-- ----------------------------
-- 后台数据库
-- ----------------------------
ALTER TABLE vbos_admin ADD `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间';
ALTER TABLE vbos_admin ADD `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间';
ALTER TABLE vbos_admin ADD `dml_flag` tinyint NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除';

ALTER TABLE vbos_admin add   `role_id` int(11) DEFAULT '0' COMMENT '角色ID';
UPDATE `vbos_admin` SET name='admin',passwd='e10adc3949ba59abbe56e057f20f883e',role_id='1' where admin_id=1;


DROP TABLE IF EXISTS `vbos_priv_role`; 
CREATE TABLE `vbos_priv_role` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `priv_id` int(11) NOT NULL COMMENT '权限ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限用户关联表';


DROP TABLE IF EXISTS `vbos_role`;
CREATE TABLE `vbos_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `vbos_role` VALUES ('1', '超级管理员', '2015-06-30 11:12:19', '2015-06-30 11:12:20', '1');


DROP TABLE IF EXISTS `vbos_user_action_log`;
CREATE TABLE `vbos_user_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `priv_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `admin_id` int(11) DEFAULT NULL COMMENT '后台用户ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `vbos_priv`;
CREATE TABLE `vbos_priv` (
  `priv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非主键业务ID',
  `priv_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '权限名称',
  `parent` int(11) NOT NULL COMMENT '父级ID',
  `menu` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否为菜单，1是，0否',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图标',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Records of vbos_priv
-- ----------------------------
INSERT INTO `vbos_priv` VALUES ('1', '运营管理', '0', '1', '', '', 'fa fa-home', '2015-06-30 11:12:19', '2015-07-03 12:05:59', '1');
INSERT INTO `vbos_priv` VALUES ('2', '财务管理', '0', '1', '', '', 'fa fa-rub', '2015-06-30 11:12:19', '2015-07-03 12:06:07', '1');
INSERT INTO `vbos_priv` VALUES ('3', '主播管理', '0', '1', '', '', 'fa fa-sun-o', '2015-06-30 11:12:19', '2015-07-03 12:06:15', '1');
INSERT INTO `vbos_priv` VALUES ('4', '会员管理', '0', '1', '', '', 'fa fa-users', '2015-06-30 11:12:19', '2015-07-03 12:06:25', '1');
INSERT INTO `vbos_priv` VALUES ('5', '签约审核', '3', '1', 'audit', 'host', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('6', '推广管理', '0', '1', '', '', 'fa fa-tasks', '2015-06-30 11:12:19', '2015-07-03 12:06:32', '1');
INSERT INTO `vbos_priv` VALUES ('7', '房间管理', '0', '1', '', '', 'fa fa-th', '2015-06-30 11:12:19', '2015-07-03 12:07:04', '1');
INSERT INTO `vbos_priv` VALUES ('8', '即时数据', '1', '1', 'index', 'index', '', '2015-06-30 11:12:19', '2015-07-01 11:19:45', '2');
INSERT INTO `vbos_priv` VALUES ('9', '用户数据', '1', '1', 'default', 'member', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('10', '营收数据', '1', '1', 'default', 'bill', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('11', '道具销售', '1', '1', 'default', 'props', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('12', '道具销售日志', '1', '1', 'log', 'props', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('13', '主播业绩', '1', '1', 'default', 'host', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('14', '充值明细', '2', '1', 'default', 'recharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('15', '提款申请', '2', '1', 'default', 'cash', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('16', '提款审批', '2', '1', 'default', 'extract', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('17', '手动充值', '2', '1', 'default', 'handrecharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('18', '主播列表', '3', '1', 'list', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('20', '主播详情', '3', '1', 'detailsConsume', 'host', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('21', '分成机制', '3', '1', 'default', 'percentage', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('22', '会员清单', '4', '1', 'default', 'vip', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('23', '重置密码', '22', '0', 'ajaxReset', 'vip', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('24', '封停账号', '22', '0', 'ajaxShutter', 'vip', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('25', '会员详情', '4', '1', 'details', 'vip', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('26', '客服消息', '4', '1', 'default', 'customService', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('27', '投诉建议', '4', '1', 'default', 'complaints', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('28', '图片管理', '0', '1', '', '', 'fa fa-picture-o', '2015-06-30 11:12:19', '2015-07-03 12:07:13', '1');
INSERT INTO `vbos_priv` VALUES ('29', '代理管理', '0', '1', '', '', 'fa fa-th-list', '2015-06-30 11:12:19', '2015-07-03 12:07:21', '1');
INSERT INTO `vbos_priv` VALUES ('33', '推广渠道', '6', '1', 'default', 'channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('36', '渠道管理', '6', '1', 'management', 'channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('37', '个人推广', '6', '1', 'personal', 'channel', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('38', '权限管理', '0', '1', '', '', 'fa fa-lock', '2015-06-30 11:12:19', '2015-07-03 12:07:22', '1');
INSERT INTO `vbos_priv` VALUES ('39', '权限管理', '38', '1', 'default', 'priv', '', '2015-06-30 11:12:19', '2015-07-03 11:39:49', '2');
INSERT INTO `vbos_priv` VALUES ('43', '道具管理', '2', '1', 'management', 'props', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('44', '房间公告', '6', '1', 'default', 'announcement', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('45', '主播日报表', '3', '1', 'daily', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('46', '主播月报表', '3', '1', 'month', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('47', '账变列表', '2', '1', 'variable', 'recharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('48', '充值申请', '2', '1', 'audit', 'recharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('50', '新增域名', '29', '1', 'add', 'domain', '', '2015-06-30 11:12:19', '2015-07-03 11:38:57', '2');
INSERT INTO `vbos_priv` VALUES ('51', '跳转设定', '29', '1', 'redirectSet', 'domain', '', '2015-06-30 11:12:19', '2015-07-03 11:39:00', '1');
INSERT INTO `vbos_priv` VALUES ('53', '帐号反查', '2', '1', 'user', 'bank', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('54', '人工充值（申请）', '2', '1', 'addApply', 'mrecharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('55', '人工充值（审核）', '2', '1', 'Check', 'mrecharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('56', '人工扣减（申请）', '2', '1', 'minusApply', 'mrecharge', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('57', '直播记录查询', '3', '1', 'statis', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('58', '主播提款申请', '3', '1', 'default', 'extract', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('59', '添加代理', '29', '1', 'add', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 11:39:02', '1');
INSERT INTO `vbos_priv` VALUES ('60', '添加域名至代理', '29', '1', 'domainAgents', 'domain', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('61', '域名查询', '29', '1', 'query', 'domain', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('62', '代理列表', '29', '1', 'list', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('63', '主播礼物提成设置', '3', '1', 'main', 'hostincome', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('64', '人工扣减（审核）', '2', '1', 'checkMinus', 'mrecharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('66', '房间状态', '7', '1', 'status', 'room', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('67', '后台用户', '38', '1', 'default', 'admin', '', '2015-06-30 11:12:19', '2015-07-03 11:35:09', '1');
INSERT INTO `vbos_priv` VALUES ('68', '工资与奖金（申请）', '1', '1', 'main', 'payBonus', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('69', '工资与奖金（审核）', '1', '1', 'check', 'payBonus', '', '2015-06-30 11:12:19', '2015-06-30 11:12:19', '1');
INSERT INTO `vbos_priv` VALUES ('71', '关键字查询', '7', '1', 'list', 'keyword', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('72', '角色管理', '38', '1', 'list', 'role', '', '2015-06-30 11:12:19', '2015-07-03 11:35:14', '1');
INSERT INTO `vbos_priv` VALUES ('88', '后台操作日志', '38', '1', 'default', 'log', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('89', 'Ajax添加角色', '72', '0', 'ajaxAdd', 'role', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('98', '主播提成列表', '63', '0', 'Set', 'hostincome', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('99', '设置公司提成比例', '63', '0', 'SetCP', 'hostincome', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('100', '设置主播提成', '63', '0', 'SetHP', 'hostincome', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('107', '添加申请', '68', '0', 'Deal', 'payBonus', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('108', '审核', '69', '0', 'Checked', 'payBonus', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('115', '默认', '62', '0', 'default', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('116', '添加(添加代理)', '59', '0', 'ajaxAgentsAdd', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('117', '成员详情', '62', '0', 'memberList', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('118', '修改(代码列表)', '62', '0', 'edit', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('119', 'Ajax修改代理', '118', '0', 'ajaxEdit', 'agents', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('135', '默认', '71', '0', 'default', 'keyword', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('136', '添加', '71', '0', 'ajaxAdd', 'keyword', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('137', '删除', '71', '0', 'ajaxDel', 'keyword', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('138', '同步', '71', '0', 'ajaxSync', 'keyword', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('146', '登陆', '8', '0', 'default', 'login', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('152', '添加角色', '72', '0', 'add', 'role', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('165', '保存设定', '72', '0', 'ajaxSetPriv', 'role', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('168', '轮播列表', '28', '1', 'default', 'images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('170', '直播记录', '20', '0', 'detailsLive', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('172', '添加轮播图', '168', '1', 'ImagesAdd', 'Images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('173', '导出数据', '9', '1', 'export', 'member', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('174', '时间段汇总统计', '10', '1', 'list', 'bill', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('175', '导出数据', '10', '1', 'export', 'bill', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('176', '时间段汇总统计', '11', '1', 'list', 'props', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('177', '导出数据', '11', '1', 'export', 'props', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('178', '时间段汇总统计', '13', '1', 'summary', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('179', '导出数据', '13', '1', 'export', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('180', '导出数据', '14', '1', 'export', 'recharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('181', '添加充值', '17', '1', 'setOrder', 'Handrecharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('182', '添加道具', '43', '1', 'addUsersProps', 'props', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('183', '导出数据', '48', '1', 'auditExport', 'recharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('184', '充值审核操作', '55', '0', 'ajaxCheck', 'Mrecharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('185', '扣减审核操作', '64', '0', 'ajaxCheckMinus', 'Mrecharge', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '2');
INSERT INTO `vbos_priv` VALUES ('186', '审核操作', '5', '0', 'ajaxEdit', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('187', '编辑主播类型', '18', '0', 'ajaxEditType', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('188', '取消主播资格', '18', '0', 'ajaxDel', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('189', '主播提现审批', '58', '0', 'ajaxEdit', 'Extract', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('190', '新建消息', '26', '0', 'ajaxMesaage', 'CustomService', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('191', '编辑建议', '27', '0', 'ajaxEdit', 'Complaints', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('192', '生成渠道', '33', '0', 'ajaxChannelAdd', 'Channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('193', '编辑', '36', '0', 'ajaxChannelEdit', 'Channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('194', '删除', '36', '0', 'ajaxChannelDel', 'Channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('195', '导出数据', '37', '1', 'export', 'Channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('196', '编辑公告', '44', '1', 'editAnnouncement', 'Announcement', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('197', '编辑', '66', '0', 'ajaxPost', 'room', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('198', '编辑轮播图', '168', '0', 'ImagesEdit', 'Images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('199', '编辑图片数量', '168', '0', 'setImagesConfig', 'Images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('200', '删除轮播图', '168', '0', 'AjaxDel', 'Images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('201', '同步轮播图', '168', '0', 'syncImages', 'Images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('202', '编辑排序', '168', '0', 'sort', 'images', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('203', '添加用户', '67', '0', 'ajaxAdd', 'admin', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('204', '编辑用户（包含删除）', '67', '0', 'ajaxEdit', 'admin', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('205', '编辑用户角色', '67', '0', 'ajaxModRole', 'admin', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('207', '房间活动', '7', '1', 'list', 'active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('208', '添加', '207', '0', 'ajaxAdd', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('209', '删除', '207', '0', 'ajaxDel', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('210', '主播排行榜', '207', '0', 'ajaxLiveList', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('211', '富豪排行榜', '207', '0', 'ajaxRichList', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('212', '颁发勋章', '207', '0', 'ajaxIconUpdate', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('213', '取消勋章', '207', '0', 'ajaxIconDel', 'Active', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('214', '预约房间查询', '7', '1', 'preorderStatus', 'room', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('215', '等级修改审核', '4', '1', 'list', 'userMexp', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('216', '等级修改', '4', '1', 'add', 'userMexp', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('217', '修改', '216', '0', 'ajaxAdd', 'userMexp', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('218', '审核', '215', '0', 'ajaxCheck', 'userMexp', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('219', '收录记录数据导出', '20', '1', 'exportConsume', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('220', '直播记录数据导出', '20', '1', 'exportLive', 'host', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('221', '预约房间数据导出', '214', '1', 'export', 'room', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('222', '时间段汇总统计', '33', '1', 'list', 'channel', '', '2015-06-30 11:12:19', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('223', 'AJAX新增域名', '50', '0', 'ajaxDomainAdd', 'Domain', '', '2015-07-02 15:09:40', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('224', 'AJAX新增跳转页面', '50', '0', 'ajaxPageAdd', 'Domain', '', '2015-07-02 15:11:25', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('225', '设定', '51', '0', 'ajaxRedirectset', 'Domain', '', '2015-07-02 15:12:55', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('226', '添加', '54', '0', 'ajaxAddapply', 'Mrecharge', '', '2015-07-02 15:51:02', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('230', '添加', '56', '0', 'ajaxMinusApply', 'Mrecharge', '', '2015-07-02 16:03:43', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('231', '添加权限', '39', '0', 'add', 'Priv', '', '2015-07-03 11:25:07', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('232', '添加', '231', '0', 'ajaxAdd', 'Priv', '', '2015-07-03 11:40:27', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('233', '修改权限', '39', '0', 'edit', 'Priv', '', '2015-07-03 11:41:13', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('234', '修改', '233', '0', 'ajaxEdit', 'Priv', '', '2015-07-03 11:41:56', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('235', '删除', '39', '0', 'ajaxDel', 'Priv', '', '2015-07-03 11:42:43', '2015-07-03 12:04:15', '1');
INSERT INTO `vbos_priv` VALUES ('236', '订单校验', '14', '0', 'ajaxGetOrderPayId', 'recharge', '', '2015-07-03 15:22:38', '2015-07-03 15:22:38', '1');
INSERT INTO `vbos_priv` VALUES ('237', '编辑勋章', '22', '0', 'ajaxEditIcon', 'vip', '', '2015-07-03 15:23:43', '2015-07-03 15:23:43', '1');
INSERT INTO `vbos_priv` VALUES ('238', '删除勋章', '22', '0', 'ajaxIconDel', 'active', '', '2015-07-03 15:24:36', '2015-07-03 15:24:36', '1');


CREATE TABLE `vbos_user_mexp` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1增加，2减少',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态：1等待审核，2通过审核;,3审核失败',
  `roled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色：0用户，3主播',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户经验值修改表';

-- ----------------------------
-- 清理数据
-- ----------------------------
ALTER TABLE vbos_admin drop column status;
DROP TABLE IF EXISTS vbos_priv_user;
DROP TABLE IF EXISTS vbos_usr_aciton_log;
