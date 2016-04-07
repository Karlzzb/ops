DROP TABLE IF EXISTS `pre_ucenter_useravatar`;
CREATE TABLE `pre_ucenter_useravatar` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`uid` int(11) NOT NULL COMMENT '用户id',
`avatar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '头像地址',
`ctime` datetime DEFAULT NULL,
`del` int(11) DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

truncate table pre_ucenter_member_tableid;
insert into pre_ucenter_member_tableid (uid) values ('50000000');

CREATE TABLE IF NOT EXISTS sph_counter ( counter_id INTEGER PRIMARY KEY NOT NULL,max_doc_id INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS sph_counter_2 ( counter_id INTEGER PRIMARY KEY NOT NULL,max_doc_id INTEGER NOT NULL);