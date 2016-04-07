/*
/home/script/bbs/online_svn/SQL/P3.3
1.pre_plugin_custom_set.sql
*/
use discuz_db;
create table pre_plugin_custom_set(
`id` int(11) unsigned primary key auto_increment not null comment '表自增字段',
`plugin_name` varchar(255) unique key not null comment '插件名称',
`plugin_set` text comment '插件配置的值'
) engine=innodb charset=utf8 comment '自定义插件配置表';

