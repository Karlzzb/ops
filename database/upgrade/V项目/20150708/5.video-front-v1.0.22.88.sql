/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.244
Source Server Version : 50622
Source Host           : 192.168.10.244:3366
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-07-04 16:43:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_gift_activity
-- ----------------------------
DROP TABLE IF EXISTS `video_gift_activity`;
CREATE TABLE `video_gift_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftname` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `moneymin` mediumint(8) DEFAULT NULL COMMENT '赠送的限制起始金额',
  `moneymax` int(11) DEFAULT NULL COMMENT '赠送的限制结束金额',
  `packid` int(11) unsigned DEFAULT NULL COMMENT '默认是延长天数',
  `giftday` smallint(2) DEFAULT NULL,
  `gitmoney` mediumint(5) DEFAULT NULL,
  `type` smallint(2) DEFAULT '1' COMMENT '活动的类型,1:充值送礼',
  `flag` smallint(2) DEFAULT '1' COMMENT '改活动默认开启',
  `richlv` smallint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video_gift_activity
-- ----------------------------
INSERT INTO `video_gift_activity` VALUES ('4', '10钻', '1', '50', '0', '0', '10', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('5', '500钻', '50', '100', '120004', '7', '0', '2', '1', '2');
INSERT INTO `video_gift_activity` VALUES ('6', '1000钻', '100', '150', '120001', '7', '0', '2', '1', '3');
INSERT INTO `video_gift_activity` VALUES ('7', '1500钻', '150', '300', '120008', '15', '0', '2', '1', '5');
INSERT INTO `video_gift_activity` VALUES ('8', '3000钻', '300', '800', '120016', '15', '0', '2', '1', '8');
INSERT INTO `video_gift_activity` VALUES ('9', '8000钻', '800', '2000', '120016', '30', '0', '2', '1', '10');
INSERT INTO `video_gift_activity` VALUES ('10', '20000钻', '2000', '5000', '120015', '30', '0', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('11', '50000钻', '5000', '10000', '120015', '60', '0', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('12', '100000钻', '10000', '20000', '120013', '30', '0', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('13', '200000钻', '20000', '50000', '120013', '60', '0', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('14', '500000钻', '50000', '1000000', '0', '0', '0', '2', '1', '0');
