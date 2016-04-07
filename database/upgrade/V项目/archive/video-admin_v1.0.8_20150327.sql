

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vbos_props_logs`
-- ----------------------------
DROP TABLE IF EXISTS `vbos_props_logs`;
CREATE TABLE `vbos_props_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '道具ID',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '增加道具数量',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人员ID',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '原因',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '添加状态   1：成功   2：失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vbos_announcement_logs`
-- ----------------------------
DROP TABLE IF EXISTS `vbos_announcement_logs`;
CREATE TABLE `vbos_announcement_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `content` text CHARACTER SET utf8 COMMENT '公告内容',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `admin_id` int(11) NOT NULL COMMENT '操作者ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '接口请求状态： 1：成功   2：失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vbos_priv`
-- ----------------------------
DROP TABLE IF EXISTS `vbos_priv`;
CREATE TABLE `vbos_priv` (
  `priv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非主键业务ID',
  `priv_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名称',
  `parent` int(11) NOT NULL COMMENT '父级ID',
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Records of vbos_priv
-- ----------------------------
INSERT INTO `vbos_priv` VALUES ('1', '运营管理', '0');
INSERT INTO `vbos_priv` VALUES ('2', '财务管理', '0');
INSERT INTO `vbos_priv` VALUES ('3', '主播管理', '0');
INSERT INTO `vbos_priv` VALUES ('4', '会员管理', '0');
INSERT INTO `vbos_priv` VALUES ('5', '内容管理', '0');
INSERT INTO `vbos_priv` VALUES ('6', '广告管理', '0');
INSERT INTO `vbos_priv` VALUES ('7', '权限管理', '0');
INSERT INTO `vbos_priv` VALUES ('8', '即时数据', '1');
INSERT INTO `vbos_priv` VALUES ('9', '用户数据', '1');
INSERT INTO `vbos_priv` VALUES ('10', '营收数据', '1');
INSERT INTO `vbos_priv` VALUES ('11', '道具销售', '1');
INSERT INTO `vbos_priv` VALUES ('12', '节目点播', '1');
INSERT INTO `vbos_priv` VALUES ('13', '主播业绩', '1');
INSERT INTO `vbos_priv` VALUES ('14', '充值明细', '2');
INSERT INTO `vbos_priv` VALUES ('15', ' 提款审批', '2');
INSERT INTO `vbos_priv` VALUES ('16', '提款记录', '2');
INSERT INTO `vbos_priv` VALUES ('17', ' 手动充值', '2');
INSERT INTO `vbos_priv` VALUES ('18', ' 主播审核', '3');
INSERT INTO `vbos_priv` VALUES ('19', '主播列表', '3');
INSERT INTO `vbos_priv` VALUES ('20', '主播详情', '3');
INSERT INTO `vbos_priv` VALUES ('21', '分成机制', '3');
INSERT INTO `vbos_priv` VALUES ('22', '会员列表', '4');
INSERT INTO `vbos_priv` VALUES ('23', '重置密码', '4');
INSERT INTO `vbos_priv` VALUES ('24', '封停账号', '4');
INSERT INTO `vbos_priv` VALUES ('25', '会员详情', '4');
INSERT INTO `vbos_priv` VALUES ('26', '客服消息', '4');
INSERT INTO `vbos_priv` VALUES ('27', '投诉建议', '4');
INSERT INTO `vbos_priv` VALUES ('28', '内容分类', '5');
INSERT INTO `vbos_priv` VALUES ('29', '道具管理', '5');
INSERT INTO `vbos_priv` VALUES ('30', '场景管理', '5');
INSERT INTO `vbos_priv` VALUES ('31', '广告位管理', '5');
INSERT INTO `vbos_priv` VALUES ('32', '广告配置', '6');
INSERT INTO `vbos_priv` VALUES ('33', '推广渠道', '6');
INSERT INTO `vbos_priv` VALUES ('34', '广告统计', '6');
INSERT INTO `vbos_priv` VALUES ('35', '费用添加', '6');
INSERT INTO `vbos_priv` VALUES ('36', '渠道管理', '6');
INSERT INTO `vbos_priv` VALUES ('37', '个人推广', '6');
INSERT INTO `vbos_priv` VALUES ('38', '后台用户', '7');
INSERT INTO `vbos_priv` VALUES ('39', '权限设定', '7');
INSERT INTO `vbos_priv` VALUES ('40', '道具销售日志', '1');
INSERT INTO `vbos_priv` VALUES ('41', '主播分成', '3');
INSERT INTO `vbos_priv` VALUES ('42', '新增主播分成', '3');
INSERT INTO `vbos_priv` VALUES ('43', '道具管理', '2');
INSERT INTO `vbos_priv` VALUES ('44', '房间公告管理', '6');
INSERT INTO `vbos_priv` VALUES ('45', '主播日报表', '3');
INSERT INTO `vbos_priv` VALUES ('46', '直播记录查询', '3');




