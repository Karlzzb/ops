/*
Navicat MySQL Data Transfer

Source Server         : 244
Source Server Version : 50622
Source Host           : 192.168.10.244:3366
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-07-03 10:41:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `video_gift_activity`
-- ----------------------------
DROP TABLE IF EXISTS `video_gift_activity`;
CREATE TABLE video.`video_gift_activity` (
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
INSERT INTO `video_gift_activity` VALUES ('1', '18元靓丽礼包：哈雷摩托座驾（10天使用期）', '19', '98', '120007', '10', '0', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('2', '46元尊贵礼包：兰博基尼座驾（15天试用期）+ 68钻石', '99', '398', '120004', '15', '68', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('3', '238元尊享礼包：双层大客机座驾（30天试用期）+388钻石', '399', '1000000000', '120008', '30', '388', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('4', '10钻', '1', '50', '0', '0', '10', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('5', '500钻', '50', '100', '120004', '7', '0', '2', '1', '2');
INSERT INTO `video_gift_activity` VALUES ('6', '1000钻', '100', '150', '120001', '7', '0', '2', '1', '3');
INSERT INTO `video_gift_activity` VALUES ('7', '1500钻', '150', '300', '120008', '15', '0', '2', '1', '5');
INSERT INTO `video_gift_activity` VALUES ('8', '3000钻', '300', '800', '120013', '15', '0', '2', '1', '8');
INSERT INTO `video_gift_activity` VALUES ('9', '8000钻', '800', '2000', '120016', '30', '0', '2', '1', '10');
INSERT INTO `video_gift_activity` VALUES ('10', '20000钻', '2000', '5000', '120015', '30', '0', '2', '1', '12');
INSERT INTO `video_gift_activity` VALUES ('11', '50000钻', '5000', '10000', '120015', '60', '0', '2', '1', '13');
INSERT INTO `video_gift_activity` VALUES ('12', '100000钻', '10000', '20000', '120013', '30', '0', '2', '1', '17');
INSERT INTO `video_gift_activity` VALUES ('13', '200000钻', '20000', '50000', '120013', '60', '0', '2', '1', '21');
INSERT INTO `video_gift_activity` VALUES ('14', '500000钻', '50000', '1000000', '120012', '30', '0', '2', '1', '23');
