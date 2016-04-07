/*
/home/script/svn/trunk/video-admin/V2.1_10/sql
1.video_20151008_2.1.sql
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

use video_bos;
INSERT INTO `vbos_priv` VALUES ('337', '充值管理', '0', '1', '', 'Recharge', 'fa fa-usd', '2015-10-05 09:54:40', '2015-10-05 10:09:14', '2');
INSERT INTO `vbos_priv` VALUES ('338', '充值白名单', '337', '1', 'whiteList', 'Recharge', '', '2015-10-05 10:07:20', '2015-10-05 10:09:02', '2');
INSERT INTO `vbos_priv` VALUES ('339', '充值条件设置', '337', '1', 'rechargeTools', 'Recharge', '', '2015-10-05 10:08:14', '2015-10-05 10:08:41', '2');
INSERT INTO `vbos_priv` VALUES ('340', '编辑', '339', '0', 'ajaxEditRechargeTools', 'Recharge', '', '2015-10-05 11:18:12', '2015-10-05 11:18:12', '1');
INSERT INTO `vbos_priv` VALUES ('341', '添加查询', '338', '0', 'ajaxGetone', 'Recharge', '', '2015-10-05 14:12:25', '2015-10-05 14:16:01', '2');
INSERT INTO `vbos_priv` VALUES ('342', '添加白名单', '338', '0', 'ajaxAddWhitelist', 'Recharge', '', '2015-10-05 14:16:59', '2015-10-05 14:16:59', '1');
INSERT INTO `vbos_priv` VALUES ('343', '移除白名单', '338', '0', 'ajaxWhiteListDel', 'Recharge', '', '2015-10-05 14:35:36', '2015-10-05 14:35:36', '1');


