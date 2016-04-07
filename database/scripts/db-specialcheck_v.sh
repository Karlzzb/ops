#!/bin/bash
# 
#author: Kerl
#version: 1.0
#date: 2015/03/27

#send problem to zabbix
report() {
  /usr/bin/zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k illegal.sql  -o "$1" > /dev/null 2>&1
}

MYSQL_USER="monitoring"
MYSQL_PASS=""
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3366"
MYSQL_BIN="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS -h $MYSQL_HOST -P $MYSQL_PORT"
MYSQL_COMMAND="$MYSQL_BIN "
MYSQLBINLOG_COMMAND="/usr/bin/mysqlbinlog /data/dblogs/mysql3366/binlogs/mysql-bin.0* "


#illegal options
ILLEGAL_SQLS=`$MYSQLBINLOG_COMMAND --start-datetime="$(date --date="-5 minute" +%Y-%m-%d\ %H:%M:%S)" |awk '/drop/ || /DROP/ || /alter/ || /ALTER/ || /grant/ || /GRANT/ '`
if [ ! -z "$ILLEGAL_SQLS" ];then
  report "$ILLEGAL_SQLS"
else
  report OK
fi
