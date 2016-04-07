/*
Navicat MySQL Data Transfer

Source Server         : 141
Source Server Version : 50622
Source Host           : 192.168.127.141:3366
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-09-04 16:05:22
*/
CREATE DATABASE IF NOT EXISTS wisdom_db;

USE wisdom_db;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wisdom_admin
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_admin`;
CREATE TABLE `wisdom_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID（自增主键）',
  `username` char(32) NOT NULL COMMENT '管理员登陆名称',
  `passwd` char(32) NOT NULL COMMENT '管理员登陆密码,md5加密',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台管理员帐号信息表';

-- ----------------------------
-- Table structure for wisdom_iteminfo
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_app`;
CREATE TABLE `wisdom_app` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '平台名称',
  `app_id` varchar(50) DEFAULT NULL COMMENT '平台认证id',
  `app_security` varchar(50) DEFAULT NULL COMMENT '平台认证秘钥',
  `code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '代号 bbs video',
  `invt_time` datetime DEFAULT NULL COMMENT '接入时间',
  `init_time` datetime DEFAULT NULL COMMENT '数据创建时间',
  `dml_time` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  `dml_flag` tinyint(3) DEFAULT NULL COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='接入应用信息表';

-- ----------------------------
-- Table structure for wisdom_access_stat
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_access_stat`;
CREATE TABLE `wisdom_access_stat` (
`app_id` varchar(50) DEFAULT NULL COMMENT '平台认证id',
`connect_type` int(11) DEFAULT NULL COMMENT '接入接口的类型1为授权接入，2为获取token接入，3为刷新token接入，4为获取资源接入',
`insert_times` int(11) DEFAULT NULL COMMENT '平台接入次数',
`insert_users` int(11) DEFAULT NULL COMMENT '接入用户次数',
`random_count` int(11) DEFAULT NULL COMMENT '避免统计锁的随即数字',
PRIMARY KEY (`app_id`,`random_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='应用访问统计表';

-- ----------------------------
-- Table structure for wisdom_priv
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_priv`;
CREATE TABLE `wisdom_priv` (
  `priv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非主键业务ID',
  `priv_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名称',
  `parent` int(11) NOT NULL COMMENT '父级ID',
  `menu` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否为菜单，1是，0否',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '方法名称',
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'class类名称',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图标',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Table structure for wisdom_priv_role
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_priv_role`;
CREATE TABLE `wisdom_priv_role` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `priv_id` int(11) NOT NULL COMMENT '权限ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限用户关联表';

-- ----------------------------
-- Table structure for wisdom_token
-- ----------------------------
#按照用户ID取模分表，分20张
DROP TABLE IF EXISTS `wisdom_token`;
CREATE TABLE `wisdom_token` (
  `public_uid` int(11) DEFAULT NULL AUTO_INCREMENT COMMENT '用户uid',
  `uid` int(11) DEFAULT NULL COMMENT '用户uid',
  `code` varchar(10) DEFAULT NULL COMMENT '用户来源 bbs   v   ....冗余',
  `app_id` int(11) DEFAULT NULL COMMENT '用户授权的app平台',
  `access_token` varchar(50) DEFAULT NULL COMMENT '用授权token',
  `refresh_token` varchar(50) DEFAULT NULL COMMENT '过期刷新token',
  `expire_time` datetime DEFAULT NULL COMMENT '授权过期时间',
  `init_time` datetime DEFAULT NULL COMMENT '数据创建时间',
  `dml_time` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  `dml_flag` tinyint(3) DEFAULT NULL COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`public_uid`),
  UNIQUE KEY (`uid` ,`code`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='认证token信息表';

DROP TABLE IF EXISTS `wisdom_request_log`;
CREATE TABLE `wisdom_request_log` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(50) DEFAULT NULL COMMENT '请求的api的名字',
  `app_id` int(11) DEFAULT NULL COMMENT '平台的开发id',
  `parameters` text,
  `request_time` datetime DEFAULT NULL COMMENT '请求的时间',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wisdom_admin` WRITE;
/*!40000 ALTER TABLE `wisdom_admin` DISABLE KEYS */;
INSERT INTO `wisdom_admin` VALUES (1,'admin','58bc55137ad85422546b70033e27b8d2',0,'2015-09-13 17:44:53','2015-09-13 17:44:53',1);
/*!40000 ALTER TABLE `wisdom_admin` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `wisdom_app` WRITE;
/*!40000 ALTER TABLE `wisdom_app` DISABLE KEYS */;
INSERT INTO `wisdom_app` VALUES (1,'V项目11111','1','NGVjMTUwZTAwY2JiYTVmMWY1MDg0ZmUxNTRmMTJjOTQ=','V',NULL,'2015-09-22 06:25:49','2015-10-10 16:31:03',3),(2,'论坛','1','NGVjMTUwZTAwY2JiYTVmMWY1MDg0ZmUxNTRmMTJjOTQ=','BBS',NULL,'2015-09-22 06:26:01','2015-10-04 13:18:55',1),(3,'Oauth','OAUTH','NDY0MGIwZjE2Y2IyZDhmNzgyY2U0ZDcyZmNlMDdlYTI=','OAUTH2.0',NULL,'2015-09-22 06:26:32','2015-09-28 23:06:06',1),(4,'1313','123123','NGVjMTUwZTAwY2JiYTVmMWY1MDg0ZmUxNTRmMTJjOTQ=','11111',NULL,'2015-09-22 06:27:14','2015-10-10 16:31:43',3),(5,'31312','31231231','OTZkMWRkOTcxYTMyM2NiZmM4MDM5YmE1NjNkNDIxZWY=','    adadada',NULL,'2015-09-22 06:27:29','2015-10-11 13:56:29',3),(6,'啪啪以啪啪','APP','MDkyNDM0ODA2MDZkZWQ0NDA2NDIzZjdjNmM4N2VjY2Q=','APP',NULL,'2015-10-06 13:35:17','2015-10-06 13:35:17',1),(7,'AP','AP','YzY1ZmJhYmQyNDBhMWU5NTc5NGI4NzJmMjg4MjA1NzI=','AP',NULL,'2015-10-06 13:36:40','2015-11-14 13:55:06',1);
/*!40000 ALTER TABLE `wisdom_app` ENABLE KEYS */;
UNLOCK TABLES;


CREATE DATABASE IF NOT EXISTS s8_bbs;

USE s8_bbs;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `pw_membercredit` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` tinyint(3) NOT NULL DEFAULT '0',
  `value` mediumint(8) NOT NULL DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `cv` (`cid`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pw_memberdata` (
  `uid` int(10) unsigned NOT NULL DEFAULT '1',
  `postnum` int(10) unsigned NOT NULL DEFAULT '0',
  `digests` smallint(6) NOT NULL DEFAULT '0',
  `rvrc` int(10) NOT NULL DEFAULT '0',
  `money` int(10) NOT NULL DEFAULT '0',
  `credit` int(10) NOT NULL DEFAULT '0',
  `currency` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `thisvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `onlinetime` int(10) unsigned NOT NULL DEFAULT '0',
  `monoltime` int(10) unsigned NOT NULL DEFAULT '0',
  `todaypost` smallint(6) unsigned NOT NULL DEFAULT '0',
  `monthpost` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `onlineip` varchar(30) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `postcheck` varchar(16) NOT NULL DEFAULT '',
  `pwdctime` int(10) unsigned NOT NULL DEFAULT '0',
  `f_num` int(10) unsigned NOT NULL DEFAULT '0',
  `creditpop` varchar(150) NOT NULL DEFAULT '',
  `jobnum` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ifcolony` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emailyz` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `postnum` (`postnum`),
  KEY `monthpost` (`monthpost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE `pw_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `safecv` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `groupid` tinyint(3) NOT NULL DEFAULT '-1',
  `memberid` tinyint(3) NOT NULL DEFAULT '0',
  `groups` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `introduce` text NOT NULL,
  `oicq` varchar(12) NOT NULL DEFAULT '',
  `aliww` varchar(30) NOT NULL,
  `icq` varchar(12) NOT NULL DEFAULT '',
  `msn` varchar(35) NOT NULL DEFAULT '',
  `yahoo` varchar(35) NOT NULL DEFAULT '',
  `site` varchar(75) NOT NULL DEFAULT '',
  `location` varchar(36) NOT NULL DEFAULT '',
  `honor` varchar(100) NOT NULL DEFAULT '',
  `bday` date NOT NULL DEFAULT '0000-00-00',
  `lastaddrst` varchar(255) NOT NULL DEFAULT '',
  `yz` int(10) NOT NULL DEFAULT '1',
  `timedf` varchar(5) NOT NULL DEFAULT '',
  `style` varchar(12) NOT NULL DEFAULT '',
  `datefm` varchar(15) NOT NULL DEFAULT '',
  `t_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `p_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attach` varchar(50) NOT NULL DEFAULT '',
  `hack` varchar(255) NOT NULL DEFAULT '0',
  `newpm` smallint(6) unsigned NOT NULL DEFAULT '0',
  `banpm` text NOT NULL,
  `msggroups` varchar(255) NOT NULL DEFAULT '',
  `medals` varchar(255) NOT NULL DEFAULT '',
  `userstatus` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut` varchar(255) NOT NULL DEFAULT '',
  `salt` char(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `pw_usergroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gptype` enum('default','member','system','special') NOT NULL DEFAULT 'member',
  `grouptitle` varchar(60) NOT NULL DEFAULT '',
  `groupimg` varchar(15) NOT NULL DEFAULT '',
  `grouppost` int(10) NOT NULL DEFAULT '0',
  `ifdefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`gid`),
  KEY `gptype` (`gptype`),
  KEY `grouppost` (`grouppost`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
