/*
/home/script/svn/trunk/video-front/V2.1_9/sql
1.video_20151007_2.1.sql
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

Date: 2015-10-07 18:06:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_recharge_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `video_recharge_whitelist`;
CREATE TABLE `video_recharge_whitelist` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `author` int(11) DEFAULT NULL COMMENT '创建者ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='充值白名单';

INSERT INTO `video_conf` VALUES ('recharge_conf', '');

