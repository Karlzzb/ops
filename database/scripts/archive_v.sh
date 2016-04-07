#!/bin/bash

MYSQL_USER="root"
MYSQL_PASS=""
MYSQL_SOCK="/data/db/mysql3366/mysql3366.sock"
MYSQL_BIN="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS --socket=$MYSQL_SOCK"
MYSQL_COMMAND="$MYSQL_BIN "
ARCHIVER="/usr/bin/pt-archiver"
ARCHIVER_CONNS="h=localhost,u=$MYSQL_USER,p=$MYSQL_PASS,S=$MYSQL_SOCK"
ERR_LOG=/var/log/archiver.log
ARCHIVER_CONF="/home/dbtools/archive_v.conf"

#error header
error(){
  echo "`date +%F_%T` [ERROR]  $1" >> $ERR_LOG
  /usr/bin/zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.data_archiver  -o "archive failed" > /dev/null 2>&1
  final_deal
  exit 1
}

final_deal() {
  $MYSQL_COMMAND -Bse "set global local_infile = 0;" > /dev/null 2>&1
}

#singe table archive
data_archive() {
  TABLE_SCHEMA=$1
  TABLE_NAME=$2
  ARCHIVE_VAL=$3
  RELY_COLUMN=$4
  IS_UNIXTIME=$5
  PLUS_WHERE=$6

  ARCHIVE_SUFFIX=`date --date="1 month ago" +%Y%m`

  $MYSQL_COMMAND -Bse "set global local_infile = 1;" >> $ERR_LOG 2>&1 || error "$TABLE_SCHEMA.$TABLE_NAME archive failed"

  $MYSQL_COMMAND -Bse "create table if not exists archive_db.$TABLE_NAME${ARCHIVE_SUFFIX} LIKE $TABLE_SCHEMA.$TABLE_NAME;" >> $ERR_LOG 2>&1 || error "$TABLE_SCHEMA.$TABLE_NAME archive failed"
  if [ $IS_UNIXTIME -gt 0 ]; then 
    ARCHIVE_WHERE="$RELY_COLUMN < UNIX_TIMESTAMP(DATE_ADD(concat(date(NOW()),' 00:00:00'),interval -$ARCHIVE_VAL day))"
  else
    ARCHIVE_WHERE="$RELY_COLUMN < DATE_ADD(concat(date(NOW()),' 00:00:00'),interval -$ARCHIVE_VAL day)"
  fi || error "$TABLE_SCHEMA.$TABLE_NAME archive failed"

  if [ $PLUS_WHERE ]; then
    ARCHIVE_WHERE=$ARCHIVE_WHERE" and "$PLUS_WHERE
  fi

  $ARCHIVER --source ${ARCHIVER_CONNS},D=${TABLE_SCHEMA},t=${TABLE_NAME} --dest ${ARCHIVER_CONNS},D=archive_db,t=${TABLE_NAME}${ARCHIVE_SUFFIX} --charset utf8 --where "$ARCHIVE_WHERE"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 >> $ERR_LOG 2>&1 || error "$TABLE_SCHEMA.$TABLE_NAME archive failed"
}


#main()
if [ ! -x $ARCHIVER ]; then
  error "archive failed due to $ARCHIVER can not be executed"
fi

if [ ! -f ${ARCHIVER_CONF} ]; then
  error "archive failed due to ${ARCHIVER_CONF} is not a file"
fi

while read LINE
do

  data_archive ${LINE} || error "$TABLE_SCHEMA.$TABLE_NAME archive failed"

done < ${ARCHIVER_CONF} || error "archive failed due to ${ARCHIVER_CONF} can not be readed"

final_deal

/usr/bin/zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.data_archiver  -o OK > /dev/null 2>&1
echo '' > $ERR_LOG
