 drop table if exists s8_bbs.tmp_expired_groups42;
 create table s8_bbs.tmp_expired_groups42 select m.uid, m.username, m.groupid, m.groups from s8_bbs.pw_members m where (m.groupid in (42) or find_in_set('42',m.groups) = 1) and m.uid not in (select distinct uid from s8_bbs.pw_extragroups g where g.gid in (42) and g.startdate > unix_timestamp(date_add(now(),interval - g.days day)));
 alter table s8_bbs.tmp_expired_groups42 add primary key(uid);
 update s8_bbs.tmp_expired_groups42 g, s8_bbs.pw_members m set m.groupid = -1 where m.uid = g.uid and m.groupid =42 and g.groupid = 42;
 update s8_bbs.tmp_expired_groups42 g, s8_bbs.pw_members m set m.groups = replace(m.groups,'42','') where m.uid = g.uid;

 drop table if exists s8_bbs.tmp_expired_groups41;
 create table s8_bbs.tmp_expired_groups41 select m.uid, m.username, m.groupid, m.groups from s8_bbs.pw_members m where (m.groupid in (41) or find_in_set('41',m.groups) = 1) and m.uid not in (select distinct uid from s8_bbs.pw_extragroups g where g.gid in (41) and g.startdate > unix_timestamp(date_add(now(),interval - g.days day)));
 alter table s8_bbs.tmp_expired_groups41 add primary key(uid);
 update s8_bbs.tmp_expired_groups41 g, s8_bbs.pw_members m set m.groupid = -1 where m.uid = g.uid and m.groupid = 41 and g.groupid = 41;
 update s8_bbs.tmp_expired_groups41 g, s8_bbs.pw_members m set m.groups = replace(m.groups,'41','') where m.uid = g.uid;

 insert into archive_db.pw_extragroups select * from s8_bbs.pw_extragroups g where gid in (41,42) and g.startdate < unix_timestamp(date_add(date(now()),interval - g.days day));
 delete from s8_bbs.pw_extragroups where gid in (41,42) and startdate < unix_timestamp(date_add(date(now()),interval - days day));


 
 select distinct uid, username from (select * from s8_bbs.tmp_expired_groups41 union all select * from s8_bbs.tmp_expired_groups42) as a;