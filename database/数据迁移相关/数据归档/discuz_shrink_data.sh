#!/bin/bash
#desc: archive pre_forum_thread
#date: 2015-05-29
#update: 
#author: kerl


#MYSQL CONNECTION INFO
HOSTNAME=localhost
USERNAME="root"
PASSWORD="myadmin"
MYSQL_SOCKET=/data/db/mysql6980/mysql6980.sock
MYSQL_SECURITIES="--host=${HOSTNAME} --user=${USERNAME} --password=${PASSWORD} --socket=${MYSQL_SOCKET}"
MYSQL_ADMIN=/opt/mysql/bin/mysqladmin
MYSQL_CLI=/opt/mysql/bin/mysql

#ARCHIVER CFG
ARCHIVER_SOURCE="h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_thread"
ARCHIVER_DESC="h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_thread_2013"

CONDITION="lastpost<unix_timestamp('2015-04-01 00:00:00')"

EXE_LOG=/var/log/shrink_data.log
echo '' > $EXE_LOG

#pt-archiver --source $ARCHIVER_SOURCE --dest $ARCHIVER_DESC --charset utf8 --where "$CONDITION"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 10000  >> $EXE_LOG 2>&1
#pt-archiver --source $ARCHIVER_SOURCE --purge --where "$CONDITION"  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1

  for i in {0..49};do
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_ucenter_memberfields_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_ucenter_memberfields_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_field_forum_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_field_forum_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_onlinetime_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_onlinetime_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_attachment_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_forum_attachment_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_profile_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_profile_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_forum_ratelog_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_forum_ratelog_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_field_home_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_field_home_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_status_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_status_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_ucenter_members_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&1
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_ucenter_members_$i" >> $EXE_LOG 2>&1 &
    pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_ucenter_friends_$i --purge --where "(uid < 26500000 and uid <> 1) or (friendid < 26500000 and uid <> 1)" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&10000
	
	pt-archiver --source h=${HOSTNAME},u=${USERNAME},p=${PASSWORD},S=${MYSQL_SOCKET},D=discuz_db,t=pre_common_member_count_$i --purge --where "uid < 26500000 and uid <> 1" --bulk-delete --limit=50000  --statistics --why-quit --local --progress 10000 >> $EXE_LOG 2>&10000
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_common_member_count_$i" >> $EXE_LOG 2>&1 &
	
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "optimize table discuz_db.pre_ucenter_friends_$i" >> $EXE_LOG 2>&1 &
    $MYSQL_CLI $MYSQL_SECURITIES -Bse "update discuz_db.pre_ucenter_members_$i set password=md5(concat(md5('123456'),'8aefc8')), salt='8aefc8';" >> $EXE_LOG 2>&1 &
  done
