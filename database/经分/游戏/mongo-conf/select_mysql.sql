insert into tmp_mongo 
SELECT '单个游戏30天内新增的充值金额' AS mytitle, gid,COUNT(1) AS cnt, now() AS data_time FROM g_leajoy.g_pay_order
WHERE atime>=UNIX_TIMESTAMP(FROM_UNIXTIME(UNIX_TIMESTAMP()-86400*30,'%Y-%m-%d')) and gid>0 GROUP BY gid;

insert into tmp_mongo
SELECT '单个游戏正在线上运营的服务器数量' AS mytitle, gid, COUNT(1) AS cnt, now() AS data_time FROM g_leajoy.g_game_server 
WHERE `status`=1 and gid>0 GROUP BY gid; 

insert into tmp_mongo
SELECT '日付费用户数' AS mytitle , gid ,COUNT(DISTINCT game_uid) AS cnt,now() AS data_time FROM g_leajoy.g_pay_order 
WHERE FROM_UNIXTIME(atime,'%Y-%m-%d')=FROM_UNIXTIME(UNIX_TIMESTAMP()-86400,'%Y-%m-%d') AND `status`=4  and gid>0 GROUP BY gid;
