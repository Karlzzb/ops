#!/bin/sh
#editor Kerl 2015-2-5

error_deal() {
  if [ $1 -ne 0 ]; then
    /usr/bin/zabbix_sender -z 172.16.100.14 -p 10051 -s TPHN-PAY-backup-check -k mysql.slowarhive  -o ${HOSTNAME}:$1 > /dev/null 2>&1
    exit 1
  else
    /usr/bin/zabbix_sender -z 172.16.100.14 -p 10051 -s TPHN-PAY-backup-check -k mysql.slowarhive  -o OK > /dev/null 2>&1
  fi
}

datestr=`date +%Y%m%d`

/usr/sbin/logrotate /etc/logrotate.d/mysql-slow-rotate
cp -rf /data/dblogs/mysql3398/slowlogs/mysql-slow.log /data/dblogs/mysql3398/slowlogs/mysql-slow.log.tail
echo '' > /data/dblogs/mysql3398/slowlogs/mysql-slow.log
error_deal $?

/usr/bin/rsync -vazu /data/dblogs/mysql3398/slowlogs/mysql-slow.log.* 172.16.100.4::slowlog/`hostname`/$datestr/ >> /data/logs/rsync-slowlogs.log 2>&1
error_deal $?
rm -rf /data/dblogs/mysql3398/slowlogs/mysql-slow.log.*
