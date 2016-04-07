#!/bin/bash
# CREATE TABLE `analyze_db`.`bin_log` (
  # `host` varchar(32) NOT NULL COMMENT'所在服务器IP',
  # `log_name` varchar(32) NOT NULL COMMENT'所在日志名称',
  # `at_pos` int(11) NOT NULL COMMENT'起始点',
  # `at_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'操作时间',
  # `server_id` int(11) NOT NULL,
  # `end_log_pos` int(11) NOT NULL COMMENT'结束点',
  # `execute_detail` varchar(500) DEFAULT NULL COMMENT'执行详情',
  # `thread_id` int(11) NOT NULL,
  # `exec_time` int(11) NOT NULL,
  # `error_code` int(11) NOT NULL,
  # `dml_type` varchar(50) DEFAULT NULL COMMENT'操作详情',
  # `dml_table` varchar(500) DEFAULT NULL COMMENT'被操作库表',
  # `dml_sql` text DEFAULT NULL
# ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT'服务器日志统计表';
# LOAD DATA LOCAL INFILE '/home/kerl/Db-Jo1-full-bin.txt' INTO TABLE analyze_db.bin_log COLUMNS TERMINATED BY '|||||' (at_pos,at_time,server_id,end_log_pos,execute_detail,exec_time,error_code,thread_id,dml_type,dml_table,dml_sql) SET host=INET_ATON('10.1.0.201'), log_name='analyze'
# LOAD DATA LOCAL INFILE '/home/kerl/Db-Jo4-full-bin.txt' INTO TABLE analyze_db.bin_log COLUMNS TERMINATED BY '|||||' (at_pos,at_time,server_id,end_log_pos,execute_detail,exec_time,error_code,thread_id,dml_type,dml_table,dml_sql) SET host=INET_ATON('10.1.0.204'), log_name='analyze'


analyzer(){
	HOSTNAME=$1
	PORT=$2
	USERNAME=$3
	PASSWORD=$4
	sql="SHOW BINARY LOGS;"
	binlog_strs=`${mysql_tool} -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -Bse "${sql}"`
	for binlog_str in $binlog_strs
	do
		#提取文件名
		binlog_name=`echo "${binlog_str}" | awk '{print $1}'`
		#BINLOG间隔
		sql="select TIMESTAMPADD(week,-1,NOW());"
		start_time=`${mysql_tool} -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -Bse "${sql}"`		
		sql="select NOW();"
		stop_time=`${mysql_tool} -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -Bse "${sql}"`		
		#将二进制日志文本化
		$mysqlbinlog -R -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} --start-datetime="${start_time}" --stop-datetime="${stop_time}" $binlog_name  > ${EXCUTE_DIR}/$binlog_name.txt 2> /dev/null
		#处理文本日志中的特殊情况
		$sed -f ${EXCUTE_DIR}/binlog_analyze.sed   ${EXCUTE_DIR}/$binlog_name.txt  >  ${EXCUTE_DIR}/$binlog_name.txt.awk
		#将二文本日志格式为可以导入到数据库的格式
		$awk -f ${EXCUTE_DIR}/binlog_analyze.awk   ${EXCUTE_DIR}/$binlog_name.txt.awk  | grep -v '|||||$' | grep -v '^$' >  ${EXCUTE_DIR}/$binlog_name.txt.awk.sql
		#数据入库
		sql="LOAD DATA LOCAL INFILE '${EXCUTE_DIR}/$binlog_name.txt.awk.sql' INTO TABLE analyze_db.bin_log_$(date +%Y%m%d) COLUMNS TERMINATED BY '|||||' (at_pos,at_time,server_id,end_log_pos,execute_detail,dml_type,dml_table,dml_sql) SET host=INET_ATON('${HOSTNAME}'), log_name='${binlog_name}'"
		${mysql_tool} -h${ANALYZE_HOST} -P${ANALYZE_PORT} -u${ANALYZE_USR} -p${ANALYZE_PWD} -e "${sql}" 2>> ${execute_log}
		#一切正确执行后，清理临时文件
		rm -f  ${EXCUTE_DIR}/$binlog_name.txt  ${EXCUTE_DIR}/$binlog_name.txt.awk	${EXCUTE_DIR}/$binlog_name.txt.awk.sql
	done
}

#基础工具
EXCUTE_DIR="/db/my-script/binlog_analyze"
TIME=`date +%Y-%m-%d/%d_%H:%M:%S`
mysqlbinlog="/db/mysql3306/bin/mysqlbinlog"
awk=`which awk`
sed=`which sed`
mysql_tool="/db/mysql3306/bin/mysql"
execute_log="/var/log/binlog_analyze.log"


#基础工具测试
mkdir -p $EXCUTE_DIR
. /etc/rc.d/init.d/functions
if [ ! -x $mysql_tool -a -x $mysqlbinlog -a -x $awk -a -x $sed ]
	then
		echo "$(date +%Y-%m-%d/%d_%H:%M:%S) ERROR:mysqlbinlog or awk or sed tool is not install!" >> ${execute_log}
		exit $COMMAND_FAIL
fi

#分析库
ANALYZE_HOST="10.255.0.34"
ANALYZE_PORT="3306"
ANALYZE_USR="db_analyzer"
ANALYZE_PWD="db_analyzer@cnwisdom"

#创建本轮分析表
sql="CREATE TABLE IF NOT EXISTS analyze_db.bin_log_$(date +%Y%m%d) LIKE analyze_db.bin_log;TRUNCATE TABLE analyze_db.bin_log_$(date +%Y%m%d);"
${mysql_tool} -h${ANALYZE_HOST} -P${ANALYZE_PORT} -u${ANALYZE_USR} -p${ANALYZE_PWD} -e "${sql}" 2>> ${execute_log}


#执行各个服务器
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:Start analyze 10.255.0.30 3306" >> ${execute_log}
analyzer 10.255.0.30 3306 db_analyzer db_analyzer@cnwisdom
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:end of analyzing 10.255.0.30 3306" >> ${execute_log}
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:Start analyze 10.255.0.33 3306" >> ${execute_log}
analyzer 10.255.0.33 3306 db_analyzer db_analyzer@cnwisdom
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:end of analyzing 10.255.0.33 3306" >> ${execute_log}
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:Start analyze 10.255.0.34 3306" >> ${execute_log}
analyzer 10.255.0.34 3306 db_analyzer db_analyzer@cnwisdom
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:end of analyzing 10.255.0.34 3306" >> ${execute_log}
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:Start analyze 10.255.0.35 3306" >> ${execute_log}
analyzer 10.255.0.35 3306 db_analyzer db_analyzer@cnwisdom
echo "$(date +%Y-%m-%d/%d_%H:%M:%S) INFO:end of analyzing 10.255.0.35 3306" >> ${execute_log}