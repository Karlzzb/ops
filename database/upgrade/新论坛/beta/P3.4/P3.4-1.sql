/*
/home/script/bbs/online_svn/SQL/P3.4
1.pre_common_advertisement_groups.sql
*/
use discuz_db;
﻿/**
 *Title:        工单2015-46-61 DZ广告系统扩展配套SQL文件（新增表格pre_common_advertisement_groups）
 *Description:  用于存储特定广告（advid）的过滤群组（gid）。
 *              广告类型common、custom的advid对应于表pre_common_advertisement中的advid；
 *              广告类型plugin的advid对应于插件ID;
 *              广告类型other为预留，如一个插件里有多于1个广告需要群组过滤设置。
 *Author:       Yangko
 *Date:         2015-11-20 18:23:59

 */

-- ----------------------------
-- Table structure for `pre_common_advertisement_groups`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `pre_common_advertisement_groups` (
`id` int(11) unsigned primary key auto_increment not null comment '自增长ID',  
`advtype` enum('common','custom','plugin','other','') COLLATE utf8_bin NOT NULL comment '广告类型',  
`advid` int(11) NOT NULL comment '广告ID',  
`gid` int(11) NOT NULL comment '用户组ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE utf8_bin comment '存储特定广告的过滤群组';




