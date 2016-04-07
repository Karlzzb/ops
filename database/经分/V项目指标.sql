1.每日注册用户数。维度（天）DNU
select date(created), count(1)  from video.video_user where created > '2015-07-30 00:00:00' group by date(created);

2.每日进入主播房间的用户数 DAU
select date(created), count(distinct uid) from video.video_exit_room where created > '2015-07-30 00:00:00' group by date(created); 

3.七日流失活跃用户数
drop table if exists analyze_db.lost_7;
create table analyze_db.lost_7 select date(t1.created) as mydate, t1.uid from video.video_exit_room t1 left join video.video_exit_room t2 on t1.uid = t2.uid and date(t1.created) = date(DATE_ADD(t2.created, interval -7 day)) where t2.uid is null;
alter table analyze_db.lost_7 add key uid_key(uid), add key mydate_key(mydate);
select mydate, count(distinct uid) from lost_7 group by mydate;

4.七日流失活跃用户比例
select mydate, u.lv_rich, count(distinct uid) from analyze_db.lost_7 l join video.video_user u on l.uid = u.uid group by mydate, lv_rich;


5.每周流失率活跃用户
drop table if exists analyze_db.lost_week;
create table analyze_db.lost_week select week(t1.created) + 1 as myweek, t1.uid from video.video_exit_room t1 left join video_exit_room t2 on t1.uid = t2.uid and week(t1.created) = week(t2.created) -1 where t2.uid is null;
alter table analyze_db.lost_week add key uid_key(uid), add key mydate_key(mydate);
select myweek, count(distinct uid) from lost_week group by myweek;

6.每周流失率活跃用户比例
select myweek, u.lv_rich, count(distinct uid) from analyze_db.lost_week l join video.video_user u on l.uid = u.uid group by mydate, myweek;
      

7.次日留存
select date_add(date(u.created), interval 1 day), count(distinct u.uid) as newnum, count(distinct r.uid) as rnum from video.video_user u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -1 day))) where u.created > (select min(created) from video.video_exit_room) and u.created < date_add(now(),interval -1 day)  group by date(u.created);

select group_concat(round(rnum/newnum,2) * 100) from (select date_add(date(u.created), interval 1 day), count(distinct u.uid) as newnum, count(distinct r.uid) as rnum from video.video_user u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -1 day))) where u.created > '2015-08-01 00:00:00' and u.created < date_add(now(),interval -1 day)  group by date(u.created)) as t;


8.三日留存
select date_add(date(u.created), interval 3 day), count(distinct u.uid), count(distinct r.uid) from video.video_user u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -3 day))) where u.created > (select min(created) from video.video_exit_room) and u.created < date_add(now(),interval -3 day)  group by date(u.created);

select group_concat(round(rnum/newnum,2) * 100) from (select date_add(date(u.created), interval 3 day), count(distinct u.uid) as newnum, count(distinct r.uid) as rnum from video.video_user u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -3 day))) where u.created > (select min(created) from video.video_exit_room) and u.created < date_add(now(),interval -3 day)  group by date(u.created)) as t;


9.七日留存
select group_concat(round(rnum/newnum,2) * 100) from (select date_add(date(u.created), interval 7 day), count(distinct u.uid) as newnum,  count(distinct r.uid) as rnum from video.video_user u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -7 day))) where u.created > (select min(created) from video.video_exit_room) and u.created < date_add(now(),interval -7 day)  group by date(u.created)) as t;

10.周活跃用户
select week(created), count(distinct uid) from video.video_exit_room group by week(created);


11.每小时在线人数？
select date(created), hour(created), count(distinct uid) from video.video_exit_room group by date(created);

12.每小时注册人数
select date(created), hour(created), count(distinct uid) from video.video_user group by date(created), hour(created);

13.时间段内有过付费行为的用户数量 APA
select week(created), pay_type, count(distinct uid) from video.video_recharge where pay_type in (1,4) and pay_status = 1 group by week(created), pay_type; 

14.时间段内付费用户消费总额
select date(created), pay_type, sum(points) from video.video_recharge where pay_type in (1,4) and pay_status = 1 group by date(created);

15.ARPPU
select date(created), pay_type, round(sum(points)/count(distinct uid),2) from video.video_recharge where pay_type in (1,4) and pay_status = 1 group by date(created);

16.ARPU
select t1.mydate, pay_type, round(t1.sump/t2.unum,2) from (select date(created) as mydate, pay_type, sum(points) as sump from video.video_recharge where pay_type in (1,4) and pay_status = 1 group by date(created)) as t1 join (select date(created) as mydate, count(distinct uid) as unum from video.video_exit_room group by date(created)) as t2 on t1.mydate = t2.mydate;

17.付费率
select t1.mydate, round(t1.punum/t2.unum,4) from (select date(created) as mydate, count(distinct uid) as punum from video.video_recharge where pay_type in (1,4) and pay_status = 1 group by date(created))as t1 join (select date(created) as mydate, count(distinct uid) as unum from video.video_exit_room group by date(created)) as t2 on t1.mydate = t2.mydate;

18.每日首次付费用户数
select date(created), count(uid) from (select uid, created from (select uid, created from video.video_recharge where pay_type in (1,4) and pay_status = 1 and created > '2015-07-30 00:00:00' order by created) as a group by uid) as t group by date(created);

19.付费用户流失数量
select date_add(date(u.created), interval 1 week), count(distinct u.uid), count(distinct r.uid) from video.video_recharge u left join video.video_exit_room r on u.uid = r.uid and date(u.created) = date(date(DATE_ADD(date(r.created), interval -1 week))) where u.pay_type in (1) and u.pay_status = 1 and u.created > '2015-08-01 00:00:00' and u.created < date_add(now(),interval -1 week)  group by date(u.created);

20.付费用户转换时长
select round(avg(unix_timestamp(p.created) - unix_timestamp(u.created))/3600, 2) as timeval from video.video_user u join (select g.uid, g.created from (select uid, created from video.video_recharge where pay_type in (1,4) and pay_status = 1 order by created ) as g group by g.uid) as p on u.uid = p.uid;

21. ?

22.主播消费刺激能力（每分钟内的平均收入）
select l.uid, u.nickname, ifnull(sum(l.points)/sum(l.duration)*60,0) as power from video.video_live_list l join video.video_user u on l.uid = u.uid group by uid order by power desc;

23.每日平均用户在线时长
select unix_timestamp((date(in_time)) as mydate, round(sum(duration)/count(distinct uid)) as onlinetime from video.video_exit_room group by date(in_time);