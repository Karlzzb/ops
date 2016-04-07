#!/bin/sh


my_dump(){
  HOSTNAME=$1
  PORT=$2
  USERNAME=$3
  PASSWORD=$4
  DUMP_DIR=$5

  query_sql="SELECT SCHEMA_NAME FROM  information_schema.SCHEMATA WHERE SCHEMA_NAME <> 'information_schema' AND SCHEMA_NAME <> 'performance_schema' AND SCHEMA_NAME <> 'test' AND SCHEMA_NAME <> 'analyze_db';"
  dbs=`${MYSQL_TOOL} -h${HOSTNAME}   -P${PORT}   -u${USERNAME} -p${PASSWORD} -NLe "${query_sql}"`

  for db in $dbs
  do
    $DUMP_TOOL -h ${HOSTNAME} -P ${PORT} -u ${USERNAME} -p ${PASSWORD} -F 32 --less-locking --use-savepoints -t 32 -B $db -o ${DUMP_DIR}/${db}$(date +%Y%m%d) >> ${execute_log} 2>&1

    if [ $? -ne 0 ]; then
      zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.backup  -o ${HOSTNAME}:${db} > /dev/null 2>&1
    else
      zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.backup  -o OK > /dev/null 2>&1
    fi
  done
}

my_clean() {
  file_dir=$1
  if [ ! -d $file_dir ];then
    echo "$file_dir if not a dictory" 2>> ${execute_log}
    return 1
  fi
  find $file_dir -type d -name "*20*" -mtime +7 | xargs rm -rf
}


MYSQL_TOOL='/usr/bin/mysql'
DUMP_TOOL='/home/dbtools/mydumper'
execute_log="/var/log/my_dump.log"

#执行各个服务器DUMP
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:Start data dump 172.16.30.12 3366" >> ${execute_log}
my_dump 172.16.30.12 3366 dumpusr [密码] /data/vdbbackup
my_clean /data/vdbbackup
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:end data dump 172.16.30.12 3366" >> ${execute_log}
