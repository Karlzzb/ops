/*
Navicat MySQL Data Transfer

Source Server         : 145
Source Server Version : 50622
Source Host           : 10.1.10.145:3366
Source Database       : wisdom_bbs_flow

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-11-01 16:27:21
*/
create database pw_wisndom_bbs;
use pw_wisndom_bbs;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wisdom_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_auth_group`;
CREATE TABLE `wisdom_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则","隔开',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户组表';

-- ----------------------------
-- Table structure for wisdom_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_auth_group_access`;
CREATE TABLE `wisdom_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户组明细表（关联表）';

-- ----------------------------
-- Table structure for wisdom_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_auth_rule`;
CREATE TABLE `wisdom_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台规则表';

-- ----------------------------
-- Table structure for wisdom_bbs_admin
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_admin`;
CREATE TABLE `wisdom_bbs_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID（自增主键）',
  `username` char(32) NOT NULL COMMENT '管理员登陆名称',
  `passwd` char(32) NOT NULL COMMENT '管理员登陆密码,md5加密',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='平台管理员帐号信息表';

INSERT INTO `wisdom_bbs_admin` VALUES ('1', 'admin', '58bc55137ad85422546b70033e27b8d2', '0', '2015-09-13 17:44:53', '2015-09-13 17:44:53', '1');

-- ----------------------------
-- Table structure for wisdom_bbs_date_stat
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_date_stat`;
CREATE TABLE `wisdom_bbs_date_stat` (
  `auid` int(11) NOT NULL AUTO_INCREMENT,
  `session` int(11) DEFAULT NULL COMMENT '会话数量',
  `session_duration` int(11) DEFAULT NULL COMMENT '会话时长',
  `bounce_rate` decimal(5,2) DEFAULT NULL COMMENT '跳出率',
  `session_avg_duration` time DEFAULT NULL COMMENT '平均会话时长',
  `percent_new_session` decimal(5,2) DEFAULT NULL COMMENT '新会话百分比',
  `new_users` int(11) DEFAULT NULL COMMENT '新用户数',
  `session_page_views` decimal(5,2) DEFAULT NULL COMMENT '会话平均浏览页面数',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日网站统计分析表';

-- ----------------------------
-- Table structure for wisdom_bbs_pv_daychart
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_pv_daychart`;
CREATE TABLE `wisdom_bbs_pv_daychart` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `date_time` varchar(24) DEFAULT NULL COMMENT 'google数据生成时间',
  `unique_page_views` int(11) DEFAULT NULL COMMENT '唯一身份浏览量',
  `exit_rate` decimal(5,2) DEFAULT NULL COMMENT '退出率',
  `page_avg_time` decimal(5,2) DEFAULT NULL COMMENT '页面平均停留时间',
  `page_views` int(11) DEFAULT NULL COMMENT '页面浏览量',
  `bounce_rate` decimal(5,2) DEFAULT NULL COMMENT '跳出率',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛页面访问PV统计表';

-- ----------------------------
-- Table structure for wisdom_bbs_pv_stat
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_pv_stat`;
CREATE TABLE `wisdom_bbs_pv_stat` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `date_time` varchar(24) DEFAULT NULL COMMENT 'google数据生成时间',
  `page_path` text COMMENT '页面地址',
  `unique_page_views` int(11) DEFAULT NULL COMMENT '唯一身份浏览量',
  `exit_rate` decimal(5,2) DEFAULT NULL COMMENT '退出率',
  `page_avg_time` time DEFAULT NULL COMMENT '页面平均停留时间',
  `page_views` int(11) DEFAULT NULL COMMENT '页面浏览量',
  `bounce_rate` decimal(5,2) DEFAULT NULL COMMENT '跳出率',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛页面访问PV统计表';

-- ----------------------------
-- Table structure for wisdom_bbs_request_log
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_request_log`;
CREATE TABLE `wisdom_bbs_request_log` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(50) DEFAULT NULL COMMENT '请求的api的名字',
  `app_id` int(11) DEFAULT NULL COMMENT '平台的开发id',
  `parameters` text,
  `request_time` datetime DEFAULT NULL COMMENT '请求的时间',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wisdom_bbs_uv_daychart
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_uv_daychart`;
CREATE TABLE `wisdom_bbs_uv_daychart` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `date_time` int(11) DEFAULT NULL COMMENT 'google数据生成时间',
  `sessions` int(11) DEFAULT '0' COMMENT '会话量',
  `session_duration` int(11) DEFAULT '0' COMMENT '会话时长',
  `bounce_rate` decimal(5,2) DEFAULT '0.00' COMMENT '跳出率',
  `seesion_avg_duration` int(11) DEFAULT NULL COMMENT '平均会话时长',
  `percent_new_session` decimal(5,2) DEFAULT NULL COMMENT '新增会话百分比',
  `new_users` int(11) DEFAULT NULL COMMENT '新用户',
  `session_page_views` decimal(5,2) DEFAULT NULL COMMENT '会话平均浏览页面数',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛页面访问UV统计表';

-- ----------------------------
-- Table structure for wisdom_bbs_uv_stat
-- ----------------------------
DROP TABLE IF EXISTS `wisdom_bbs_uv_stat`;
CREATE TABLE `wisdom_bbs_uv_stat` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `date_time` int(11) DEFAULT NULL COMMENT 'google数据生成时间',
  `host_name` varchar(255) DEFAULT NULL COMMENT '域名',
  `sessions` int(11) DEFAULT '0' COMMENT '会话量',
  `session_duration` int(11) DEFAULT '0' COMMENT '会话时长',
  `bounce_rate` decimal(5,2) DEFAULT '0.00' COMMENT '跳出率',
  `seesion_avg_duration` int(11) DEFAULT NULL COMMENT '平均会话时长',
  `percent_new_session` decimal(5,2) DEFAULT NULL COMMENT '新增会话百分比',
  `new_users` int(11) DEFAULT NULL COMMENT '新用户',
  `session_page_views` decimal(5,2) DEFAULT NULL COMMENT '会话平均浏览页面数',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛页面访问UV统计表';
