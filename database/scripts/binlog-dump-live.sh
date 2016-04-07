#!/bin/sh
#editor Kerl 2015-1-10

source $1
RESPAWN=10

if [ ! -d $BACKUPDIR ];then
  mkdir -p $BACKUPDIR
fi

cd $BACKUPDIR
echo "Backup dir: $BACKUPDIR "
while :
do
  zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k binlog.backup -o OK > /dev/null 2>&1
  LASTFILE=`ls -1 $BACKUPDIR|grep -v orig|tail -n 1`
  if [ ! -n "$LASTFILE" ]; then
    LASTFILE=`$MYSQLTOOL --host $MYSQLHOST --port $MYSQLPORT -u $MYSQLUSER -p$MYSQLPASS -NLe "SHOW BINARY LOGS"|head -n 1|awk '{print $1}'`
  else
    TIMESTAMP=`date +%s`
    FILESIZE=$(stat -c%s "$LASTFILE")
    if [ $FILESIZE -gt 0 ]; then
      echo "Backing up last binlog"
      mv $LASTFILE $LASTFILE.orig$TIMESTAMP
    fi
    touch $LASTFILE
  fi
  echo "[info]$(date +%Y%m%d): Starting live binlog backup"
  $MBL --raw --read-from-remote-server --stop-never --host $MYSQLHOST --port $MYSQLPORT -u $MYSQLUSER -p$MYSQLPASS $LASTFILE
  if [ $? -ne 0 ]; then
   zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k binlog.backup -o $MYSQLHOST > /dev/null 2>&1
  else
   zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k binlog.backup -o OK > /dev/null 2>&1
  fi

  find $BACKUPDIR -type f -name "mysql-bin.*" -mtime +14 | xargs rm -rf

  echo "[error]$(date +%Y%m%d) mysqlbinlog exited with $? trying to reconnect in $RESPAWN seconds."
  sleep $RESPAWN
done
