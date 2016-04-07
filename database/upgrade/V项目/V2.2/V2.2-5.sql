/*
/home/script/svn/trunk/video-front/V2.2/sql
3.video_front_V2.2_20151016_U.sql
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

Date: 2015-10-02 14:03:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_level_rich
-- ----------------------------
DROP TABLE IF EXISTS `video_level_rich`;
CREATE TABLE `video_level_rich` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `level_id` int(10) NOT NULL COMMENT '等级ID',
  `level_name` varchar(20) DEFAULT NULL COMMENT '等级名称',
  `level_value` int(10) DEFAULT NULL COMMENT '等级数值',
  `type` varchar(50) DEFAULT NULL COMMENT '用户组类型 system member  special',
  `system` varchar(250) DEFAULT NULL COMMENT '私有还是公有用户组 公有的可买',
  `color` varchar(20) DEFAULT NULL COMMENT '标识颜色',
  `mount` int(11) DEFAULT NULL COMMENT '坐骑id',
  `icon` int(11) DEFAULT NULL COMMENT '标识 勋章',
  `description` varchar(255) DEFAULT NULL COMMENT '用户组描述',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户组配置表';

-- ----------------------------
-- Records of video_level_rich
-- ----------------------------
INSERT INTO `video_level_rich` VALUES ('1', '0', '游客', '0', 'system', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-28 12:17:09', '1');
INSERT INTO `video_level_rich` VALUES ('2', '1', '屌丝', '0', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('3', '2', '一富', '500', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('4', '3', '二富', '2000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('5', '4', '三富', '5000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('6', '5', '四富', '10000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('7', '6', '五富', '18000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('8', '7', '六富', '33000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('9', '8', '七富', '63000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('10', '9', '八富', '113000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('11', '10', '九富', '183000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('12', '11', '十富', '273000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('13', '12', '男爵', '373000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('14', '13', '子爵', '493000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('15', '14', '伯爵', '633000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('16', '15', '候爵', '793000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('17', '16', '公爵', '993000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('18', '17', '郡公', '1293000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('19', '18', '国公', '1743000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('20', '19', '王爵', '2343000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('21', '20', '藩王', '3343000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('22', '21', '郡王', '5143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('23', '22', '亲王', '7143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('24', '23', '国王', '10143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('25', '24', '帝王', '14143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('26', '25', '皇帝', '20143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('27', '26', '天君', '29143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('28', '27', '帝君', '39143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('29', '28', '圣君', '64143000', 'member', 'private', null, null, null, null, '2015-09-22 16:08:56', '2015-09-22 16:09:41', '1');
INSERT INTO `video_level_rich` VALUES ('30', '1101', '七品白尊', null, 'special', 'a:5:{s:10:\"open_money\";s:4:\"3000\";s:10:\"keep_level\";s:4:\"1500\";s:10:\"gift_money\";s:4:\"1000\";s:10:\"gift_level\";s:1:\"5\";s:10:\"host_money\";s:4:\"1000\";}', '#FFFFFF', '120101', null, '贵族', '2015-09-30 12:05:36', '2015-09-30 12:14:00', '1');
INSERT INTO `video_level_rich` VALUES ('31', '1102', '六品墨尊', null, 'special', 'a:5:{s:10:\"open_money\";s:5:\"10000\";s:10:\"keep_level\";s:4:\"5000\";s:10:\"gift_money\";s:4:\"3000\";s:10:\"gift_level\";s:1:\"8\";s:10:\"host_money\";s:4:\"3000\";}', '#A5EAB5', '120102', null, '贵族', '2015-09-30 12:07:28', '2015-09-30 12:14:05', '1');
INSERT INTO `video_level_rich` VALUES ('32', '1103', '五品绿尊', null, 'special', 'a:5:{s:10:\"open_money\";s:5:\"20000\";s:10:\"keep_level\";s:4:\"8000\";s:10:\"gift_money\";s:4:\"8000\";s:10:\"gift_level\";s:2:\"12\";s:10:\"host_money\";s:4:\"8000\";}', '#0FA731', '120103', null, '贵族', '2015-09-30 12:09:23', '2015-09-30 12:14:09', '1');
INSERT INTO `video_level_rich` VALUES ('33', '1104', '四品青尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"100000\";s:10:\"keep_level\";s:5:\"30000\";s:10:\"gift_money\";s:5:\"30000\";s:10:\"gift_level\";s:2:\"13\";s:10:\"host_money\";s:5:\"30000\";}', '#09E1F9', '120104', null, '贵族', '2015-09-30 12:11:06', '2015-09-30 12:14:12', '1');
INSERT INTO `video_level_rich` VALUES ('34', '1105', '三品蓝尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"250000\";s:10:\"keep_level\";s:5:\"80000\";s:10:\"gift_money\";s:5:\"80000\";s:10:\"gift_level\";s:2:\"15\";s:10:\"host_money\";s:5:\"80000\";}', '#056290', '120105', null, '贵族', '2015-09-30 12:12:46', '2015-09-30 12:14:14', '1');
INSERT INTO `video_level_rich` VALUES ('35', '1106', '二品红尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"500000\";s:10:\"keep_level\";s:6:\"150000\";s:10:\"gift_money\";s:6:\"150000\";s:10:\"gift_level\";s:2:\"19\";s:10:\"host_money\";s:6:\"150000\";}', '#FF0000', '120106', null, '贵族', '2015-09-30 12:15:36', '2015-09-30 12:17:03', '1');
INSERT INTO `video_level_rich` VALUES ('36', '1107', '一品金尊', null, 'special', 'a:5:{s:10:\"open_money\";s:7:\"1000000\";s:10:\"keep_level\";s:6:\"250000\";s:10:\"gift_money\";s:6:\"250000\";s:10:\"gift_level\";s:2:\"23\";s:10:\"host_money\";s:6:\"250000\";}', '#FFED00', '120107', null, '贵族', '2015-09-30 12:16:53', '2015-09-30 12:17:06', '1');

-- ----------------------------
-- Table structure for video_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `video_group_permission`;
CREATE TABLE `video_group_permission` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `allowvisitroom` tinyint(4) DEFAULT NULL COMMENT '是否限制访问房间',
  `modnickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否允许修改昵称',
  `haswelcome` tinyint(4) DEFAULT NULL COMMENT '是否有进房欢迎语',
  `haschateffect` tinyint(4) DEFAULT NULL COMMENT '是否有聊天特效',
  `chatlimit` tinyint(4) DEFAULT NULL COMMENT '聊天文字长度限制',
  `chatsecond` tinyint(4) DEFAULT NULL COMMENT '聊天文字时间限制',
  `hasvipseat` tinyint(4) DEFAULT NULL COMMENT '房间是否有贵宾席',
  `nochat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '防止被禁言',
  `nochatlimit` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '禁言别人的权限',
  `avoidout` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否可以防被踢',
  `letout` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '踢人的权限',
  `allowstealth` tinyint(4) DEFAULT NULL COMMENT '是否允许隐身',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of video_group_permission
-- ----------------------------
INSERT INTO `video_group_permission` VALUES ('1', '1', '1|year', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `video_group_permission` VALUES ('30', '0', '1|month', null, null, '30', '5', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('31', '0', '1|week', null, null, '50', '3', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('32', '0', '-1', null, null, '50', '0', null, '2', '1', '2', '0', null);
INSERT INTO `video_group_permission` VALUES ('33', '0', '-1', null, null, '100', '0', null, '2', '2', '2', '0', null);
INSERT INTO `video_group_permission` VALUES ('34', '0', '-1', null, null, '100', '0', null, '2', '3', '2', '1', null);
INSERT INTO `video_group_permission` VALUES ('35', '0', '-1', null, null, '100', '0', null, '2', '4', '2', '2', null);
INSERT INTO `video_group_permission` VALUES ('36', '0', '-1', null, null, '100', '0', null, '1|2', '5', '1|2', '3', null);


-- ----------------------------
-- Records of video_user_commission
-- ----------------------------
DROP TABLE IF EXISTS `video_user_commission`;
CREATE TABLE `video_user_commission` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '佣金信息 自增id',
  `uid` int(11) NOT NULL COMMENT '用户的id  不分主播和用户 都是一样的用户id',
  `r_uid` int(11) DEFAULT NULL COMMENT '与产生这条佣金有关系的用户，如 谁开通的，就存此用户的uid，系统的就为0，也可以为空',
  `r_id` int(11) DEFAULT NULL COMMENT '关联的数据的id 比如某个用户开通贵族的，就存贵族的id，也可为空',
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '佣金来源关键词 如果开通贵族：open_vip',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '佣金说明的标题',
  `points` int(11) DEFAULT NULL COMMENT '提成佣金的数量 单位为 钻石',
  `create_at` datetime DEFAULT NULL COMMENT '佣金产生的时间',
  `data` text COLLATE utf8_unicode_ci COMMENT '佣金相关的数据 序列化后的数据',
  `content` text COLLATE utf8_unicode_ci COMMENT '佣金说明 比如 xx在您的房间xxxx年x月x日开通了什么XXX，您得到XX佣金！',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否已经提取了 0否 1已经提取',
  `dml_flag` tinyint(4) DEFAULT NULL COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户佣金提成表';

-- ----------------------------
-- Table structure for video_user_buy_group
-- ----------------------------
DROP TABLE IF EXISTS `video_user_buy_group`;
CREATE TABLE `video_user_buy_group` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户购买用户组记录id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `gid` int(11) DEFAULT NULL COMMENT '购买的组的id',
  `level_id` int(11) DEFAULT NULL COMMENT '开通的vip值对应用户组的',
  `type` tinyint(4) DEFAULT NULL COMMENT '操作类型  1开通 2 保级',
  `create_at` datetime DEFAULT NULL COMMENT '开通时间',
  `rid` int(11) DEFAULT NULL COMMENT '房间id',
  `end_time` datetime DEFAULT NULL COMMENT '到期时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `open_money` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开通时的价格',
  `keep_level` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '保级价格',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`),
  KEY  nultikey1 ( `uid` ,`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户购买用户组的记录';


-- ----------------------------
-- Table structure for video_user_mod_nickname
-- ----------------------------
DROP TABLE IF EXISTS `video_user_mod_nickname`;
CREATE TABLE `video_user_mod_nickname` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `before` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改前的名字',
  `after` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改后的名字',
  `update_at` int(11) DEFAULT NULL COMMENT '修改时的时间戳',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`),
  KEY  uid_st ( `uid` )
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户修改昵称记录 记录修改次数和修改的信息';

INSERT INTO `video_charge_channel` VALUES ('1', '环讯', '1', 'hx', '2015-09-29 16:19:50', '2015-10-01 09:40:02', '1');
INSERT INTO `video_charge_channel` VALUES ('2', '新生', '1', 'xs', '2015-09-29 18:39:56', '2015-09-30 18:00:49', '1');
INSERT INTO `video_charge_channel` VALUES ('3', '顺峰', '1', 'sf', '2015-09-29 18:40:16', '2015-10-01 09:39:56', '1');


#第三方支付可设置隐藏
DROP TABLE IF EXISTS `video_charge_channel`;
CREATE TABLE `video_charge_channel` (
  `charge_channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID：充值渠道',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1开0关',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '标识符',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`charge_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付通道配置表';



