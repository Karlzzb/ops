use video_bos;
CREATE TABLE `vbos_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `order_id` int(11) NOT NULL COMMENT '主播提现订单ID',
  `order_number` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '提现流水号  唯一',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '提现金额',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态：0 等待提现  1：等待审核(提现中) 2：提现失败  3：提现成功',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提现时间',
  `app_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '申请成功或失败原因',
  `app_time` datetime DEFAULT NULL COMMENT '申请操作时间',
  `check_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核成功或失败原因',
  `check_time` datetime DEFAULT NULL COMMENT '审核操作时间',
  `host_editor` int(11) DEFAULT NULL COMMENT '主播申请通过操作人ID',
  `apply_editor` int(11) DEFAULT NULL COMMENT '财务申请操作人ID',
  `check_editor` int(11) DEFAULT NULL COMMENT '财务审核操作人ID',
  PRIMARY KEY (`id`,`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='财务申请 审核表';

CREATE TABLE `vbos_mrecharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `plus_gold` int(11) DEFAULT NULL COMMENT '充值金额',
  `minus_gold` int(11) DEFAULT NULL COMMENT '扣减金额',
  `rechargetype` smallint(2) DEFAULT NULL COMMENT '充值类型:0人工充值，1活动奖励，2平台赔偿',
  `status` smallint(2) DEFAULT NULL COMMENT '审核状态:0等待审核,1审核通过,2审核失败',
  `apply_name` char(32) DEFAULT NULL COMMENT '充值|扣减员',
  `check_name` char(32) DEFAULT NULL COMMENT '审核员',
  `apply_time` datetime DEFAULT NULL COMMENT '充值|扣减时间',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `check_remark` varchar(255) DEFAULT NULL COMMENT '审核不通过原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='人工充值|扣减表';


-- ----------------------------
-- Table structure for `vbos_interface_logs`
-- ----------------------------
DROP TABLE IF EXISTS `vbos_interface_logs`;
CREATE TABLE `vbos_interface_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '接口名称',
  `rout` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '请求位置',
  `return_msg` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '返回内容  json格式',
  `ctime` datetime DEFAULT NULL COMMENT '调用时间',
  `status` int(6) DEFAULT NULL COMMENT '调用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `vbos_pay_bonus`
-- ----------------------------
DROP TABLE IF EXISTS `vbos_pay_bonus`;
CREATE TABLE `vbos_pay_bonus` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `ctime` datetime NOT NULL COMMENT '创建时间',
  `mtime` datetime DEFAULT NULL COMMENT '修改时间',
  `uid` int(11) unsigned NOT NULL COMMENT '充值用户id',
  `pay_money` int(11) unsigned NOT NULL COMMENT '申请钱数',
  `pay_type` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL COMMENT '留言',
  `replyid` int(11) NOT NULL COMMENT '申请员id',
  `checkid` int(11) DEFAULT NULL COMMENT '审核员id',
  `pay_status` int(11) DEFAULT '0',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='主播工资奖金发放表';

INSERT INTO `video_bos`.`vbos_priv` VALUES ('47', '账变列表', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('48', '充值申请', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('49', '代理管理', '0');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('50', '新增域名', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('51', '跳转设定', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('53', '人工充值（申请）', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('54', '人工充值(审核)', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('55', '人工扣减（申请）', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('56', '人工扣减（审核）', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('57', '主播礼物提成设置', '3');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('58', '主播月报表', '3');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('59', '添加代理', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('60', '添加域名至代理', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('61', '域名查询', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('62', '代理列表', '49');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('63', '主播提款申请', '3');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('64', '帐号反查', '2');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('65', '房间管理', '0');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('66', '房间状态', '65');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('68', '工资与奖金（申请）', '1');
INSERT INTO `video_bos`.`vbos_priv` VALUES ('69', '工资与奖金（审核）', '1');

DROP TABLE IF EXISTS `vbos_pay_bonus`;
CREATE TABLE `vbos_pay_bonus` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `ctime` datetime NOT NULL COMMENT '创建时间',
  `mtime` datetime DEFAULT NULL COMMENT '修改时间',
  `uid` int(11) unsigned NOT NULL COMMENT '充值用户id',
  `pay_money` int(11) unsigned NOT NULL COMMENT '申请钱数',
  `pay_type` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL COMMENT '留言',
  `replyid` int(11) NOT NULL COMMENT '申请员id',
  `checkid` int(11) DEFAULT NULL COMMENT '审核员id',
  `pay_status` int(11) DEFAULT '0',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COMMENT='主播工资奖金发放表';

DROP TABLE IF EXISTS `vbos_bank`;
CREATE TABLE `vbos_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `issuing_bank` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发卡银行',
  `code_bank` int(11) DEFAULT NULL COMMENT '发卡行代码',
  `card_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '卡种名称',
  `card_type` tinyint(3) DEFAULT NULL COMMENT '卡类型',
  `num_length` tinyint(4) DEFAULT NULL COMMENT '卡号长度',
  `bin` int(11) DEFAULT NULL COMMENT 'BIN号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vbos_bank
-- ----------------------------
INSERT INTO `vbos_bank` VALUES ('1', '农业银行', '1030000', '金穗借记卡', '1', '19', '103000');
INSERT INTO `vbos_bank` VALUES ('2', '昆明农联社', '14097310', '金碧卡', '1', '16', '185720');
INSERT INTO `vbos_bank` VALUES ('3', '上海银行', '4012902', '双币种申卡贷记卡个人金卡', '2', '16', '356827');
INSERT INTO `vbos_bank` VALUES ('4', '上海银行', '4012902', '双币种申卡贷记卡个人普卡', '2', '16', '356828');
INSERT INTO `vbos_bank` VALUES ('5', '中国银行', '1040000', '中银JCB卡金卡', '2', '16', '356833');
INSERT INTO `vbos_bank` VALUES ('6', '中国银行', '1040000', '中银JCB卡普卡', '2', '16', '356835');
INSERT INTO `vbos_bank` VALUES ('7', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '356837');
INSERT INTO `vbos_bank` VALUES ('8', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '356838');
INSERT INTO `vbos_bank` VALUES ('9', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '356839');
INSERT INTO `vbos_bank` VALUES ('10', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '356840');
INSERT INTO `vbos_bank` VALUES ('11', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356885');
INSERT INTO `vbos_bank` VALUES ('12', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356886');
INSERT INTO `vbos_bank` VALUES ('13', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356887');
INSERT INTO `vbos_bank` VALUES ('14', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356888');
INSERT INTO `vbos_bank` VALUES ('15', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356889');
INSERT INTO `vbos_bank` VALUES ('16', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '356890');
INSERT INTO `vbos_bank` VALUES ('17', '工商银行', '1020000', '牡丹运通卡金卡', '3', '15', '370246');
INSERT INTO `vbos_bank` VALUES ('18', '工商银行', '1020000', '牡丹运通卡普通卡', '3', '15', '370247');
INSERT INTO `vbos_bank` VALUES ('19', '中国工商银行', '1020000', '牡丹运通卡金卡', '2', '15', '370248');
INSERT INTO `vbos_bank` VALUES ('20', '中国工商银行', '1020000', '牡丹运通卡金卡', '2', '15', '370249');
INSERT INTO `vbos_bank` VALUES ('21', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '400360');
INSERT INTO `vbos_bank` VALUES ('22', '中国银行', '1040000', '长城国际卡(美元卡)-商务普卡', '2', '16', '400937');
INSERT INTO `vbos_bank` VALUES ('23', '中国银行', '1040000', '长城国际卡(美元卡)-商务金卡', '2', '16', '400938');
INSERT INTO `vbos_bank` VALUES ('24', '中国银行', '1040000', '长城国际卡(港币卡)-商务普卡', '2', '16', '400939');
INSERT INTO `vbos_bank` VALUES ('25', '中国银行', '1040000', '长城国际卡(港币卡)-商务金卡', '2', '16', '400940');
INSERT INTO `vbos_bank` VALUES ('26', '中国银行', '1040000', '长城国际卡(美元卡)-个人普卡', '2', '16', '400941');
INSERT INTO `vbos_bank` VALUES ('27', '中国银行', '1040000', '长城国际卡(美元卡)-个人金卡', '2', '16', '400942');
INSERT INTO `vbos_bank` VALUES ('28', '招商银行银行', '3080000', '两地一卡通', '1', '16', '402658');
INSERT INTO `vbos_bank` VALUES ('29', '上海银行', '4012902', '申卡贷记卡', '2', '16', '402673');
INSERT INTO `vbos_bank` VALUES ('30', '工商银行', '1020000', '国际借记卡', '3', '16', '402791');
INSERT INTO `vbos_bank` VALUES ('31', '农业银行', '1030000', '金穗贷记卡', '3', '16', '403361');
INSERT INTO `vbos_bank` VALUES ('32', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '403391');
INSERT INTO `vbos_bank` VALUES ('33', '农业银行', '1030000', '金穗贷记卡', '3', '16', '404117');
INSERT INTO `vbos_bank` VALUES ('34', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '404157');
INSERT INTO `vbos_bank` VALUES ('35', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '404171');
INSERT INTO `vbos_bank` VALUES ('36', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '404172');
INSERT INTO `vbos_bank` VALUES ('37', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '404173');
INSERT INTO `vbos_bank` VALUES ('38', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '404174');
INSERT INTO `vbos_bank` VALUES ('39', '上海浦东发展银行', '3100000', '上海浦东发展银行信用卡VISA普通卡', '2', '16', '404738');
INSERT INTO `vbos_bank` VALUES ('40', '上海浦东发展银行', '3100000', '上海浦东发展银行信用卡VISA金卡', '2', '16', '404739');
INSERT INTO `vbos_bank` VALUES ('41', '交通银行', '3010000', '太平洋互连卡', '1', '17', '405512');
INSERT INTO `vbos_bank` VALUES ('42', '交通银行', '3010000', '太平洋互连卡', '1', '17', '405512');
INSERT INTO `vbos_bank` VALUES ('43', '中国光大银行', '3030000', '阳光信用卡', '2', '16', '406252');
INSERT INTO `vbos_bank` VALUES ('44', '中国光大银行', '3030000', '阳光信用卡', '2', '16', '406254');
INSERT INTO `vbos_bank` VALUES ('45', '广东发展银行', '3060000', '广发VISA信用卡', '3', '16', '406365');
INSERT INTO `vbos_bank` VALUES ('46', '民生银行', '3050001', '民生贷记卡', '2', '16', '407405');
INSERT INTO `vbos_bank` VALUES ('47', '中国银行', '1040000', '中银威士信用卡员工普卡', '2', '16', '409665');
INSERT INTO `vbos_bank` VALUES ('48', '中国银行', '1040000', '中银威士信用卡个人普卡', '2', '16', '409666');
INSERT INTO `vbos_bank` VALUES ('49', '中国银行', '1040000', '中银威士信用卡员工金卡', '2', '16', '409667');
INSERT INTO `vbos_bank` VALUES ('50', '中国银行', '1040000', '中银威士信用卡个人金卡', '2', '16', '409668');
INSERT INTO `vbos_bank` VALUES ('51', '中国银行', '1040000', '中银威士信用卡员工白金卡', '2', '16', '409669');
INSERT INTO `vbos_bank` VALUES ('52', '中国银行', '1040000', '中银威士信用卡个人白金卡', '2', '16', '409670');
INSERT INTO `vbos_bank` VALUES ('53', '中国银行', '1040000', '中银威士信用卡商务白金卡', '2', '16', '409671');
INSERT INTO `vbos_bank` VALUES ('54', '中国银行', '1040000', '长城公务卡', '2', '16', '409672');
INSERT INTO `vbos_bank` VALUES ('55', '招商银行银行', '3080000', '招商银行银行国际卡', '1', '16', '410062');
INSERT INTO `vbos_bank` VALUES ('56', '深圳发展银行', '3070010', '发展借记卡', '1', '16', '412962');
INSERT INTO `vbos_bank` VALUES ('57', '民生银行', '3050000', '民生借记卡', '1', '16', '415599');
INSERT INTO `vbos_bank` VALUES ('58', '北京银行', '4031000', '京卡双币种国际借记卡', '1', '16', '421317');
INSERT INTO `vbos_bank` VALUES ('59', '建设银行', '1050000', '乐当家银卡VISA', '1', '16', '421349');
INSERT INTO `vbos_bank` VALUES ('60', '民生银行', '3050000', '民生国际卡', '1', '16', '421393');
INSERT INTO `vbos_bank` VALUES ('61', '中信实业银行', '3020000', '中信国际借记卡', '1', '16', '421437');
INSERT INTO `vbos_bank` VALUES ('62', '民生银行', '3050000', '民生国际卡', '1', '16', '421865');
INSERT INTO `vbos_bank` VALUES ('63', '民生银行', '3050001', '民生贷记卡', '2', '16', '421869');
INSERT INTO `vbos_bank` VALUES ('64', '民生银行', '3050001', '民生贷记卡', '2', '16', '421870');
INSERT INTO `vbos_bank` VALUES ('65', '民生银行', '3050001', '民生贷记卡', '2', '16', '421871');
INSERT INTO `vbos_bank` VALUES ('66', '北京银行', '4031000', '京卡贵宾金卡', '1', '16', '422160');
INSERT INTO `vbos_bank` VALUES ('67', '北京银行', '4031000', '京卡贵宾白金卡', '1', '16', '422161');
INSERT INTO `vbos_bank` VALUES ('68', '中国银行', '1040000', '长城人民币信用卡-个人金卡', '4', '16', '424106');
INSERT INTO `vbos_bank` VALUES ('69', '中国银行', '1040000', '长城人民币信用卡-员工金卡', '4', '16', '424107');
INSERT INTO `vbos_bank` VALUES ('70', '中国银行', '1040000', '长城人民币信用卡-个人普卡', '4', '16', '424108');
INSERT INTO `vbos_bank` VALUES ('71', '中国银行', '1040000', '长城人民币信用卡-员工普卡', '4', '16', '424109');
INSERT INTO `vbos_bank` VALUES ('72', '中国银行', '1040000', '长城人民币信用卡-单位普卡', '4', '16', '424110');
INSERT INTO `vbos_bank` VALUES ('73', '中国银行', '1040000', '长城人民币信用卡-单位金卡', '4', '16', '424111');
INSERT INTO `vbos_bank` VALUES ('74', '中国银行', '1040000', '长城国际卡(美元卡)-白金卡', '2', '16', '424902');
INSERT INTO `vbos_bank` VALUES ('75', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '425862');
INSERT INTO `vbos_bank` VALUES ('76', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427010');
INSERT INTO `vbos_bank` VALUES ('77', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427018');
INSERT INTO `vbos_bank` VALUES ('78', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427019');
INSERT INTO `vbos_bank` VALUES ('79', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427020');
INSERT INTO `vbos_bank` VALUES ('80', '工商银行', '1020000', '国际借记卡', '3', '16', '427028');
INSERT INTO `vbos_bank` VALUES ('81', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427029');
INSERT INTO `vbos_bank` VALUES ('82', '工商银行', '1020000', '国际借记卡', '3', '16', '427038');
INSERT INTO `vbos_bank` VALUES ('83', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427039');
INSERT INTO `vbos_bank` VALUES ('84', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427062');
INSERT INTO `vbos_bank` VALUES ('85', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '427064');
INSERT INTO `vbos_bank` VALUES ('86', '中国民生银行', '3050000', '民生国际借记卡', '3', '16', '427570');
INSERT INTO `vbos_bank` VALUES ('87', '中国民生银行', '3050000', '民生国际借记卡', '3', '16', '427571');
INSERT INTO `vbos_bank` VALUES ('88', '广东发展银行', '3060000', '广发信用卡', '3', '16', '428911');
INSERT INTO `vbos_bank` VALUES ('89', '华夏', '3040000', '华夏卡', '1', '16', '431502');
INSERT INTO `vbos_bank` VALUES ('90', '华夏', '3040000', '华夏卡', '1', '16', '431502');
INSERT INTO `vbos_bank` VALUES ('91', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '433666');
INSERT INTO `vbos_bank` VALUES ('92', '中信实业银行', '3020000', '中信借记卡', '1', '16', '433670');
INSERT INTO `vbos_bank` VALUES ('93', '中信实业银行', '3020000', '中信借记卡', '1', '16', '433680');
INSERT INTO `vbos_bank` VALUES ('94', '建设银行', '1050000', '乐当家金卡VISA', '1', '16', '434061');
INSERT INTO `vbos_bank` VALUES ('95', '建设银行', '1050000', '乐当家白金卡VISA', '1', '16', '434062');
INSERT INTO `vbos_bank` VALUES ('96', '深圳发展银行', '3070000', '沃尔玛百分卡', '2', '16', '435744');
INSERT INTO `vbos_bank` VALUES ('97', '深圳发展银行', '3070000', '沃尔玛百分卡', '2', '16', '435745');
INSERT INTO `vbos_bank` VALUES ('98', '建设银行', '1050000', '龙卡贷记卡公司卡金卡VISA', '2', '16', '436718');
INSERT INTO `vbos_bank` VALUES ('99', '建设银行', '1050000', '龙卡普通卡VISA', '4', '16', '436728');
INSERT INTO `vbos_bank` VALUES ('100', '建设银行', '1050000', '龙卡贷记卡公司卡普通卡VISA', '2', '16', '436738');
INSERT INTO `vbos_bank` VALUES ('101', '建设银行', '1050000', '龙卡储蓄卡', '5', '19', '436742');
INSERT INTO `vbos_bank` VALUES ('102', '建设银行', '1050000', '龙卡国际普通卡VISA', '2', '16', '436745');
INSERT INTO `vbos_bank` VALUES ('103', '建设银行', '1050000', '龙卡国际金卡 VISA', '2', '16', '436748');
INSERT INTO `vbos_bank` VALUES ('104', '广东发展银行', '3060000', '广发信用卡', '3', '16', '436768');
INSERT INTO `vbos_bank` VALUES ('105', '中国银行', '1040000', '中银奥运信用卡个人卡', '2', '16', '438088');
INSERT INTO `vbos_bank` VALUES ('106', '工商银行', '1020000', '牡丹VISA信用卡', '3', '16', '438125');
INSERT INTO `vbos_bank` VALUES ('107', '中国工商银行', '1020000', '牡丹VISA白金卡', '3', '16', '438126');
INSERT INTO `vbos_bank` VALUES ('108', '兴业银行', '3090000', '兴业智能卡', '1', '18', '438588');
INSERT INTO `vbos_bank` VALUES ('109', '兴业银行', '3090000', '兴业智能卡', '1', '18', '438589');
INSERT INTO `vbos_bank` VALUES ('110', '上海银行', '4012902', '上海申卡IC', '1', '16', '438600');
INSERT INTO `vbos_bank` VALUES ('111', '招商银行银行', '3080000', '招商银行银行信用卡', '3', '16', '439188');
INSERT INTO `vbos_bank` VALUES ('112', '招商银行银行', '3080010', 'VISA信用卡', '3', '16', '439225');
INSERT INTO `vbos_bank` VALUES ('113', '招商银行银行', '3080000', 'VISA商务信用卡', '3', '16', '439227');
INSERT INTO `vbos_bank` VALUES ('114', '中信实业银行', '3020000', '中信国际借记卡', '1', '16', '442729');
INSERT INTO `vbos_bank` VALUES ('115', '中信实业银行', '3020000', '中信国际借记卡', '1', '16', '442730');
INSERT INTO `vbos_bank` VALUES ('116', '兴业银行', '3090010', 'VISA信用卡', '2', '16', '451289');
INSERT INTO `vbos_bank` VALUES ('117', '中国银行', '1040000', '长城国际卡(欧元卡)-个人金卡', '2', '16', '451291');
INSERT INTO `vbos_bank` VALUES ('118', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '451804');
INSERT INTO `vbos_bank` VALUES ('119', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '451804');
INSERT INTO `vbos_bank` VALUES ('120', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '451810');
INSERT INTO `vbos_bank` VALUES ('121', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '451810');
INSERT INTO `vbos_bank` VALUES ('122', '建设银行', '1050000', 'VISA准贷记卡', '4', '16', '453242');
INSERT INTO `vbos_bank` VALUES ('123', '中国银行', '1040000', '长城电子借记卡', '1', '19', '456351');
INSERT INTO `vbos_bank` VALUES ('124', '上海浦东发展银行', '3100000', '浦发银行VISA年青卡', '2', '16', '456418');
INSERT INTO `vbos_bank` VALUES ('125', '工商银行', '1020000', '牡丹信用卡', '3', '16', '458060');
INSERT INTO `vbos_bank` VALUES ('126', '工商银行', '1020000', '牡丹信用卡', '3', '16', '458060');
INSERT INTO `vbos_bank` VALUES ('127', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '458071');
INSERT INTO `vbos_bank` VALUES ('128', '工商银行', '1020000', '牡丹贷记卡', '3', '16', '458071');
INSERT INTO `vbos_bank` VALUES ('129', '交通银行', '3010000', '太平洋双币贷记卡VISA', '2', '16', '458123');
INSERT INTO `vbos_bank` VALUES ('130', '交通银行', '3010000', '太平洋双币贷记卡VISA', '2', '16', '458124');
INSERT INTO `vbos_bank` VALUES ('131', '招商银行银行', '3080000', '招商银行银行国际卡', '1', '16', '468203');
INSERT INTO `vbos_bank` VALUES ('132', '民生银行', '3050000', '民生国际卡', '1', '16', '472067');
INSERT INTO `vbos_bank` VALUES ('133', '民生银行', '3050000', '民生国际卡', '1', '16', '472068');
INSERT INTO `vbos_bank` VALUES ('134', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '479228');
INSERT INTO `vbos_bank` VALUES ('135', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '479229');
INSERT INTO `vbos_bank` VALUES ('136', '中国光大银行', '3030000', '阳光白金信用卡', '2', '16', '481699');
INSERT INTO `vbos_bank` VALUES ('137', '上海银行', '4012902', '申卡贷记卡', '2', '16', '486466');
INSERT INTO `vbos_bank` VALUES ('138', '兴业银行', '3090010', 'VISA商务普卡', '2', '16', '486493');
INSERT INTO `vbos_bank` VALUES ('139', '兴业银行', '3090010', 'VISA商务金卡', '2', '16', '486494');
INSERT INTO `vbos_bank` VALUES ('140', '中国光大银行', '3030000', '阳光商旅信用卡', '2', '16', '486497');
INSERT INTO `vbos_bank` VALUES ('141', '广东发展银行', '3060000', '广发VISA信用卡', '3', '16', '487013');
INSERT INTO `vbos_bank` VALUES ('142', '中国建设银行', '1050000', 'VISA白金/钻石信用卡', '2', '16', '489592');
INSERT INTO `vbos_bank` VALUES ('143', '中国工商银行', '1020000', '牡丹欧元卡', '2', '16', '489734');
INSERT INTO `vbos_bank` VALUES ('144', '中国工商银行', '1020000', '牡丹欧元卡', '2', '16', '489735');
INSERT INTO `vbos_bank` VALUES ('145', '中国工商银行', '1020000', '牡丹欧元卡', '2', '16', '489736');
INSERT INTO `vbos_bank` VALUES ('146', '农业银行', '1030000', '金穗信用卡', '4', '16', '491020');
INSERT INTO `vbos_bank` VALUES ('147', '农业银行', '1030000', '金穗信用卡', '4', '16', '491020');
INSERT INTO `vbos_bank` VALUES ('148', '建设银行', '1050000', 'VISA准贷记金卡', '4', '16', '491031');
INSERT INTO `vbos_bank` VALUES ('149', '广东发展银行', '3060000', '广发信用卡', '3', '16', '491032');
INSERT INTO `vbos_bank` VALUES ('150', '交通银行', '3010000', '太平洋信用卡', '3', '16', '491040');
INSERT INTO `vbos_bank` VALUES ('151', '广东发展银行', '3060000', '广发信用卡', '3', '16', '493427');
INSERT INTO `vbos_bank` VALUES ('152', '中国银行', '1040000', '长城国际卡(港币卡)-个人金卡', '2', '16', '493878');
INSERT INTO `vbos_bank` VALUES ('153', '上海浦东发展银行', '3100000', '上海浦东发展银行信用卡VISA白金卡', '2', '16', '498451');
INSERT INTO `vbos_bank` VALUES ('154', '常州商业银行', '4683040', '月季卡', '1', '16', '504923');
INSERT INTO `vbos_bank` VALUES ('155', '工商银行', '1020000', '牡丹万事达国际借记卡', '3', '16', '510529');
INSERT INTO `vbos_bank` VALUES ('156', '中国银行', '1040000', '中银万事达信用卡员工普卡', '2', '16', '512315');
INSERT INTO `vbos_bank` VALUES ('157', '中国银行', '1040000', '中银万事达信用卡个人普卡', '2', '16', '512316');
INSERT INTO `vbos_bank` VALUES ('158', '中国银行', '1040000', '中银万事达信用卡员工金卡', '2', '16', '512411');
INSERT INTO `vbos_bank` VALUES ('159', '中国银行', '1040000', '中银万事达信用卡个人金卡', '2', '16', '512412');
INSERT INTO `vbos_bank` VALUES ('160', '招商银行银行', '3080000', '招商银行银行国际卡', '1', '16', '512425');
INSERT INTO `vbos_bank` VALUES ('161', '宁波市商业银行', '4083329', '汇通国际卡', '2', '16', '512431');
INSERT INTO `vbos_bank` VALUES ('162', '民生银行', '3050001', '民生贷记卡', '2', '16', '512466');
INSERT INTO `vbos_bank` VALUES ('163', '中国银行', '1040000', '长城国际卡(英镑卡)-个人普卡', '2', '16', '512695');
INSERT INTO `vbos_bank` VALUES ('164', '中国银行', '1040000', '长城国际卡(英镑卡)-个人金卡', '2', '16', '512732');
INSERT INTO `vbos_bank` VALUES ('165', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '514906');
INSERT INTO `vbos_bank` VALUES ('166', '中国银行', '1040000', '中银万事达信用卡员工白金卡', '2', '16', '514957');
INSERT INTO `vbos_bank` VALUES ('167', '中国银行', '1040000', '中银万事达信用卡个人白金卡', '2', '16', '514958');
INSERT INTO `vbos_bank` VALUES ('168', '民生银行', '3050001', '民生贷记卡', '2', '16', '517636');
INSERT INTO `vbos_bank` VALUES ('169', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '518212');
INSERT INTO `vbos_bank` VALUES ('170', '广东发展银行', '3060000', '广发信用卡', '3', '16', '518364');
INSERT INTO `vbos_bank` VALUES ('171', '中国银行', '1040000', '长城人民币信用卡-个人金卡', '4', '16', '518378');
INSERT INTO `vbos_bank` VALUES ('172', '中国银行', '1040000', '长城人民币信用卡-员工金卡', '4', '16', '518379');
INSERT INTO `vbos_bank` VALUES ('173', '中国银行', '1040000', '长城人民币信用卡-专用卡普卡', '4', '16', '518474');
INSERT INTO `vbos_bank` VALUES ('174', '中国银行', '1040000', '长城人民币信用卡-员工普卡', '4', '16', '518475');
INSERT INTO `vbos_bank` VALUES ('175', '中国银行', '1040000', '长城人民币信用卡-个人普卡', '4', '16', '518476');
INSERT INTO `vbos_bank` VALUES ('176', '招商银行', '3080010', 'MASTER信用卡', '3', '16', '518710');
INSERT INTO `vbos_bank` VALUES ('177', '招商银行', '3080010', 'MASTER信用金卡', '3', '16', '518718');
INSERT INTO `vbos_bank` VALUES ('178', '农业银行', '1030000', '金穗贷记卡', '3', '16', '519412');
INSERT INTO `vbos_bank` VALUES ('179', '上海银行', '4012902', '双币种申卡贷记卡普通卡', '2', '16', '519498');
INSERT INTO `vbos_bank` VALUES ('180', '农业银行', '1030000', '金穗贷记卡', '3', '16', '520082');
INSERT INTO `vbos_bank` VALUES ('181', '中信实业银行', '3020000', '中信贷记卡', '2', '16', '520108');
INSERT INTO `vbos_bank` VALUES ('182', '上海银行', '4012902', '双币种申卡贷记卡金卡', '2', '16', '520131');
INSERT INTO `vbos_bank` VALUES ('183', '广东发展银行', '3060000', '广发万事达信用卡', '3', '16', '520152');
INSERT INTO `vbos_bank` VALUES ('184', '交通银行', '3010000', '太平洋双币贷记卡MasterCard', '2', '16', '520169');
INSERT INTO `vbos_bank` VALUES ('185', '宁波市商业银行', '4083329', '汇通国际卡', '2', '16', '520194');
INSERT INTO `vbos_bank` VALUES ('186', '广东发展银行', '3060000', '广发万事达信用卡', '3', '16', '520382');
INSERT INTO `vbos_bank` VALUES ('187', '交通银行', '3010000', '太平洋双币贷记卡MasterCard', '2', '16', '521899');
INSERT INTO `vbos_bank` VALUES ('188', '中国银行', '1040000', '长城国际卡(欧元卡)-个人普卡', '2', '16', '522153');
INSERT INTO `vbos_bank` VALUES ('189', '兴业银行', '3090010', '万事达信用卡', '2', '16', '523036');
INSERT INTO `vbos_bank` VALUES ('190', '招商银行银行', '3080000', '招商银行银行国际卡', '1', '16', '524011');
INSERT INTO `vbos_bank` VALUES ('191', '工商银行', '1020000', '牡丹万事达白金卡', '3', '16', '524047');
INSERT INTO `vbos_bank` VALUES ('192', '兴业银行', '3090010', '万事达信用卡', '2', '16', '524070');
INSERT INTO `vbos_bank` VALUES ('193', '中国工商银行', '1020000', '牡丹海航信用卡个人金卡', '3', '16', '524091');
INSERT INTO `vbos_bank` VALUES ('194', '建设银行', '1050000', '乐当家金卡MASTER', '1', '16', '524094');
INSERT INTO `vbos_bank` VALUES ('195', '中国银行', '1040000', '长城信用卡', '4', '16', '524864');
INSERT INTO `vbos_bank` VALUES ('196', '中国银行', '1040000', '长城信用卡', '4', '16', '524865');
INSERT INTO `vbos_bank` VALUES ('197', '中国工商银行', '1020000', '牡丹海航信用卡个人普卡', '3', '16', '525498');
INSERT INTO `vbos_bank` VALUES ('198', '中国银行', '1040000', '长城信用卡', '4', '16', '525745');
INSERT INTO `vbos_bank` VALUES ('199', '中国银行', '1040000', '长城信用卡', '4', '16', '525746');
INSERT INTO `vbos_bank` VALUES ('200', '建设银行', '1050000', '乐当家银卡MASTER', '1', '16', '526410');
INSERT INTO `vbos_bank` VALUES ('201', '深圳市商业银行', '4105841', '深圳市商业银行信用卡', '2', '16', '526855');
INSERT INTO `vbos_bank` VALUES ('202', '兴业银行', '3090010', '加菲猫信用卡', '2', '16', '527414');
INSERT INTO `vbos_bank` VALUES ('203', '深圳市商业银行', '4105841', '深圳市商业银行信用卡', '2', '16', '528020');
INSERT INTO `vbos_bank` VALUES ('204', '广东发展银行', '3060000', '广发万事达信用卡', '3', '16', '528931');
INSERT INTO `vbos_bank` VALUES ('205', '民生银行', '3050001', '民生贷记卡', '2', '16', '528948');
INSERT INTO `vbos_bank` VALUES ('206', '工商银行', '1020000', '牡丹万事达信用卡', '3', '16', '530970');
INSERT INTO `vbos_bank` VALUES ('207', '工商银行', '1020000', '牡丹信用卡', '3', '16', '530980');
INSERT INTO `vbos_bank` VALUES ('208', '工商银行', '1020000', '牡丹信用卡', '3', '16', '530980');
INSERT INTO `vbos_bank` VALUES ('209', '工商银行', '1020000', '牡丹万事达信用卡', '3', '16', '530990');
INSERT INTO `vbos_bank` VALUES ('210', '建设银行', '1050000', 'MASTER准贷记卡', '4', '16', '532420');
INSERT INTO `vbos_bank` VALUES ('211', '建设银行', '1050000', '龙卡普通卡MASTER', '4', '16', '532430');
INSERT INTO `vbos_bank` VALUES ('212', '建设银行', '1050000', '龙卡国际普通卡MASTER', '2', '16', '532450');
INSERT INTO `vbos_bank` VALUES ('213', '建设银行', '1050000', '龙卡国际金卡 MASTER', '2', '16', '532458');
INSERT INTO `vbos_bank` VALUES ('214', '农业银行', '1030000', '金穗信用卡', '4', '16', '535910');
INSERT INTO `vbos_bank` VALUES ('215', '农业银行', '1030000', '金穗信用卡', '4', '16', '535910');
INSERT INTO `vbos_bank` VALUES ('216', '交通银行', '3010000', '太平洋信用卡', '3', '16', '537830');
INSERT INTO `vbos_bank` VALUES ('217', '中国银行', '1040000', '长城国际卡(港币卡)-个人普卡', '2', '16', '540297');
INSERT INTO `vbos_bank` VALUES ('218', '中国银行', '1040000', '长城国际卡(美元卡)-个人普卡', '2', '16', '540838');
INSERT INTO `vbos_bank` VALUES ('219', '中国银行', '1040000', '长城国际卡(美元卡)-个人金卡', '2', '16', '541068');
INSERT INTO `vbos_bank` VALUES ('220', '广东发展银行', '3060000', '广发信用卡', '3', '16', '541709');
INSERT INTO `vbos_bank` VALUES ('221', '中国光大银行', '3030000', '第十八届世界足球锦标赛纪念卡', '2', '16', '543159');
INSERT INTO `vbos_bank` VALUES ('222', '建设银行', '1050000', 'MASTER准贷记金卡', '4', '16', '544033');
INSERT INTO `vbos_bank` VALUES ('223', '招商银行', '3080000', '万事达信用卡', '3', '16', '545619');
INSERT INTO `vbos_bank` VALUES ('224', '招商银行', '3080000', '万事达信用卡', '3', '16', '545623');
INSERT INTO `vbos_bank` VALUES ('225', '招商银行', '3080000', '万事达信用卡', '3', '16', '545947');
INSERT INTO `vbos_bank` VALUES ('226', '中国银行', '1040000', '长城国际卡(美元卡)-商务普卡', '2', '16', '547628');
INSERT INTO `vbos_bank` VALUES ('227', '中国银行', '1040000', '长城国际卡(港币卡)-商务普卡', '2', '16', '547648');
INSERT INTO `vbos_bank` VALUES ('228', '中国银行', '1040000', '长城人民币信用卡-单位普卡', '4', '16', '547766');
INSERT INTO `vbos_bank` VALUES ('229', '中国银行', '1040000', '长城万事达信用卡单位普卡', '4', '16', '547766');
INSERT INTO `vbos_bank` VALUES ('230', '工商银行', '1020000', '国际借记卡', '3', '16', '548259');
INSERT INTO `vbos_bank` VALUES ('231', '广东发展银行', '3060000', '广发信用卡', '3', '16', '548844');
INSERT INTO `vbos_bank` VALUES ('232', '建设银行', '1050000', '乐当家白金卡MASTER', '1', '16', '552245');
INSERT INTO `vbos_bank` VALUES ('233', '民生银行', '3050001', '民生贷记卡', '2', '16', '552288');
INSERT INTO `vbos_bank` VALUES ('234', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '552534');
INSERT INTO `vbos_bank` VALUES ('235', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '552587');
INSERT INTO `vbos_bank` VALUES ('236', '农业银行', '1030000', '金穗贷记卡', '3', '16', '552599');
INSERT INTO `vbos_bank` VALUES ('237', '中国银行', '1040000', '长城公务卡', '5', '16', '552742');
INSERT INTO `vbos_bank` VALUES ('238', '广东发展银行', '3060000', '广发万事达信用卡', '3', '16', '552794');
INSERT INTO `vbos_bank` VALUES ('239', '建设银行', '1050000', '龙卡贷记卡公司卡普通卡MASTER', '2', '16', '552801');
INSERT INTO `vbos_bank` VALUES ('240', '交通银行', '3010000', '太平洋双币贷记卡MasterCard', '2', '16', '552853');
INSERT INTO `vbos_bank` VALUES ('241', '中国银行', '1040000', '长城公务卡', '5', '16', '553131');
INSERT INTO `vbos_bank` VALUES ('242', '建设银行', '1050000', '龙卡信用卡', '3', '18', '553242');
INSERT INTO `vbos_bank` VALUES ('243', '民生银行', '3050001', '民生贷记卡', '2', '16', '556610');
INSERT INTO `vbos_bank` VALUES ('244', '中信实业银行', '3020000', '中信MASTERCARD人民币+美金双币贷记卡', '2', '16', '556617');
INSERT INTO `vbos_bank` VALUES ('245', '工商银行', '1020000', '牡丹万事达信用卡', '3', '16', '558360');
INSERT INTO `vbos_bank` VALUES ('246', '农业银行', '1030000', '金穗贷记卡', '3', '16', '558730');
INSERT INTO `vbos_bank` VALUES ('247', '中国银行', '1040000', '长城国际卡(港币卡)-商务金卡', '2', '16', '558808');
INSERT INTO `vbos_bank` VALUES ('248', '中国银行', '1040000', '长城国际卡(美元卡)-商务金卡', '2', '16', '558809');
INSERT INTO `vbos_bank` VALUES ('249', '中国银行', '1040000', '长城人民币信用卡-单位金卡', '4', '16', '558868');
INSERT INTO `vbos_bank` VALUES ('250', '中国银行', '1040000', '中银万事达信用卡单位金卡', '4', '16', '558868');
INSERT INTO `vbos_bank` VALUES ('251', '广东发展银行', '3060000', '广发万事达信用卡', '3', '16', '558894');
INSERT INTO `vbos_bank` VALUES ('252', '建设银行', '1050000', '龙卡贷记卡公司卡金卡MASTER', '2', '16', '558895');
INSERT INTO `vbos_bank` VALUES ('253', '中信实业银行', '3020000', '中信MASTERCARD人民币+美金双币贷记卡', '2', '16', '558916');
INSERT INTO `vbos_bank` VALUES ('254', '沈阳市商业银行', '4172210', '玫瑰卡', '1', '18', '566666');
INSERT INTO `vbos_bank` VALUES ('255', '深圳农联社', '14045840', '信通卡', '1', '16', '584016');
INSERT INTO `vbos_bank` VALUES ('256', 'D.F.S.I(备注1)', '26290840', '发现卡', '2', '16', '601100');
INSERT INTO `vbos_bank` VALUES ('257', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601101');
INSERT INTO `vbos_bank` VALUES ('258', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601121');
INSERT INTO `vbos_bank` VALUES ('259', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601122');
INSERT INTO `vbos_bank` VALUES ('260', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601123');
INSERT INTO `vbos_bank` VALUES ('261', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601124');
INSERT INTO `vbos_bank` VALUES ('262', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601125');
INSERT INTO `vbos_bank` VALUES ('263', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601126');
INSERT INTO `vbos_bank` VALUES ('264', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601127');
INSERT INTO `vbos_bank` VALUES ('265', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601128');
INSERT INTO `vbos_bank` VALUES ('266', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601131');
INSERT INTO `vbos_bank` VALUES ('267', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601136');
INSERT INTO `vbos_bank` VALUES ('268', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601137');
INSERT INTO `vbos_bank` VALUES ('269', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601138');
INSERT INTO `vbos_bank` VALUES ('270', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601140');
INSERT INTO `vbos_bank` VALUES ('271', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601142');
INSERT INTO `vbos_bank` VALUES ('272', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601143');
INSERT INTO `vbos_bank` VALUES ('273', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601144');
INSERT INTO `vbos_bank` VALUES ('274', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601145');
INSERT INTO `vbos_bank` VALUES ('275', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601146');
INSERT INTO `vbos_bank` VALUES ('276', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601147');
INSERT INTO `vbos_bank` VALUES ('277', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601148');
INSERT INTO `vbos_bank` VALUES ('278', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601149');
INSERT INTO `vbos_bank` VALUES ('279', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601174');
INSERT INTO `vbos_bank` VALUES ('280', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601177');
INSERT INTO `vbos_bank` VALUES ('281', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601178');
INSERT INTO `vbos_bank` VALUES ('282', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601179');
INSERT INTO `vbos_bank` VALUES ('283', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601186');
INSERT INTO `vbos_bank` VALUES ('284', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601187');
INSERT INTO `vbos_bank` VALUES ('285', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601188');
INSERT INTO `vbos_bank` VALUES ('286', 'D.F.S.I', '26290840', '发现卡', '2', '16', '601189');
INSERT INTO `vbos_bank` VALUES ('287', '中国银行', '1040000', '长城电子借记卡', '1', '19', '601382');
INSERT INTO `vbos_bank` VALUES ('288', '交通银行', '3010000', '太平洋万事顺卡', '1', '17', '601428');
INSERT INTO `vbos_bank` VALUES ('289', '交通银行', '3010000', '太平洋万事顺卡', '1', '17', '601428');
INSERT INTO `vbos_bank` VALUES ('290', '深圳商业银行', '4105840', '万事顺卡', '1', '16', '602907');
INSERT INTO `vbos_bank` VALUES ('291', '北京银行', '4031000', '京卡', '1', '16', '602969');
INSERT INTO `vbos_bank` VALUES ('292', '南京市商业银行', '4243010', '梅花卡', '1', '16', '603128');
INSERT INTO `vbos_bank` VALUES ('293', '杭州商业银行', '4233310', '西湖卡', '1', '18', '603367');
INSERT INTO `vbos_bank` VALUES ('294', '广州市商业银行', '4135810', '羊城借记卡', '1', '19', '603445');
INSERT INTO `vbos_bank` VALUES ('295', '苏州市商业银行', '4213050', '姑苏卡', '1', '19', '603506');
INSERT INTO `vbos_bank` VALUES ('296', '徽商银行合肥分行', '4403610', '黄山卡', '1', '17', '603601');
INSERT INTO `vbos_bank` VALUES ('297', '徽商银行合肥分行', '4403610', '黄山卡', '1', '17', '603601');
INSERT INTO `vbos_bank` VALUES ('298', '徽商银行合肥分行', '4403610', '黄山卡', '1', '17', '603601');
INSERT INTO `vbos_bank` VALUES ('299', '绍兴商业银行', '4283370', '兰花卡', '1', '18', '603602');
INSERT INTO `vbos_bank` VALUES ('300', '常熟农村商业银行', '14033055', '粒金卡', '1', '19', '603694');
INSERT INTO `vbos_bank` VALUES ('301', '大连商业银行', '4202220', '北方明珠卡', '1', '17', '603708');
INSERT INTO `vbos_bank` VALUES ('302', '温州商业银行', '4123330', '金鹿卡', '1', '16', '621977');
INSERT INTO `vbos_bank` VALUES ('303', '阜新市商业银行', '4672290', '金通卡', '1', '18', '622126');
INSERT INTO `vbos_bank` VALUES ('304', '福建省农村信用社联合社', '14173900', '万通', '1', '19', '622127');
INSERT INTO `vbos_bank` VALUES ('305', '厦门市农村信用合作社', '14173930', '万通卡', '1', '19', '622127');
INSERT INTO `vbos_bank` VALUES ('306', '深圳农信社', '14045840', '信通卡', '1', '16', '622128');
INSERT INTO `vbos_bank` VALUES ('307', '深圳市农村信用合作社联合社', '14045840', '信通商务卡', '1', '16', '622129');
INSERT INTO `vbos_bank` VALUES ('308', '淮安市商业银行', '4693080', '九州借记卡', '1', '19', '622131');
INSERT INTO `vbos_bank` VALUES ('309', '嘉兴市商业银行', '4703350', '南湖借记卡', '1', '16', '622132');
INSERT INTO `vbos_bank` VALUES ('310', '贵阳市商业银行', '4437010', '甲秀银联借记卡', '1', '19', '622133');
INSERT INTO `vbos_bank` VALUES ('311', '重庆市商业银行', '4416530', '长江卡', '1', '16', '622134');
INSERT INTO `vbos_bank` VALUES ('312', '成都商业银行', '4296510', '锦程卡', '1', '19', '622135');
INSERT INTO `vbos_bank` VALUES ('313', '西安市商业银行', '4447910', '福瑞卡', '1', '18', '622136');
INSERT INTO `vbos_bank` VALUES ('314', '徽商银行芜湖分行', '4403620', '黄山卡', '1', '17', '622137');
INSERT INTO `vbos_bank` VALUES ('315', '北京农联社', '14181000', '信通卡', '1', '19', '622138');
INSERT INTO `vbos_bank` VALUES ('316', '兰州市商业银行', '4478210', '敦煌国际卡', '1', '16', '622139');
INSERT INTO `vbos_bank` VALUES ('317', '廊坊市商业银行', '4721460', '银星卡', '1', '16', '622140');
INSERT INTO `vbos_bank` VALUES ('318', '泰隆城市信用社', '4733450', '泰隆卡', '1', '16', '622141');
INSERT INTO `vbos_bank` VALUES ('319', '乌鲁木齐市商业银行', '4278810', '雪莲借记卡', '1', '19', '622143');
INSERT INTO `vbos_bank` VALUES ('320', '青岛商行', '4504520', '金桥卡', '1', '16', '622146');
INSERT INTO `vbos_bank` VALUES ('321', '呼市商业银行', '4741910', '百灵卡', '1', '19', '622147');
INSERT INTO `vbos_bank` VALUES ('322', '上海银行', '4012902', '人民币申卡贷记卡金卡', '2', '16', '622148');
INSERT INTO `vbos_bank` VALUES ('323', '上海银行', '4012902', '人民币申卡贷记卡普通卡', '2', '16', '622149');
INSERT INTO `vbos_bank` VALUES ('324', '国家邮政局', '1000000', '绿卡银联标准卡', '1', '19', '622150');
INSERT INTO `vbos_bank` VALUES ('325', '国家邮政局', '1000000', '绿卡银联标准卡', '1', '19', '622151');
INSERT INTO `vbos_bank` VALUES ('326', '成都市商业银行', '4296510', '锦程卡金卡', '1', '19', '622152');
INSERT INTO `vbos_bank` VALUES ('327', '成都市商业银行', '4296510', '锦程卡定活一卡通金卡', '1', '19', '622153');
INSERT INTO `vbos_bank` VALUES ('328', '成都市商业银行', '4296510', '锦程卡定活一卡通', '1', '19', '622154');
INSERT INTO `vbos_bank` VALUES ('329', '深圳市商业银行', '4105841', '深圳市商业银行信用卡', '2', '16', '622155');
INSERT INTO `vbos_bank` VALUES ('330', '深圳市商业银行', '4105841', '深圳市商业银行信用卡', '2', '16', '622156');
INSERT INTO `vbos_bank` VALUES ('331', '包头市商业银行', '4791921', '包头市商业银行借记卡', '1', '16', '622165');
INSERT INTO `vbos_bank` VALUES ('332', '中国建设银行', '1050000', '龙卡人民币信用卡', '2', '16', '622166');
INSERT INTO `vbos_bank` VALUES ('333', '中国建设银行', '1050000', '龙卡人民币信用金卡', '2', '16', '622168');
INSERT INTO `vbos_bank` VALUES ('334', '湖南省农村信用社联合社', '14385500', '福祥借记卡', '1', '19', '622169');
INSERT INTO `vbos_bank` VALUES ('335', '吉林市商业银行', '4512421', '信用卡', '2', '16', '622178');
INSERT INTO `vbos_bank` VALUES ('336', '吉林市商业银行', '4512421', '信用卡', '2', '16', '622179');
INSERT INTO `vbos_bank` VALUES ('337', '福建省农村信用社联合社', '14173900', '万通', '1', '19', '622184');
INSERT INTO `vbos_bank` VALUES ('338', '国家邮政局', '1000000', '绿卡银联标准卡', '1', '19', '622188');
INSERT INTO `vbos_bank` VALUES ('339', '国家邮政局', '1000000', '绿卡银联标准卡', '1', '19', '622199');
INSERT INTO `vbos_bank` VALUES ('340', '中国工商银行', '1020000', '灵通卡', '1', '19', '622200');
INSERT INTO `vbos_bank` VALUES ('341', '中国工商银行', '1020000', 'E时代卡', '1', '19', '622202');
INSERT INTO `vbos_bank` VALUES ('342', '中国工商银行', '1020000', 'E时代卡', '1', '19', '622203');
INSERT INTO `vbos_bank` VALUES ('343', '中国工商银行', '1020000', '理财金卡', '1', '19', '622208');
INSERT INTO `vbos_bank` VALUES ('344', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622210');
INSERT INTO `vbos_bank` VALUES ('345', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622211');
INSERT INTO `vbos_bank` VALUES ('346', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622212');
INSERT INTO `vbos_bank` VALUES ('347', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622213');
INSERT INTO `vbos_bank` VALUES ('348', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622214');
INSERT INTO `vbos_bank` VALUES ('349', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622215');
INSERT INTO `vbos_bank` VALUES ('350', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622220');
INSERT INTO `vbos_bank` VALUES ('351', '中国工商银行', '1020000', '准贷记卡', '4', '16', '622225');
INSERT INTO `vbos_bank` VALUES ('352', '中国工商银行', '1020000', '贷记卡', '2', '16', '622230');
INSERT INTO `vbos_bank` VALUES ('353', '中国工商银行', '1020000', '贷记卡', '2', '16', '622235');
INSERT INTO `vbos_bank` VALUES ('354', '中国工商银行', '1020000', '贷记卡', '2', '16', '622240');
INSERT INTO `vbos_bank` VALUES ('355', '中国工商银行', '1020000', '贷记卡', '2', '16', '622245');
INSERT INTO `vbos_bank` VALUES ('356', '交行太平洋卡中心', '3010000', '太平洋人民币贷记卡', '2', '16', '622250');
INSERT INTO `vbos_bank` VALUES ('357', '交行太平洋卡中心', '3010000', '太平洋人民币贷记卡', '2', '16', '622251');
INSERT INTO `vbos_bank` VALUES ('358', '交行太平洋卡中心', '3010000', '太平洋人民币贷记卡', '2', '16', '622252');
INSERT INTO `vbos_bank` VALUES ('359', '交行太平洋卡中心', '3010000', '太平洋人民币贷记卡', '2', '16', '622253');
INSERT INTO `vbos_bank` VALUES ('360', '交通银行', '3010000', '太平洋人民币准贷记卡', '4', '16', '622254');
INSERT INTO `vbos_bank` VALUES ('361', '交通银行', '3010000', '太平洋人民币借记卡', '1', '17', '622258');
INSERT INTO `vbos_bank` VALUES ('362', '交通银行', '3010000', '太平洋人民币借记卡', '1', '17', '622259');
INSERT INTO `vbos_bank` VALUES ('363', '交通银行', '3010000', '太平洋人民币借记卡', '1', '19', '622260');
INSERT INTO `vbos_bank` VALUES ('364', '交通银行', '3010000', '太平洋人民币借记卡', '1', '19', '622261');
INSERT INTO `vbos_bank` VALUES ('365', '建设银行', '1050000', '622280银联储蓄卡', '1', '19', '622280');
INSERT INTO `vbos_bank` VALUES ('366', '柳州市商业银行', '4956140', '龙城卡', '1', '18', '622291');
INSERT INTO `vbos_bank` VALUES ('367', '柳州市商业银行', '4956140', '龙城卡', '1', '18', '622292');
INSERT INTO `vbos_bank` VALUES ('368', '湖州市商业银行', '4753360', '百合卡', '1', '19', '622301');
INSERT INTO `vbos_bank` VALUES ('369', '佛山市禅城区农村信用联社', '14275880', '信通卡', '1', '16', '622302');
INSERT INTO `vbos_bank` VALUES ('370', '南京市商业银行', '4240001', '梅花贷记卡', '2', '16', '622303');
INSERT INTO `vbos_bank` VALUES ('371', '南京市商业银行', '4243010', '梅花借记卡', '1', '16', '622305');
INSERT INTO `vbos_bank` VALUES ('372', '九江市商业银行', '4544240', '庐山卡', '1', '19', '622307');
INSERT INTO `vbos_bank` VALUES ('373', '昆明商业银行', '4667310', '春城卡', '1', '17', '622308');
INSERT INTO `vbos_bank` VALUES ('374', '西宁市商业银行', '4588510', '三江银行卡', '1', '17', '622310');
INSERT INTO `vbos_bank` VALUES ('375', '淄博市商业银行', '3134530', '金达借记卡', '1', '17', '622311');
INSERT INTO `vbos_bank` VALUES ('376', '徐州市郊农村信用合作联社', '14113030', '信通卡', '1', '16', '622312');
INSERT INTO `vbos_bank` VALUES ('377', '宁波市商业银行', '4083320', '汇通卡', '1', '16', '622316');
INSERT INTO `vbos_bank` VALUES ('378', '宁波市商业银行', '4083329', '汇通卡', '2', '16', '622318');
INSERT INTO `vbos_bank` VALUES ('379', '山东农村信用联合社', '14144500', '信通卡', '1', '16', '622319');
INSERT INTO `vbos_bank` VALUES ('380', '台州市商业银行', '4593450', '大唐贷记卡', '2', '16', '622321');
INSERT INTO `vbos_bank` VALUES ('381', '顺德农信社', '14085883', '恒通卡', '1', '16', '622322');
INSERT INTO `vbos_bank` VALUES ('382', '常熟农村商业银行', '14033055', '粒金借记卡', '1', '19', '622323');
INSERT INTO `vbos_bank` VALUES ('383', '江苏农信', '14243000', '圆鼎卡', '1', '19', '622324');
INSERT INTO `vbos_bank` VALUES ('384', '武汉市商业银行', '4145210', '九通卡', '1', '16', '622325');
INSERT INTO `vbos_bank` VALUES ('385', '徽商银行马鞍山分行', '4403650', '黄山卡', '1', '17', '622327');
INSERT INTO `vbos_bank` VALUES ('386', '东莞农村信用合作社', '14156020', '信通卡', '1', '19', '622328');
INSERT INTO `vbos_bank` VALUES ('387', '天津市农村信用社', '14191100', '信通借记卡', '1', '19', '622329');
INSERT INTO `vbos_bank` VALUES ('388', '天津市商业银行', '4341100', '津卡', '1', '18', '622331');
INSERT INTO `vbos_bank` VALUES ('389', '张家港市农村商业银行', '14163056', '一卡通', '1', '17', '622332');
INSERT INTO `vbos_bank` VALUES ('390', '东莞市商业银行', '4256020', '万顺通卡', '1', '16', '622333');
INSERT INTO `vbos_bank` VALUES ('391', '南宁市商业银行', '4786110', '桂花卡', '1', '16', '622335');
INSERT INTO `vbos_bank` VALUES ('392', '包头市商业银行', '4791920', '雄鹰卡', '1', '17', '622336');
INSERT INTO `vbos_bank` VALUES ('393', '连云港市商业银行', '4803070', '金猴神通借记卡', '1', '16', '622337');
INSERT INTO `vbos_bank` VALUES ('394', '焦作市商业银行', '4115010', '月季借记卡', '1', '19', '622338');
INSERT INTO `vbos_bank` VALUES ('395', '鄞州农村合作银行', '14203320', '蜜蜂借记卡', '1', '16', '622339');
INSERT INTO `vbos_bank` VALUES ('396', '徽商银行淮北分行', '4403660', '黄山卡', '1', '17', '622340');
INSERT INTO `vbos_bank` VALUES ('397', '江阴农村商业银行', '14123022', '合作借记卡', '1', '16', '622341');
INSERT INTO `vbos_bank` VALUES ('398', '攀枝花市商业银行', '4836560', '攀枝花卡', '1', '19', '622342');
INSERT INTO `vbos_bank` VALUES ('399', '佛山市三水区农村信用合作社', '14215881', '信通卡', '1', '19', '622343');
INSERT INTO `vbos_bank` VALUES ('400', '成都农信社', '14226510', '天府借记卡', '1', '19', '622345');
INSERT INTO `vbos_bank` VALUES ('401', '中国银行', '999077', '人民币信用卡金卡', '3', '16', '622346');
INSERT INTO `vbos_bank` VALUES ('402', '中国银行', '999077', '人民币信用卡普通卡', '3', '16', '622347');
INSERT INTO `vbos_bank` VALUES ('403', '中国银行', '999077', '中银卡', '1', '16', '622348');
INSERT INTO `vbos_bank` VALUES ('404', '南洋商业银行', '47980344', '人民币信用卡金卡', '3', '16', '622349');
INSERT INTO `vbos_bank` VALUES ('405', '南洋商业银行', '47980344', '人民币信用卡普通卡', '3', '16', '622350');
INSERT INTO `vbos_bank` VALUES ('406', '南洋商业银行', '47980344', '中银卡', '1', '16', '622351');
INSERT INTO `vbos_bank` VALUES ('407', '集友银行', '47980344', '人民币信用卡金卡', '3', '16', '622352');
INSERT INTO `vbos_bank` VALUES ('408', '集友银行', '47980344', '人民币信用卡普通卡', '3', '16', '622353');
INSERT INTO `vbos_bank` VALUES ('409', '集友银行', '47980344', '中银卡', '1', '16', '622355');
INSERT INTO `vbos_bank` VALUES ('410', '沧州农信社', '14231430', '信通卡', '1', '19', '622358');
INSERT INTO `vbos_bank` VALUES ('411', '临沂市商业银行', '3134730', '沂蒙卡', '1', '19', '622359');
INSERT INTO `vbos_bank` VALUES ('412', '香港上海汇丰银行有限公司', '25120344', '人民币卡', '3', '16', '622360');
INSERT INTO `vbos_bank` VALUES ('413', '香港上海汇丰银行有限公司', '25120344', '人民币金卡', '3', '16', '622361');
INSERT INTO `vbos_bank` VALUES ('414', '中山市农村信用合作社', '14326030', '信通卡', '1', '19', '622362');
INSERT INTO `vbos_bank` VALUES ('415', '珠海市商业银行', '4375850', '万事顺卡', '1', '19', '622363');
INSERT INTO `vbos_bank` VALUES ('416', '东亚银行有限公司', '25020344', '电子网络人民币卡', '1', '17', '622365');
INSERT INTO `vbos_bank` VALUES ('417', '徽商银行安庆分行', '4403680', '黄山卡', '1', '17', '622366');
INSERT INTO `vbos_bank` VALUES ('418', '绵阳市商业银行', '4856590', '科技城卡', '1', '19', '622367');
INSERT INTO `vbos_bank` VALUES ('419', '长沙市商业银行', '4615510', '芙蓉卡', '1', '19', '622368');
INSERT INTO `vbos_bank` VALUES ('420', '昆明市农村信用联社', '14097310', '金碧一卡通', '1', '16', '622369');
INSERT INTO `vbos_bank` VALUES ('421', '泉州市商业银行', '4643970', '海峡银联卡', '1', '19', '622370');
INSERT INTO `vbos_bank` VALUES ('422', '花旗银行有限公司', '25030344', '花旗人民币信用卡', '3', '16', '622371');
INSERT INTO `vbos_bank` VALUES ('423', '大新银行有限公司', '25040344', '大新人民币信用卡普通卡', '3', '16', '622373');
INSERT INTO `vbos_bank` VALUES ('424', '大新银行有限公司', '25040344', '人民币借记卡', '1', '17', '622375');
INSERT INTO `vbos_bank` VALUES ('425', '恒生银行有限公司', '25050344', '恒生人民币信用卡', '3', '16', '622376');
INSERT INTO `vbos_bank` VALUES ('426', '恒生银行有限公司', '25050344', '恒生人民币金卡', '3', '16', '622377');
INSERT INTO `vbos_bank` VALUES ('427', '恒生银行有限公司', '25050344', '恒生人民币白金卡', '3', '16', '622378');
INSERT INTO `vbos_bank` VALUES ('428', '济南市商业银行', '3134510', '齐鲁卡', '1', '19', '622379');
INSERT INTO `vbos_bank` VALUES ('429', '美国银行', '10000000', '人民币卡', '1', '16', '622382');
INSERT INTO `vbos_bank` VALUES ('430', '大连市商业银行', '4202221', '大连市商业银行贷记卡', '2', '16', '622383');
INSERT INTO `vbos_bank` VALUES ('431', '恒丰银行', '3114560', '九州借记卡', '1', '17', '622384');
INSERT INTO `vbos_bank` VALUES ('432', '大连市商业银行', '4202221', '大连市商业银行贷记卡', '2', '16', '622385');
INSERT INTO `vbos_bank` VALUES ('433', '上海商业银行', '25090344', '人民币信用卡', '3', '16', '622386');
INSERT INTO `vbos_bank` VALUES ('434', '永隆银行有限公司', '25100344', '永隆人民币信用卡', '3', '16', '622387');
INSERT INTO `vbos_bank` VALUES ('435', '福州市商业银行', '4053910', '榕城卡', '1', '16', '622388');
INSERT INTO `vbos_bank` VALUES ('436', '宁波鄞州农村合作银行', '14203323', '蜜蜂贷记卡', '2', '16', '622389');
INSERT INTO `vbos_bank` VALUES ('437', '潍坊商业银行', '3134580', '鸢都卡', '1', '16', '622391');
INSERT INTO `vbos_bank` VALUES ('438', '泸州市商业银行', '4866570', '酒城卡', '1', '19', '622392');
INSERT INTO `vbos_bank` VALUES ('439', '厦门市商业银行', '3133930', '银鹭借记卡', '1', '16', '622393');
INSERT INTO `vbos_bank` VALUES ('440', '镇江市商业银行', '4073140', '金山灵通卡', '1', '16', '622394');
INSERT INTO `vbos_bank` VALUES ('441', '大同市商业银行', '4871620', '云冈卡', '5', '19', '622395');
INSERT INTO `vbos_bank` VALUES ('442', '宜昌市商业银行', '4325260', '三峡卡', '1', '17', '622396');
INSERT INTO `vbos_bank` VALUES ('443', '宜昌市商业银行', '4325261', '信用卡', '3', '16', '622397');
INSERT INTO `vbos_bank` VALUES ('444', '辽阳市商业银行', '4192310', '新兴卡', '1', '17', '622399');
INSERT INTO `vbos_bank` VALUES ('445', '营口市商业银行', '4652280', '辽河一卡通', '1', '17', '622400');
INSERT INTO `vbos_bank` VALUES ('446', '香港上海汇丰银行有限公司', '25130344', 'ATM Card', '1', '17', '622406');
INSERT INTO `vbos_bank` VALUES ('447', '香港上海汇丰银行有限公司', '25130344', 'ATM Card', '1', '19', '622407');
INSERT INTO `vbos_bank` VALUES ('448', '威海市商业银行', '4814650', '通达卡', '1', '16', '622411');
INSERT INTO `vbos_bank` VALUES ('449', '湖北农信社', '14105200', '信通卡', '1', '16', '622412');
INSERT INTO `vbos_bank` VALUES ('450', '鞍山市商业银行', '4562230', '千山卡', '1', '16', '622413');
INSERT INTO `vbos_bank` VALUES ('451', '丹东商行', '4462260', '银杏卡', '1', '16', '622415');
INSERT INTO `vbos_bank` VALUES ('452', '南通市商业银行', '4523060', '金桥卡', '1', '16', '622418');
INSERT INTO `vbos_bank` VALUES ('453', '洛阳市商业银行', '4184930', '都市一卡通', '1', '17', '622420');
INSERT INTO `vbos_bank` VALUES ('454', '郑州商业银行', '4354910', '世纪一卡通', '1', '19', '622421');
INSERT INTO `vbos_bank` VALUES ('455', '扬州市商业银行', '4533120', '绿扬卡', '1', '16', '622422');
INSERT INTO `vbos_bank` VALUES ('456', '永隆银行有限公司', '25100344', '永隆人民币信用卡', '3', '16', '622423');
INSERT INTO `vbos_bank` VALUES ('457', '哈尔滨市商业银行', '4422610', '丁香借记卡', '1', '17', '622425');
INSERT INTO `vbos_bank` VALUES ('458', '天津市商业银行', '4341100', '津卡贷记卡', '2', '16', '622426');
INSERT INTO `vbos_bank` VALUES ('459', '台州市商业银行', '4593451', '大唐卡', '1', '16', '622427');
INSERT INTO `vbos_bank` VALUES ('460', '银川市商业银行', '4368710', '如意卡', '2', '16', '622428');
INSERT INTO `vbos_bank` VALUES ('461', '银川市商业银行', '4368710', '如意借记卡', '1', '19', '622429');
INSERT INTO `vbos_bank` VALUES ('462', '大西洋银行股份有限公司', '26230446', '澳门币卡', '1', '19', '622432');
INSERT INTO `vbos_bank` VALUES ('463', '澳门国际银行', '26220446', '人民币卡', '1', '19', '622434');
INSERT INTO `vbos_bank` VALUES ('464', '澳门国际银行', '26220446', '港币卡', '1', '19', '622435');
INSERT INTO `vbos_bank` VALUES ('465', '澳门国际银行', '26220446', '澳门币卡', '1', '19', '622436');
INSERT INTO `vbos_bank` VALUES ('466', '广州农村信用合作社联合社', '14055810', '麒麟储蓄卡', '1', '18', '622439');
INSERT INTO `vbos_bank` VALUES ('467', '吉林市商业银行', '4512420', '雾凇卡', '1', '16', '622440');
INSERT INTO `vbos_bank` VALUES ('468', '三门峡市城市信用社', '4885050', '天鹅卡', '1', '16', '622441');
INSERT INTO `vbos_bank` VALUES ('469', '抚顺市商业银行', '4302240', '绿叶卡', '1', '17', '622442');
INSERT INTO `vbos_bank` VALUES ('470', '昆山农村信用合作社联合社', '14023052', '江通卡', '1', '19', '622443');
INSERT INTO `vbos_bank` VALUES ('471', '常州商业银行', '4683040', '月季卡', '1', '16', '622447');
INSERT INTO `vbos_bank` VALUES ('472', '湛江市商业银行', '4895910', '南珠卡', '1', '16', '622448');
INSERT INTO `vbos_bank` VALUES ('473', '金华市商业银行', '4263380', '双龙借记卡', '1', '16', '622449');
INSERT INTO `vbos_bank` VALUES ('474', '金华市商业银行', '4263380', '双龙贷记卡', '2', '16', '622450');
INSERT INTO `vbos_bank` VALUES ('475', '大新银行有限公司', '25040344', '大新人民币信用卡金卡', '3', '16', '622451');
INSERT INTO `vbos_bank` VALUES ('476', '江苏农信社', '14243000', '圆鼎卡', '1', '19', '622452');
INSERT INTO `vbos_bank` VALUES ('477', '中信嘉华银行有限公司', '25160344', '人民币信用卡金卡', '3', '16', '622453');
INSERT INTO `vbos_bank` VALUES ('478', '中信嘉华银行有限公司', '25160344', '人民币信用卡普通卡', '3', '16', '622456');
INSERT INTO `vbos_bank` VALUES ('479', '中信嘉华银行有限公司', '25160344', '人民币借记卡', '1', '17', '622459');
INSERT INTO `vbos_bank` VALUES ('480', '常熟市农村商业银行', '14030001', '粒金贷记卡', '2', '16', '622462');
INSERT INTO `vbos_bank` VALUES ('481', '廖创兴银行有限公司', '25170344', '港币借记卡', '1', '19', '622463');
INSERT INTO `vbos_bank` VALUES ('482', '沈阳市商业银行', '4172211', '玫瑰卡', '2', '16', '622466');
INSERT INTO `vbos_bank` VALUES ('483', '广州市商业银行', '4135810', '羊城借记卡', '1', '19', '622467');
INSERT INTO `vbos_bank` VALUES ('484', '上海银行', '4012900', '申卡', '1', '18', '622468');
INSERT INTO `vbos_bank` VALUES ('485', '江门市新会农信社', '14255890', '信通卡', '1', '19', '622470');
INSERT INTO `vbos_bank` VALUES ('486', '东亚银行有限公司', '25020344', '人民币信用卡', '3', '16', '622471');
INSERT INTO `vbos_bank` VALUES ('487', '东亚银行有限公司', '25020344', '人民币信用卡金卡', '3', '16', '622472');
INSERT INTO `vbos_bank` VALUES ('488', '乌鲁木齐市商业银行', '4270001', '雪莲贷记卡', '2', '16', '622476');
INSERT INTO `vbos_bank` VALUES ('489', '高要市农村信用联社', '14265930', '信通卡', '1', '19', '622477');
INSERT INTO `vbos_bank` VALUES ('490', '上海市农村信用合作社联合社', '4022900', '如意卡', '1', '16', '622478');
INSERT INTO `vbos_bank` VALUES ('491', '江阴市农村商业银行', '14123020', '合作贷记卡', '2', '16', '622481');
INSERT INTO `vbos_bank` VALUES ('492', '无锡市商业银行', '4453020', '太湖金保卡', '1', '18', '622485');
INSERT INTO `vbos_bank` VALUES ('493', '绍兴市商业银行', '4283370', '兰花卡', '1', '16', '622486');
INSERT INTO `vbos_bank` VALUES ('494', '星展银行', '999077', '银联人民币银行卡', '1', '17', '622487');
INSERT INTO `vbos_bank` VALUES ('495', '星展银行', '999077', '银联人民币银行卡', '1', '16', '622487');
INSERT INTO `vbos_bank` VALUES ('496', '吴江农村商业银行', '14283050', '垂虹卡', '1', '16', '622488');
INSERT INTO `vbos_bank` VALUES ('497', '大新银行有限公司', '25040344', '借记卡', '1', '17', '622489');
INSERT INTO `vbos_bank` VALUES ('498', '星展银行', '999077', '银联人民币银行卡', '1', '17', '622490');
INSERT INTO `vbos_bank` VALUES ('499', '星展银行', '999077', '银联人民币银行卡', '1', '16', '622490');
INSERT INTO `vbos_bank` VALUES ('500', '星展银行', '999077', '银联港币银行卡', '1', '17', '622491');
INSERT INTO `vbos_bank` VALUES ('501', '星展银行', '999077', '银联银行卡', '1', '16', '622491');
INSERT INTO `vbos_bank` VALUES ('502', '星展银行', '999077', '银联港币银行卡', '1', '17', '622492');
INSERT INTO `vbos_bank` VALUES ('503', '星展银行', '999077', '银联银行卡', '1', '16', '622492');
INSERT INTO `vbos_bank` VALUES ('504', 'AEON信贷财务', '10000000', 'AEON JUSCO银联卡', '5', '16', '622493');
INSERT INTO `vbos_bank` VALUES ('505', 'Travelex', '26040344', 'Travelex港币卡', '1', '16', '622495');
INSERT INTO `vbos_bank` VALUES ('506', 'Travelex', '26040344', 'Travelex美元卡', '1', '16', '622496');
INSERT INTO `vbos_bank` VALUES ('507', '石家庄市商业银行', '4221210', '如意借记卡', '1', '19', '622498');
INSERT INTO `vbos_bank` VALUES ('508', '石家庄市商业银行', '4221210', '如意借记卡', '1', '19', '622499');
INSERT INTO `vbos_bank` VALUES ('509', '上海浦东发展银行', '3100000', '东方卡', '3', '16', '622500');
INSERT INTO `vbos_bank` VALUES ('510', '陕西省农村信用社联合社', '14427900', '陕西信合富泰卡', '1', '19', '622506');
INSERT INTO `vbos_bank` VALUES ('511', '高要市农村信用合作社联合社', '14265930', '信通白金卡', '1', '19', '622509');
INSERT INTO `vbos_bank` VALUES ('512', '高要市农村信用合作社联合社', '14265930', '信通金卡', '1', '19', '622510');
INSERT INTO `vbos_bank` VALUES ('513', '上海浦东发展银行', '3100000', '东方-轻松理财卡白金卡', '2', '16', '622516');
INSERT INTO `vbos_bank` VALUES ('514', '上海浦东发展银行', '3100000', '东方-轻松理财卡普卡', '2', '16', '622517');
INSERT INTO `vbos_bank` VALUES ('515', '上海浦东发展银行', '3100000', '东方-轻松理财卡钻石卡', '2', '16', '622518');
INSERT INTO `vbos_bank` VALUES ('516', '上海浦东发展银行', '3100000', '东方-新标准准贷记卡', '4', '16', '622519');
INSERT INTO `vbos_bank` VALUES ('517', '上海浦东发展银行', '3100000', '东方卡', '1', '16', '622521');
INSERT INTO `vbos_bank` VALUES ('518', '上海浦东发展银行', '3100000', '东方卡', '1', '16', '622522');
INSERT INTO `vbos_bank` VALUES ('519', '上海浦东发展银行', '3100000', '东方卡', '2', '16', '622523');
INSERT INTO `vbos_bank` VALUES ('520', '深圳发展银行', '3070000', '人民币信用卡金卡', '2', '16', '622525');
INSERT INTO `vbos_bank` VALUES ('521', '深圳发展银行', '3070000', '人民币信用卡普卡', '2', '16', '622526');
INSERT INTO `vbos_bank` VALUES ('522', '深圳发展银行', '3070010', '发展卡', '1', '16', '622538');
INSERT INTO `vbos_bank` VALUES ('523', '大丰银行有限公司', '25250446', '人民币借记卡', '1', '19', '622546');
INSERT INTO `vbos_bank` VALUES ('524', '大丰银行有限公司', '25250446', '港币借记卡', '1', '19', '622547');
INSERT INTO `vbos_bank` VALUES ('525', '大丰银行有限公司', '25250446', '澳门币借记卡', '1', '19', '622548');
INSERT INTO `vbos_bank` VALUES ('526', '哈萨克斯坦国民储蓄银行', '26330398', 'Halykbank Classic', '1', '16', '622549');
INSERT INTO `vbos_bank` VALUES ('527', '哈萨克斯坦国民储蓄银行', '26330398', 'Halykbank Golden', '1', '16', '622550');
INSERT INTO `vbos_bank` VALUES ('528', '德阳市商业银行', '4986580', '锦程卡定活一卡通白金卡', '1', '19', '622561');
INSERT INTO `vbos_bank` VALUES ('529', '德阳市商业银行', '4986580', '锦程卡定活一卡通金卡', '1', '19', '622562');
INSERT INTO `vbos_bank` VALUES ('530', '德阳市商业银行', '4986580', '锦程卡定活一卡通', '1', '19', '622563');
INSERT INTO `vbos_bank` VALUES ('531', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622575');
INSERT INTO `vbos_bank` VALUES ('532', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622576');
INSERT INTO `vbos_bank` VALUES ('533', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622577');
INSERT INTO `vbos_bank` VALUES ('534', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622578');
INSERT INTO `vbos_bank` VALUES ('535', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622579');
INSERT INTO `vbos_bank` VALUES ('536', '招商银行银行', '3080000', '一卡通', '1', '16', '622580');
INSERT INTO `vbos_bank` VALUES ('537', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622581');
INSERT INTO `vbos_bank` VALUES ('538', '招商银行银行', '3080000', '招商银行银行信用卡', '2', '16', '622582');
INSERT INTO `vbos_bank` VALUES ('539', '招商银行银行', '3080000', '一卡通', '1', '16', '622588');
INSERT INTO `vbos_bank` VALUES ('540', '招商银行银行', '3080000', '公司卡', '1', '16', '622598');
INSERT INTO `vbos_bank` VALUES ('541', '民生银行', '3050001', '民生信用卡', '2', '16', '622600');
INSERT INTO `vbos_bank` VALUES ('542', '民生银行', '3050001', '民生信用卡', '2', '16', '622601');
INSERT INTO `vbos_bank` VALUES ('543', '中国民生银行', '3050001', '民生银联白金信用卡', '2', '16', '622602');
INSERT INTO `vbos_bank` VALUES ('544', '中国民生银行', '3050001', '民生银联商务信用卡', '2', '16', '622603');
INSERT INTO `vbos_bank` VALUES ('545', '民生银行', '3050000', '民生借记卡', '1', '16', '622615');
INSERT INTO `vbos_bank` VALUES ('546', '中国民生银行', '3050000', '民生借记卡', '1', '16', '622617');
INSERT INTO `vbos_bank` VALUES ('547', '中国民生银行', '3050000', '民生借记卡', '1', '16', '622619');
INSERT INTO `vbos_bank` VALUES ('548', '中国民生银行', '3050000', '民生借记卡', '1', '16', '622622');
INSERT INTO `vbos_bank` VALUES ('549', '华夏银行', '3040000', '华夏卡', '1', '16', '622630');
INSERT INTO `vbos_bank` VALUES ('550', '华夏银行', '3040000', '华夏至尊金卡', '1', '16', '622631');
INSERT INTO `vbos_bank` VALUES ('551', '华夏银行', '3040000', '华夏丽人卡', '1', '16', '622632');
INSERT INTO `vbos_bank` VALUES ('552', '华夏银行', '3040000', '华夏万通卡', '1', '16', '622633');
INSERT INTO `vbos_bank` VALUES ('553', '中国光大银行', '3030000', '炎黄卡普卡', '2', '16', '622650');
INSERT INTO `vbos_bank` VALUES ('554', '中国光大银行', '3030000', '炎黄卡白金卡', '2', '16', '622655');
INSERT INTO `vbos_bank` VALUES ('555', '中国光大银行', '3030000', '炎黄卡金卡', '2', '16', '622658');
INSERT INTO `vbos_bank` VALUES ('556', '光大银行', '3030000', '阳光卡', '1', '16', '622660');
INSERT INTO `vbos_bank` VALUES ('557', '中信实业银行信用卡中心', '3020000', '中信银联标准贷记卡', '2', '16', '622678');
INSERT INTO `vbos_bank` VALUES ('558', '中信实业银行信用卡中心', '3020000', '中信银联标准贷记卡', '2', '16', '622679');
INSERT INTO `vbos_bank` VALUES ('559', '中信实业银行信用卡中心', '3020000', '中信银联标准贷记卡', '2', '16', '622680');
INSERT INTO `vbos_bank` VALUES ('560', '江西省农村信用社联合社', '14394200', '百福卡', '1', '19', '622681');
INSERT INTO `vbos_bank` VALUES ('561', '江西省农村信用社联合社', '14394200', '百福卡', '1', '19', '622682');
INSERT INTO `vbos_bank` VALUES ('562', '渤海银行', '3170000', '渤海银行公司借记卡', '1', '16', '622684');
INSERT INTO `vbos_bank` VALUES ('563', '中信实业银行信用卡中心', '3020000', '中信银联标准贷记卡', '2', '16', '622688');
INSERT INTO `vbos_bank` VALUES ('564', '中信实业银行信用卡中心', '3020000', '中信银联标准贷记卡', '2', '16', '622689');
INSERT INTO `vbos_bank` VALUES ('565', '中信实业银行', '3020000', '中信借记卡', '1', '16', '622690');
INSERT INTO `vbos_bank` VALUES ('566', '中信实业银行', '3020000', '中信借记卡', '1', '16', '622691');
INSERT INTO `vbos_bank` VALUES ('567', '中信实业银行', '3020000', '中信贵宾卡', '1', '16', '622692');
INSERT INTO `vbos_bank` VALUES ('568', '中信银行', '3020000', '中信理财宝金卡', '1', '16', '622696');
INSERT INTO `vbos_bank` VALUES ('569', '中信银行', '3020000', '中信理财宝白金卡', '1', '16', '622698');
INSERT INTO `vbos_bank` VALUES ('570', '建设银行', '1050000', '龙卡储蓄卡', '1', '19', '622700');
INSERT INTO `vbos_bank` VALUES ('571', '中国建设银行', '1050000', '龙卡准贷记卡', '4', '16', '622725');
INSERT INTO `vbos_bank` VALUES ('572', '中国建设银行', '1050000', '龙卡准贷记卡金卡', '4', '16', '622728');
INSERT INTO `vbos_bank` VALUES ('573', '中国银行澳门分行', '1040446', '人民币信用卡', '3', '16', '622750');
INSERT INTO `vbos_bank` VALUES ('574', '中国银行澳门分行', '1040446', '人民币信用卡', '3', '16', '622751');
INSERT INTO `vbos_bank` VALUES ('575', '中国银行', '1040000', '长城人民币信用卡-个人普卡', '4', '16', '622752');
INSERT INTO `vbos_bank` VALUES ('576', '中国银行', '1040000', '长城人民币信用卡-个人金卡', '4', '16', '622753');
INSERT INTO `vbos_bank` VALUES ('577', '中国银行', '1040000', '长城人民币信用卡-专用卡普卡', '4', '16', '622754');
INSERT INTO `vbos_bank` VALUES ('578', '中国银行', '1040000', '长城人民币信用卡-员工金卡', '4', '16', '622755');
INSERT INTO `vbos_bank` VALUES ('579', '中国银行', '1040000', '长城人民币信用卡-员工金卡', '4', '16', '622756');
INSERT INTO `vbos_bank` VALUES ('580', '中国银行', '1040000', '长城人民币信用卡-员工金卡', '4', '16', '622757');
INSERT INTO `vbos_bank` VALUES ('581', '中国银行', '1040000', '长城人民币信用卡-单位普卡', '4', '16', '622758');
INSERT INTO `vbos_bank` VALUES ('582', '中国银行', '1040000', '长城人民币信用卡-单位金卡', '4', '16', '622759');
INSERT INTO `vbos_bank` VALUES ('583', '中国银行', '1040000', '银联单币贷记卡', '2', '16', '622760');
INSERT INTO `vbos_bank` VALUES ('584', '中国银行', '1040000', '长城信用卡', '4', '16', '622761');
INSERT INTO `vbos_bank` VALUES ('585', '中国银行', '1040000', '长城信用卡', '4', '16', '622762');
INSERT INTO `vbos_bank` VALUES ('586', '中国银行', '1040000', '长城信用卡', '4', '16', '622763');
INSERT INTO `vbos_bank` VALUES ('587', '中国银行澳门分行', '1040446', '中银卡', '1', '19', '622770');
INSERT INTO `vbos_bank` VALUES ('588', '曲靖市商业银行', '5027360', '珠江源卡', '1', '16', '622777');
INSERT INTO `vbos_bank` VALUES ('589', '农业银行', '1030000', '金穗校园卡', '1', '19', '622821');
INSERT INTO `vbos_bank` VALUES ('590', '农业银行', '1030000', '金穗星座卡', '1', '19', '622822');
INSERT INTO `vbos_bank` VALUES ('591', '农业银行', '1030000', '金穗社保卡', '1', '19', '622823');
INSERT INTO `vbos_bank` VALUES ('592', '农业银行', '1030000', '金穗旅游卡', '1', '19', '622824');
INSERT INTO `vbos_bank` VALUES ('593', '农业银行', '1030000', '金穗青年卡', '1', '19', '622825');
INSERT INTO `vbos_bank` VALUES ('594', '农业银行', '1030000', '复合介质金穗通宝卡', '1', '19', '622826');
INSERT INTO `vbos_bank` VALUES ('595', '农业银行', '1030000', '金穗贷记卡', '2', '16', '622836');
INSERT INTO `vbos_bank` VALUES ('596', '农业银行', '1030000', '金穗贷记卡', '2', '16', '622837');
INSERT INTO `vbos_bank` VALUES ('597', '农业银行', '1030000', '金穗通宝卡', '1', '19', '622840');
INSERT INTO `vbos_bank` VALUES ('598', '农业银行', '1030000', '金穗通宝卡', '1', '19', '622844');
INSERT INTO `vbos_bank` VALUES ('599', '农业银行', '1030000', '金穗通宝卡', '1', '19', '622845');
INSERT INTO `vbos_bank` VALUES ('600', '中国农业银行', '1030000', '金穗通宝卡', '1', '19', '622846');
INSERT INTO `vbos_bank` VALUES ('601', '农业银行', '1030000', '金穗通宝卡', '1', '19', '622847');
INSERT INTO `vbos_bank` VALUES ('602', '农业银行', '1030000', '金穗通宝卡', '1', '19', '622848');
INSERT INTO `vbos_bank` VALUES ('603', '江苏东吴农村商业银行', '14303050', '新苏卡', '1', '19', '622855');
INSERT INTO `vbos_bank` VALUES ('604', '桂林市商业银行', '4916170', '漓江卡', '1', '17', '622856');
INSERT INTO `vbos_bank` VALUES ('605', '日照市商业银行', '3134732', '黄海卡', '1', '19', '622857');
INSERT INTO `vbos_bank` VALUES ('606', '浙江省农村信用社联合社', '14293300', '丰收卡', '1', '19', '622858');
INSERT INTO `vbos_bank` VALUES ('607', '珠海农村信用合作社联社', '14315850', '信通卡', '1', '19', '622859');
INSERT INTO `vbos_bank` VALUES ('608', '大庆市商业银行', '4922690', '玉兔卡', '1', '16', '622860');
INSERT INTO `vbos_bank` VALUES ('609', '澳门永亨银行股份有限公司', '26080446', '人民币卡', '1', '16', '622861');
INSERT INTO `vbos_bank` VALUES ('610', '莱芜市商业银行', '4974634', '金凤卡', '1', '16', '622864');
INSERT INTO `vbos_bank` VALUES ('611', '长春市商业银行', '4062410', '君子兰一卡通', '1', '19', '622865');
INSERT INTO `vbos_bank` VALUES ('612', '徐州市商业银行', '4943030', '彭城借记卡', '1', '16', '622866');
INSERT INTO `vbos_bank` VALUES ('613', '重庆市农村信用社联合社', '14136530', '信合平安卡', '1', '16', '622867');
INSERT INTO `vbos_bank` VALUES ('614', '太仓农村商业银行', '14333051', '郑和卡', '1', '19', '622869');
INSERT INTO `vbos_bank` VALUES ('615', '靖江市长江城市信用社', '4933120', '长江卡', '1', '16', '622870');
INSERT INTO `vbos_bank` VALUES ('616', '永亨银行', '25060344', '永亨尊贵理财卡', '1', '16', '622871');
INSERT INTO `vbos_bank` VALUES ('617', '徽商银行', '4403600', '黄山卡', '1', '19', '622877');
INSERT INTO `vbos_bank` VALUES ('618', '杭州市商业银行', '4233310', '西湖卡', '1', '18', '622878');
INSERT INTO `vbos_bank` VALUES ('619', '徽商银行', '4403600', '黄山卡', '1', '19', '622879');
INSERT INTO `vbos_bank` VALUES ('620', '柳州市商业银行', '4956140', '龙城卡', '1', '16', '622880');
INSERT INTO `vbos_bank` VALUES ('621', '柳州市商业银行', '4956140', '龙城卡', '1', '16', '622881');
INSERT INTO `vbos_bank` VALUES ('622', '尧都区农村信用合作社联社', '14341770', '天河卡', '1', '19', '622882');
INSERT INTO `vbos_bank` VALUES ('623', '渤海银行', '3170000', '渤海银行借记卡', '1', '16', '622884');
INSERT INTO `vbos_bank` VALUES ('624', '重庆市农村信用社联合社', '14136530', '信合希望卡', '1', '16', '622885');
INSERT INTO `vbos_bank` VALUES ('625', '烟台市商业银行', '3134560', '金通卡', '1', '16', '622886');
INSERT INTO `vbos_bank` VALUES ('626', '武进农村商业银行', '14353041', '阳湖卡', '1', '19', '622891');
INSERT INTO `vbos_bank` VALUES ('627', '上海银行', '4012900', '申卡借记卡', '1', '18', '622892');
INSERT INTO `vbos_bank` VALUES ('628', '贵州省农村信用社联合社', '14367000', '信合卡', '1', '19', '622893');
INSERT INTO `vbos_bank` VALUES ('629', '江苏锡州农村商业银行', '14373020', '金阿福', '1', '16', '622895');
INSERT INTO `vbos_bank` VALUES ('630', '中外合资.南充市商业银行', '4966730', '熊猫团团卡', '1', '19', '622897');
INSERT INTO `vbos_bank` VALUES ('631', '长沙市商业银行', '4615511', '芙蓉贷记卡', '2', '16', '622898');
INSERT INTO `vbos_bank` VALUES ('632', '长沙市商业银行', '4615511', '芙蓉贷记卡', '2', '16', '622900');
INSERT INTO `vbos_bank` VALUES ('633', '兴业银行', '3090010', '银联信用卡', '2', '16', '622901');
INSERT INTO `vbos_bank` VALUES ('634', '兴业银行', '3090000', '兴业自然人生理财卡', '1', '18', '622908');
INSERT INTO `vbos_bank` VALUES ('635', '兴业银行', '3090002', '万能卡', '1', '16', '622909');
INSERT INTO `vbos_bank` VALUES ('636', 'Discover Financial Services，Inc', '26290840', '发现卡', '2', '16', '650600');
INSERT INTO `vbos_bank` VALUES ('637', 'Discover Financial Services，Inc', '26290840', '发现卡', '2', '16', '650700');
INSERT INTO `vbos_bank` VALUES ('638', 'Discover Financial Services，Inc', '26290840', '发现卡', '2', '16', '650800');
INSERT INTO `vbos_bank` VALUES ('639', 'Discover Financial Services，Inc', '26290840', '发现卡', '2', '16', '650900');
INSERT INTO `vbos_bank` VALUES ('640', '上海银行', '4012900', '上海明珠卡', '1', '18', '682900');
INSERT INTO `vbos_bank` VALUES ('641', '泉州市商业银行', '4643970', '海峡储蓄卡', '1', '18', '683970');
INSERT INTO `vbos_bank` VALUES ('642', '广东发展银行', '3060000', '广发VISA信用卡', '3', '16', '685800');
INSERT INTO `vbos_bank` VALUES ('643', '广东发展银行', '3060000', '广发理财通', '1', '18', '685800');
INSERT INTO `vbos_bank` VALUES ('644', '广东发展银行', '3060000', '广发信用卡', '3', '16', '685800');
INSERT INTO `vbos_bank` VALUES ('645', '招商银行', '3080000', '招商银行银行一卡通', '5', '15', '690755');
INSERT INTO `vbos_bank` VALUES ('646', '招商银行', '3080000', '招商银行银行一卡通', '5', '18', '690755');
INSERT INTO `vbos_bank` VALUES ('647', '长沙市商业银行', '4615510', '芙蓉卡', '1', '18', '694301');
INSERT INTO `vbos_bank` VALUES ('648', '南通商业银行', '4523060', '金桥卡', '1', '18', '695800');
INSERT INTO `vbos_bank` VALUES ('649', '浦东发展银行', '3100000', '东方卡', '1', '16', '843010');
INSERT INTO `vbos_bank` VALUES ('650', '浦东发展银行', '3100000', '东方卡', '1', '16', '843360');
INSERT INTO `vbos_bank` VALUES ('651', '浦东发展银行', '3100000', '东方卡', '1', '16', '843420');
INSERT INTO `vbos_bank` VALUES ('652', '浦东发展银行', '3100000', '东方卡', '1', '16', '843610');
INSERT INTO `vbos_bank` VALUES ('653', '浦东发展银行', '3100000', '东方卡', '1', '16', '843730');
INSERT INTO `vbos_bank` VALUES ('654', '浦东发展银行', '3100000', '东方卡', '1', '16', '843800');
INSERT INTO `vbos_bank` VALUES ('655', '浦东发展银行', '3100000', '东方卡', '1', '16', '843850');
INSERT INTO `vbos_bank` VALUES ('656', '浦东发展银行', '3100000', '东方卡', '1', '16', '843900');
INSERT INTO `vbos_bank` VALUES ('657', '浦东发展银行', '3100000', '东方卡', '1', '16', '870000');
INSERT INTO `vbos_bank` VALUES ('658', '浦东发展银行', '3100000', '东方卡', '1', '16', '870100');
INSERT INTO `vbos_bank` VALUES ('659', '浦东发展银行', '3100000', '东方卡', '1', '16', '870300');
INSERT INTO `vbos_bank` VALUES ('660', '浦东发展银行', '3100000', '东方卡', '1', '16', '870400');
INSERT INTO `vbos_bank` VALUES ('661', '浦东发展银行', '3100000', '东方卡', '1', '16', '870500');
INSERT INTO `vbos_bank` VALUES ('662', '贵阳市商业银行', '4437010', '甲秀卡', '1', '16', '888000');
INSERT INTO `vbos_bank` VALUES ('663', '工商银行', '1020000', '牡丹银联灵通卡-个人普卡', '1', '16', '955880');
INSERT INTO `vbos_bank` VALUES ('664', '工商银行', '1020000', '牡丹银联灵通卡-个人普卡', '1', '16', '955881');
INSERT INTO `vbos_bank` VALUES ('665', '工商银行', '1020000', '牡丹银联灵通卡-个人金卡', '1', '16', '955882');
INSERT INTO `vbos_bank` VALUES ('666', '工商银行', '1020000', '牡丹银联理财金卡', '1', '16', '955888');
INSERT INTO `vbos_bank` VALUES ('667', '上海浦东发展银行', '3100000', '东方卡', '1', '16', '984301');

ALTER  table `video_bos`.`vbos_mrecharge_stat` add `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '手动：  1 ： 增加    2 ：  扣减';

ALTER  table  `video`.`video_charge_list` add `message` VARCHAR(200)  COMMENT '后台操作记录留言';

insert into video.video_room_status(uid,tid,status) select uid, 1, 1 from video_bos.vbos_host_info where dml_flag <> 3;