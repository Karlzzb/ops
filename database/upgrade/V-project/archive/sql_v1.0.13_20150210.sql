use video_db;
DROP TABLE `video_level_rich`;
CREATE TABLE `video_level_rich` (
  `level_id` int(10) NOT NULL,
  `level_name` varchar(20) DEFAULT NULL,
  `level_value` int(10) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户财富等级配置表';

-- ----------------------------
--  Records of `video_level_rich`
-- ----------------------------
BEGIN;
INSERT INTO `video_level_rich` VALUES ('1', '屌丝', '0'), ('2', '一富', '500'), ('3', '二富', '2000'), ('4', '三富', '5000'), ('5', '四富', '10000'), ('6', '五富', '18000'), ('7', '六富', '33000'), ('8', '七富', '63000'), ('9', '八富', '113000'), ('10', '九富', '183000'), ('11', '十富', '273000'), ('12', '男爵', '373000'), ('13', '子爵', '493000'), ('14', '伯爵', '633000'), ('15', '候爵', '793000'), ('16', '公爵', '993000'), ('17', '郡公', '1293000'), ('18', '国公', '1743000'), ('19', '王爵', '2343000'), ('20', '藩王', '3343000'), ('21', '郡王', '5143000'), ('22', '亲王', '7143000'), ('23', '国王', '10143000'), ('24', '帝王', '14143000'), ('25', '皇帝', '20143000'), ('26', '天君', '29143000'), ('27', '帝君', '39143000'), ('28', '圣君', '64143000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for `video_charge_list`
-- ----------------------------
CREATE TABLE `video_charge_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `tradeno` varchar(255) NOT NULL COMMENT '交易号',
  `ttime` datetime NOT NULL COMMENT '交易成功时间',
  `paymoney` double NOT NULL COMMENT '支付金额',
  `status` int(10) NOT NULL COMMENT '0表示未支付1表示成功',
  `points` int(10) NOT NULL COMMENT '点数',
  `del` int(2) NOT NULL COMMENT '是否删除0未删除1删除',
  `ctime` datetime DEFAULT NULL,
  `postdata` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

ALTER TABLE `video_recharge` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`);