/*
Navicat MySQL Data Transfer

Source Server         : 10.146.180.42
Source Server Version : 50622
Source Host           : 10.146.180.42:3366
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-03-21 17:55:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_gift_activity
-- ----------------------------
DROP TABLE IF EXISTS `video_gift_activity`;
CREATE TABLE `video_gift_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `moneymin` smallint(8) DEFAULT NULL COMMENT '赠送的限制起始金额',
  `moneymax` int(11) DEFAULT NULL COMMENT '赠送的限制结束金额',
  `packid` int(11) unsigned DEFAULT NULL COMMENT '默认是延长天数',
  `giftday` smallint(2) DEFAULT NULL,
  `gitmoney` smallint(5) DEFAULT NULL,
  `type` smallint(2) DEFAULT '1' COMMENT '活动的类型,1:充值送礼',
  `flag` smallint(2) DEFAULT '1' COMMENT '改活动默认开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video_gift_activity
-- ----------------------------
INSERT INTO `video_gift_activity` VALUES ('1', '18元靓丽礼包：哈雷摩托座驾（10天使用期）', '19', '98', '120007', '10', '0', '1', '1');
INSERT INTO `video_gift_activity` VALUES ('2', '46元尊贵礼包：兰博基尼座驾（15天试用期）+ 68钻石\r\n', '99', '398', '120004', '15', '68', '1', '1');
INSERT INTO `video_gift_activity` VALUES ('3', '238元尊享礼包：双层大客机座驾（30天试用期）+388钻石', '399', '1000000000', '120008', '30', '388', '1', '1');


DROP TABLE IF EXISTS `video_goods`;
CREATE TABLE `video_goods` (
  `gid` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` int(10) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `category` int(10) NOT NULL,
  `unit_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '购买单位方式,1=计件；2=计时',
  `is_show` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否上架：0=下架，1=上架',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_goods
-- ----------------------------
INSERT INTO `video_goods` VALUES ('120001', '私人直升机（月）', '1500', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120003', '八抬大轿（月）', '2000', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120004', '兰博基尼（月）', '800', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120006', '奥迪A8（月）', '8000', '坐骑', '坐骑', '1002', '2', '0');
INSERT INTO `video_goods` VALUES ('120007', '哈雷摩托（月）', '500', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120008', '双层大客机（月）', '2000', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120009', '避孕套', '3888', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('120010', '猪', '3888', '坐骑', '坐骑', '1002', '2', '1');
INSERT INTO `video_goods` VALUES ('310001', '钻戒', '50', '钻石很久远，一颗就…', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310002', '项链', '320', '戴着它，我好像一下变得高贵了', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310003', '香奈儿包包', '300', '有钱就是任性，来一打', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310004', '皇冠', '50', '只有尊贵的人才配得上我', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310005', 'DIRO香水', '20', '我是迪奥，不是奥迪哦', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310006', '啤酒', '10', '啤酒加炸鸡，惬意', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310007', '抱抱熊', '70', '需要抱抱吗', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310008', '便便', '60', '阿拉蕾最喜欢的玩具', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310009', '抱枕', '50', '睡觉抱着我最舒服了', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310010', '情书', '40', '男女朋友都通用的情书哦', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310011', '冰激凌', '3', '快点吃掉我，我快化掉了', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310012', '鼓掌', '5', '不错不错，鼓掌', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310013', '蛋糕', '20', '吃多了会长胖的哦', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310014', '香吻', '3', '只献给最喜欢的人', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310015', '喉宝', '15', '喉宝助你好声音', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310016', '鲜花', '1', '请不要把我插在牛粪上', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310017', '板砖', '10', '任你再叼，一砖拍倒', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310018', '棒棒糖', '1', '棒棒，好棒哦', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('310019', 'iphone6', '100', '土豪金才符合我的气质呢', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310020', '挖掘机', '5', '挖掘机技术哪家强呢', '热门', '1', '1', '0');
INSERT INTO `video_goods` VALUES ('310021', '愚人节快乐', '1', '', '热门', '1', '1', '1');
INSERT INTO `video_goods` VALUES ('320001', '鹊桥相会', '1314', '这桥坚固吗', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320002', '带字粉丝灯牌', '520', '可不是一般的灯牌哦', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320003', '烛光晚餐', '888', '只把最好的留给你', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320004', '梦幻城堡', '1500', '爱TA就送TA一座城堡', '高级', '2', '1', '0');
INSERT INTO `video_goods` VALUES ('320005', '我爱你', '520', '对不起，我爱你', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320006', '心雨', '188', '心如雨下', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320007', '烟花', '368', '去年烟花特别多', '高级', '2', '1', '0');
INSERT INTO `video_goods` VALUES ('320008', '丘比特之箭', '521', '用它让主播爱上你吧', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320009', '幸福摩天轮', '1200', '幸福转转转', '高级', '2', '1', '0');
INSERT INTO `video_goods` VALUES ('320010', '放飞气球', '1888', '飞屋环球必备', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320011', '印章（萌）', '10', '萌萌达', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320012', '印章（任性）', '10', '任性一次', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320013', '印章（女神）', '10', '请叫我女神', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320014', '印章（大咖）', '10', '大咖驾到', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320015', '印章（duang）', '10', 'duang，duang', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320016', '印章（呆）', '10', '我当时就惊呆了', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320017', '蛋糕', '99', '吃多了会长胖的哦', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320019', '惊喜盒子（狮子）', '10', '惊喜！', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320020', '惊喜盒子（小丑）', '10', '惊喜！', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('320021', '秋千', '999', '摇摆', '高级', '2', '1', '1');
INSERT INTO `video_goods` VALUES ('700001', '飞屏', '100', '房间内的飞屏', '飞屏', '1003', '1', '1');
INSERT INTO `video_goods` VALUES ('700002', '广播', '200', '广播', '广播', '1004', '1', '1');
INSERT INTO `video_goods` VALUES ('700003', '贵宾坐椅', '40', '贵宾坐椅', '坐椅', '1005', '1', '1');
