/*
/home/script/svn/trunk/socket/V2.1_5/sql
1.video_goods20150919.sql
*/
use video;
/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.244
Source Server Version : 50622
Source Host           : 192.168.10.244:3366
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-09-19 19:50:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_goods
-- ----------------------------
DROP TABLE IF EXISTS `video_goods`;
CREATE TABLE `video_goods` (
  `gid` int(10) NOT NULL COMMENT '礼物id',
  `name` varchar(128) NOT NULL COMMENT '礼物名称',
  `price` int(10) NOT NULL COMMENT '礼物价格',
  `desc` varchar(128) NOT NULL COMMENT '描述',
  `category_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `category` int(10) NOT NULL COMMENT '礼物类别',
  `unit_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '购买单位方式,1=计件；2=计时',
  `is_show` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否上架：0=下架，1=上架',
  `is_cast` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否上礼物跑道 0不上 1上',
  `create_time` date NOT NULL COMMENT '上线时间',
  `sort_order` smallint(3) DEFAULT NULL COMMENT '商品排序',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼物配置表';

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
INSERT INTO `video_goods` VALUES ('310016', '鲜花', '1', '请不要把我插在牛粪上', '热门', '1', '1', '1', '0', '2015-02-13', '2');
INSERT INTO `video_goods` VALUES ('310017', '板砖', '10', '任你再叼，一砖拍倒', '推荐', '2', '1', '1', '0', '2015-02-13', '15');
INSERT INTO `video_goods` VALUES ('310018', '棒棒糖', '1', '棒棒，好棒哦', '推荐', '2', '1', '1', '0', '2015-06-08', '10');
INSERT INTO `video_goods` VALUES ('310019', 'iphone6', '100', '土豪金才符合我的气质呢', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310020', '挖掘机', '5', '挖掘机技术哪家强呢', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310021', '愚人节快乐', '1', '', '热门', '1', '1', '0', '0', '2015-02-13', '0');
INSERT INTO `video_goods` VALUES ('310022', '蓝色妖姬', '5', '', '热门', '1', '1', '1', '0', '2015-02-13', '3');
INSERT INTO `video_goods` VALUES ('310023', '魅力之星', '1', '', '热门', '1', '1', '0', '0', '2015-06-24', '0');
INSERT INTO `video_goods` VALUES ('310024', '鲍鱼', '10', '', '热门', '1', '1', '1', '0', '2015-07-02', '4');
INSERT INTO `video_goods` VALUES ('310025', '泰迪熊', '40', '', '推荐', '2', '1', '1', '0', '2015-07-02', '7');
INSERT INTO `video_goods` VALUES ('310026', '冰块', '1', '', '热门', '1', '1', '0', '0', '2015-07-02', '0');
INSERT INTO `video_goods` VALUES ('310027', 'XO', '30', '', '推荐', '2', '1', '1', '0', '2015-07-02', '8');
INSERT INTO `video_goods` VALUES ('310028', '月饼', '1', '', '热门', '1', '1', '1', '0', '2015-09-22', '1');
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
INSERT INTO `video_goods` VALUES ('320033', '揉一揉', '200', '', '推荐', '1', '1', '1', '0', '2015-06-24', '5');
INSERT INTO `video_goods` VALUES ('320034', '有容乃大', '300', '', '推荐', '1', '1', '1', '0', '2015-06-24', '6');
INSERT INTO `video_goods` VALUES ('320035', '花瓣纷飞', '266', '', '推荐', '2', '1', '1', '0', '2015-07-02', '4');
INSERT INTO `video_goods` VALUES ('320036', '黄瓜', '50', '', '推荐', '2', '1', '1', '0', '2015-07-02', '2');
INSERT INTO `video_goods` VALUES ('320037', '蜡烛', '100', '', '推荐', '2', '1', '1', '0', '2015-07-02', '3');
INSERT INTO `video_goods` VALUES ('320038', '爱心漫漫', '125', '', '推荐', '2', '1', '1', '0', '2015-09-22', '1');
INSERT INTO `video_goods` VALUES ('330001', '绚丽流星雨', '3888', '一起去看流星雨', '热门', '4', '1', '1', '0', '2015-02-13', '1');
INSERT INTO `video_goods` VALUES ('330002', '情比钻坚', '6888', '', '奢华', '1', '1', '1', '0', '2015-02-13', '2');
INSERT INTO `video_goods` VALUES ('330003', '豪华游艇', '3888', '', '奢华', '4', '1', '1', '0', '2015-02-13', '4');
INSERT INTO `video_goods` VALUES ('330004', '世外桃源', '5888', '', '热门', '1', '1', '1', '0', '2015-09-22', '8');
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


