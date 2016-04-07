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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='平台管理员帐号信息表';

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

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
) ENGINE=InnoDB AUTO_INCREMENT=9426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限用户关联表';

-- ----------------------------
-- Table structure for wisdom_token
-- ----------------------------
#按照用户ID取模分表，分20张
DROP TABLE IF EXISTS `wisdom_token`;
CREATE TABLE `wisdom_token` (
  `uid` int(11) DEFAULT NULL COMMENT '用户uid',
  `code` varchar(10) DEFAULT NULL COMMENT '用户来源 bbs   v   ....冗余',
  `app_id` int(11) DEFAULT NULL COMMENT '用户授权的app平台',
  `access_token` varchar(50) DEFAULT NULL COMMENT '用授权token',
  `refresh_token` varchar(50) DEFAULT NULL COMMENT '过期刷新token',
  `expire_time` datetime DEFAULT NULL COMMENT '授权过期时间',
  `init_time` datetime DEFAULT NULL COMMENT '数据创建时间',
  `dml_time` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  `dml_flag` tinyint(3) DEFAULT NULL COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`uid`,`code`)
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




