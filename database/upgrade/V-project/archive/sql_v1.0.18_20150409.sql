/*
 Navicat MySQL Data Transfer

 Source Server         : 10.146.180.42
 Source Server Version : 50622
 Source Host           : 10.146.180.42
 Source Database       : video

 Target Server Version : 50622
 File Encoding         : utf-8

 Date: 04/09/2015 21:06:53 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `video_goods`
-- ----------------------------
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
--  Records of `video_goods`
-- ----------------------------
BEGIN;
INSERT INTO `video_goods` VALUES ('120001', '私人直升机（月）', '1500', '坐骑', '坐骑', '1002', '2', '1'), ('120003', '八抬大轿（月）', '2000', '坐骑', '坐骑', '1002', '2', '0'), ('120004', '兰博基尼（月）', '800', '坐骑', '坐骑', '1002', '2', '1'), ('120006', '奥迪A8（月）', '8000', '坐骑', '坐骑', '1002', '2', '0'), ('120007', '哈雷摩托（月）', '500', '坐骑', '坐骑', '1002', '2', '1'), ('120008', '双层大客机（月）', '2000', '坐骑', '坐骑', '1002', '2', '1'), ('120009', '杏吧专属', '200', '坐骑', '坐骑', '1002', '2', '1'), ('120010', '猪猪快跑', '200', '坐骑', '坐骑', '1002', '2', '1'), ('120011', '布加迪威龙', '20000', '坐骑', '坐骑', '1002', '2', '1'), ('120012', '宇宙飞船', '20000', '坐骑', '坐骑', '1002', '2', '1'), ('310001', '钻戒', '50', '钻石很久远，一颗就…', '推荐', '2', '1', '1'), ('310002', '项链', '320', '戴着它，我好像一下变得高贵了', '热门', '1', '1', '0'), ('310003', '香奈儿包包', '300', '有钱就是任性，来一打', '热门', '1', '1', '0'), ('310004', '皇冠', '50', '只有尊贵的人才配得上我', '推荐', '2', '1', '1'), ('310005', 'DIOR香水', '20', '我是迪奥，不是奥迪哦', '热门', '1', '1', '1'), ('310006', '啤酒', '10', '啤酒加炸鸡，惬意', '热门', '1', '1', '1'), ('310007', '抱抱熊', '70', '需要抱抱吗', '热门', '1', '1', '0'), ('310008', '便便', '60', '阿拉蕾最喜欢的玩具', '热门', '1', '1', '0'), ('310009', '抱枕', '50', '睡觉抱着我最舒服了', '热门', '1', '1', '0'), ('310010', '情书', '40', '男女朋友都通用的情书哦', '热门', '1', '1', '0'), ('310011', '冰激凌', '3', '快点吃掉我，我快化掉了', '热门', '1', '1', '1'), ('310012', '鼓掌', '5', '不错不错，鼓掌', '推荐', '2', '1', '1'), ('310013', '蛋糕', '20', '吃多了会长胖的哦', '热门', '1', '1', '0'), ('310014', '香吻', '3', '只献给最喜欢的人', '热门', '1', '1', '1'), ('310015', '喉宝', '15', '喉宝助你好声音', '热门', '1', '1', '0'), ('310016', '鲜花', '1', '请不要把我插在牛粪上', '热门', '1', '1', '1'), ('310017', '板砖', '10', '任你再叼，一砖拍倒', '推荐', '2', '1', '1'), ('310018', '棒棒糖', '1', '棒棒，好棒哦', '推荐', '2', '1', '1'), ('310019', 'iphone6', '100', '土豪金才符合我的气质呢', '热门', '1', '1', '0'), ('310020', '挖掘机', '5', '挖掘机技术哪家强呢', '热门', '1', '1', '0'), ('310021', '愚人节快乐', '1', '', '热门', '1', '1', '0'), ('320001', '鹊桥相会', '1314', '这桥坚固吗', '推荐', '2', '1', '0'), ('320002', '带字粉丝灯牌', '520', '可不是一般的灯牌哦', '推荐', '2', '1', '0'), ('320003', '烛光晚餐', '888', '只把最好的留给你', '高级', '3', '1', '1'), ('320004', '梦幻城堡', '1500', '爱TA就送TA一座城堡', '推荐', '2', '1', '0'), ('320005', '我爱你', '520', '对不起，我爱你', '高级', '3', '1', '1'), ('320006', '心雨', '188', '心如雨下', '热门', '1', '1', '1'), ('320007', '烟花', '368', '去年烟花特别多', '推荐', '2', '1', '0'), ('320008', '丘比特之箭', '521', '用它让主播爱上你吧', '高级', '3', '1', '1'), ('320009', '幸福摩天轮', '1200', '幸福转转转', '高级', '3', '1', '0'), ('320010', '放飞气球', '1888', '飞屋环球必备', '高级', '3', '1', '1'), ('320011', '印章（萌）', '10', '萌萌达', '推荐', '2', '1', '1'), ('320012', '印章（任性）', '10', '任性一次', '热门', '1', '1', '1'), ('320013', '印章（女神）', '10', '请叫我女神', '热门', '1', '1', '1'), ('320014', '印章（波霸）', '10', '哇，好大的胸器', '热门', '1', '1', '1'), ('320015', '印章（duang）', '10', 'duang，duang', '推荐', '2', '1', '1'), ('320016', '印章（呆）', '10', '我当时就惊呆了', '推荐', '2', '1', '1'), ('320017', '蛋糕', '99', '吃多了会长胖的哦', '高级', '3', '1', '1'), ('320019', '惊喜盒子（狮子）', '10', '惊喜！', '高级', '3', '1', '1'), ('320020', '惊喜盒子（小丑）', '10', '惊喜！', '高级', '3', '1', '1'), ('320021', '秋千', '999', '摇摆', '高级', '3', '1', '1'), ('320022', '爱的烟花', '3888', '爱TA，就送这个给TA吧', '奢华', '4', '1', '1'), ('320023', '印章（脱掉）', '10', '脱！脱！脱！', '推荐', '2', '1', '1'), ('330001', '一起去看流星雨', '3888', '一起去看流星雨', '热门', '1', '1', '1'), ('700001', '飞屏', '100', '房间内的飞屏', '飞屏', '1003', '1', '1'), ('700002', '广播', '200', '广播', '广播', '1004', '1', '1'), ('700003', '贵宾坐椅', '40', '贵宾坐椅', '坐椅', '1005', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;