/*
/home/script/svn/trunk/video-admin/V2.2_5/sql
1.video_admin_20151026_D.sql
*/
use video_bos;
﻿/*
raby
*/
CREATE TABLE `vbos_usr_stat_month` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `registed_users` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当月用户注册数',
  `uv` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当月UV数',
  `login_users` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当月登陆用户数',
  `login_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当月登陆次数',
  `users_in_room` int(11) NOT NULL COMMENT '当月连线用户数',
  `num_in_room` int(11) NOT NULL COMMENT '当月连线人次',
  `apex_num` int(11) NOT NULL COMMENT '当月峰值最高人数',
  `apex_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '当月峰值出现的时刻，精确到分钟',
  `avg_time` int(11) NOT NULL COMMENT '当月平均停留时长',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  PRIMARY KEY (`auid`),
  KEY `ctime_key` (`ctime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户访问统计表(月)';



