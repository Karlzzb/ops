#!/bin/bash
#desc: backup mysql slowlog to 10.1.0.3 (bakup-jo1)
#date: 2014-10-28
#update: 
#author: dezill

FILENAME="mysql-slow_$(date '+%Y%m%d')_$(hostname).log"
FILECOPY="/tmp/$FILENAME"
LOGFILE=/tmp/$(basename $0).log
cp /mysqldb/log/mysql-slow.log $FILECOPY && > /mysqldb/log/mysql-slow.log

rsync -vazu $FILECOPY 10.1.0.3::db_jo2/data/slowlog/$FILENAME >/dev/null 2>&1
if [ $? -eq  0 ]; then
	echo "generating slow log report"
	/home/kerl/tools/pt-query-digest --group-by fingerprint --order-by Query_time:sum --limit 50 $FILECOPY > /home/kerl/slow-rpt/`hostname`-`date +"%Y%m%d"`-slow.rpt
	echo "clean the slow log"
	echo "Done OK"
	echo "$(date +'%F %T') backup slow log and generated report OK" >> $LOGFILE
	rm -f $FILECOPY
else 
	echo "Backup ERROR"
	echo "$(date +'%F %T') backup slow log and generated report FAIL" >> $LOGFILE
fi
