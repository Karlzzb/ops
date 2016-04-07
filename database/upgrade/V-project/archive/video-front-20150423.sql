USE video;
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

--
-- Table structure for table `video_goods`
-- Table structure for table `video_goods`
--

DROP TABLE IF EXISTS `video_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_goods` (
  `gid` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` int(10) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `category` int(10) NOT NULL,
  `unit_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '购买单位方式,1=计件；2=计时',
  `is_show` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否上架：0=下架，1=上架',
  `is_cast` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否上礼物跑道 0不上 1上',
  `sort_order` smallint(3) DEFAULT NULL COMMENT '商品排序',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_goods`
--

LOCK TABLES `video_goods` WRITE;
/*!40000 ALTER TABLE `video_goods` DISABLE KEYS */;
INSERT INTO `video_goods` VALUES (120001,'私人直升机（月）',1500,'坐骑','坐骑',1002,2,1,0,0),(120003,'八抬大轿（月）',2000,'坐骑','坐骑',1002,2,0,0,0),(120004,'兰博基尼（月）',800,'坐骑','坐骑',1002,2,1,0,0),(120006,'奥迪A8（月）',8000,'坐骑','坐骑',1002,2,0,0,0),(120007,'哈雷摩托（月）',500,'坐骑','坐骑',1002,2,1,0,0),(120008,'双层大客机（月）',2000,'坐骑','坐骑',1002,2,1,0,0),(120009,'杏吧专属',3888,'坐骑','坐骑',1002,2,1,0,0),(120010,'猪猪快跑',3888,'坐骑','坐骑',1002,2,1,0,0),(120011,'布加迪威龙',20000,'坐骑','坐骑',1002,2,1,0,0),(120012,'宇宙飞船',20000,'坐骑','坐骑',1002,2,1,0,0),(120013,'航空母舰',5888,'坐骑','坐骑',1002,2,1,0,0),(120014,'天马',8888,'坐骑','坐骑',1002,2,1,0,0),(120015,'战斗机',3888,'坐骑','坐骑',1002,2,1,0,0),(120016,'法拉利超跑',3888,'坐骑','坐骑',1002,2,1,0,0),(310001,'钻戒',50,'钻石很久远，一颗就…','推荐',2,1,1,0,6),(310002,'项链',320,'戴着它，我好像一下变得高贵了','热门',1,1,0,0,0),(310003,'香奈儿包包',300,'有钱就是任性，来一打','热门',1,1,0,0,0),(310004,'皇冠',50,'只有尊贵的人才配得上我','推荐',2,1,1,0,7),(310005,'Dior香水',20,'我是迪奥，不是奥迪哦','热门',1,1,1,0,4),(310006,'啤酒',10,'啤酒加炸鸡，惬意','热门',1,1,1,0,9),(310007,'抱抱熊',70,'需要抱抱吗','热门',1,1,0,0,0),(310008,'便便',60,'阿拉蕾最喜欢的玩具','热门',1,1,0,0,0),(310009,'抱枕',50,'睡觉抱着我最舒服了','热门',1,1,0,0,0),(310010,'情书',40,'男女朋友都通用的情书哦','热门',1,1,0,0,0),(310011,'冰激凌',3,'快点吃掉我，我快化掉了','热门',1,1,1,0,10),(310012,'鼓掌',5,'不错不错，鼓掌','推荐',2,1,1,0,1),(310013,'蛋糕',20,'吃多了会长胖的哦','热门',1,1,0,0,0),(310014,'香吻',3,'只献给最喜欢的人','热门',1,1,1,0,2),(310015,'喉宝',15,'喉宝助你好声音','热门',1,1,0,0,0),(310016,'鲜花',1,'请不要把我插在牛粪上','热门',1,1,1,0,1),(310017,'板砖',10,'任你再叼，一砖拍倒','推荐',2,1,1,0,8),(310018,'棒棒糖',1,'棒棒，好棒哦','推荐',2,1,1,0,9),(310019,'iphone6',100,'土豪金才符合我的气质呢','热门',1,1,0,0,0),(310020,'挖掘机',5,'挖掘机技术哪家强呢','热门',1,1,0,0,0),(310021,'愚人节快乐',1,'','热门',1,1,0,0,0),(320001,'鹊桥相会',1314,'这桥坚固吗','高级',2,1,0,0,0),(320002,'带字粉丝灯牌',520,'可不是一般的灯牌哦','高级',2,1,0,0,0),(320003,'烛光晚餐',888,'只把最好的留给你','高级',3,1,1,0,3),(320004,'梦幻城堡',1500,'爱TA就送TA一座城堡','高级',2,1,0,0,0),(320005,'我爱你',520,'对不起，我爱你','高级',3,1,1,0,4),(320006,'心雨',188,'心如雨下','热门',1,1,1,0,5),(320007,'烟花',368,'去年烟花特别多','高级',2,1,0,0,0),(320008,'爱神之箭',521,'用它让主播爱上你吧','高级',3,1,1,0,5),(320009,'幸福摩天轮',1200,'幸福转转转','高级',3,1,0,0,0),(320010,'祝福气球',1888,'飞屋环球必备','高级',3,1,1,0,6),(320011,'萌',10,'萌萌达','推荐',2,1,1,0,2),(320012,'任性',10,'任性一次','热门',1,1,1,0,7),(320013,'女神',10,'请叫我女神','热门',1,1,1,0,8),(320014,'波霸',10,'哇，好大的胸器','热门',1,1,1,0,3),(320015,'duang',10,'duang，duang','推荐',2,1,1,0,3),(320016,'呆',10,'我当时就惊呆了','推荐',2,1,1,0,4),(320017,'蛋糕',99,'吃多了会长胖的哦','高级',3,1,1,0,7),(320019,'惊喜狮子',10,'惊喜！','高级',3,1,1,0,1),(320020,'惊喜小丑',10,'惊喜！','高级',3,1,1,0,2),(320021,'秋千',999,'摇摆','高级',3,1,0,0,0),(320022,'烟花之吻',3888,'爱TA，就送这个给TA吧','奢华',4,1,1,0,0),(320023,'脱掉',10,'脱！脱！脱！','推荐',2,1,1,0,5),(320024,'花田别墅',5888,'','奢华',4,1,1,0,0),(330001,'绚丽流星雨',3888,'一起去看流星雨','热门',1,1,1,0,6),(700001,'飞屏',100,'房间内的飞屏','飞屏',1003,1,1,0,0),(700002,'广播',200,'广播','广播',1004,1,1,0,0),(700003,'贵宾坐椅',40,'贵宾坐椅','坐椅',1005,1,1,0,0);
/*!40000 ALTER TABLE `video_goods` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE `video`.`video_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '域名或跳转地址',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：0域名，1跳转页面',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_uniq` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='域名和跳转页面表';

CREATE TABLE `video`.`video_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `did` int(11) DEFAULT NULL COMMENT '域名',
  `rid` int(11) DEFAULT NULL COMMENT '跳转页面',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='域名和跳转页面关联表';

/** 时长房间,预约房间,门票房间表**/
CREATE TABLE `video`.`video_room_duration` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `roomtid` smallint(3) NOT NULL COMMENT '房间类型ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `starttime` datetime NOT NULL COMMENT '房间开始时间',
  `duration` int(10) NOT NULL COMMENT '房间时长',
  `points` int(10) DEFAULT NULL COMMENT '进房间消耗的钻石数  钻石/秒',
  `tickets` int(10) DEFAULT NULL COMMENT '进房间门票数',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '房间状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/** 代理商会员关联表**/
CREATE TABLE `video`.`video_agent_relationship` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `aid` int(10) NOT NULL COMMENT '代理ID',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/** 代理商表**/
CREATE TABLE `video`.`video_agents` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '代理ID',
  `agentaccount` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '代理账号',
  `password` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '代理密码',
  `nickname` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '代理昵称',
  `atype` smallint(2) NOT NULL COMMENT '代理类型:0代理商，1渠道商',
  `rebate` int(10) NOT NULL DEFAULT '0' COMMENT '  返点',
  `agentname` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '代理姓名',
  `withdrawalname` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '提款账号姓名',
  `bank` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '提款银行',
  `bankaccount` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '提款银行账号',
  `testaccount` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否测试帐户:1是，0否',
  `did` int(11) NOT NULL DEFAULT '0',
  `regtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '域名ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


/** 提现申请列表**/
CREATE TABLE `video`.`video_withdrawal_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `withdrawalnu` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '申请提款流水号',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `created` datetime NOT NULL,
  `money` int(10) NOT NULL COMMENT '申请金额',
  `status` int(2) NOT NULL COMMENT '0表示审批中,1表示已审批,2表示拒绝',
  `withdrawaltime` datetime DEFAULT NULL,
  `moneypoints` int(10) DEFAULT '0' COMMENT '提现时候扣掉的钻石点数',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `editor` int(11) DEFAULT NULL COMMENT '操作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `video_gift_activity`;
/*充值活动表*/
CREATE TABLE `video_gift_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `moneymin` mediumint(8) DEFAULT NULL COMMENT '赠送的限制起始金额',
  `moneymax` int(11) DEFAULT NULL COMMENT '赠送的限制结束金额',
  `packid` int(11) unsigned DEFAULT NULL COMMENT '默认是延长天数',
  `giftday` smallint(2) DEFAULT NULL,
  `gitmoney` mediumint(5) DEFAULT NULL,
  `type` smallint(2) DEFAULT '1' COMMENT '活动的类型,1:充值送礼',
  `flag` smallint(2) DEFAULT '1' COMMENT '改活动默认开启',
  `richlv` smallint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video_gift_activity
-- ----------------------------
INSERT INTO `video_gift_activity` VALUES ('1', '18元靓丽礼包：哈雷摩托座驾（10天使用期）', '19', '98', '120007', '10', '0', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('2', '46元尊贵礼包：兰博基尼座驾（15天试用期）+ 68钻石', '99', '398', '120004', '15', '68', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('3', '238元尊享礼包：双层大客机座驾（30天试用期）+388钻石', '399', '1000000000', '120008', '30', '388', '1', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('4', '充1-299元，送10钻石+猪猪快跑（30天）', '1', '299', '120010', '30', '10', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('5', '充300-799元，送888钻石+兰博基尼快跑（30天）', '300', '799', '120004', '30', '888', '2', '1', '0');
INSERT INTO `video_gift_activity` VALUES ('6', '充800-1999元，送2888钻石+私人直升机快跑（30天）', '800', '1999', '120001', '30', '2888', '2', '1', '12');
INSERT INTO `video_gift_activity` VALUES ('7', '充2000-9999元，送8888钻石+双层大客机快跑（30天）+“男爵”', '2000', '9999', '120008', '30', '8888', '2', '1', '12');
INSERT INTO `video_gift_activity` VALUES ('8', '充10000-49999元，送88888钻石+双层大客机快跑（60天）+“王爵”', '10000', '49999', '120008', '60', '88888', '2', '1', '19');
INSERT INTO `video_gift_activity` VALUES ('9', '充50000元以上，送438888钻石+双层大客机快跑（60天）+“皇帝”', '50000', '1000000000', '120008', '60', '438888', '2', '1', '25');


/** 提现规则表**/
DROP TABLE IF EXISTS `video_withdrawal_rules`;
CREATE TABLE `video_withdrawal_rules` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `anchortype` smallint(2) NOT NULL COMMENT '主播类型级别',
  `duration` int(10) NOT NULL COMMENT '主播时长',
  `minincome` int(10) NOT NULL COMMENT '提成档次最低收入',
  `maxincome` int(10) NOT NULL COMMENT '提成级别封顶',
  `rpercentage` float(10,2) NOT NULL COMMENT '提成比例',
  `rlevel` smallint(3) DEFAULT NULL COMMENT '提成级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video_withdrawal_rules
-- ----------------------------
INSERT INTO `video_withdrawal_rules` VALUES ('1', '1', '3600', '0', '2000', '0.00', '1');
INSERT INTO `video_withdrawal_rules` VALUES ('2', '1', '3600', '2003', '20000', '0.45', '2');
INSERT INTO `video_withdrawal_rules` VALUES ('3', '1', '3600', '20001', '50000', '0.48', '3');
INSERT INTO `video_withdrawal_rules` VALUES ('4', '1', '3600', '50001', '200000', '0.50', '4');
INSERT INTO `video_withdrawal_rules` VALUES ('5', '1', '3600', '200001', '500000', '0.53', '5');
INSERT INTO `video_withdrawal_rules` VALUES ('6', '1', '3600', '500001', '1000000', '0.55', '6');
INSERT INTO `video_withdrawal_rules` VALUES ('7', '1', '3600', '1000001', '99999999', '0.55', '7');
INSERT INTO `video_withdrawal_rules` VALUES ('8', '2', '3600', '0', '2999', '0.00', '1');
INSERT INTO `video_withdrawal_rules` VALUES ('9', '2', '3600', '3000', '5999', '0.35', '2');
INSERT INTO `video_withdrawal_rules` VALUES ('10', '2', '3600', '6000', '9999', '0.36', '3');
INSERT INTO `video_withdrawal_rules` VALUES ('11', '2', '3600', '10000', '29999', '0.37', '4');
INSERT INTO `video_withdrawal_rules` VALUES ('12', '2', '3600', '30000', '49999', '0.50', '5');
INSERT INTO `video_withdrawal_rules` VALUES ('13', '2', '3600', '50000', '99999', '0.52', '6');
INSERT INTO `video_withdrawal_rules` VALUES ('14', '2', '3600', '100000', '499999', '0.53', '7');
INSERT INTO `video_withdrawal_rules` VALUES ('15', '2', '3600', '500000', '999999999', '0.55', '8');
INSERT INTO `video_withdrawal_rules` VALUES ('16', '3', '3660', '2', '2999', '7.00', '1');
INSERT INTO `video_withdrawal_rules` VALUES ('17', '3', '3600', '3000', '6000', '0.20', '2');
INSERT INTO `video_withdrawal_rules` VALUES ('18', '3', '3600', '6001', '10000', '0.25', '3');
INSERT INTO `video_withdrawal_rules` VALUES ('19', '3', '3600', '10001', '30000', '0.35', '4');
INSERT INTO `video_withdrawal_rules` VALUES ('20', '3', '3600', '30001', '50000', '0.47', '5');
INSERT INTO `video_withdrawal_rules` VALUES ('21', '3', '3600', '50001', '100000', '0.52', '6');
INSERT INTO `video_withdrawal_rules` VALUES ('22', '3', '3600', '100001', '500000', '0.53', '7');
INSERT INTO `video_withdrawal_rules` VALUES ('23', '3', '3600', '500001', '1000000', '0.55', '8');

DROP TABLE IF EXISTS `video_room_status`;
CREATE TABLE `video_room_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '主播ID',
  `tid` int(11) DEFAULT NULL COMMENT '房间类型ID',
  `pwd` varchar(100) DEFAULT NULL COMMENT '房间密码',
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `status` int(1) DEFAULT NULL COMMENT '状态1=开启,否则关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='房间状态表';



DROP TABLE IF EXISTS `video_lottery`;
CREATE TABLE `video_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '抽奖来源',
  `prize` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '奖品',
  `fenshu` int(10) DEFAULT '0' COMMENT '奖品奖励的钻石数目',
  `probability` decimal(10,2) DEFAULT NULL COMMENT '概率',
  `nums` int(10) DEFAULT '0' COMMENT '奖品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video_lottery
-- ----------------------------
INSERT INTO `video_lottery` VALUES ('1', '抽奖', '一等奖88888钻石', '88888', '0.00', '0');
INSERT INTO `video_lottery` VALUES ('2', '抽奖', '二等奖8888钻石', '8888', '0.00', '0');
INSERT INTO `video_lottery` VALUES ('3', '抽奖', '三等奖888钻石', '888', '0.00', '0');
INSERT INTO `video_lottery` VALUES ('4', '抽奖', '四等奖88钻石', '88', '0.00', '0');
INSERT INTO `video_lottery` VALUES ('5', '抽奖', '五等奖8钻石', '8', '100000.00', '999997');
INSERT INTO `video_lottery` VALUES ('6', '抽奖', '六等奖1钻石', '1', '900000.00', '999949');

DROP TABLE IF EXISTS `video_room_type`;
CREATE TABLE `video_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` varchar(12) DEFAULT NULL COMMENT '房间类型名称',
  PRIMARY KEY (`id`) COMMENT '房间类型表'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='房间类型表';

-- ----------------------------
-- Records of video_room_type
-- ----------------------------
INSERT INTO `video_room_type` VALUES ('1', '普通房间');
INSERT INTO `video_room_type` VALUES ('2', '密码房间');
INSERT INTO `video_room_type` VALUES ('3', '门票房间');
INSERT INTO `video_room_type` VALUES ('4', '预约房间');
INSERT INTO `video_room_type` VALUES ('5', '时常房间');

ALTER TABLE `video_user_extends`
ADD COLUMN `bankname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '银行开户名称' AFTER `qq`,
ADD COLUMN `banknumber`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '银行帐号' AFTER `bankname`,
ADD COLUMN `bankaddress`  varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '银行开户地址' AFTER `banknumber`;

ALTER TABLE video_user add lv_type smallint(2) DEFAULT 1 COMMENT '主播类型1普通艺人,2中级艺人,3高级艺人' AFTER `pic_used_size`;