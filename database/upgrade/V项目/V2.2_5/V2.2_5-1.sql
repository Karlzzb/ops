/*
/home/script/svn/trunk/video-front/V2.2_5/sql
1.video_front_20151026_C.sql
*/
use video;
/*
Navicat MySQL Data Transfer

Source Server         : 145
Source Server Version : 50622
Source Host           : 10.1.10.145:3366
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-10-26 13:53:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_recharge_conf
-- ----------------------------

CREATE TABLE `video_recharge_conf` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '充值群组名称',
  `recharge_min` int(11) DEFAULT '0' COMMENT '最小充值金额',
  `recharge_max` int(11) DEFAULT '0' COMMENT '最大充值金额',
  `reg_time_min` int(11) NOT NULL DEFAULT '0' COMMENT '最小注册时间  单位： day',
  `reg_time_max` int(11) DEFAULT '0' COMMENT '最大注册时间  单位： day',
  `isopen` tinyint(3) DEFAULT NULL COMMENT '是否开启充值渠道    0 : 关闭  1：开启',
  `channel_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '充值渠道类型     1 : 第三方充值渠道; 2: 客服充值渠道; 3: 无充值渠道;',
  `channel_id` tinyint(4) DEFAULT NULL COMMENT '充值渠道关联ID  对应充提平台设置',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='充值分组配置表';

ALTER TABLE `video_recharge_whitelist` ADD COLUMN `type` tinyint(4) DEFAULT '0' COMMENT '名单类型：  0：白名单  1：黑名单';

INSERT INTO `video_conf` VALUES ('gamepop', '1');


CREATE TABLE `video_user_check` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID，非业务主键',
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `gid` int(11) DEFAULT '0' COMMENT '等级level_id，特权码ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '审核状态:1通过，2失败，3等待',
  `operate` tinyint(4) DEFAULT '1' COMMENT '审核操作：1开通，2删除',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  `giver` int(11) DEFAULT '0' COMMENT '后台申请人',
  `checker` int(11) DEFAULT '0' COMMENT '后台审核人',
  `checked` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `type` int(11) DEFAULT '3' COMMENT '类型：1开通，2保级，3赠送',
  PRIMARY KEY (`auto_id`,`init_time`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='贵族审核表';


