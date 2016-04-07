#!/bin/bash
#desc: archive pre_forum_thread
#date: 2015-05-29
#update: 
#author: kerl


#MYSQL CONNECTION INFO
HOSTNAME=localhost
USERNAME="root"
PASSWORD="kerl1234"
MYSQL_SOCKET=/home/data/db/mysql3980/mysql3980.sock
MYSQL_SECURITIES="--host=${HOSTNAME} --user=${USERNAME} --password=${PASSWORD} --socket=${MYSQL_SOCKET}"
MYSQL_ADMIN=/usr/bin/mysqladmin
MYSQL_CLI=/usr/bin/mysql

#ARCHIVER CFG
ARCHIVER_SOURCE="h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_thread"
ARCHIVER_DESC="h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_thread_2013"

CONDITION="fid in(75,134,96,155,357,135,103,232,26,308,150,373,130,187,280,181,183,116,192,45,233,384,2,27,282,377,203,307,20,12,149,80,174,197,125,11,371,228,391,106,305,376,24,225,362,327,112,227,270,148,126,216,157,248,108,222,374,318,47,65,66,179,162,136,142,193,353,3,91,295,151,378,159,118,208,260,158,123,269,109,32,189,29,31,259,190,128,370,234,184,194,379,316,152,119,180,223,256,349,345,289,355,87,303,33,165,341,292,191,213,254,117,34,328,94,206,82,185,77,338,19,386,177,253,167,120,343,235,64,320,250,17,342,306,129,420,141,201,168,98,385,406,339,392,188,114,427,54,143,258,207,70,331,356,381,229,298,324,6,372,287,418,390,423,410,71,67,393,46,276,4,424,198,315,220,263,69,314,369,267,42,156,16,238,138,340,387,9,49,101,309,83,48,273,313,53,95,278,297,28,264,419,226,321,199,147,15,239,319,360,218,153,44,121,325,415,37,58,209,89,107,93,290,110,275,293,211,196,212,10,217,50,36,336,140,230,407,164,255,332,383) and lastpost<1388505600"

EXE_LOG=/var/log/archive_pre_forum_thread.log
echo '' > $EXE_LOG


#1. 创建新的主题表
sql="CREATE TABLE IF NOT EXISTS discuz_db.pre_forum_thread_2013 LIKE discuz_db.pre_forum_thread;"
$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" >> $EXE_LOG 2>&1

#2. 更新系统设置表
sql="REPLACE INTO discuz_db.pre_common_setting SET skey='threadtableids' , svalue='a:2:{i:0;i:0;i:1;i:2013;}';REPLACE INTO discuz_db.pre_common_syscache SET cname='threadtableids' , ctype='1' , dateline=unix_timestamp() , data=HEX('a:2:{i:0;i:0;i:1;i:2013;}')"
$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" >> $EXE_LOG 2>&1


#3. 归档数据到的主题表(pre_forum_thread_2013)
pt-archiver --source $ARCHIVER_SOURCE --dest $ARCHIVER_DESC --charset utf8 --where "$CONDITION"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 10000  >> $EXE_LOG 2>&1

#4. 更新每个版块的帖子数量到 pre_forum_forum_threadtable表
REPLACE INTO pre_forum_forum_threadtable SET fid='0' , threadtableid='0' , threads='48449' , posts='254512'

#5. 更新操作了归档的版块（把archive设置为1, 标识该版块有归档）
sql="UPDATE  discuz_db.pre_forum_forum SET archive='1' WHERE fid in(75,134,96,155,357,135,103,232,26,308,150,373,130,187,280,181,183,116,192,45,233,384,2,27,282,377,203,307,20,12,149,80,174,197,125,11,371,228,391,106,305,376,24,225,362,327,112,227,270,148,126,216,157,248,108,222,374,318,47,65,66,179,162,136,142,193,353,3,91,295,151,378,159,118,208,260,158,123,269,109,32,189,29,31,259,190,128,370,234,184,194,379,316,152,119,180,223,256,349,345,289,355,87,303,33,165,341,292,191,213,254,117,34,328,94,206,82,185,77,338,19,386,177,253,167,120,343,235,64,320,250,17,342,306,129,420,141,201,168,98,385,406,339,392,188,114,427,54,143,258,207,70,331,356,381,229,298,324,6,372,287,418,390,423,410,71,67,393,46,276,4,424,198,315,220,263,69,314,369,267,42,156,16,238,138,340,387,9,49,101,309,83,48,273,313,53,95,278,297,28,264,419,226,321,199,147,15,239,319,360,218,153,44,121,325,415,37,58,209,89,107,93,290,110,275,293,211,196,212,10,217,50,36,336,140,230,407,164,255,332,383)"
$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" >> $EXE_LOG 2>&1

#6 归档主题的统计信息
#sql="set group_concat_max_len = 4294967295;select concat_ws('|',fid, group_concat(distinct tid), count(1)) from discuz_db.pre_forum_thread_2013 group by fid;"
sql="set group_concat_max_len = 4294967295;select concat_ws('|',fid, count(1)) from discuz_db.pre_forum_thread_2013 group by fid;"
statlist=`$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" 2> /dev/null`

sql="drop table if exists discuz_db.pre_forum_post;alter table discuz_db.pre_forum_post_0 rename discuz_db.pre_forum_post;optimize table discuz_db.pre_forum_thread;"
$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql"  >> $EXE_LOG 2>&1

for threadstat in $statlist;do
  fid=`echo $threadstat |awk -F\| '{print $1}'`
  #tids=`echo $threadstat |awk -F\| '{print $2}'`
  tids="select distinct tid from discuz_db.pre_forum_thread_2013"
  thread_num=`echo $threadstat |awk -F\| '{print $2}'`

  sql="select count(1) from discuz_db.pre_forum_post where fid = $fid and tid in ($tids)"
  post_num=`$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" 2> /dev/null`

  for i in {1..50};do
     sql="select count(1) from discuz_db.pre_forum_post_$i where fid = $fid and tid in ($tids)"
     post_num_part=`$MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql" 2> /dev/null`
     post_num=`expr $post_num_part + $post_num`
  done

  sql="replace into discuz_db.pre_forum_forum_threadtable select $fid, 2013,$thread_num,$post_num"
  $MYSQL_CLI $MYSQL_SECURITIES -Bse "$sql"  >> $EXE_LOG 2>&1

done