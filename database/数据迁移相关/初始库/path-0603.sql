DROP TABLE IF EXISTS `pre_s8_common_medal_type`;
CREATE TABLE `pre_s8_common_medal_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `medalid` int(11) NOT NULL DEFAULT '0',
  `assid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_38F5FF47F316AB2` (`medalid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE pre_forum_medallog add `description` text COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE pre_forum_medallog add `authorid` int(10) unsigned NOT NULL DEFAULT '0';
ALTER TABLE pre_common_member_medal add `istransfer` tinyint(40) unsigned NOT NULL DEFAULT '0';


DROP TABLE IF EXISTS `pre_s8_medal_transfer_log`;
CREATE TABLE `pre_s8_medal_transfer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operator` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username1` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `pre_moderator_log`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_log`;
CREATE TABLE `pre_moderator_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `display` tinyint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pre_moderator_log
-- ----------------------------


-- ----------------------------
-- Table structure for `pre_moderator_oper`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_oper`;
CREATE TABLE `pre_moderator_oper` (
  `operid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `opervalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operhook` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display` tinyint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`operid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pre_moderator_oper
-- ----------------------------
INSERT INTO `pre_moderator_oper` VALUES ('1', 'post', '发贴', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('2', 'reply', '回复', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('3', 'delete', '删除主题', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('4', 'bump', '升降', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('5', 'stick', '置顶', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('6', 'live', '直播', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('7', 'highlight', '高亮', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('8', 'digest', '精华', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('9', 'stamp', '图章', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('10', 'stamplist', '图标', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('11', 'close', '关闭', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('12', 'move', '移动', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('13', 'type', '分类', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('14', 'copy', '复制', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('15', 'merge', '合并', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('16', 'split', '分割', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('17', 'repair', '修复', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('18', 'warn', '警告', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('19', 'banpost', '屏蔽', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('20', 'tag', '标签', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('21', 'edit', '编辑', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('22', 'ban', '禁言', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('23', 'rate', '评分', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('24', 'mod', '审核', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('25', 'comment', '点评', '', '1');
INSERT INTO `pre_moderator_oper` VALUES ('26', 'readed', '已阅', '', '1');

-- ----------------------------
-- Table structure for `pre_moderator_readed`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_readed`;
CREATE TABLE `pre_moderator_readed` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`tid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pre_moderator_readed
-- ----------------------------


-- ----------------------------
-- Table structure for `pre_moderator_setting`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_setting`;
CREATE TABLE `pre_moderator_setting` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pre_moderator_setting
-- ----------------------------
INSERT INTO `pre_moderator_setting` VALUES ('sign_set', 'a:26:{s:4:\"post\";a:5:{s:3:\"set\";i:1;s:5:\"ctype\";i:3;s:3:\"min\";i:11;s:3:\"max\";i:11;s:5:\"limit\";i:33;}s:5:\"reply\";a:5:{s:3:\"set\";i:1;s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:6:\"delete\";a:5:{s:3:\"set\";i:1;s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"bump\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"stick\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"live\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:9:\"highlight\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:6:\"digest\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"stamp\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:9:\"stamplist\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"close\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"move\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"type\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"copy\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"merge\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"split\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:6:\"repair\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"warn\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:7:\"banpost\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:3:\"tag\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"edit\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:3:\"ban\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:4:\"rate\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:5:\"check\";a:4:{s:5:\"ctype\";i:1;s:3:\"min\";i:0;s:3:\"max\";i:0;s:5:\"limit\";i:0;}s:7:\"comment\";a:5:{s:3:\"set\";i:1;s:5:\"ctype\";i:1;s:3:\"min\";i:11;s:3:\"max\";i:22;s:5:\"limit\";i:55;}s:6:\"readed\";a:5:{s:3:\"set\";i:1;s:5:\"ctype\";i:1;s:3:\"min\";i:11;s:3:\"max\";i:11;s:5:\"limit\";i:22;}}');

-- ----------------------------
-- Table structure for `pre_moderator_sign`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_sign`;
CREATE TABLE `pre_moderator_sign` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tdsignum` int(10) unsigned NOT NULL DEFAULT '0',
  `presigntime` int(10) unsigned NOT NULL DEFAULT '0',
  `tdopernum` int(10) unsigned NOT NULL DEFAULT '0',
  `preopertime` int(10) unsigned NOT NULL DEFAULT '0',
  `signum` int(10) unsigned NOT NULL DEFAULT '0',
  `opernum` int(10) unsigned NOT NULL DEFAULT '0',
  `topicnum` int(10) unsigned NOT NULL DEFAULT '0',
  `replynum` int(10) unsigned NOT NULL DEFAULT '0',
  `onltime` int(10) unsigned NOT NULL DEFAULT '0',
  `remind` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `vacate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vacstart` int(10) unsigned NOT NULL DEFAULT '0',
  `vacstop` int(10) unsigned NOT NULL DEFAULT '0',
  `vacday` int(10) unsigned NOT NULL DEFAULT '0',
  `absentday` int(10) unsigned NOT NULL DEFAULT '0',
  `display` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `groupid` int(10) DEFAULT '0',
  `leavereason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pre_moderator_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `pre_moderator_wage`
-- ----------------------------
DROP TABLE IF EXISTS `pre_moderator_wage`;
CREATE TABLE `pre_moderator_wage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `vacday` int(10) unsigned NOT NULL DEFAULT '0',
  `absentday` int(10) unsigned NOT NULL DEFAULT '0',
  `signum` int(10) unsigned NOT NULL DEFAULT '0',
  `opernum` int(10) unsigned NOT NULL DEFAULT '0',
  `topicnum` int(10) unsigned NOT NULL DEFAULT '0',
  `replynum` int(10) unsigned NOT NULL DEFAULT '0',
  `onltime` int(10) unsigned NOT NULL DEFAULT '0',
  `display` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit1` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit2` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit3` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit4` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit5` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit6` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit7` int(10) unsigned NOT NULL DEFAULT '0',
  `plancredit8` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit1` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit2` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit3` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit4` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit5` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit6` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit7` int(10) unsigned NOT NULL DEFAULT '0',
  `realcredit8` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `pre_s8cash`
-- ----------------------------
DROP TABLE IF EXISTS `pre_s8cash`;
CREATE TABLE `pre_s8cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addtime` datetime NOT NULL,
  `del` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- ----------------------------
-- Table structure for `pre_s8cash_log`
-- ----------------------------
DROP TABLE IF EXISTS `pre_s8cash_log`;
CREATE TABLE `pre_s8cash_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `addtime` datetime NOT NULL,
  `credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lixi` float DEFAULT NULL COMMENT '利息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `pre_s8cash_password`
-- ----------------------------
DROP TABLE IF EXISTS `pre_s8cash_password`;
CREATE TABLE `pre_s8cash_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `pre_s8cash_percent`;
CREATE TABLE `pre_s8cash_percent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(8) NOT NULL COMMENT '组id',
  `percent` double NOT NULL COMMENT '提现密码',
  `ctime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_accout` (`groupid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `pre_s8cash_percent` VALUES ('1', '9', '2', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('2', '10', '3.8', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('3', '11', '1.9', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('4', '12', '4.7', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('5', '13', '33', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('6', '14', '3', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('7', '15', '3', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('8', '16', '3', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('9', '17', '5', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('10', '18', '4', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('11', '19', '4.9', '2015-05-18 18:27:41');
INSERT INTO `pre_s8cash_percent` VALUES ('12', '20', '7', '2015-05-18 18:27:41');

DROP TABLE IF EXISTS `pre_s8bank_adset`;
CREATE TABLE `pre_s8bank_adset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_picture` varchar(255) NOT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `pre_s8bank_adset` VALUES ('1', 'http://192.168.10.244:4869/5a44c7ba5bbe4ec867233d67e4806848', 'http://www.baidu.com', '2015-05-07 11:46:03');
INSERT INTO `pre_s8bank_adset` VALUES ('2', 'http://192.168.10.244:4869/2b04df3ecc1d94afddff082d139c6f15', 'http://www.baidu.com', '2015-05-06 11:46:06');
INSERT INTO `pre_s8bank_adset` VALUES ('3', 'http://192.168.10.244:4869/22655546833bbf7019a0af8f5b0c6d60?w=516&h=300', 'http://www.baidu.com', '2015-05-11 20:16:43');
INSERT INTO `pre_s8bank_adset` VALUES ('4', 'http://192.168.10.244:4869/5a44c7ba5bbe4ec867233d67e4806848?w=516&h=300', 'http://www.baidu.com', '2015-05-11 20:17:34');


DROP TABLE IF EXISTS `pre_s8bank_history`;
CREATE TABLE `pre_s8bank_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `operat_time` datetime NOT NULL,
  `operat_credit` int(10) NOT NULL,
  `operat_type` int(10) NOT NULL,
  `credit_type` int(10) NOT NULL,
  `rate` float NOT NULL,
  `total_credit` int(10) NOT NULL,
  `t_id` int(10) DEFAULT NULL,
  `dmoney` float DEFAULT NULL,
  `hmoney` float DEFAULT NULL,
  `lixi` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pre_s8bank_timehistory`;
CREATE TABLE `pre_s8bank_timehistory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `deposit_time` datetime NOT NULL,
  `deposit_credit` int(10) NOT NULL,
  `deposit_state` int(10) NOT NULL,
  `interest` int(10) NOT NULL,
  `over_time` datetime NOT NULL,
  `time_cycle` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pre_s8bank_user`;
CREATE TABLE `pre_s8bank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `bank_card` char(11) NOT NULL,
  `join_time` datetime NOT NULL,
  `total_current_credit` int(10) NOT NULL,
  `total_time_credit` int(10) NOT NULL,
  `current_interest` decimal(11,2) NOT NULL,
  `total_interest` decimal(11,2) NOT NULL,
  `last_time` datetime NOT NULL,
  `last_trade_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pre_publicity_users`;
CREATE TABLE `pre_publicity_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL COMMENT 'fromid推广人ID',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '注册用户ID',
  `username` varchar(32) DEFAULT NULL COMMENT '注册用户名',
  `fromip` varchar(15) DEFAULT NULL COMMENT '注册来源IP',
  `fromtime` datetime DEFAULT NULL COMMENT '注册时间',
  `extcredits1` int(10) DEFAULT NULL,
  `extcredits2` int(10) DEFAULT NULL,
  `extcredits3` int(10) DEFAULT NULL,
  `extcredits4` int(10) DEFAULT NULL,
  `extcredits5` int(10) DEFAULT NULL,
  `extcredits6` int(10) DEFAULT NULL,
  `extcredits7` int(10) DEFAULT NULL,
  `extcredits8` int(10) DEFAULT NULL,
  `content` varchar(96) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='宣传中心推广用户表';
