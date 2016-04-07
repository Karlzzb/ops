/*
/home/script/svn/trunk/video-front/V2.2/sql
2.video_group_init.sql
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

Date: 2015-10-05 17:10:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `video_group_permission`;
CREATE TABLE `video_group_permission` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '用户组权限配置表';

-- ----------------------------
-- Records of video_group_permission
-- ----------------------------
INSERT INTO `video_group_permission` VALUES ('1', '1', '1|year', '0', '0', '0', '-1', '0', '0', '0', '0', '0', '0');
INSERT INTO `video_group_permission` VALUES ('2', '1', '0', null, null, '5', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('3', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('4', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('5', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('6', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('7', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('8', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('9', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('10', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('11', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('12', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('13', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('14', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('15', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('16', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('17', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('18', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('19', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('20', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('21', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('22', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('23', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('24', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('25', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('26', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('27', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('28', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('29', '1', '0', null, null, '30', '10', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('30', '0', '1|month', null, null, '30', '5', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('31', '0', '1|week', null, null, '50', '3', null, '0', '0', '0', '0', null);
INSERT INTO `video_group_permission` VALUES ('32', '0', '-1', null, null, '50', '0', null, '2', '1', '2', '0', null);
INSERT INTO `video_group_permission` VALUES ('33', '0', '-1', null, null, '100', '0', null, '2', '2', '2', '0', null);
INSERT INTO `video_group_permission` VALUES ('34', '0', '-1', null, null, '100', '0', null, '2', '3', '2', '1', null);
INSERT INTO `video_group_permission` VALUES ('35', '0', '-1', null, null, '100', '0', null, '2', '4', '2', '2', null);
INSERT INTO `video_group_permission` VALUES ('36', '0', '-1', null, null, '100', '0', null, '1|2', '5', '1|2', '3', null);

-- ----------------------------
-- Table structure for video_level_rich
-- ----------------------------
DROP TABLE IF EXISTS `video_level_rich`;
CREATE TABLE `video_level_rich` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `level_id` int(10) NOT NULL COMMENT '等级ID',
  `level_name` varchar(20) DEFAULT NULL COMMENT '等级名称',
  `level_value` int(10) DEFAULT NULL COMMENT '获取等级对应财富值',
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
INSERT INTO `video_level_rich` VALUES ('1', '0', '游客', '0', 'system', 'private', '#FFFFFF', null, null, '大陆观光客', '2015-09-22 16:08:56', '2015-10-03 15:16:54', '1');
INSERT INTO `video_level_rich` VALUES ('2', '1', '屌丝', '0', 'member', 'private', '#FFFFFF', null, null, '屌丝中的战斗机', '2015-09-22 16:08:56', '2015-10-03 14:55:46', '1');
INSERT INTO `video_level_rich` VALUES ('3', '2', '一富', '500', 'member', 'private', '#FFFFFF', null, null, '初学乍练', '2015-09-22 16:08:56', '2015-10-03 14:57:13', '1');
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
INSERT INTO `video_level_rich` VALUES ('31', '1102', '六品翠尊', null, 'special', 'a:5:{s:10:\"open_money\";s:5:\"10000\";s:10:\"keep_level\";s:4:\"5000\";s:10:\"gift_money\";s:4:\"3000\";s:10:\"gift_level\";s:1:\"8\";s:10:\"host_money\";s:4:\"3000\";}', '#A5EAB5', '120102', null, '贵族', '2015-09-30 12:07:28', '2015-09-30 12:14:05', '1');
INSERT INTO `video_level_rich` VALUES ('32', '1103', '五品绿尊', null, 'special', 'a:5:{s:10:\"open_money\";s:5:\"20000\";s:10:\"keep_level\";s:4:\"8000\";s:10:\"gift_money\";s:4:\"8000\";s:10:\"gift_level\";s:2:\"12\";s:10:\"host_money\";s:4:\"8000\";}', '#0FA731', '120103', null, '贵族', '2015-09-30 12:09:23', '2015-09-30 12:14:09', '1');
INSERT INTO `video_level_rich` VALUES ('33', '1104', '四品青尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"100000\";s:10:\"keep_level\";s:5:\"30000\";s:10:\"gift_money\";s:5:\"30000\";s:10:\"gift_level\";s:2:\"13\";s:10:\"host_money\";s:5:\"30000\";}', '#09E1F9', '120104', null, '贵族', '2015-09-30 12:11:06', '2015-09-30 12:14:12', '1');
INSERT INTO `video_level_rich` VALUES ('34', '1105', '三品蓝尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"250000\";s:10:\"keep_level\";s:5:\"80000\";s:10:\"gift_money\";s:5:\"80000\";s:10:\"gift_level\";s:2:\"15\";s:10:\"host_money\";s:5:\"80000\";}', '#056290', '120105', null, '贵族', '2015-09-30 12:12:46', '2015-09-30 12:14:14', '1');
INSERT INTO `video_level_rich` VALUES ('35', '1106', '二品红尊', null, 'special', 'a:5:{s:10:\"open_money\";s:6:\"500000\";s:10:\"keep_level\";s:6:\"150000\";s:10:\"gift_money\";s:6:\"150000\";s:10:\"gift_level\";s:2:\"19\";s:10:\"host_money\";s:6:\"150000\";}', '#FF0000', '120106', null, '贵族', '2015-09-30 12:15:36', '2015-09-30 12:17:03', '1');
INSERT INTO `video_level_rich` VALUES ('36', '1107', '一品金尊', null, 'special', 'a:5:{s:10:\"open_money\";s:7:\"1000000\";s:10:\"keep_level\";s:6:\"250000\";s:10:\"gift_money\";s:6:\"250000\";s:10:\"gift_level\";s:2:\"23\";s:10:\"host_money\";s:6:\"250000\";}', '#FFED00', '120107', null, '贵族', '2015-09-30 12:16:53', '2015-09-30 12:17:06', '1');


/*
/home/script/svn/trunk/socket/V2.2/sql
2.video_goods20151006.sql
*/
use video;
/*
Navicat MySQL Data Transfer

Source Server         : 10.1.100.51
Source Server Version : 50624
Source Host           : 10.1.100.51:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-10-06 17:20:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_goods
-- ----------------------------
truncate table video_goods;

-- ----------------------------
-- Records of video_goods
-- ----------------------------
INSERT INTO `video_goods` VALUES ('120001', '私人直升机（月）', '1500', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120003', '八抬大轿（月）', '2000', '坐骑', '坐骑', '1002', '2', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120004', '兰博基尼（月）', '800', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120006', '奥迪A8（月）', '8000', '坐骑', '坐骑', '1002', '2', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120007', '哈雷摩托（月）', '500', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120008', '双层大客机（月）', '2000', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120009', '杏吧专属', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120010', '猪猪快跑', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120011', '布加迪威龙', '20000', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120012', '宇宙飞船', '20000', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120013', '航空母舰', '5888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120014', '天马', '8888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120015', '战斗机', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120016', '法拉利超跑', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120017', '浪漫单车', '3888', '坐骑', '坐骑', '1002', '2', '0', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('120018', '审判天使', '0', '坐骑', '坐骑', '1002', '2', '0', '0', '2015-08-01', '0');
INSERT INTO `video_goods` VALUES ('120101', '雪狼', '0', '力量、勇气、谋略于一身，他的气宇让再强的生灵都敬畏三分，有他护佑，所向披靡。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120102', '翠鹰', '0', '他是神圣的精灵，拥有流光的羽翼，和声似银铃的歌鸣，他的到来往往昭示着祥瑞和自由。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120103', '绿鹿', '0', '他是百花的圣灵，是仙子的爱宠，拥有他的人，凡春花开放的地方，都轻易可及。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120104', '龙龟', '0', '能预知未来，能左右大海，无坚不摧，法力无边……有他助阵，就将拥有不可撼。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120105', '麒麟', '0', '贤明祥瑞的仙人坐骑，拥有所有备受人们珍爱的动物所具备的所有优点。谦和时主德行，震怒时威四方，另生灵敬畏。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120106', '火凤', '0', '美与德的极致，拥有操控烈火的神力，和主宰重生的圣权。德、顺、义、信、仁兼具的百鸟之王——他的存在，衔领着世间公正。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('120107', '金龙', '0', '驾天地于无疆，驭水火于无形的万物之灵。大象无形，大音希声——最至高无上的圣灵，才配得上最难得一见的神秘。但他一旦出现，就必将迎来世人的敬仰与朝拜。', '坐骑', '1008', '2', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310001', '蓝宝石', '50', '钻石很久远，一颗就…', '推荐', '1', '1', '1', '0', '2015-06-08', '10');
INSERT INTO `video_goods` VALUES ('310002', '项链', '320', '戴着它，我好像一下变得高贵了', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310003', '香奈儿包包', '300', '有钱就是任性，来一打', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310004', '水晶鞋', '50', '只有尊贵的人才配得上我', '推荐', '2', '1', '1', '0', '2015-06-08', '11');
INSERT INTO `video_goods` VALUES ('310005', '包包', '20', '我是迪奥，不是奥迪哦', '热门', '1', '1', '1', '0', '2015-06-08', '9');
INSERT INTO `video_goods` VALUES ('310006', '千纸鹤', '1', '', '热门', '1', '1', '0', '0', '2015-08-20', '0');
INSERT INTO `video_goods` VALUES ('310007', '抱抱熊', '70', '需要抱抱吗', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310008', '便便', '60', '阿拉蕾最喜欢的玩具', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310009', '抱枕', '50', '睡觉抱着我最舒服了', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310010', '情书', '40', '男女朋友都通用的情书哦', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310011', '冰激凌', '3', '快点吃掉我，我快化掉了', '热门', '1', '1', '1', '0', '2015-06-08', '7');
INSERT INTO `video_goods` VALUES ('310012', '鼓掌', '5', '不错不错，鼓掌', '推荐', '2', '1', '1', '0', '2015-02-13', '14');
INSERT INTO `video_goods` VALUES ('310013', '蛋糕', '20', '吃多了会长胖的哦', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310014', '香吻', '3', '只献给最喜欢的人', '热门', '2', '1', '1', '0', '2015-02-13', '13');
INSERT INTO `video_goods` VALUES ('310015', '喉宝', '15', '喉宝助你好声音', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310016', '鲜花', '1', '请不要把我插在牛粪上', '热门', '1', '1', '1', '0', '2015-02-13', '1');
INSERT INTO `video_goods` VALUES ('310017', '板砖', '10', '任你再叼，一砖拍倒', '推荐', '2', '1', '1', '0', '2015-02-13', '15');
INSERT INTO `video_goods` VALUES ('310018', '棒棒糖', '1', '棒棒，好棒哦', '推荐', '2', '1', '1', '0', '2015-06-08', '10');
INSERT INTO `video_goods` VALUES ('310019', 'iphone6', '100', '土豪金才符合我的气质呢', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310020', '挖掘机', '5', '挖掘机技术哪家强呢', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310021', '愚人节快乐', '1', '', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310022', '蓝色妖姬', '5', '', '热门', '1', '1', '1', '0', '2015-02-13', '2');
INSERT INTO `video_goods` VALUES ('310023', '魅力之星', '1', '', '热门', '1', '1', '0', '0', '2015-06-24', '0');
INSERT INTO `video_goods` VALUES ('310024', '鲍鱼', '10', '', '热门', '1', '1', '1', '0', '2015-07-02', '3');
INSERT INTO `video_goods` VALUES ('310025', '泰迪熊', '40', '', '推荐', '2', '1', '1', '0', '2015-07-02', '7');
INSERT INTO `video_goods` VALUES ('310026', '冰块', '1', '', '热门', '1', '1', '0', '0', '2015-07-02', '0');
INSERT INTO `video_goods` VALUES ('310027', 'XO', '30', '', '推荐', '2', '1', '1', '0', '2015-07-02', '8');
INSERT INTO `video_goods` VALUES ('310028', '月饼', '1', '', '热门', '1', '1', '0', '0', '2015-09-23', '0');
INSERT INTO `video_goods` VALUES ('320001', '鹊桥相会', '777', '', '推荐', '2', '1', '0', '0', '2015-08-20', '0');
INSERT INTO `video_goods` VALUES ('320002', '带字粉丝灯牌', '520', '可不是一般的灯牌哦', '高级', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320003', '烛光晚餐', '888', '只把最好的留给你', '高级', '3', '1', '1', '0', '2015-02-13', '7');
INSERT INTO `video_goods` VALUES ('320004', '梦幻城堡', '1500', '爱TA就送TA一座城堡', '高级', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320005', '我爱你', '520', '对不起，我爱你', '高级', '3', '1', '1', '0', '2015-02-13', '8');
INSERT INTO `video_goods` VALUES ('320006', '心雨', '188', '心如雨下', '热门', '2', '1', '1', '0', '2015-02-13', '5');
INSERT INTO `video_goods` VALUES ('320007', '烟花', '368', '去年烟花特别多', '高级', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320008', '爱神之箭', '521', '用它让主播爱上你吧', '高级', '1', '1', '1', '0', '2015-02-13', '8');
INSERT INTO `video_goods` VALUES ('320009', '幸福摩天轮', '1200', '幸福转转转', '高级', '3', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320010', '祝福气球', '1888', '飞屋环球必备', '高级', '3', '1', '1', '0', '2015-02-13', '6');
INSERT INTO `video_goods` VALUES ('320011', '萌', '10', '萌萌达', '推荐', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320012', '任性', '10', '任性一次', '热门', '3', '1', '1', '0', '2015-02-13', '10');
INSERT INTO `video_goods` VALUES ('320013', '女神', '10', '请叫我女神', '热门', '3', '1', '1', '0', '2015-02-13', '11');
INSERT INTO `video_goods` VALUES ('320014', '波霸', '10', '哇，好大的胸器', '热门', '2', '1', '1', '0', '2015-02-13', '12');
INSERT INTO `video_goods` VALUES ('320015', 'duang', '10', 'duang，duang', '推荐', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320016', '呆', '10', '我当时就惊呆了', '推荐', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320017', '蛋糕', '99', '吃多了会长胖的哦', '高级', '1', '1', '1', '0', '2015-02-13', '11');
INSERT INTO `video_goods` VALUES ('320019', '惊喜狮子', '10', '惊喜！', '高级', '3', '1', '1', '0', '2015-02-13', '2');
INSERT INTO `video_goods` VALUES ('320020', '惊喜小丑', '10', '惊喜！', '高级', '3', '1', '1', '0', '2015-02-13', '3');
INSERT INTO `video_goods` VALUES ('320021', '秋千', '999', '摇摆', '高级', '3', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320022', '烟花之吻', '3888', '爱TA，就送这个给TA吧', '奢华', '4', '1', '1', '0', '2015-02-13', '5');
INSERT INTO `video_goods` VALUES ('320023', '脱掉', '10', '脱！脱！脱！', '推荐', '3', '1', '1', '0', '2015-02-13', '9');
INSERT INTO `video_goods` VALUES ('320024', '花田别墅', '5888', '', '奢华', '4', '1', '1', '0', '2015-02-13', '3');
INSERT INTO `video_goods` VALUES ('320025', '情侣戒指', '488', '它是爱情不可言喻的密码', '高级', '3', '1', '1', '0', '2015-02-13', '5');
INSERT INTO `video_goods` VALUES ('320026', '音乐盒', '388', '可自动演奏音乐', '高级', '3', '1', '1', '0', '2015-02-13', '4');
INSERT INTO `video_goods` VALUES ('320027', '清凉一夏', '266', '清凉一夏，避暑总动员 ', '高级', '2', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('320028', '么么哒', '10', '', '高级', '3', '1', '1', '0', '2015-06-08', '12');
INSERT INTO `video_goods` VALUES ('320029', '玫瑰花捧', '188', '好漂亮的一束鲜花', '高级', '3', '1', '1', '0', '2015-06-08', '1');
INSERT INTO `video_goods` VALUES ('320030', '内涵茄子', '10', '这东西可以吃，还可以用，你懂得', '高级', '2', '1', '1', '0', '2015-06-08', '6');
INSERT INTO `video_goods` VALUES ('320031', '金牌暖情', '10', '', '高级', '2', '1', '0', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('320032', '我罩着你', '100', '', '推荐', '2', '1', '1', '0', '2015-06-24', '9');
INSERT INTO `video_goods` VALUES ('320033', '揉一揉', '200', '', '推荐', '1', '1', '1', '0', '2015-06-24', '4');
INSERT INTO `video_goods` VALUES ('320034', '有容乃大', '300', '', '推荐', '1', '1', '1', '0', '2015-06-24', '5');
INSERT INTO `video_goods` VALUES ('320035', '花瓣纷飞', '266', '', '推荐', '2', '1', '1', '0', '2015-07-02', '4');
INSERT INTO `video_goods` VALUES ('320036', '黄瓜', '50', '', '推荐', '2', '1', '1', '0', '2015-07-02', '2');
INSERT INTO `video_goods` VALUES ('320037', '蜡烛', '100', '', '推荐', '2', '1', '1', '0', '2015-07-02', '3');
INSERT INTO `video_goods` VALUES ('320038', '爱心漫漫', '125', '', '推荐', '2', '1', '1', '0', '2015-09-23', '1');
INSERT INTO `video_goods` VALUES ('330001', '绚丽流星雨', '3888', '一起去看流星雨', '热门', '4', '1', '1', '0', '2015-02-13', '1');
INSERT INTO `video_goods` VALUES ('330002', '情比钻坚', '6888', '', '奢华', '4', '1', '1', '0', '2015-02-13', '2');
INSERT INTO `video_goods` VALUES ('330003', '豪华游艇', '3888', '', '奢华', '4', '1', '1', '0', '2015-02-13', '4');
INSERT INTO `video_goods` VALUES ('330004', '世外桃源', '5888', '', '热门', '1', '1', '1', '0', '2015-09-23', '6');
INSERT INTO `video_goods` VALUES ('700001', '飞屏', '100', '房间内的飞屏', '飞屏', '1003', '1', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('700002', '广播', '200', '广播', '广播', '1004', '1', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('700003', '贵宾坐椅', '40', '贵宾坐椅', '坐椅', '1005', '1', '1', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('800000', '新主播标示', '0', '', '新主播标示', '1006', '1', '1', '0', '2015-09-02', '0');
INSERT INTO `video_goods` VALUES ('900000', '礼物之星（尊享）', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900001', '至尊（金）', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900002', '至尊（银）', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900003', '至尊（铁）', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900004', '金牌会员', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900005', '银牌会员', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');
INSERT INTO `video_goods` VALUES ('900006', '铁牌会员', '0', '', '活动勋章', '1006', '1', '1', '0', '2015-06-08', '0');


