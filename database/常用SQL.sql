#添加系统维护表
SELECT CONCAT('ALTER TABLE fc_wfc_new.', table_name, ' ADD `INIT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT \'数据创建时间\', ADD `DML_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'数据最后修改时间\', ADD `DML_FLAG` tinyint(4) NOT NULL DEFAULT 1 COMMENT \'数据操作标识: 1-新增;2-修改;3-删除\';') FROM information_schema.tables WHERE table_schema = 'fc_wfc_new'

SELECT CONCAT('ALTER TABLE fc_wfc_new.', table_name, ' DROP \`INIT_TIME\` , DROP \`DML_TIME\`, DROP \`DML_FLAG\`;') FROM information_schema.tables WHERE table_schema = 'fc_wfc_new'

#统一变更字段配置
mysql -uroot -p -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE ', TABLE_SCHEMA, '.',TABLE_NAME,' RENAME ',TABLE_SCHEMA,'.',UPPER(TABLE_NAME),';') from information_schema.tables where table_schema = 'fc_wfc';" > /tmp/alter_table_name.sql


mysql -uroot -p -S /db/mysql3306/mysql.sock < /tmp/alter_table_name.sql


mysql -uroot -p -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE ', TABLE_SCHEMA, '.',TABLE_NAME,' CHANGE ',COLUMN_NAME,' ',UPPER(COLUMN_NAME), ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_wfc';" > /tmp/alter_table_column_name.sql


mysql -uroot -p -S /db/mysql3306/mysql.sock < /tmp/alter_table_column_name.sql



echo "##############################################################fc_recharge-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_recharge';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_recharge-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_RECHARGE_'),';') from information_schema.tables where table_schema = 'fc_recharge';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_innerc-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_innerc';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_innerc-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_INNERC_'),';') from information_schema.tables where table_schema = 'fc_innerc';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_client-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_client';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_client-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_CLIENT_'),';') from information_schema.tables where table_schema = 'fc_client';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_sys-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_sys';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_sys-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_SYS_'),';') from information_schema.tables where table_schema = 'fc_sys';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_risk-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_risk';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_risk-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_RISK_'),';') from information_schema.tables where table_schema = 'fc_risk';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_withdraw-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_withdraw';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_withdraw-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_WITHDRAW_'),';') from information_schema.tables where table_schema = 'fc_withdraw';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql


echo "##############################################################fc_shift-columns##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' MODIFY ',COLUMN_NAME, ' ', COLUMN_TYPE , IF(IS_NULLABLE='NO',' NOT NULL ',''),  EXTRA, ' COMMENT\'',COLUMN_COMMENT,'\' ;') from information_schema.columns where TABLE_SCHEMA = 'fc_shift';" >> /home/kerl/backup/fc_database_update.sql
echo "##############################################################fc_shift-tables##############################################################" >> /home/kerl/backup/fc_database_update.sql
mysql -uroot -pmyadmin -S /db/mysql3306/mysql.sock -Bse "select concat('ALTER TABLE fc_wfc_new.',TABLE_NAME,' RENAME fc_wfc_new.',REPLACE(TABLE_NAME,'FC_','FC_SHIFT_'),';') from information_schema.tables where table_schema = 'fc_shift';"  >> /home/kerl/backup/fc_database_update.sql

echo "" >> /home/kerl/backup/fc_database_update.sql



SELECT CONCAT('INSERT INTO fc_wfc_new.',TABLE_NAME,'(',GROUP_CONCAT(column_name),') SELECT ', GROUP_CONCAT(column_name),' FROM fc_wfc.',TABLE_NAME,';') FROM information_schema.columns WHERE TABLE_SCHEMA = 'fc_wfc_new' GROUP BY TABLE_NAME;

SELECT CONCAT(   "*4 ",   '$', LENGTH(redis_cmd), ' ',   redis_cmd, ' ',   '$', LENGTH(redis_key), ' ',   redis_key, ' ',   '$', LENGTH(hkey), ' ',   hkey, ' ',   '$', LENGTH(hval), ' ',   hval, ' ' ) as cmd FROM (   SELECT   'HSET' as redis_cmd,   'events_all_time' AS redis_key,   action AS hkey,   count AS hval   FROM events_all_time ) AS t;

#灰度任务清理
delete IGNORE LOW_PRIORITY from s8_bbs.pw_transforms where dml_time > DATE_ADD(NOW(),interval -10 day) and dml_time < DATE_ADD(NOW(),interval -1 hour);
optimize table s8_bbs.pw_transforms ;

#播出频率
select date(created),sum(if(duration < 60,1,0)) as num_60,sum(if(duration between 60 and 600,1,0)) as num_600,sum(if(duration between 600 and 1800,1,0)) as num_1800,sum(if(duration between 1800 and 3600,1,0)) as num_3600,sum(if(duration > 3600,1,0)) as num_max from video.video_live_list where created > '2015-03-01' group by date(created);

#掉权查询SQL
use s8_bbs;

select m.uid ,m.username, m.groupid , m.groups,g.gid, from_unixtime(g.startdate) start_date , g.days from s8_bbs.pw_extragroups g left join s8_bbs.pw_members m on g.uid = m.uid where ( g.gid =41 or g.gid = 42 ) and g.startdate > unix_timestamp(date_add(now(),interval - g.days day)) and find_in_set(g.gid,m.groups) = 0 and m.groupid <> g.gid and m.groupid <> 6 order by m.uid;


DROP TABLE IF EXISTS s8_bbs.priv_lost;
create table s8_bbs.priv_lost select m.uid ,m.username, m.groupid , m.groups,g.gid, from_unixtime(g.startdate) start_date , g.days from s8_bbs.pw_extragroups g left join s8_bbs.pw_members m on g.uid = m.uid where ( g.gid =41 or g.gid = 42 ) and g.startdate > unix_timestamp(date_add(now(),interval - g.days day)) and find_in_set(g.gid,m.groups) = 0 and m.groupid <> g.gid and m.groupid <> 6 order by m.uid;

update s8_bbs.pw_extragroups m, s8_bbs.priv_lost p set m.days = m.days - 31 where m.uid = p.uid;
insert into s8_bbs.pw_extragroups select uid, groupid, 0, unix_timestamp(now()), 31 from s8_bbs.priv_lost where groupid <> -1;
update s8_bbs.pw_members m, s8_bbs.priv_lost p set m.groups = concat(m.groups,",",p.gid,",") where m.uid = p.uid;

#下权查询&修复
drop table if exists s8_bbs.unpay_user;
create table s8_bbs.unpay_user select m.uid ,m.username, m.groupid , m.groups,g.gid, from_unixtime(g.startdate) start_date , g.days from s8_bbs.pw_extragroups g right join s8_bbs.pw_members m on g.uid = m.uid and g.startdate > unix_timestamp(date_add(now(),interval - g.days day)) where (m.groupid in (41,42,56) or find_in_set('41',m.groups) <> 0  or find_in_set('42',m.groups) <> 0 or find_in_set('56',m.groups) <> 0 ) and g.uid is null;
alter table s8_bbs.unpay_user add primary key (uid);
start transaction;
update s8_bbs.unpay_user u, s8_bbs.pw_members m set m.groupid = -1 where u.uid = m.uid and m.groupid in (41,42,56);
update s8_bbs.unpay_user u, s8_bbs.pw_members m set m.groups = replace(m.groups,'41','') where u.uid = m.uid and find_in_set('41',m.groups) <> 0;
update s8_bbs.unpay_user u, s8_bbs.pw_members m set m.groups = replace(m.groups,'42','') where u.uid = m.uid and find_in_set('42',m.groups) <> 0;
update s8_bbs.unpay_user u, s8_bbs.pw_members m set m.groups = replace(m.groups,'56','') where u.uid = m.uid and find_in_set('56',m.groups) <> 0;
system sudo rm -rf /tmp/unpay_user.xls
select uid,username,m.groupid, m.groups from s8_bbs.unpay_user m into outfile '/tmp/unpay_user.xls';
system sudo sz /tmp/unpay_user.xls
drop table if exists s8_bbs.unpay_user;

#老论坛订单查询（d.FC_ORDER_NO为银行的订单号, s.pTransID为pw论坛的订单号）
select s.pTransID, s.UID, from_unixtime(pTransTime), p.FC_MESSAGE_NO, d.FC_ORDER_NO from s8_bbs.cdb_paymenttransactions s join fcpay_db.FC_PAY_FROM_CUSTOMER p on p.SERIAL_ID = s.pTransID join fcpay_db.FC_PAY_ORDER_DETAILS d on p.FC_MESSAGE_NO = d.FC_MESSAGE_NO where d.FC_ORDER_NO = 'FC00OD2015111123410747004fe';

#结果导出EXL
select uid, username, points, logined from video_user where points > 50000 INTO OUTFILE '/tmp/user.csv'  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';