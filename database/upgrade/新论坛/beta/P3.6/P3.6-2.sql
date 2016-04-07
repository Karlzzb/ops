/*
/home/script/bbs/online_svn/SQL/P3.6
2.pre_custom_notify.sql
*/
use discuz_db;
create table pre_custom_notify(
	`notify_id` int(11) unsigned primary key auto_increment comment '提醒id',
	`subject` varchar(255) comment '提醒标题',
	`message` text comment '提醒内容',
	`send_time` int(11) unsigned comment  '发送提醒的时间',
	key `send_time` (`send_time`)
) engine=innodb charset=utf8 comment "自定义提醒表"

