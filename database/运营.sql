#查询每个代理下的验证邮箱用户数量
select a.agentname, u.safemail from video.video_agents a join video.video_agent_relationship r on r.aid = a.id join video.video_user u on r.uid = u.uid where a.agentaccount in(1249620,1242967) and u.safemail is not null order by agentname;

#论坛订单支付
select a.UID, b.username,a.pTransID,from_unixtime(pTransTime) as pTransTime,from_unixtime(pTransFinishTime) as finishTime,a.pTypeID,a.pTransStatus,a.paytype as pTransFinishTIme from cdb_paymenttransactions as a left join pw_members as b on a.UID=b.uid  where pTransFinishTime>=1435708800 and pTransFinishTIme<=1438308800;



select m.uid, m.username , from_unixtime(d.lastvisit) lastvisit ,from_unixtime(m.regdate) regdate, a.pTransID,from_unixtime(pTransTime) as pTransTime,from_unixtime(pTransFinishTime) from pw_members m left join pw_memberdata d on m.uid=d.uid left join pw_extragroups g on (m.groupid = g.gid and m.uid = g.uid ) left join cdb_paymenttransactions a on a.uid = m.uid where (m. groupid = 42 or m. groupid = 41) and g.gid is NULL;

#查登陆人数
select count(distinct uid) from (SELECT uid, in_time from video_exit_room201506 union all SELECT uid, in_time from video_exit_room20150623 union all SELECT uid, in_time from video_exit_room201507 union all SELECT uid, in_time from video_exit_room20150714 union all SELECT uid, in_time from video_exit_room20150721 union all SELECT uid, in_time from video_exit_room20150727 union all SELECT uid, in_time from video.video_exit_room) as t where in_time between '2015-06-01 00:00:00' and '2015-07-01 00:00:00';

#查看单月新注册用户的首充记录
select v.uid,l.paymoney,l.ctime  from video.video_user v join (select * from video.video_charge_list order by ctime) as  l on v.uid = l.uid where v.created  between '2015-06-01 00:00:00' and '2015-07-01 00:00:00' and l.status = 2  group by uid;
select v.uid,l.paymoney,l.ctime  from video.video_user v join (select * from video.video_charge_list order by ctime) as  l on v.uid = l.uid where v.created  between '2015-07-01 00:00:00' and '2015-08-01 00:00:00' and l.status = 2  group by uid;

#临时修改密码
mysql> select uid,username,password,salt from s8_bbs.pw_members where username in ('yangbinglin8','花非花无','ls403836367');
+----------+--------------+----------------------------------+------+
| uid      | username     | password                         | salt |
+----------+--------------+----------------------------------+------+
| 23485401 | ls403836367  | 13c60d5ee3c321d5a00419c51f841709 |      |
| 15565816 | yangbinglin8 | 7bedaac8fec98673a74d19adcfa0e726 |      |
|  8397824 | 花非花无     | 9d9cc2620f4fc4c2493a8a6e61a87d04 |      |
+----------+--------------+----------------------------------+------+
update s8_bbs.pw_members set password = md5('abc123') where username in ('yangbinglin8','花非花无','ls403836367');
update s8_bbs.pw_members set password = '13c60d5ee3c321d5a00419c51f841709' where uid = 23485401;
update s8_bbs.pw_members set password = '7bedaac8fec98673a74d19adcfa0e726' where uid = 15565816;
update s8_bbs.pw_members set password = '9d9cc2620f4fc4c2493a8a6e61a87d04' where uid = 8397824;

mysql> select uid,username,password,salt from s8_bbs.pw_members where username in ('447866164kev', '南门露帅', '282948588', 'w53649584');
+----------+--------------+----------------------------------+------+
| uid      | username     | password                         | salt |
+----------+--------------+----------------------------------+------+
| 23947208 | 282948588    | 2096f91418ff6c63cf2db0b50428eff0 |      |
| 24075766 | 447866164kev | dcdd8b727ac139d50bbe1ca8d2cef4b7 |      |
| 90250656 | w53649584    | bd3a4da08f497e53c8b0e2ac50d720f6 |      |
|  3463892 | 南门露帅     | 4c2ce50a7ad06c36fb25c17422a01b5d |      |
+----------+--------------+----------------------------------+------+
update s8_bbs.pw_members set password = md5('abc123') where username in ('447866164kev', '南门露帅', '282948588', 'w53649584');
update s8_bbs.pw_members set password = '2096f91418ff6c63cf2db0b50428eff0' where uid = 23485401;
update s8_bbs.pw_members set password = 'dcdd8b727ac139d50bbe1ca8d2cef4b7' where uid = 23485401;
update s8_bbs.pw_members set password = 'bd3a4da08f497e53c8b0e2ac50d720f6' where uid = 23485401;
update s8_bbs.pw_members set password = '4c2ce50a7ad06c36fb25c17422a01b5d' where uid = 23485401;

#活动统计

drop table if exists tmp_qixi;

create table tmp_qixi select t.send_uid, t.rec_uid, u.nickname, sum(t.points) as num, sum(t.gnum) as gnum from video.video_mall_list t join video.video_user u on t.rec_uid = u.uid where t.rec_uid in (select rec_uid from video_mall_list where created between '2015-08-20 00:00:00' and '2015-08-26 20:00:00' group by rec_uid having sum(points) > 5000) and t.created between '2015-08-20 00:00:00' and '2015-08-26 20:00:00' group by t.send_uid, t.rec_uid order by num desc;

SELECT t.send_uid, u.nickname, t.rec_uid, t.nickname, t.num, t.gnum from (select a.* from tmp_qixi a where 3 > (select count(*) from tmp_qixi where rec_uid = a.rec_uid and num > a.num ) order by a.rec_uid,a.num desc) t join video.video_user u on u.uid = t.send_uid;


drop table if exists tmp_qixi;

create table tmp_qixi select t.send_uid, t.rec_uid, u.nickname, sum(t.points) as num, sum(t.gnum) as gnum from video.video_mall_list t join video.video_user u on t.rec_uid = u.uid where t.rec_uid in (select rec_uid from video_mall_list where created between '2015-08-20 00:00:00' and '2015-08-26 20:00:00' group by rec_uid having sum(points) > 5000) and t.created between '2015-08-20 00:00:00' and '2015-08-26 20:00:00' group by t.send_uid, t.rec_uid order by gnum desc;

SELECT t.send_uid, u.nickname, t.rec_uid, t.nickname, t.gnum, t.num from (select a.* from tmp_qixi a where 3 > (select count(*) from tmp_qixi where rec_uid = a.rec_uid and gnum > a.gnum ) order by a.rec_uid,a.gnum desc) t join video.video_user u on u.uid = t.send_uid;


#问题修复
#掉权为-1（42）
drop table if exists my_gid42;
create table my_gid42(uid int not null primary key, gid tinyint(3) NOT NULL);
replace into my_gid42 select m.uid, 42 as gid from pw_extragroups g left join pw_members m on g.uid = m.uid where g.gid = 42 and find_in_set('42',m.groups) = 0 and (unix_timestamp(now()) < (g.startdate + g.days*3600*24)) and m.groupid = -1;
update pw_members m, my_gid42 t set m.groupid = t.gid where m.uid = t.uid and m.groupid = -1;

#掉权为-1（41）
drop table if exists my_gid41;
create table my_gid41(uid int not null primary key, gid tinyint(3) NOT NULL);
replace into my_gid41 select m.uid, 41 as gid from pw_extragroups g left join pw_members m on g.uid = m.uid where (g.gid = 41 ) and !find_in_set('41',m.groups) and (unix_timestamp(now()) < (g.startdate + g.days*3600*24)) and m.groupid = -1;
update pw_members m, my_gid41 t set m.groupid = t.gid where m.uid = t.uid and m.groupid = -1;

#后备组掉权（42）
drop table if exists my_mgid42;
create table my_mgid42(uid int not null primary key, mgid varchar(255) NOT NULL);
replace into my_mgid42 select m.uid, '42' from pw_extragroups g left join pw_members m on g.uid = m.uid where g.gid = 42 and  find_in_set('42',m.groups) = 0 and (unix_timestamp(now()) < (g.startdate + g.days*3600*24)) and m.groupid = 41;
update pw_members m, my_mgid42 t set m.groups = concat(m.groups,",",t.mgid,",") where m.uid = t.uid;

#后备组掉权（41）
drop table if exists my_mgid41;
create table my_mgid41(uid int not null primary key, mgid varchar(255) NOT NULL);
insert into my_mgid41  select m.uid, '41' from pw_extragroups g left join pw_members m on g.uid = m.uid where (g.gid = 41 ) and !find_in_set('41',m.groups) and (unix_timestamp(now()) < (g.startdate + g.days*3600*24)) and m.groupid = 42;
update pw_members m, my_mgid41 t set m.groups = concat(m.groups,",",t.mgid,",") where m.uid = t.uid;

#调出10月10日前注册并充值的用户名单，名单内容包含：用户名、注册邮箱、安全邮箱、注册时间、最后登录时间、充值笔数、充值总额、单笔充值最高额度、需要将这批名单用户放在一个代理字段下面（例：杏吧，博马账号一样）
select u.uid, u.nickname, u.username, u.safemail, u.created, u.logined, count(r.uid), round(sum(r.points/10)), round(max(r.points/10))  from video.video_user u join video.video_recharge r on u.uid = r.uid where u.created < '2015-10-10 00:00:00' and r.pay_type in (1,4) and r.pay_status = 1 group by u.uid limit 10;
