ALTER TABLE `video`.`video_charge_list`  add `editor` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID';

alter table video.`video_charge_list` Add column channel int not null default 0 AFTER `editor`;



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video_goods
-- ----------------------------
DROP TABLE IF EXISTS video.`video_goods`;
CREATE TABLE video.`video_goods` (
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

-- ----------------------------
-- Records of video_goods
-- ----------------------------
INSERT INTO `video_goods` VALUES ('120001', '私人直升机（月）', '1500', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120003', '八抬大轿（月）', '2000', '坐骑', '坐骑', '1002', '2', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('120004', '兰博基尼（月）', '800', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120006', '奥迪A8（月）', '8000', '坐骑', '坐骑', '1002', '2', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('120007', '哈雷摩托（月）', '500', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120008', '双层大客机（月）', '2000', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120009', '杏吧专属', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120010', '猪猪快跑', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120011', '布加迪威龙', '20000', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120012', '宇宙飞船', '20000', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120013', '航空母舰', '5888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120014', '天马', '8888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120015', '战斗机', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('120016', '法拉利超跑', '3888', '坐骑', '坐骑', '1002', '2', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('310001', '钻戒', '50', '钻石很久远，一颗就…', '推荐', '2', '1', '1', '0', '6');
INSERT INTO `video_goods` VALUES ('310002', '项链', '320', '戴着它，我好像一下变得高贵了', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310003', '香奈儿包包', '300', '有钱就是任性，来一打', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310004', '皇冠', '50', '只有尊贵的人才配得上我', '推荐', '2', '1', '1', '0', '7');
INSERT INTO `video_goods` VALUES ('310005', 'Dior香水', '20', '我是迪奥，不是奥迪哦', '热门', '1', '1', '1', '0', '7');
INSERT INTO `video_goods` VALUES ('310006', '啤酒', '10', '啤酒加炸鸡，惬意', '热门', '1', '1', '1', '0', '10');
INSERT INTO `video_goods` VALUES ('310007', '抱抱熊', '70', '需要抱抱吗', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310008', '便便', '60', '阿拉蕾最喜欢的玩具', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310009', '抱枕', '50', '睡觉抱着我最舒服了', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310010', '情书', '40', '男女朋友都通用的情书哦', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310011', '冰激凌', '3', '快点吃掉我，我快化掉了', '热门', '1', '1', '1', '0', '11');
INSERT INTO `video_goods` VALUES ('310012', '鼓掌', '5', '不错不错，鼓掌', '推荐', '2', '1', '1', '0', '1');
INSERT INTO `video_goods` VALUES ('310013', '蛋糕', '20', '吃多了会长胖的哦', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310014', '香吻', '3', '只献给最喜欢的人', '热门', '2', '1', '1', '0', '2');
INSERT INTO `video_goods` VALUES ('310015', '喉宝', '15', '喉宝助你好声音', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310016', '鲜花', '1', '请不要把我插在牛粪上', '热门', '1', '1', '1', '0', '1');
INSERT INTO `video_goods` VALUES ('310017', '板砖', '10', '任你再叼，一砖拍倒', '推荐', '2', '1', '1', '0', '8');
INSERT INTO `video_goods` VALUES ('310018', '棒棒糖', '1', '棒棒，好棒哦', '推荐', '2', '1', '1', '0', '9');
INSERT INTO `video_goods` VALUES ('310019', 'iphone6', '100', '土豪金才符合我的气质呢', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310020', '挖掘机', '5', '挖掘机技术哪家强呢', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310021', '愚人节快乐', '1', '', '热门', '1', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('310022', '蓝色妖姬', '5', '', '热门', '1', '1', '1', '0', '2');
INSERT INTO `video_goods` VALUES ('320001', '鹊桥相会', '1314', '这桥坚固吗', '高级', '2', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320002', '带字粉丝灯牌', '520', '可不是一般的灯牌哦', '高级', '2', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320003', '烛光晚餐', '888', '只把最好的留给你', '高级', '3', '1', '1', '0', '3');
INSERT INTO `video_goods` VALUES ('320004', '梦幻城堡', '1500', '爱TA就送TA一座城堡', '高级', '2', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320005', '我爱你', '520', '对不起，我爱你', '高级', '3', '1', '1', '0', '4');
INSERT INTO `video_goods` VALUES ('320006', '心雨', '188', '心如雨下', '热门', '1', '1', '1', '0', '4');
INSERT INTO `video_goods` VALUES ('320007', '烟花', '368', '去年烟花特别多', '高级', '2', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320008', '爱神之箭', '521', '用它让主播爱上你吧', '高级', '3', '1', '1', '0', '5');
INSERT INTO `video_goods` VALUES ('320009', '幸福摩天轮', '1200', '幸福转转转', '高级', '3', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320010', '祝福气球', '1888', '飞屋环球必备', '高级', '1', '1', '1', '0', '5');
INSERT INTO `video_goods` VALUES ('320011', '萌', '10', '萌萌达', '推荐', '2', '1', '1', '0', '2');
INSERT INTO `video_goods` VALUES ('320012', '任性', '10', '任性一次', '热门', '1', '1', '1', '0', '8');
INSERT INTO `video_goods` VALUES ('320013', '女神', '10', '请叫我女神', '热门', '1', '1', '1', '0', '9');
INSERT INTO `video_goods` VALUES ('320014', '波霸', '10', '哇，好大的胸器', '热门', '1', '1', '1', '0', '3');
INSERT INTO `video_goods` VALUES ('320015', 'duang', '10', 'duang，duang', '推荐', '2', '1', '1', '0', '3');
INSERT INTO `video_goods` VALUES ('320016', '呆', '10', '我当时就惊呆了', '推荐', '2', '1', '1', '0', '4');
INSERT INTO `video_goods` VALUES ('320017', '蛋糕', '99', '吃多了会长胖的哦', '高级', '3', '1', '1', '0', '7');
INSERT INTO `video_goods` VALUES ('320019', '惊喜狮子', '10', '惊喜！', '高级', '3', '1', '1', '0', '1');
INSERT INTO `video_goods` VALUES ('320020', '惊喜小丑', '10', '惊喜！', '高级', '3', '1', '1', '0', '2');
INSERT INTO `video_goods` VALUES ('320021', '秋千', '999', '摇摆', '高级', '3', '1', '0', '0', '0');
INSERT INTO `video_goods` VALUES ('320022', '烟花之吻', '3888', '爱TA，就送这个给TA吧', '奢华', '4', '1', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('320023', '脱掉', '10', '脱！脱！脱！', '推荐', '2', '1', '1', '0', '5');
INSERT INTO `video_goods` VALUES ('320024', '花田别墅', '5888', '', '奢华', '4', '1', '1', '0', '1');
INSERT INTO `video_goods` VALUES ('330001', '绚丽流星雨', '3888', '一起去看流星雨', '热门', '1', '1', '1', '0', '6');
INSERT INTO `video_goods` VALUES ('330002', '情比钻坚', '6888', '', '奢华', '4', '1', '1', '0', '2');
INSERT INTO `video_goods` VALUES ('330003', '豪华游艇', '3888', '', '奢华', '4', '1', '1', '0', '3');
INSERT INTO `video_goods` VALUES ('700001', '飞屏', '100', '房间内的飞屏', '飞屏', '1003', '1', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('700002', '广播', '200', '广播', '广播', '1004', '1', '1', '0', '0');
INSERT INTO `video_goods` VALUES ('700003', '贵宾坐椅', '40', '贵宾坐椅', '坐椅', '1005', '1', '1', '0', '0');