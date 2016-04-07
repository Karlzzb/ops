#!/bin/sh
#editor Kerl 2015-1-15

log_analyze (){
  SLOWLOGDIR=$1
  MYHOSTNAME=$2
  slowlogs=`find $SLOWLOGDIR -type f -name "$SLOWTYPE" -mtime 0`
  if [ -z "$slowlogs" ]; then
    echo "$(date +%Y%m%d/%T)[error] no suitable slowlogs in $SLOWLOGDIR" >> ${EXECUTE_LOG}
    return 1
  fi
  $PTTOOLS --group-by fingerprint  --order-by Query_time:max  --limit=0% $slowlogs > $RPTDIR/$MYHOSTNAME-$RPTSUFFIX 2> ${EXECUTE_LOG}
  #$PTTOOLS --review u=$MYSQL_USR,p=$MYSQL_PWD,h=$MYSQL_HOST,P=$MYSQL_PORT,D=$MYSQL_DB,t=analyze_sql_review_$MYHOSTNAME --history u=$MYSQL_USR,p=$MYSQL_PWD,h=$MYSQL_HOST,P=$MYSQL_PORT,D=$MYSQL_DB,t=analyze_sql_history_$MYHOSTNAME --no-report --limit=0%  $slowlogs > $RPTDIR/$MYHOSTNAME-$RPTSUFFIX 2> ${EXECUTE_LOG}
  if [ $? -ne 0 ]; then
    echo "$(date +%Y%m%d/%T)[error] $file_dir if not a dictory" >> ${EXECUTE_LOG}
  fi
}

log_clean () {
  file_dir=$1
  if [ ! -d $file_dir ];then
    echo "$(date +%Y%m%d/%T)[error] $file_dir if not a dictory" >> ${EXECUTE_LOG}
    return 1
  fi
  find $file_dir -mindepth 1 -type d -mtime +7 | xargs rm -rf
}



#The path of slow logs
SLOWDIR=/data/slowlog-backup
#The path of reports
RPTDIR=/data/slowlog-rpt
#Slow logs file name styple
SLOWTYPE="mysql-slow.log*"
RPTSUFFIX=`date +%Y%m%d`.rpt
EXECUTE_LOG=/var/log/query-digest.log
datestr=`date +%Y%m%d`

#analyze db conn cfg
MYSQL_USR=dumpusr
MYSQL_PWD=m13pGDtHjLM%yk
MYSQL_HOST=172.16.30.14
MYSQL_PORT=3366
MYSQL_DB=analyze_db

#The analyze tools
PTTOOLS=/usr/bin/pt-query-digest

#Get the host list
HOSTLIST=`/bin/ls $SLOWDIR`
for HOST in $HOSTLIST
do
  log_analyze $SLOWDIR/$HOST/$datestr $HOST
  log_clean $SLOWDIR/$HOST
done
