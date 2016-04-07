SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `video_gift_activity`
-- ----------------------------
DROP TABLE IF EXISTS `video`.`video_gift_activity`;
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
INSERT INTO `video_gift_activity` VALUES ('4', '送十钻', '1', '50', '0', '0', '10', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('5', '升一富+兰博基尼座驾（7天）', '50', '100', '120004', '7', '0', '2', '1', '2');
INSERT INTO `video_gift_activity` VALUES ('6', ' 升二富+私人直升机（7天)', '100', '150', '120001', '7', '0', '2', '1', '3');
INSERT INTO `video_gift_activity` VALUES ('7', '升四富+双层大客机（15天）', '150', '300', '120008', '15', '0', '2', '1', '5');
INSERT INTO `video_gift_activity` VALUES ('8', '升七富+法拉利（15天）', '300', '800', '120013', '15', '0', '2', '1', '8');
INSERT INTO `video_gift_activity` VALUES ('9', '升九富+法拉利（30天）+杏吧VIP15天', '800', '2000', '120016', '30', '0', '2', '1', '10');
INSERT INTO `video_gift_activity` VALUES ('10', '即可获得男爵爵位，一对一房间1次（25分钟），战斗机30天，成为第一坊初级富豪，并获铁质“富豪” 勋章', '2000', '5000', '120015', '30', '0', '2', '1', '12');
INSERT INTO `video_gift_activity` VALUES ('11', '即可获得子爵爵位，一对一房间1次（25分钟），战斗机60天，成为第一坊初级富豪，并获铁质“富豪”勋章', '5000', '10000', '120015', '60', '0', '2', '1', '13');
INSERT INTO `video_gift_activity` VALUES ('12', '原有爵位基础上升一级（最高不得超过郡公），一对一房间1次（25分钟），航空母舰坐骑30天，成为第一坊中级富豪，并获银质“富豪” 勋章', '10000', '20000', '120013', '30', '0', '2', '1', '17');
INSERT INTO `video_gift_activity` VALUES ('13', '原有爵位基础上升一级（最高不得超过郡王），一对一房间1次（25分钟），航空母舰坐骑60天，成为第一坊中级富豪，并获银质“富豪” 勋章', '20000', '50000', '120013', '60', '0', '2', '1', '21');
INSERT INTO `video_gift_activity` VALUES ('14', '原有爵位基础上升两级（最高不得超过国王），一对一房间1次（55分钟），私人订制坐骑200天，成为第一坊高级富豪，并获金质“富豪” 勋章', '50000', '1000000', '120012', '30', '0', '2', '1', '23');


INSERT INTO video.video_conf (name, value) VALUES ('recharge_datetime', '{"begintime":"2015-7-7 00:00:00","endtime":"2015-7-24 23:59:59"}');