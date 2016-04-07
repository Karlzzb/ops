/*
Navicat MySQL Data Transfer

Source Server         : 独立资源
Source Server Version : 50518
Source Host           : rdsyzmqaizafzvn.mysql.rds.aliyuncs.com:3306
Source Database       : dlzy_test

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2015-12-22 15:01:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for artcategory
-- ----------------------------
DROP TABLE IF EXISTS `artcategory`;
CREATE TABLE `artcategory` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号[li]',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称[li][search]*',
  `parent` bigint(20) DEFAULT '0' COMMENT '所属父类[li]*',
  `isvalid` int(1) DEFAULT '1' COMMENT '是否有效[list]0:无效|:有效[li][search]',
  `fullpath` varchar(100) DEFAULT NULL COMMENT '全路径',
  `fullpathname` varchar(200) DEFAULT NULL COMMENT '全路径名称',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间[date]endtime[search]',
  `createduser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间[date]end_up_time[search]',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类';

-- ----------------------------
-- Records of artcategory
-- ----------------------------
INSERT INTO `artcategory` VALUES ('1', '帮助中心', '0', '1', '/1', '/帮助中心', '1441003377', 'admin', '1442300294', 'lr');
INSERT INTO `artcategory` VALUES ('2', '用户需知', '1', '1', '/1/2', '/帮助中心/用户需知', '1441003419', 'admin', '1442300294', 'lr');
INSERT INTO `artcategory` VALUES ('3', '新手指南', '1', '1', '/1/3', '/帮助中心/新手指南', '1441003508', 'admin', '1442300294', 'lr');
INSERT INTO `artcategory` VALUES ('4', '关于我们', '1', '1', '/1/4', '/帮助中心/关于我们', '1441003547', 'admin', '1446360022', 'test_99');
INSERT INTO `artcategory` VALUES ('5', '用户帮助', '1', '0', '/1/5', '/帮助中心/用户帮助', '1442300042', 'lr', '1442300294', 'lr');
INSERT INTO `artcategory` VALUES ('6', '常见问题', '1', '0', '/1/6', '/帮助中心/常见问题', '1442300092', 'lr', '1442300309', 'lr');
INSERT INTO `artcategory` VALUES ('12', '用户进阶', '0', '0', '/12', '/用户进阶', '1444371767', 'admin', '1444371767', 'admin');
INSERT INTO `artcategory` VALUES ('13', 'test', '1', '0', '/1/13', '/帮助中心/test', '1444483905', 'admin', '1445250323', 'admin');
INSERT INTO `artcategory` VALUES ('14', '测试分类2', '1', '0', '/1/14', '/帮助中心/测试分类2', '1444483979', 'admin', '1445249855', 'admin');
INSERT INTO `artcategory` VALUES ('15', 'test2', '1', '0', '/1/15', '/帮助中心/test2', '1446359229', 'test_99', '1446359230', 'test_99');
INSERT INTO `artcategory` VALUES ('16', '分类Dd2！@#!@#222', '13', '0', '/1/13/16', '/帮助中心/test/分类Dd2！@#!@#222', '1446359263', 'test_99', '1446359524', 'test_99');
INSERT INTO `artcategory` VALUES ('17', '2233', '16', '0', '/1/13/16/17', '/帮助中心/test/分类Dd2！@#!@#222/2233', '1446359372', 'test_99', '1446359525', 'test_99');
INSERT INTO `artcategory` VALUES ('18', '测试234', '1', '1', '/1/18', '/帮助中心/测试234', '1448718144', 'admin01', '1448718145', 'admin01');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号[li]',
  `title` varchar(100) DEFAULT NULL COMMENT '标题*[li][search]',
  `code` varchar(512) NOT NULL COMMENT '编码',
  `categoryid` bigint(20) DEFAULT NULL COMMENT '所属分类*[li][search]',
  `content` text COMMENT '内容*',
  `seokeywords` varchar(200) DEFAULT NULL COMMENT 'SEO关键字',
  `fullpath` varchar(100) DEFAULT NULL COMMENT '全路径',
  `fullpathname` varchar(200) DEFAULT NULL COMMENT '全路径名称',
  `sort` int(11) DEFAULT '100' COMMENT '排序[li]',
  `isvalid` int(1) DEFAULT '1' COMMENT '是否有效[list]0:无效|1:有效[search]',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间[search][date]endtime',
  `createduser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间[search][date]end_up_time',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '协议声明', 'xieyi', '2', '<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	一、用户使用夺宝大咖的前提条件\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	1、用户拥有大咖网盘账号\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	用户使用夺宝大咖的前提是注册并拥有一个大咖网盘账号。因此，本服务协议是《大咖网盘账号服务条款》的补充条款，与《大咖网盘账号服务条款》具有同等法律效力。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	2、用户在使用夺宝大咖时须具备相应的权利能力和行为能力，能够独立承担法律责任，如果用户在18周岁以下，必须在父母或监护人的监护参与下才能使用本站。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	二、用户管理\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	1、用户ID\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	用户首次登录夺宝大咖时，夺宝大咖会为每位用户生成一个帐户ID，作为其使用夺宝大咖服务的唯一身份标识，用户需要对其帐户项下发生的所有行为负责。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	2、用户资料完善\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	用户应当在使用夺宝大咖时完善个人资料，用户资料包括但不限于个人手机号码或收货地址、帐号名称、头像、密码、注册或更新夺宝大咖账号时输入的所有信息。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	用户在完善个人资料时承诺遵守法律法规、社会主义制度、国家利益、公民合法权益、公共秩序、社会道德风尚和信息真实性等七条底线，不得在资料中出现违法和不良信息，且用户保证其在完善个人资料和使用帐号时，不得有以下情形：\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（1）违反宪法或法律法规规定的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（3）损害国家荣誉和利益的，损害公共利益的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（4）煽动民族仇恨、民族歧视，破坏民族团结的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（5）破坏国家宗教政策，宣扬邪教和封建迷信的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（6）散布谣言，扰乱社会秩序，破坏社会稳定的\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（8）侮辱或者诽谤他人，侵害他人合法权益的；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（9）含有法律、行政法规禁止的其他内容的。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	若用户提供给炬度公司的资料不准确，不真实，含有违法或不良信息的，炬度公司有权不予完善，并保留终止用户使用夺宝大咖的权利。若用户以虚假信息骗取帐号ID或帐号头像、个人简介等注册资料存在违法和不良信息的，炬度公司有权采取通知限期改正、暂停使用、注销登记等措施。对于冒用关联机构或社会名人注册帐号名称的，炬度公司有权注销该帐号，并向政府主管部门进行报告。\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	根据相关法律、法规规定以及考虑到夺宝大咖服务的重要性，用户同意：\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（1）在完善资料时提交个人有效身份信息进行实名认证；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（2）提供及时、详尽及准确的用户资料；\r\n</p>\r\n<p style=\"font-family:Arial, \'Microsoft YaHei\', STXihei, SimHei, sans-serif, Verdana;background-color:#FFFFFF;\">\r\n	（3）不断更新用户资料，符合及时、详尽准确的要求，对完善个人资料时填写的身份证件信息不能更新。\r\n</p>', '协议', '/1/2', '/帮助中心/用户需知', '100', '1', '1441003661', 'admin', '1441003661', 'admin');
INSERT INTO `article` VALUES ('2', '版权声明', 'banquan', '2', '这个是版权声明', 'banquan', '/1/2', '/帮助中心/用户需知', '100', '1', '1441003696', 'admin', '1441003696', 'admin');
INSERT INTO `article` VALUES ('3', '隐私政策', 'yinsi', '2', '<a href=\"http://dlzy.xuanit.com/index.php/site/login#\">隐私政策</a>', '隐私政策', '/1/2', '/帮助中心/用户需知', '100', '1', '1441003721', 'admin', '1441003721', 'admin');
INSERT INTO `article` VALUES ('4', '使用协议', 'shiyongxieyi', '2', '<a href=\"http://localhost/ziyuan/index.php/site/act#\">使用协议</a>', '使用协议', '/1/2', '/帮助中心/用户需知', '100', '1', '1441003746', 'admin', '1441003843', 'admin');
INSERT INTO `article` VALUES ('5', '用户帮助', 'help', '3', '用户帮助', '用户帮助', '/1/3', '/帮助中心/新手指南', '100', '1', '1441003772', 'admin', '1441003772', 'admin');
INSERT INTO `article` VALUES ('6', '充值方式', 'chongzhi', '3', '<a href=\"http://localhost/ziyuan/index.php/site/act#\">充值方式</a>', '充值方式', '/1/3', '/帮助中心/新手指南', '100', '1', '1441003796', 'admin', '1441003796', 'admin');
INSERT INTO `article` VALUES ('7', '提现帮助', 'tixian', '3', '<a href=\"http://localhost/ziyuan/index.php/site/act#\">提现帮助</a>', '提现帮助', '/1/3', '/帮助中心/新手指南', '100', '1', '1441003816', 'admin', '1441003816', 'admin');
INSERT INTO `article` VALUES ('8', '常见问题', 'wenti', '3', '常见问题', '常见问题', '/1/3', '/帮助中心/新手指南', '100', '1', '1441003880', 'admin', '1441003880', 'admin');
INSERT INTO `article` VALUES ('9', '联系我们', 'contact', '4', '联系333333333333333333333我们', '联系我们', '/1/4', '/帮助中心/关于我们', '100', '1', '1441003919', 'admin', '1446288077', 'test_99');
INSERT INTO `article` VALUES ('10', '版权争议', 'zhenyi', '4', '版权争议', '版权争议', '/1/4', '/帮助中心/关于我们', '100', '1', '1441003946', 'admin', '1446360280', 'test_99');
INSERT INTO `article` VALUES ('11', '英才招聘', 'zhaopin', '4', '<a href=\"http://dlzy.xuanit.com/index.php/member/service#\">英才招聘</a>', '英才招聘', '/1/4', '/帮助中心/关于我们', '100', '1', '1441003964', 'admin', '1446288439', 'test_99');
INSERT INTO `article` VALUES ('12', '关于我们', 'about', '4', '关于我们fsdfasdfasdfasdfasdffasdfasdfasdf11111111111111111111', '关于我们', '/1/4', '/帮助中心/关于我们', '100', '1', '1441004002', 'admin', '1446288358', 'test_99');
INSERT INTO `article` VALUES ('13', '普通用户签到升级指南', 'shengjizhinan', '12', '普通用户升级指南', '普通用户升级指南', '/1', '/帮助中心', '100', '1', '1444371812', 'admin', '1444372585', 'admin');
INSERT INTO `article` VALUES ('14', '普通用户上传作品指南', 'zhipinzhinan', '12', '<a target=\"_blank\" href=\"http://www.baidu.com\"><u>普通用户上传作品指南<img src=\"http://dlzy_upload.xuanit.com/data/cms/4798b2cec2/4798b2cec23591e4783518b550d7173a.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/07ce46dadb/07ce46dadbd625ff7de068b9c2f70378.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png\" alt=\"\" /></u></a>', '普通用户作品指南', '/1', '/帮助中心', '100', '1', '1444371840', 'admin', '1446521929', 'admin');
INSERT INTO `article` VALUES ('15', 'test', 'test', '14', 'test', 'test', '/1/14', '/帮助中心/test2', '100', '0', '1444484305', 'admin', '1445250256', 'admin');
INSERT INTO `article` VALUES ('16', 'fdafasdf', 'dsafasdf', '13', 'dasfasfsaf', 'dsafds', '/1/13', '/帮助中心/test', '100', '0', '1445250392', 'admin', '1445250392', 'admin');
INSERT INTO `article` VALUES ('17', '关于我们！@#4Aa!@#', 'about22', '4', '<div align=\"center\">\r\n	<ol>\r\n		<li>\r\n			<strong><em><u><span style=\"font-family:Tahoma;\"><span style=\"font-size:24px;color:#E53333;\"><span style=\"background-color:#99BB00;\">塔顶f</span></span></span></u></em></strong> \r\n		</li>\r\n		<ol>\r\n			<li>\r\n				<a href=\"http://www.baidu.com\">http://www.baidu.com</a><br />\r\n			</li>\r\n		</ol>\r\n		<li>\r\n			<strong><em><u>fsdfsadf\r\n			<hr />\r\n			<img src=\"http://dlzy_upload.xuanit.com/data/cms/52eb9712d5/52eb9712d5828d7e58877510d1cb6c3a.png\" alt=\"\" /></u></em></strong> \r\n		</li>\r\n		<li>\r\n			<strong><em><u>dfasdfas</u></em></strong> \r\n		</li>\r\n		<li>\r\n			<u><embed src=\"http://demo.sc.chinaz.com/Files/DownLoad/flash2/201504/flash3616.swf\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" quality=\"high\" /></u> \r\n		</li>\r\n	</ol>\r\n	<p>\r\n		<a target=\"_blank\" href=\"http://www.sina.com.cn\"><u>景区</u></a> \r\n	</p>\r\n	<p>\r\n		<strong><em><u></u></em></strong> \r\n	</p>\r\n</div>', '关于 他们', '/1/4', '/帮助中心/关于我们', '101', '0', '1446362601', 'test_99', '1446362690', 'test_99');
INSERT INTO `article` VALUES ('18', 'fasdfasd', 'fasdfasd', '4', '<embed src=\"http://rock-forve.narod.ru/mp3/Nightwish/2004_-_Nemo/04_Nemo_Orchestral_Version.mp3\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', '', '/1/4', '/帮助中心/关于我们', '98', '0', '1446362801', 'test_99', '1446362801', 'test_99');
INSERT INTO `article` VALUES ('19', '土土堵截要', '无可奈何花落去', '4', '<img src=\"http://dlzy_upload.xuanit.com/data/cms/c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg\" alt=\"\" /> \r\n<hr />', 'ddd', '/1/4', '/帮助中心/关于我们', '102', '0', '1446363063', 'test_99', '1447225968', 'admin');
INSERT INTO `article` VALUES ('20', '新标题', '', '3', '指南<img src=\"http://dlzy_upload.xuanit.com/data/cms/8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/3e289a5625/3e289a56258d7783cf67837303c0e743.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/4e7bb494ed/4e7bb494ede22983f0b3cf3c660f625a.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/db230f1915/db230f1915d8f6668f6caf4512c8e10e.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/6e62d4086d/6e62d4086d793fd6b14c4d03d842b70c.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/16cb976de0/16cb976de0bbe848a988b8b522d1fa68.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/a688d86748/a688d8674800f2caab4493413c57d9d1.jpg\" alt=\"\" />', '', '/1/3', '/帮助中心/新手指南', '2', '0', '1447084921', 'admin', '1447224009', 'admin');
INSERT INTO `article` VALUES ('21', 'fasdfas', 'fsf', '2', '<img src=\"http://dlzy_upload.xuanit.com/data/cms/7a67d50aa8/7a67d50aa82b499296fd486dac803ee7.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/5ea8e37159/5ea8e371598fddd6c1b88e44cfb09df5.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/e8ce7f5d32/e8ce7f5d324c160ded9f210be6ef5115.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/384770b5cd/384770b5cda881eb2569b267d772a222.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/f797ee2e3f/f797ee2e3fd4a85599fc468a49c3101c.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/d1d1e9a80b/d1d1e9a80ba2a4840ad249236d1988f2.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/4fc350071a/4fc350071aa4c459d75238f507248f10.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/20ac0f4674/20ac0f4674adacb3abaeb4aae450b47f.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/4798b2cec2/4798b2cec23591e4783518b550d7173a.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/361d97e87a/361d97e87a0b8868ea013e1920489bc4.gif\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/e8ce7f5d32/e8ce7f5d324c160ded9f210be6ef5115.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/384770b5cd/384770b5cda881eb2569b267d772a222.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/f797ee2e3f/f797ee2e3fd4a85599fc468a49c3101c.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/d1d1e9a80b/d1d1e9a80ba2a4840ad249236d1988f2.jpg\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/4fc350071a/4fc350071aa4c459d75238f507248f10.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/20ac0f4674/20ac0f4674adacb3abaeb4aae450b47f.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/4798b2cec2/4798b2cec23591e4783518b550d7173a.png\" alt=\"\" /><img src=\"http://dlzy_upload.xuanit.com/data/cms/361d97e87a/361d97e87a0b8868ea013e1920489bc4.gif\" alt=\"\" />', 'fasdf', '/1/2', '/帮助中心/用户需知', '100', '1', '1447582064', 'test_99', '1447582064', 'test_99');
INSERT INTO `article` VALUES ('22', '更多更多', '哈哈哈', '18', '黄飞鸿复合肥', 'fhfhfg', '/1/18', '/帮助中心/测试234', '100', '1', '1448718424', 'admin01', '1448718424', 'admin01');

-- ----------------------------
-- Table structure for checking_tmp
-- ----------------------------
DROP TABLE IF EXISTS `checking_tmp`;
CREATE TABLE `checking_tmp` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝账户',
  `transfer_order_no` varchar(100) DEFAULT NULL COMMENT '转账流水号',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '金额',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(60) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='转账对账临时表';

-- ----------------------------
-- Records of checking_tmp
-- ----------------------------
INSERT INTO `checking_tmp` VALUES ('1', '12321321', '123', '500.00', null, null);
INSERT INTO `checking_tmp` VALUES ('2', '111111', '222222', '1000.00', null, null);
INSERT INTO `checking_tmp` VALUES ('3', '33333', '88999', '6666.33', null, null);
INSERT INTO `checking_tmp` VALUES ('4', '123@qq.com', '1231321', '12345.00', null, null);
INSERT INTO `checking_tmp` VALUES ('5', '123@qq.com', '20151115001', '203.67', null, null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `objid` bigint(20) DEFAULT NULL COMMENT '对象编号',
  `objtype` int(2) DEFAULT '0' COMMENT '对象类型0 用户 1场馆',
  `userid` bigint(20) unsigned DEFAULT NULL COMMENT '用户编号',
  `content` varchar(512) DEFAULT NULL COMMENT '评论内容',
  `parentid` bigint(20) unsigned DEFAULT NULL COMMENT '父节点',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '评论时间',
  `likenum` int(11) DEFAULT '0' COMMENT '赞数量',
  PRIMARY KEY (`oid`),
  KEY `userid` (`userid`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '43', '0', '15', '还不错', '0', '1440383578', '0');
INSERT INTO `comment` VALUES ('2', '43', '0', '15', '还不错', '0', '1440383593', '0');
INSERT INTO `comment` VALUES ('3', '59', '0', '20', '还不错', '0', '1441509599', '1');
INSERT INTO `comment` VALUES ('4', '59', '0', '20', '还不错', '0', '1441509782', '1');
INSERT INTO `comment` VALUES ('5', '56', '0', '14', '错错错', '0', '1441525848', '0');
INSERT INTO `comment` VALUES ('6', '56', '0', '14', '还不错', '0', '1441531191', '0');
INSERT INTO `comment` VALUES ('7', '64', '0', '20', '还不错哦，很好！', '0', '1442387101', '0');
INSERT INTO `comment` VALUES ('8', '48', '0', '20', '你好', '0', '1442392313', '0');
INSERT INTO `comment` VALUES ('9', '46', '0', '25', '很好', '0', '1442397515', '1');
INSERT INTO `comment` VALUES ('10', '62', '0', '25', '很好很好', '0', '1442397717', '0');
INSERT INTO `comment` VALUES ('11', '62', '0', '25', '很很好好哈', '0', '1442397724', '0');
INSERT INTO `comment` VALUES ('12', '67', '0', '14', '很好的作品', '0', '1442559317', '0');
INSERT INTO `comment` VALUES ('13', '46', '0', '15', '骗子', '0', '1442990192', '2');
INSERT INTO `comment` VALUES ('14', '54', '0', '25', '你好', '0', '1443149265', '0');
INSERT INTO `comment` VALUES ('15', '97', '0', '25', '还不错', '0', '1443149288', '2');
INSERT INTO `comment` VALUES ('16', '97', '0', '17', 'hi', '0', '1443149434', '3');
INSERT INTO `comment` VALUES ('17', '46', '0', '21', '客家话卡 and 10', '0', '1444027904', '0');
INSERT INTO `comment` VALUES ('18', '46', '0', '21', 'NULL', '0', '1444027915', '0');
INSERT INTO `comment` VALUES ('19', '5', '0', '32', 'wwwww', '0', '1444278250', '1');
INSERT INTO `comment` VALUES ('20', '110', '0', '34', 'tet', '0', '1444564396', '1');
INSERT INTO `comment` VALUES ('21', '110', '0', '34', '555', '0', '1444564403', '1');
INSERT INTO `comment` VALUES ('22', '43', '0', '33', 'haibucuo', '0', '1444728270', '0');
INSERT INTO `comment` VALUES ('23', '86', '0', '33', 'hhhaha', '0', '1444728775', '0');
INSERT INTO `comment` VALUES ('24', '86', '0', '33', 'dsfgd sj sd kfsad fsadfsafds', '0', '1444728801', '0');
INSERT INTO `comment` VALUES ('25', '86', '0', '33', 'sdf sf safsa', '0', '1444728804', '0');
INSERT INTO `comment` VALUES ('26', '86', '0', '33', 'sdf saf df a', '0', '1444728809', '0');
INSERT INTO `comment` VALUES ('27', '86', '0', '33', 'sdf safd sf', '0', '1444728811', '0');
INSERT INTO `comment` VALUES ('28', '86', '0', '33', 'ad fsdf', '0', '1444728816', '0');
INSERT INTO `comment` VALUES ('29', '86', '0', '33', 'sadf asdf', '0', '1444728820', '0');
INSERT INTO `comment` VALUES ('30', '86', '0', '33', 'sdf asdf', '0', '1444728822', '0');
INSERT INTO `comment` VALUES ('31', '86', '0', '33', 'sdf sadfsdf', '0', '1444728825', '0');
INSERT INTO `comment` VALUES ('32', '86', '0', '33', 'sdf sadf sadf', '0', '1444728827', '0');
INSERT INTO `comment` VALUES ('33', '86', '0', '33', 'sdf sadf sadf', '0', '1444728831', '0');
INSERT INTO `comment` VALUES ('34', '86', '0', '33', 'sadf sadf sdfs', '0', '1444728837', '0');
INSERT INTO `comment` VALUES ('35', '43', '0', '33', '师德师风', '0', '1444729137', '0');
INSERT INTO `comment` VALUES ('36', '43', '0', '33', '水电费', '0', '1444729139', '0');
INSERT INTO `comment` VALUES ('37', '43', '0', '33', '水电费', '0', '1444729142', '0');
INSERT INTO `comment` VALUES ('38', '43', '0', '33', '收到反复', '0', '1444729144', '0');
INSERT INTO `comment` VALUES ('39', '43', '0', '33', '是否是舒服舒服', '0', '1444729148', '0');
INSERT INTO `comment` VALUES ('40', '43', '0', '33', '水电费爽肤水发', '0', '1444729150', '0');
INSERT INTO `comment` VALUES ('41', '43', '0', '33', '水电费水电费收到', '0', '1444729153', '0');
INSERT INTO `comment` VALUES ('42', '43', '0', '33', '是东方闪电水电费收到', '0', '1444729156', '0');
INSERT INTO `comment` VALUES ('43', '43', '0', '33', '水电费水电费', '0', '1444729158', '1');
INSERT INTO `comment` VALUES ('44', '43', '0', '33', '水电费水电费', '0', '1444729160', '0');
INSERT INTO `comment` VALUES ('45', '112', '0', '34', 'ggg', '0', '1444748950', '1');
INSERT INTO `comment` VALUES ('46', '112', '0', '34', 'jjjjjjjjjjjj', '0', '1444749011', '0');
INSERT INTO `comment` VALUES ('47', '112', '0', '34', 'kjkjk', '0', '1444749014', '0');
INSERT INTO `comment` VALUES ('48', '118', '0', '30', '你好，认识一下呗', '0', '1445225038', '8');
INSERT INTO `comment` VALUES ('49', '105', '0', '30', '5455454', '0', '1445225128', '1');
INSERT INTO `comment` VALUES ('50', '60', '0', '30', 'nihao', '0', '1445249324', '0');
INSERT INTO `comment` VALUES ('51', '130', '0', '40', 'fasdfasdf111111111', '0', '1446367412', '0');
INSERT INTO `comment` VALUES ('52', '130', '0', '40', 'fasdfasdf2222222222', '0', '1446367566', '0');
INSERT INTO `comment` VALUES ('53', '144', '0', '44', '很不好', '0', '1446531405', '0');
INSERT INTO `comment` VALUES ('54', '145', '0', '30', 'henheenenenenenn', '0', '1446531577', '0');
INSERT INTO `comment` VALUES ('55', '131', '0', '30', 'ggddd', '0', '1446531912', '0');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(200) DEFAULT NULL COMMENT '编码',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'alipay_number', '支付宝账号', 'sibada300gogogo@sohu.com', '转账支付时，需要转到指定商家支付宝账号');
INSERT INTO `config` VALUES ('2', 'alipay_name', '姓名', '陈保玲', '转账支付时，商家支付宝姓名');

-- ----------------------------
-- Table structure for order_customer
-- ----------------------------
DROP TABLE IF EXISTS `order_customer`;
CREATE TABLE `order_customer` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `socode` varchar(100) DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `pay_type` int(2) DEFAULT NULL COMMENT '付款方式',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '订单总金额',
  `amount_payable` decimal(16,2) DEFAULT '0.00' COMMENT '应付金额',
  `quantity` int(8) DEFAULT '0' COMMENT '订单商品总数',
  `status` int(2) DEFAULT '0' COMMENT '状态0 待支付   1成功  2失败',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明',
  `ordertime` bigint(20) DEFAULT NULL COMMENT '下单时间',
  `promotion_amount` decimal(16,2) DEFAULT NULL COMMENT '优惠总金额',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COMMENT='用户消费订单';

-- ----------------------------
-- Records of order_customer
-- ----------------------------
INSERT INTO `order_customer` VALUES ('1', '1439538497', '14', '0', '50.00', '50.00', '0', '1', '单次点播(46)', '1439538497', '0.00', '1439538497', null, null, null);
INSERT INTO `order_customer` VALUES ('2', '1439538522', '14', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1439538522', '0.00', '1439538522', null, null, null);
INSERT INTO `order_customer` VALUES ('3', '1439538612', '14', '0', '20.00', '20.00', '0', '1', '单次点播(44)', '1439538612', '0.00', '1439538612', null, null, null);
INSERT INTO `order_customer` VALUES ('4', '1439539811', '14', '0', '10.00', '10.00', '0', '1', '单次点播(19)', '1439539811', '0.00', '1439539811', null, null, null);
INSERT INTO `order_customer` VALUES ('5', '1439540000', '14', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1439540000', '0.00', '1439540000', null, null, null);
INSERT INTO `order_customer` VALUES ('6', '1439540014', '14', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1439540014', '0.00', '1439540014', null, null, null);
INSERT INTO `order_customer` VALUES ('7', '1439540023', '14', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1439540023', '0.00', '1439540023', null, null, null);
INSERT INTO `order_customer` VALUES ('8', '1439540043', '14', '0', '40.00', '40.00', '0', '1', '单次点播(45)', '1439540043', '0.00', '1439540043', null, null, null);
INSERT INTO `order_customer` VALUES ('9', '1440151168', '3', '0', '50.00', '50.00', '0', '1', '单次点播(46)', '1440151168', '0.00', '1440151168', null, null, null);
INSERT INTO `order_customer` VALUES ('10', '1440151179', '3', '0', '50.00', '50.00', '0', '1', '单次点播(31)', '1440151179', '0.00', '1440151179', null, null, null);
INSERT INTO `order_customer` VALUES ('11', '1440151204', '3', '0', '40.00', '40.00', '0', '1', '单次点播(45)', '1440151204', '0.00', '1440151204', null, null, null);
INSERT INTO `order_customer` VALUES ('12', '1440389592', '15', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1440389592', '0.00', '1440389592', null, null, null);
INSERT INTO `order_customer` VALUES ('13', '1440389596', '15', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1440389596', '0.00', '1440389596', null, null, null);
INSERT INTO `order_customer` VALUES ('14', '1440389604', '15', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1440389604', '0.00', '1440389604', null, null, null);
INSERT INTO `order_customer` VALUES ('15', '1440389616', '15', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1440389616', '0.00', '1440389616', null, null, null);
INSERT INTO `order_customer` VALUES ('16', '1440406024', '15', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1440406024', '0.00', '1440406024', null, null, null);
INSERT INTO `order_customer` VALUES ('17', '1440406045', '15', '0', '20.00', '20.00', '0', '1', '单次点播(44)', '1440406045', '0.00', '1440406045', null, null, null);
INSERT INTO `order_customer` VALUES ('18', '1440753491', '20', '1', '10.00', '10.00', '1', '1', '批量订单', '1440753491', '0.00', '1440753491', '20', '1440753491', '20');
INSERT INTO `order_customer` VALUES ('19', '1440753590', '20', '0', '10.00', '10.00', '0', '1', '单次点播(19)', '1440753590', '0.00', '1440753590', null, null, null);
INSERT INTO `order_customer` VALUES ('20', '1440753935', '20', '0', '30.00', '30.00', '0', '1', '单次点播(47)', '1440753935', '0.00', '1440753935', null, null, null);
INSERT INTO `order_customer` VALUES ('21', '1440754148', '20', '1', '20.00', '20.00', '2', '1', '批量订单', '1440754148', '0.00', '1440754148', '20', '1440754148', '20');
INSERT INTO `order_customer` VALUES ('22', '1440754823', '20', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1440754823', '0.00', '1440754823', null, null, null);
INSERT INTO `order_customer` VALUES ('23', '1440992345', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1440992345', '0.00', '1440992345', '3', '1440992345', '3');
INSERT INTO `order_customer` VALUES ('24', '1440992897', '3', '0', '10.00', '10.00', '0', '1', '单次点播(19)', '1440992897', '0.00', '1440992897', null, null, null);
INSERT INTO `order_customer` VALUES ('25', '1441092419', '13', '0', '200.00', '200.00', '0', '1', '单次点播(4)', '1441092419', '0.00', '1441092419', null, null, null);
INSERT INTO `order_customer` VALUES ('26', '1441092672', '14', '0', '200.00', '200.00', '0', '1', '单次点播(4)', '1441092672', '0.00', '1441092672', null, null, null);
INSERT INTO `order_customer` VALUES ('27', '1441092685', '14', '0', '200.00', '200.00', '0', '1', '单次点播(4)', '1441092685', '0.00', '1441092685', null, null, null);
INSERT INTO `order_customer` VALUES ('28', '1441094345', '14', '0', '30.00', '30.00', '0', '1', '单次点播(56)', '1441094345', '0.00', '1441094345', null, null, null);
INSERT INTO `order_customer` VALUES ('29', '1441094376', '14', '0', '30.00', '30.00', '0', '1', '单次点播(56)', '1441094376', '0.00', '1441094376', null, null, null);
INSERT INTO `order_customer` VALUES ('30', '1441095313', '14', '0', '10.00', '10.00', '0', '1', '单次点播(57)', '1441095313', '0.00', '1441095313', null, null, null);
INSERT INTO `order_customer` VALUES ('31', '1441095987', '14', '0', '10.00', '10.00', '0', '1', '单次点播(13)', '1441095987', '0.00', '1441095987', null, null, null);
INSERT INTO `order_customer` VALUES ('32', '1441096269', '14', '0', '50.00', '50.00', '0', '1', '单次点播(54)', '1441096269', '0.00', '1441096269', null, null, null);
INSERT INTO `order_customer` VALUES ('33', '1441096342', '20', '0', '10.00', '10.00', '0', '1', '单次点播(57)', '1441096342', '0.00', '1441096342', null, null, null);
INSERT INTO `order_customer` VALUES ('34', '1441096839', '20', '0', '30.00', '30.00', '0', '1', '单次点播(56)', '1441096839', '0.00', '1441096839', null, null, null);
INSERT INTO `order_customer` VALUES ('35', '1441096850', '3', '0', '50.00', '50.00', '0', '1', '单次点播(54)', '1441096850', '0.00', '1441096850', null, null, null);
INSERT INTO `order_customer` VALUES ('36', '1441097027', '3', '0', '30.00', '30.00', '0', '1', '单次点播(56)', '1441097027', '0.00', '1441097027', null, null, null);
INSERT INTO `order_customer` VALUES ('37', '1441097573', '3', '0', '30.00', '30.00', '0', '1', '单次点播(55)', '1441097573', '0.00', '1441097573', null, null, null);
INSERT INTO `order_customer` VALUES ('38', '1441098027', '3', '0', '10.00', '10.00', '0', '1', '单次点播(57)', '1441098027', '0.00', '1441098027', null, null, null);
INSERT INTO `order_customer` VALUES ('39', '1441098532', '20', '0', '300.00', '300.00', '0', '1', '单次点播(18)', '1441098532', '0.00', '1441098532', null, null, null);
INSERT INTO `order_customer` VALUES ('40', '1441098662', '3', '0', '0.00', '0.00', '0', '1', '单次点播(5)', '1441098662', '0.00', '1441098662', null, null, null);
INSERT INTO `order_customer` VALUES ('41', '1441099042', '3', '0', '55.00', '55.00', '0', '1', '单次点播(15)', '1441099042', '0.00', '1441099042', null, null, null);
INSERT INTO `order_customer` VALUES ('42', '1441100359', '20', '0', '20.00', '20.00', '0', '1', '单次点播(29)', '1441100359', '0.00', '1441100359', null, null, null);
INSERT INTO `order_customer` VALUES ('43', '1441100372', '20', '0', '100.00', '100.00', '0', '1', '单次点播(3)', '1441100372', '0.00', '1441100372', null, null, null);
INSERT INTO `order_customer` VALUES ('44', '1441188162', '3', '0', '99.00', '99.00', '0', '1', '单次点播(14)', '1441188162', '0.00', '1441188162', null, null, null);
INSERT INTO `order_customer` VALUES ('45', '1441509005', '20', '0', '100.00', '100.00', '0', '1', '单次点播(12)', '1441509005', '0.00', '1441509005', null, null, null);
INSERT INTO `order_customer` VALUES ('46', '1441509098', '20', '0', '30.00', '30.00', '0', '1', '单次点播(55)', '1441509098', '0.00', '1441509098', null, null, null);
INSERT INTO `order_customer` VALUES ('47', '1441509587', '20', '0', '444.00', '444.00', '0', '1', '单次点播(59)', '1441509587', '0.00', '1441509587', null, null, null);
INSERT INTO `order_customer` VALUES ('48', '1441512232', '20', '0', '50.00', '50.00', '0', '1', '单次点播(25)', '1441512232', '0.00', '1441512232', null, null, null);
INSERT INTO `order_customer` VALUES ('49', '1441512472', '20', '0', '20.00', '20.00', '0', '1', '单次点播(21)', '1441512472', '0.00', '1441512472', null, null, null);
INSERT INTO `order_customer` VALUES ('50', '1441521853', '14', '0', '444.00', '444.00', '0', '1', '单次点播(59)', '1441521853', '0.00', '1441521853', null, null, null);
INSERT INTO `order_customer` VALUES ('51', '1441532036', '14', '0', '50.00', '50.00', '0', '1', '单次点播(48)', '1441532036', '0.00', '1441532036', null, null, null);
INSERT INTO `order_customer` VALUES ('52', '1441533395', '14', '0', '20.00', '20.00', '0', '1', '单次点播(62)', '1441533395', '0.00', '1441533395', null, null, null);
INSERT INTO `order_customer` VALUES ('53', '1441591921', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1441591921', '0.00', '1441591921', '3', '1441591921', '3');
INSERT INTO `order_customer` VALUES ('54', '1441591993', '3', '0', '10.00', '10.00', '0', '1', '单次点播(13)', '1441591993', '0.00', '1441591993', null, null, null);
INSERT INTO `order_customer` VALUES ('55', '1441605064', '3', '0', '10.00', '10.00', '0', '1', '单次点播(61)', '1441605064', '0.00', '1441605064', null, null, null);
INSERT INTO `order_customer` VALUES ('56', '1441605560', '3', '0', '30.00', '30.00', '0', '1', '单次点播(63)', '1441605560', '0.00', '1441605560', null, null, null);
INSERT INTO `order_customer` VALUES ('57', '1441960783', '15', '0', '123.00', '123.00', '0', '1', '单次点播(1)', '1441960783', '0.00', '1441960783', null, null, null);
INSERT INTO `order_customer` VALUES ('58', '1441960845', '15', '0', '50.00', '50.00', '0', '1', '单次点播(48)', '1441960845', '0.00', '1441960845', null, null, null);
INSERT INTO `order_customer` VALUES ('59', '1441960912', '15', '0', '50.00', '50.00', '0', '1', '单次点播(54)', '1441960912', '0.00', '1441960912', null, null, null);
INSERT INTO `order_customer` VALUES ('60', '1441960943', '15', '0', '30.00', '30.00', '0', '1', '单次点播(63)', '1441960943', '0.00', '1441960943', null, null, null);
INSERT INTO `order_customer` VALUES ('61', '1441960979', '15', '0', '30.00', '30.00', '0', '1', '单次点播(56)', '1441960979', '0.00', '1441960979', null, null, null);
INSERT INTO `order_customer` VALUES ('62', '1441960996', '15', '0', '50.00', '50.00', '0', '1', '单次点播(46)', '1441960996', '0.00', '1441960996', null, null, null);
INSERT INTO `order_customer` VALUES ('63', '1441961044', '15', '0', '100.00', '100.00', '0', '1', '单次点播(3)', '1441961044', '0.00', '1441961044', null, null, null);
INSERT INTO `order_customer` VALUES ('64', '1441961059', '15', '0', '100.00', '100.00', '0', '1', '单次点播(12)', '1441961059', '0.00', '1441961059', null, null, null);
INSERT INTO `order_customer` VALUES ('65', '1441961076', '15', '0', '10.00', '10.00', '0', '1', '单次点播(19)', '1441961076', '0.00', '1441961076', null, null, null);
INSERT INTO `order_customer` VALUES ('66', '1441962009', '15', '1', '10.00', '9.00', '1', '1', '批量订单', '1441962009', '1.00', '1441962009', '15', '1441962009', '15');
INSERT INTO `order_customer` VALUES ('67', '1442386560', '20', '0', '5.00', '5.00', '0', '1', '单次点播(60)', '1442386561', '0.00', '1442386561', null, null, null);
INSERT INTO `order_customer` VALUES ('68', '1442389354', '20', '0', '50.00', '50.00', '0', '1', '单次点播(54)', '1442389354', '0.00', '1442389354', null, null, null);
INSERT INTO `order_customer` VALUES ('69', '1442390534', '20', '0', '30.00', '30.00', '0', '1', '单次点播(63)', '1442390534', '0.00', '1442390534', null, null, null);
INSERT INTO `order_customer` VALUES ('70', '1442392907', '20', '0', '200.00', '200.00', '0', '1', '单次点播(4)', '1442392907', '0.00', '1442392907', null, null, null);
INSERT INTO `order_customer` VALUES ('71', '1442482076', '20', '0', '20.00', '20.00', '0', '1', '单次点播(42)', '1442482076', '0.00', '1442482076', null, null, null);
INSERT INTO `order_customer` VALUES ('72', '1442557382', '14', '0', '20.00', '20.00', '0', '1', '单次点播(68)', '1442557382', '0.00', '1442557382', null, null, null);
INSERT INTO `order_customer` VALUES ('73', '1442559299', '14', '0', '10.00', '10.00', '0', '1', '单次点播(67)', '1442559299', '0.00', '1442559299', null, null, null);
INSERT INTO `order_customer` VALUES ('74', '1442570020', '15', '1', '10.00', '10.00', '2', '1', '批量订单', '1442570020', '0.00', '1442570020', '15', '1442570020', '15');
INSERT INTO `order_customer` VALUES ('75', '1442570466', '15', '1', '10.00', '10.00', '2', '1', '批量订单', '1442570466', '0.00', '1442570466', '15', '1442570466', '15');
INSERT INTO `order_customer` VALUES ('76', '1442570495', '15', '0', '10.00', '10.00', '0', '1', '单次点播(67)', '1442570495', '0.00', '1442570495', null, null, null);
INSERT INTO `order_customer` VALUES ('77', '1442902676', '20', '1', '10.00', '10.00', '2', '1', '批量订单', '1442902676', '0.00', '1442902676', '20', '1442902676', '20');
INSERT INTO `order_customer` VALUES ('78', '1442908914', '20', '0', '5.00', '5.00', '0', '1', '单次点播(77)', '1442908914', '0.00', '1442908914', null, null, null);
INSERT INTO `order_customer` VALUES ('79', '1442909414', '3', '0', '5.00', '5.00', '0', '1', '单次点播(77)', '1442909414', '0.00', '1442909414', null, null, null);
INSERT INTO `order_customer` VALUES ('80', '1442912658', '20', '0', '123.00', '123.00', '0', '1', '单次点播(1)', '1442912658', '0.00', '1442912658', null, null, null);
INSERT INTO `order_customer` VALUES ('81', '1442979531', '20', '0', '30.00', '30.00', '0', '1', '单次点播(81)', '1442979531', '0.00', '1442979531', null, null, null);
INSERT INTO `order_customer` VALUES ('82', '1442979557', '20', '0', '20.00', '20.00', '0', '1', '单次点播(84)', '1442979557', '0.00', '1442979557', null, null, null);
INSERT INTO `order_customer` VALUES ('83', '1442988870', '20', '0', '20.00', '20.00', '0', '1', '单次点播(44)', '1442988870', '0.00', '1442988870', null, null, null);
INSERT INTO `order_customer` VALUES ('84', '1442988901', '20', '0', '30.00', '30.00', '0', '1', '单次点播(87)', '1442988901', '0.00', '1442988901', null, null, null);
INSERT INTO `order_customer` VALUES ('85', '1442989342', '20', '0', '20.00', '20.00', '0', '1', '单次点播(88)', '1442989342', '0.00', '1442989342', null, null, null);
INSERT INTO `order_customer` VALUES ('86', '1442989393', '15', '0', '20.00', '20.00', '0', '1', '单次点播(88)', '1442989393', '0.00', '1442989393', null, null, null);
INSERT INTO `order_customer` VALUES ('87', '1442989721', '15', '0', '0.00', '0.00', '0', '1', '单次点播(5)', '1442989721', '0.00', '1442989721', null, null, null);
INSERT INTO `order_customer` VALUES ('88', '1442989880', '15', '0', '0.00', '0.00', '0', '1', '单次点播(65)', '1442989880', '0.00', '1442989880', null, null, null);
INSERT INTO `order_customer` VALUES ('89', '1442993774', '15', '0', '10.00', '10.00', '0', '1', '单次点播(13)', '1442993774', '0.00', '1442993774', null, null, null);
INSERT INTO `order_customer` VALUES ('90', '1442995100', '15', '0', '10.00', '10.00', '0', '1', '单次点播(89)', '1442995100', '0.00', '1442995100', null, null, null);
INSERT INTO `order_customer` VALUES ('91', '1442999455', '20', '0', '10.00', '10.00', '0', '1', '单次点播(97)', '1442999455', '0.00', '1442999455', null, null, null);
INSERT INTO `order_customer` VALUES ('92', '1443081223', '25', '0', '10.00', '10.00', '0', '1', '单次点播(97)', '1443081223', '0.00', '1443081223', null, null, null);
INSERT INTO `order_customer` VALUES ('93', '1443081638', '25', '0', '20.00', '20.00', '0', '1', '单次点播(13)', '1443081638', '0.00', '1443081638', null, null, null);
INSERT INTO `order_customer` VALUES ('94', '1443081882', '25', '0', '0.00', '0.00', '0', '1', '单次点播(92)', '1443081882', '0.00', '1443081882', null, null, null);
INSERT INTO `order_customer` VALUES ('95', '1443082379', '25', '1', '10.00', '10.00', '2', '1', '批量订单', '1443082379', '0.00', '1443082379', '25', '1443082379', '25');
INSERT INTO `order_customer` VALUES ('96', '1443083071', '25', '1', '10.00', '10.00', '2', '1', '批量订单', '1443083071', '0.00', '1443083071', '25', '1443083071', '25');
INSERT INTO `order_customer` VALUES ('97', '1443423883', '25', '1', '10.00', '10.00', '2', '1', '批量订单', '1443423883', '0.00', '1443423883', '25', '1443423883', '25');
INSERT INTO `order_customer` VALUES ('98', '1443428675', '25', '0', '20.00', '20.00', '0', '1', '单次点播(68)', '1443428675', '0.00', '1443428675', null, null, null);
INSERT INTO `order_customer` VALUES ('99', '1443428698', '25', '0', '10.00', '10.00', '0', '1', '单次点播(53)', '1443428698', '0.00', '1443428698', null, null, null);
INSERT INTO `order_customer` VALUES ('100', '1443429103', '25', '0', '10.00', '10.00', '0', '1', '单次点播(93)', '1443429103', '0.00', '1443429103', null, null, null);
INSERT INTO `order_customer` VALUES ('101', '1443430522', '25', '1', '10.00', '10.00', '2', '1', '批量订单', '1443430522', '0.00', '1443430522', '25', '1443430522', '25');
INSERT INTO `order_customer` VALUES ('102', '1443430620', '25', '0', '5.00', '5.00', '0', '1', '单次点播(94)', '1443430620', '0.00', '1443430620', null, null, null);
INSERT INTO `order_customer` VALUES ('103', '1443433226', '25', '0', '5.00', '5.00', '0', '1', '单次点播(66)', '1443433226', '0.00', '1443433226', null, null, null);
INSERT INTO `order_customer` VALUES ('104', '1443600755', '25', '0', '20.00', '20.00', '0', '1', '单次点播(91)', '1443600755', '0.00', '1443600755', null, null, null);
INSERT INTO `order_customer` VALUES ('105', '1443603247', '25', '0', '10.00', '10.00', '0', '1', '单次点播(101)', '1443603247', '0.00', '1443603247', null, null, null);
INSERT INTO `order_customer` VALUES ('106', '1443605582', '25', '0', '20.00', '20.00', '0', '1', '单次点播(95)', '1443605582', '0.00', '1443605582', null, null, null);
INSERT INTO `order_customer` VALUES ('107', '1444028930', '21', '0', '0.00', '0.00', '0', '1', '单次点播(86)', '1444028930', '0.00', '1444028930', null, null, null);
INSERT INTO `order_customer` VALUES ('108', '1444028978', '21', '0', '0.00', '0.00', '0', '1', '单次点播(92)', '1444028978', '0.00', '1444028978', null, null, null);
INSERT INTO `order_customer` VALUES ('109', '1444377734', '30', '0', '2.00', '2.00', '0', '1', '单次点播(108)', '1444377734', '0.00', '1444377734', null, null, null);
INSERT INTO `order_customer` VALUES ('110', '1444378668', '30', '1', '30.00', '-39.00', '3', '1', '批量订单', '1444378668', '69.00', '1444378668', '30', '1444378668', '30');
INSERT INTO `order_customer` VALUES ('111', '1444378884', '30', '1', '300.00', '-390.00', '30', '1', '批量订单', '1444378884', '690.00', '1444378884', '30', '1444378884', '30');
INSERT INTO `order_customer` VALUES ('112', '1444381929', '31', '1', '10.00', '10.00', '1', '1', '批量订单', '1444381929', '0.00', '1444381929', '31', '1444381929', '31');
INSERT INTO `order_customer` VALUES ('113', '1444382067', '31', '1', '100.00', '100.00', '1', '1', '批量订单', '1444382067', '0.00', '1444382067', '31', '1444382067', '31');
INSERT INTO `order_customer` VALUES ('114', '1444382922', '25', '0', '5.00', '5.00', '0', '1', '单次点播(100)', '1444382922', '0.00', '1444382922', null, null, null);
INSERT INTO `order_customer` VALUES ('115', '1444442339', '30', '0', '10.00', '10.00', '0', '1', '单次点播(53)', '1444442339', '0.00', '1444442339', null, null, null);
INSERT INTO `order_customer` VALUES ('116', '1444442350', '30', '0', '0.00', '0.00', '0', '1', '单次点播(92)', '1444442350', '0.00', '1444442350', null, null, null);
INSERT INTO `order_customer` VALUES ('117', '1444490207', '34', '1', '1035.00', '235.00', '5', '1', '批量订单', '1444490207', '800.00', '1444490207', '34', '1444490207', '34');
INSERT INTO `order_customer` VALUES ('118', '1444490747', '34', '1', '1015.00', '1015.00', '3', '1', '批量订单', '1444490747', '0.00', '1444490747', '34', '1444490747', '34');
INSERT INTO `order_customer` VALUES ('119', '1444564591', '34', '0', '1.00', '1.00', '0', '1', '单次点播(103)', '1444564591', '0.00', '1444564591', null, null, null);
INSERT INTO `order_customer` VALUES ('120', '1444618454', '33', '0', '50.00', '50.00', '0', '1', '单次点播(46)', '1444618454', '0.00', '1444618454', null, null, null);
INSERT INTO `order_customer` VALUES ('121', '1444618503', '33', '0', '20.00', '20.00', '0', '1', '单次点播(105)', '1444618503', '0.00', '1444618503', null, null, null);
INSERT INTO `order_customer` VALUES ('122', '1444658901', '30', '0', '30.00', '30.00', '0', '1', '单次点播(111)', '1444658901', '0.00', '1444658901', null, null, null);
INSERT INTO `order_customer` VALUES ('123', '1444659159', '34', '0', '10.00', '10.00', '0', '1', '单次点播(67)', '1444659159', '0.00', '1444659159', null, null, null);
INSERT INTO `order_customer` VALUES ('124', '1444709362', '33', '1', '20.00', '20.00', '2', '1', '批量订单', '1444709362', '0.00', '1444709362', '33', '1444709362', '33');
INSERT INTO `order_customer` VALUES ('125', '1444728121', '33', '0', '10.00', '10.00', '0', '1', '单次点播(43)', '1444728121', '0.00', '1444728121', null, null, null);
INSERT INTO `order_customer` VALUES ('126', '1444728882', '33', '0', '0.00', '0.00', '0', '1', '单次点播(86)', '1444728882', '0.00', '1444728882', null, null, null);
INSERT INTO `order_customer` VALUES ('127', '1444729465', '33', '0', '20.00', '20.00', '0', '1', '单次点播(13)', '1444729465', '0.00', '1444729465', null, null, null);
INSERT INTO `order_customer` VALUES ('128', '1444749639', '33', '0', '20.00', '20.00', '0', '1', '单次点播(113)', '1444749639', '0.00', '1444749639', null, null, null);
INSERT INTO `order_customer` VALUES ('129', '1444752000', '35', '1', '215.00', '215.00', '4', '1', '批量订单', '1444752000', '0.00', '1444752000', '35', '1444752000', '35');
INSERT INTO `order_customer` VALUES ('130', '1444900599', '30', '0', '20.00', '20.00', '0', '1', '单次点播(113)', '1444900599', '0.00', '1444900599', null, null, null);
INSERT INTO `order_customer` VALUES ('131', '1444900679', '30', '0', '0.00', '0.00', '0', '1', '单次点播(112)', '1444900679', '0.00', '1444900679', null, null, null);
INSERT INTO `order_customer` VALUES ('132', '1444985895', '30', '0', '5.00', '5.00', '0', '1', '单次点播(77)', '1444985895', '0.00', '1444985895', null, null, null);
INSERT INTO `order_customer` VALUES ('133', '1444985925', '30', '0', '30.00', '30.00', '0', '1', '单次点播(78)', '1444985925', '0.00', '1444985925', null, null, null);
INSERT INTO `order_customer` VALUES ('134', '1444989152', '30', '0', '20.00', '20.00', '0', '1', '单次点播(95)', '1444989152', '0.00', '1444989152', null, null, null);
INSERT INTO `order_customer` VALUES ('135', '1445221338', '30', '0', '0.00', '0.00', '0', '1', '单次点播(86)', '1445221338', '0.00', '1445221338', null, null, null);
INSERT INTO `order_customer` VALUES ('136', '1445221542', '30', '0', '20.00', '20.00', '0', '1', '单次点播(88)', '1445221542', '0.00', '1445221542', null, null, null);
INSERT INTO `order_customer` VALUES ('137', '1445221788', '30', '0', '10.00', '10.00', '0', '1', '单次点播(80)', '1445221788', '0.00', '1445221788', null, null, null);
INSERT INTO `order_customer` VALUES ('138', '1445222073', '30', '0', '20.00', '20.00', '0', '1', '单次点播(84)', '1445222073', '0.00', '1445222073', null, null, null);
INSERT INTO `order_customer` VALUES ('139', '1445223003', '30', '0', '30.00', '30.00', '0', '1', '单次点播(47)', '1445223003', '0.00', '1445223003', null, null, null);
INSERT INTO `order_customer` VALUES ('140', '1445223387', '30', '0', '10.00', '10.00', '0', '1', '单次点播(75)', '1445223387', '0.00', '1445223387', null, null, null);
INSERT INTO `order_customer` VALUES ('141', '1445223478', '31', '0', '10.00', '10.00', '0', '1', '单次点播(75)', '1445223478', '0.00', '1445223478', null, null, null);
INSERT INTO `order_customer` VALUES ('142', '1445223545', '30', '0', '10.00', '10.00', '0', '1', '单次点播(102)', '1445223545', '0.00', '1445223545', null, null, null);
INSERT INTO `order_customer` VALUES ('143', '1445224271', '30', '0', '50.00', '50.00', '0', '1', '单次点播(54)', '1445224271', '0.00', '1445224271', null, null, null);
INSERT INTO `order_customer` VALUES ('144', '1445224326', '30', '0', '5.00', '5.00', '0', '1', '单次点播(100)', '1445224326', '0.00', '1445224326', null, null, null);
INSERT INTO `order_customer` VALUES ('145', '1445249542', '30', '1', '10.00', '10.00', '1', '1', '批量订单', '1445249542', '0.00', '1445249542', '30', '1445249542', '30');
INSERT INTO `order_customer` VALUES ('146', '1445249724', '30', '0', '20.00', '20.00', '0', '1', '单次点播(64)', '1445249724', '0.00', '1445249724', null, null, null);
INSERT INTO `order_customer` VALUES ('147', '1445308118', '33', '0', '10.00', '10.00', '0', '1', '单次点播(93)', '1445308118', '0.00', '1445308118', null, null, null);
INSERT INTO `order_customer` VALUES ('148', '1445667560', '34', '0', '5.00', '5.00', '0', '1', '单次点播(77)', '1445667560', '0.00', '1445667560', null, null, null);
INSERT INTO `order_customer` VALUES ('149', '1445667836', '34', '1', '44.00', '26.40', '4', '1', '批量订单', '1445667836', '17.60', '1445667836', '34', '1445667836', '34');
INSERT INTO `order_customer` VALUES ('150', '1445752947', '34', '1', '20.00', '20.00', '2', '1', '批量订单', '1445752947', '0.00', '1445752947', '34', '1445752947', '34');
INSERT INTO `order_customer` VALUES ('151', '1445776555', '30', '0', '111.00', '111.00', '0', '1', '单次点播(121)', '1445776555', '0.00', '1445776555', null, null, null);
INSERT INTO `order_customer` VALUES ('152', '1446175408', '30', '0', '10.00', '10.00', '0', '1', '单次点播(143)', '1446175408', '0.00', '1446175408', null, null, null);
INSERT INTO `order_customer` VALUES ('153', '1446175566', '30', '0', '0.20', '0.20', '0', '1', '单次点播(142)', '1446175566', '0.00', '1446175566', null, null, null);
INSERT INTO `order_customer` VALUES ('154', '1446433296', '40', '1', '6.00', '6.00', '1', '1', '批量订单', '1446433296', '0.00', '1446433296', '40', '1446433296', '40');
INSERT INTO `order_customer` VALUES ('158', '1446447463', '40', '1', '100.00', '100.00', '11', '1', '批量订单', '1446447463', '0.00', '1446447463', '40', '1446447463', '40');
INSERT INTO `order_customer` VALUES ('161', '1446448011', '40', '1', '30.00', '30.00', '4', '1', '批量订单', '1446448011', '0.00', '1446448011', '40', '1446448011', '40');
INSERT INTO `order_customer` VALUES ('163', '1446449882', '30', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1446449882', '0.00', '1446449882', null, null, null);
INSERT INTO `order_customer` VALUES ('164', '1446451341', '44', '1', '10.00', '10.00', '1', '1', '批量订单', '1446451341', '0.00', '1446451341', '44', '1446451341', '44');
INSERT INTO `order_customer` VALUES ('165', '1446453155', '30', '0', '50.05', '50.05', '0', '1', '单次点播(144)', '1446453155', '0.00', '1446453155', null, null, null);
INSERT INTO `order_customer` VALUES ('166', '1446453483', '47', '1', '98.00', '98.00', '2', '1', '批量订单', '1446453483', '0.00', '1446453483', '47', '1446453483', '47');
INSERT INTO `order_customer` VALUES ('167', '1446454811', '47', '1', '10.00', '7.00', '1', '1', '批量订单', '1446454811', '3.00', '1446454811', '47', '1446454811', '47');
INSERT INTO `order_customer` VALUES ('169', '1446456500', '47', '1', '432.00', '345.60', '46', '1', '批量订单', '1446456500', '86.40', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer` VALUES ('170', '1446458092', '48', '0', '32.00', '32.00', '0', '1', '单次点播(134)', '1446458092', '0.00', '1446458092', null, null, null);
INSERT INTO `order_customer` VALUES ('171', '1446458228', '48', '0', '5.00', '5.00', '0', '1', '单次点播(66)', '1446458228', '0.00', '1446458228', null, null, null);
INSERT INTO `order_customer` VALUES ('172', '1446458465', '48', '0', '21.00', '21.00', '0', '1', '单次点播(131)', '1446458465', '0.00', '1446458465', null, null, null);
INSERT INTO `order_customer` VALUES ('173', '1446532292', '31', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1446532292', '0.00', '1446532292', null, null, null);
INSERT INTO `order_customer` VALUES ('174', '1446532385', '31', '0', '50.05', '50.05', '0', '1', '单次点播(144)', '1446532385', '0.00', '1446532385', null, null, null);
INSERT INTO `order_customer` VALUES ('175', '1446533938', '31', '0', '5.00', '5.00', '0', '1', '单次点播(77)', '1446533938', '0.00', '1446533938', null, null, null);
INSERT INTO `order_customer` VALUES ('176', '1446534957', '31', '0', '200.00', '200.00', '0', '1', '单次点播(126)', '1446534957', '0.00', '1446534957', null, null, null);
INSERT INTO `order_customer` VALUES ('177', '1446534964', '31', '0', '111.00', '111.00', '0', '1', '单次点播(121)', '1446534964', '0.00', '1446534964', null, null, null);
INSERT INTO `order_customer` VALUES ('178', '1446534973', '31', '0', '10.00', '10.00', '0', '1', '单次点播(127)', '1446534973', '0.00', '1446534973', null, null, null);
INSERT INTO `order_customer` VALUES ('179', '1446534982', '31', '0', '50.00', '50.00', '0', '1', '单次点播(124)', '1446534982', '0.00', '1446534982', null, null, null);
INSERT INTO `order_customer` VALUES ('180', '1446535161', '31', '0', '30.00', '30.00', '0', '1', '单次点播(78)', '1446535161', '0.00', '1446535161', null, null, null);
INSERT INTO `order_customer` VALUES ('181', '1446535189', '31', '0', '20.00', '20.00', '0', '1', '单次点播(79)', '1446535189', '0.00', '1446535189', null, null, null);
INSERT INTO `order_customer` VALUES ('182', '1446536025', '31', '0', '3.22', '3.22', '0', '1', '单次点播(154)', '1446536025', '0.00', '1446536025', null, null, null);
INSERT INTO `order_customer` VALUES ('183', '1446536035', '31', '0', '2.33', '2.33', '0', '1', '单次点播(153)', '1446536035', '0.00', '1446536035', null, null, null);
INSERT INTO `order_customer` VALUES ('184', '1446536044', '31', '0', '5.66', '5.66', '0', '1', '单次点播(152)', '1446536044', '0.00', '1446536044', null, null, null);
INSERT INTO `order_customer` VALUES ('185', '1446536056', '31', '0', '3.66', '3.66', '0', '1', '单次点播(151)', '1446536056', '0.00', '1446536056', null, null, null);
INSERT INTO `order_customer` VALUES ('186', '1446536065', '31', '0', '5.00', '5.00', '0', '1', '单次点播(150)', '1446536065', '0.00', '1446536065', null, null, null);
INSERT INTO `order_customer` VALUES ('187', '1446536079', '31', '0', '5.00', '5.00', '0', '1', '单次点播(149)', '1446536079', '0.00', '1446536079', null, null, null);
INSERT INTO `order_customer` VALUES ('188', '1446536260', '30', '0', '3.22', '3.22', '0', '1', '单次点播(154)', '1446536260', '0.00', '1446536260', null, null, null);
INSERT INTO `order_customer` VALUES ('189', '1446536300', '30', '0', '2.33', '2.33', '0', '1', '单次点播(153)', '1446536300', '0.00', '1446536300', null, null, null);
INSERT INTO `order_customer` VALUES ('190', '1446536317', '30', '0', '5.66', '5.66', '0', '1', '单次点播(152)', '1446536317', '0.00', '1446536317', null, null, null);
INSERT INTO `order_customer` VALUES ('191', '1446536331', '30', '0', '3.66', '3.66', '0', '1', '单次点播(151)', '1446536331', '0.00', '1446536331', null, null, null);
INSERT INTO `order_customer` VALUES ('192', '1446536514', '33', '0', '3.22', '3.22', '0', '1', '单次点播(154)', '1446536514', '0.00', '1446536514', null, null, null);
INSERT INTO `order_customer` VALUES ('193', '1446536521', '33', '0', '2.33', '2.33', '0', '1', '单次点播(153)', '1446536521', '0.00', '1446536521', null, null, null);
INSERT INTO `order_customer` VALUES ('194', '1446536527', '33', '0', '5.66', '5.66', '0', '1', '单次点播(152)', '1446536527', '0.00', '1446536527', null, null, null);
INSERT INTO `order_customer` VALUES ('195', '1446536535', '33', '0', '3.66', '3.66', '0', '1', '单次点播(151)', '1446536535', '0.00', '1446536535', null, null, null);
INSERT INTO `order_customer` VALUES ('196', '1446628221', '30', '1', '100.00', '100.00', '6', '1', '批量订单', '1446628221', '0.00', '1446628221', '30', '1446628221', '30');
INSERT INTO `order_customer` VALUES ('203', '1446691315', '3', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1446691315', '0.00', '1446691315', null, null, null);
INSERT INTO `order_customer` VALUES ('204', '1446719054', '32', '1', '17.00', '3.40', '2', '1', '批量订单', '1446719054', '13.60', '1446719054', '32', '1446719054', '32');
INSERT INTO `order_customer` VALUES ('205', '1446775981', '22', '0', '3.22', '3.22', '0', '1', '单次点播(154)', '1446775981', '0.00', '1446775981', null, null, null);
INSERT INTO `order_customer` VALUES ('206', '1446776669', '30', '0', '7.63', '7.63', '0', '1', '单次点播(159)', '1446776669', '0.00', '1446776669', null, null, null);
INSERT INTO `order_customer` VALUES ('207', '1446778260', '32', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1446778260', '0.00', '1446778260', null, null, null);
INSERT INTO `order_customer` VALUES ('208', '1446781536', '30', '0', '5.00', '5.00', '0', '1', '单次点播(150)', '1446781536', '0.00', '1446781536', null, null, null);
INSERT INTO `order_customer` VALUES ('209', '1446796819', '30', '1', '17.00', '17.00', '2', '1', '批量订单', '1446796819', '0.00', '1446796819', '30', '1446796819', '30');
INSERT INTO `order_customer` VALUES ('210', '1446796906', '30', '1', '6.00', '6.00', '1', '1', '批量订单', '1446796906', '0.00', '1446796906', '30', '1446796906', '30');
INSERT INTO `order_customer` VALUES ('211', '1446812029', '25', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1446812029', '0.00', '1446812029', null, null, null);
INSERT INTO `order_customer` VALUES ('212', '1446812498', '25', '0', '55.00', '55.00', '0', '1', '单次点播(123)', '1446812498', '0.00', '1446812498', null, null, null);
INSERT INTO `order_customer` VALUES ('213', '1446812502', '25', '0', '100.00', '100.00', '0', '1', '单次点播(122)', '1446812502', '0.00', '1446812502', null, null, null);
INSERT INTO `order_customer` VALUES ('214', '1446812506', '25', '0', '111.00', '111.00', '0', '1', '单次点播(121)', '1446812506', '0.00', '1446812506', null, null, null);
INSERT INTO `order_customer` VALUES ('215', '1446812515', '25', '0', '5.00', '5.00', '0', '1', '单次点播(109)', '1446812515', '0.00', '1446812515', null, null, null);
INSERT INTO `order_customer` VALUES ('216', '1446812679', '25', '0', '10.00', '10.00', '0', '1', '单次点播(120)', '1446812679', '0.00', '1446812679', null, null, null);
INSERT INTO `order_customer` VALUES ('217', '1446813605', '25', '0', '2.39', '2.39', '0', '1', '单次点播(129)', '1446813605', '0.00', '1446813605', null, null, null);
INSERT INTO `order_customer` VALUES ('218', '1446866401', '25', '0', '10.00', '10.00', '0', '1', '单次点播(164)', '1446866401', '0.00', '1446866401', null, null, null);
INSERT INTO `order_customer` VALUES ('219', '1446888690', '30', '1', '200.00', '160.00', '1', '1', '批量订单', '1446888690', '40.00', '1446888690', '30', '1446888690', '30');
INSERT INTO `order_customer` VALUES ('220', '1447034279', '3', '0', '2.39', '2.39', '0', '1', '单次点播(129)', '1447034279', '0.00', '1447034279', null, null, null);
INSERT INTO `order_customer` VALUES ('221', '1447035114', '3', '0', '5.00', '5.00', '0', '1', '单次点播(60)', '1447035114', '0.00', '1447035114', null, null, null);
INSERT INTO `order_customer` VALUES ('222', '1447035124', '3', '0', '5.00', '5.00', '0', '1', '单次点播(161)', '1447035124', '0.00', '1447035124', null, null, null);
INSERT INTO `order_customer` VALUES ('223', '1447086250', '3', '1', '10.00', '10.00', '2', '1', '批量订单', '1447086250', '0.00', '1447086250', '3', '1447086250', '3');
INSERT INTO `order_customer` VALUES ('224', '1447136873', '15', '0', '2.33', '2.33', '0', '1', '单次点播(153)', '1447136873', '0.00', '1447136873', null, null, null);
INSERT INTO `order_customer` VALUES ('225', '1447136916', '15', '0', '20.00', '20.00', '0', '1', '单次点播(95)', '1447136916', '0.00', '1447136916', null, null, null);
INSERT INTO `order_customer` VALUES ('226', '1447137038', '15', '0', '5.00', '5.00', '0', '1', '单次点播(161)', '1447137038', '0.00', '1447137038', null, null, null);
INSERT INTO `order_customer` VALUES ('227', '1447137062', '15', '0', '10.00', '10.00', '0', '1', '单次点播(148)', '1447137062', '0.00', '1447137062', null, null, null);
INSERT INTO `order_customer` VALUES ('228', '1447137144', '15', '0', '9.00', '9.00', '0', '1', '单次点播(158)', '1447137144', '0.00', '1447137144', null, null, null);
INSERT INTO `order_customer` VALUES ('229', '1447137214', '15', '0', '30.99', '30.99', '0', '1', '单次点播(145)', '1447137214', '0.00', '1447137214', null, null, null);
INSERT INTO `order_customer` VALUES ('230', '1447137258', '15', '0', '5.00', '5.00', '0', '1', '单次点播(66)', '1447137259', '0.00', '1447137259', null, null, null);
INSERT INTO `order_customer` VALUES ('231', '1447137388', '15', '0', '0.00', '0.00', '0', '1', '单次点播(92)', '1447137388', '0.00', '1447137388', null, null, null);
INSERT INTO `order_customer` VALUES ('232', '1447137441', '15', '0', '10.00', '10.00', '0', '1', '单次点播(57)', '1447137441', '0.00', '1447137441', null, null, null);
INSERT INTO `order_customer` VALUES ('233', '1447138518', '15', '0', '0.00', '0.00', '0', '1', '单次点播(86)', '1447138518', '0.00', '1447138518', null, null, null);
INSERT INTO `order_customer` VALUES ('234', '1447138548', '15', '0', '20.00', '20.00', '0', '1', '单次点播(84)', '1447138548', '0.00', '1447138548', null, null, null);
INSERT INTO `order_customer` VALUES ('235', '1447141791', '41', '1', '20.00', '20.00', '2', '1', '批量订单', '1447141791', '0.00', '1447141791', '41', '1447141791', '41');
INSERT INTO `order_customer` VALUES ('236', '1447142051', '41', '1', '20.00', '20.00', '3', '1', '批量订单', '1447142051', '0.00', '1447142051', '41', '1447142051', '41');
INSERT INTO `order_customer` VALUES ('237', '1447146647', '15', '0', '10.00', '10.00', '0', '1', '单次点播(97)', '1447146647', '0.00', '1447146647', null, null, null);
INSERT INTO `order_customer` VALUES ('238', '1447149009', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1447149009', '0.00', '1447149009', '3', '1447149009', '3');
INSERT INTO `order_customer` VALUES ('239', '1447149225', '3', '1', '10.00', '10.00', '2', '1', '批量订单', '1447149225', '0.00', '1447149225', '3', '1447149225', '3');
INSERT INTO `order_customer` VALUES ('240', '1447209983', '25', '1', '10.00', '10.00', '1', '1', '批量订单', '1447209983', '0.00', '1447209983', '25', '1447209983', '25');
INSERT INTO `order_customer` VALUES ('241', '1447210107', '30', '1', '100.00', '100.00', '1', '1', '批量订单', '1447210107', '0.00', '1447210107', '30', '1447210107', '30');
INSERT INTO `order_customer` VALUES ('242', '1447210138', '30', '1', '100.00', '100.00', '1', '1', '批量订单', '1447210138', '0.00', '1447210138', '30', '1447210138', '30');
INSERT INTO `order_customer` VALUES ('243', '1447576223', '41', '0', '10.00', '10.00', '0', '1', '单次点播(148)', '1447576223', '0.00', '1447576223', null, null, null);
INSERT INTO `order_customer` VALUES ('244', '1447583001', '40', '1', '24.00', '7.20', '4', '1', '批量订单', '1447583001', '16.80', '1447583001', '40', '1447583001', '40');
INSERT INTO `order_customer` VALUES ('245', '1447643570', '40', '1', '68.00', '68.00', '9', '1', '批量订单', '1447643570', '0.00', '1447643570', '40', '1447643570', '40');
INSERT INTO `order_customer` VALUES ('246', '1447817350', '41', '0', '7.63', '7.63', '0', '1', '单次点播(159)', '1447817350', '0.00', '1447817350', null, null, null);
INSERT INTO `order_customer` VALUES ('247', '1447817374', '41', '0', '32.00', '32.00', '0', '1', '单次点播(134)', '1447817374', '0.00', '1447817374', null, null, null);
INSERT INTO `order_customer` VALUES ('248', '1447829161', '41', '1', '20.00', '4.00', '3', '1', '批量订单', '1447829161', '16.00', '1447829161', '41', '1447829161', '41');
INSERT INTO `order_customer` VALUES ('249', '1447831306', '43', '1', '20.00', '2.00', '2', '1', '批量订单', '1447831306', '18.00', '1447831306', '43', '1447831306', '43');
INSERT INTO `order_customer` VALUES ('250', '1447836254', '43', '1', '40.00', '40.00', '3', '1', '批量订单', '1447836254', '0.00', '1447836254', '43', '1447836254', '43');
INSERT INTO `order_customer` VALUES ('251', '1447836612', '43', '1', '20.00', '20.00', '3', '1', '批量订单', '1447836612', '0.00', '1447836612', '43', '1447836612', '43');
INSERT INTO `order_customer` VALUES ('252', '1447916772', '25', '0', '100.00', '100.00', '0', '1', '单次点播(181)', '1447916772', '0.00', '1447916772', null, null, null);
INSERT INTO `order_customer` VALUES ('253', '1447917122', '25', '0', '20.00', '20.00', '0', '1', '单次点播(182)', '1447917122', '0.00', '1447917122', null, null, null);
INSERT INTO `order_customer` VALUES ('254', '1447926765', '33', '0', '30.00', '30.00', '0', '1', '单次点播(187)', '1447926765', '0.00', '1447926765', null, null, null);
INSERT INTO `order_customer` VALUES ('255', '1447926990', '33', '0', '33.00', '33.00', '0', '1', '单次点播(180)', '1447926990', '0.00', '1447926990', null, null, null);
INSERT INTO `order_customer` VALUES ('256', '1448009994', '35', '1', '20.00', '20.00', '3', '1', '批量订单', '1448009994', '0.00', '1448009994', '35', '1448009994', '35');
INSERT INTO `order_customer` VALUES ('257', '1448010116', '35', '1', '20.00', '20.00', '3', '1', '批量订单', '1448010116', '0.00', '1448010116', '35', '1448010116', '35');
INSERT INTO `order_customer` VALUES ('258', '1448011938', '31', '1', '20.00', '20.00', '3', '1', '批量订单', '1448011938', '0.00', '1448011938', '31', '1448011938', '31');
INSERT INTO `order_customer` VALUES ('259', '1448031752', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1448031752', '0.00', '1448031752', '3', '1448031752', '3');
INSERT INTO `order_customer` VALUES ('260', '1448270875', '35', '1', '30.00', '30.00', '4', '1', '批量订单', '1448270875', '0.00', '1448270875', '35', '1448270875', '35');
INSERT INTO `order_customer` VALUES ('261', '1448272496', '35', '1', '50.00', '50.00', '6', '1', '批量订单', '1448272496', '0.00', '1448272496', '35', '1448272496', '35');
INSERT INTO `order_customer` VALUES ('262', '1448333895', '35', '1', '40.00', '40.00', '6', '1', '批量订单', '1448333895', '0.00', '1448333895', '35', '1448333895', '35');
INSERT INTO `order_customer` VALUES ('263', '1448373137', '30', '1', '220.00', '190.00', '4', '1', '批量订单', '1448373137', '30.00', '1448373137', '30', '1448373137', '30');
INSERT INTO `order_customer` VALUES ('264', '1448439472', '42', '1', '20.00', '20.00', '3', '1', '批量订单', '1448439472', '0.00', '1448439472', '42', '1448439472', '42');
INSERT INTO `order_customer` VALUES ('265', '1448442432', '42', '1', '10.00', '10.00', '1', '1', '批量订单', '1448442432', '0.00', '1448442432', '42', '1448442432', '42');
INSERT INTO `order_customer` VALUES ('266', '1448442707', '42', '1', '20.00', '20.00', '2', '1', '批量订单', '1448442707', '0.00', '1448442707', '42', '1448442707', '42');
INSERT INTO `order_customer` VALUES ('267', '1448443272', '42', '1', '108.00', '108.00', '2', '1', '批量订单', '1448443272', '0.00', '1448443272', '42', '1448443272', '42');
INSERT INTO `order_customer` VALUES ('268', '1448444089', '42', '1', '3.00', '3.00', '1', '1', '批量订单', '1448444089', '0.00', '1448444089', '42', '1448444089', '42');
INSERT INTO `order_customer` VALUES ('269', '1448511822', '34', '1', '61.00', '61.00', '8', '1', '批量订单', '1448511822', '0.00', '1448511822', '34', '1448511822', '34');
INSERT INTO `order_customer` VALUES ('270', '1448511873', '34', '1', '31.00', '31.00', '4', '1', '批量订单', '1448511873', '0.00', '1448511873', '34', '1448511873', '34');
INSERT INTO `order_customer` VALUES ('271', '1448512016', '34', '1', '5.00', '5.00', '1', '1', '批量订单', '1448512016', '0.00', '1448512016', '34', '1448512016', '34');
INSERT INTO `order_customer` VALUES ('272', '1448513490', '3', '1', '200.00', '200.00', '2', '1', '批量订单', '1448513490', '0.00', '1448513490', '3', '1448513490', '3');
INSERT INTO `order_customer` VALUES ('273', '1448526053', '34', '1', '66.00', '6.60', '7', '1', '批量订单', '1448526053', '59.40', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer` VALUES ('274', '1448526114', '34', '1', '6.00', '0.60', '1', '1', '批量订单', '1448526114', '5.40', '1448526114', '34', '1448526114', '34');
INSERT INTO `order_customer` VALUES ('275', '1448605932', '34', '1', '132.00', '15.00', '6', '1', '批量订单', '1448605932', '117.00', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer` VALUES ('276', '1448605987', '34', '1', '5.00', '0.50', '1', '1', '批量订单', '1448605987', '4.50', '1448605987', '34', '1448605987', '34');
INSERT INTO `order_customer` VALUES ('277', '1448606082', '34', '1', '11.00', '2.00', '2', '1', '批量订单', '1448606082', '9.00', '1448606082', '34', '1448606082', '34');
INSERT INTO `order_customer` VALUES ('278', '1448606394', '35', '1', '11.00', '2.00', '2', '1', '批量订单', '1448606394', '9.00', '1448606394', '35', '1448606394', '35');
INSERT INTO `order_customer` VALUES ('279', '1448606649', '35', '1', '5.00', '0.50', '1', '1', '批量订单', '1448606649', '4.50', '1448606649', '35', '1448606649', '35');
INSERT INTO `order_customer` VALUES ('280', '1448613525', '34', '1', '11.00', '2.00', '2', '1', '批量订单', '1448613525', '9.00', '1448613525', '34', '1448613525', '34');
INSERT INTO `order_customer` VALUES ('281', '1448718843', '41', '1', '102.00', '102.00', '3', '1', '批量订单', '1448718843', '0.00', '1448718843', '41', '1448718843', '41');
INSERT INTO `order_customer` VALUES ('282', '1448719357', '41', '1', '11.00', '11.00', '1', '1', '批量订单', '1448719357', '0.00', '1448719357', '41', '1448719357', '41');
INSERT INTO `order_customer` VALUES ('283', '1448719437', '41', '1', '10.00', '10.00', '1', '1', '批量订单', '1448719437', '0.00', '1448719437', '41', '1448719437', '41');
INSERT INTO `order_customer` VALUES ('284', '1448770460', '41', '1', '10.00', '10.00', '1', '1', '批量订单', '1448770460', '0.00', '1448770460', '41', '1448770460', '41');
INSERT INTO `order_customer` VALUES ('285', '1448770520', '41', '1', '10.00', '10.00', '1', '1', '批量订单', '1448770520', '0.00', '1448770520', '41', '1448770520', '41');
INSERT INTO `order_customer` VALUES ('286', '1448770643', '41', '1', '200.00', '200.00', '2', '1', '批量订单', '1448770643', '0.00', '1448770643', '41', '1448770643', '41');
INSERT INTO `order_customer` VALUES ('287', '1448848545', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1448848545', '0.00', '1448848545', '3', '1448848545', '3');
INSERT INTO `order_customer` VALUES ('288', '1448848596', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1448848596', '0.00', '1448848596', '3', '1448848596', '3');
INSERT INTO `order_customer` VALUES ('289', '1448848626', '3', '1', '10.00', '10.00', '1', '1', '批量订单', '1448848626', '0.00', '1448848626', '3', '1448848626', '3');
INSERT INTO `order_customer` VALUES ('290', '1448849553', '3', '1', '200.00', '200.00', '1', '1', '批量订单', '1448849553', '0.00', '1448849553', '3', '1448849553', '3');
INSERT INTO `order_customer` VALUES ('291', '1448867254', '46', '0', '12.00', '12.00', '0', '1', '单次点播(199)', '1448867254', '0.00', '1448867254', null, null, null);
INSERT INTO `order_customer` VALUES ('292', '1448870032', '41', '1', '102.00', '10.20', '3', '1', '批量订单', '1448870032', '91.80', '1448870032', '41', '1448870032', '41');
INSERT INTO `order_customer` VALUES ('293', '1448875355', '41', '1', '6.00', '0.60', '1', '1', '批量订单', '1448875355', '5.40', '1448875355', '41', '1448875355', '41');
INSERT INTO `order_customer` VALUES ('294', '1448875457', '41', '1', '10.00', '1.00', '1', '1', '批量订单', '1448875457', '9.00', '1448875457', '41', '1448875457', '41');
INSERT INTO `order_customer` VALUES ('295', '1448875557', '41', '1', '200.00', '20.00', '1', '1', '批量订单', '1448875557', '180.00', '1448875557', '41', '1448875557', '41');
INSERT INTO `order_customer` VALUES ('296', '1449137894', '41', '1', '102.00', '102.00', '3', '1', '批量订单', '1449137894', '0.00', '1449137894', '41', '1449137894', '41');
INSERT INTO `order_customer` VALUES ('297', '1449138101', '41', '1', '210.00', '21.00', '5', '1', '批量订单', '1449138101', '189.00', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer` VALUES ('298', '1449138216', '41', '1', '10.00', '1.00', '1', '1', '批量订单', '1449138216', '9.00', '1449138216', '41', '1449138216', '41');

-- ----------------------------
-- Table structure for order_customer_item
-- ----------------------------
DROP TABLE IF EXISTS `order_customer_item`;
CREATE TABLE `order_customer_item` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `title` varchar(300) DEFAULT NULL COMMENT '服务标题',
  `spec` varchar(300) DEFAULT NULL COMMENT '规格',
  `promotion_amount` decimal(16,2) DEFAULT '0.00' COMMENT '优惠金额',
  `quantity` int(11) DEFAULT '0' COMMENT '购买数量',
  `unit_price` decimal(16,2) DEFAULT '0.00' COMMENT '单价',
  `total` decimal(16,2) DEFAULT '0.00' COMMENT '小计',
  `order_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '消费订单',
  `is_give` int(2) DEFAULT '0' COMMENT '是否赠品',
  `anchor_id` bigint(20) DEFAULT NULL COMMENT '主播',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COMMENT='用户消费订单明细';

-- ----------------------------
-- Records of order_customer_item
-- ----------------------------
INSERT INTO `order_customer_item` VALUES ('1', null, '单次点播(46)', '单次点播(46)', '0.00', '1', '50.00', '50.00', '1', '0', null, '1439538497', null, null, null);
INSERT INTO `order_customer_item` VALUES ('2', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '2', '0', null, '1439538522', null, null, null);
INSERT INTO `order_customer_item` VALUES ('3', null, '单次点播(44)', '单次点播(44)', '0.00', '1', '20.00', '20.00', '3', '0', null, '1439538612', null, null, null);
INSERT INTO `order_customer_item` VALUES ('4', null, '单次点播(19)', '单次点播(19)', '0.00', '1', '10.00', '10.00', '4', '0', null, '1439539811', null, null, null);
INSERT INTO `order_customer_item` VALUES ('5', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '5', '0', null, '1439540000', null, null, null);
INSERT INTO `order_customer_item` VALUES ('6', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '6', '0', null, '1439540014', null, null, null);
INSERT INTO `order_customer_item` VALUES ('7', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '7', '0', null, '1439540023', null, null, null);
INSERT INTO `order_customer_item` VALUES ('8', null, '单次点播(45)', '单次点播(45)', '0.00', '1', '40.00', '40.00', '8', '0', null, '1439540043', null, null, null);
INSERT INTO `order_customer_item` VALUES ('9', null, '单次点播(46)', '单次点播(46)', '0.00', '1', '50.00', '50.00', '9', '0', null, '1440151168', null, null, null);
INSERT INTO `order_customer_item` VALUES ('10', null, '单次点播(31)', '单次点播(31)', '0.00', '1', '50.00', '50.00', '10', '0', null, '1440151179', null, null, null);
INSERT INTO `order_customer_item` VALUES ('11', null, '单次点播(45)', '单次点播(45)', '0.00', '1', '40.00', '40.00', '11', '0', null, '1440151204', null, null, null);
INSERT INTO `order_customer_item` VALUES ('12', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '12', '0', null, '1440389592', null, null, null);
INSERT INTO `order_customer_item` VALUES ('13', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '13', '0', null, '1440389596', null, null, null);
INSERT INTO `order_customer_item` VALUES ('14', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '14', '0', null, '1440389604', null, null, null);
INSERT INTO `order_customer_item` VALUES ('15', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '15', '0', null, '1440389616', null, null, null);
INSERT INTO `order_customer_item` VALUES ('16', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '16', '0', null, '1440406024', null, null, null);
INSERT INTO `order_customer_item` VALUES ('17', null, '单次点播(44)', '单次点播(44)', '0.00', '1', '20.00', '20.00', '17', '0', null, '1440406045', null, null, null);
INSERT INTO `order_customer_item` VALUES ('18', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '18', '0', '12', '1440753491', '20', '1440753491', '20');
INSERT INTO `order_customer_item` VALUES ('19', null, '单次点播(19)', '单次点播(19)', '0.00', '1', '10.00', '10.00', '19', '0', null, '1440753590', null, null, null);
INSERT INTO `order_customer_item` VALUES ('20', null, '单次点播(47)', '单次点播(47)', '0.00', '1', '30.00', '30.00', '20', '0', null, '1440753935', null, null, null);
INSERT INTO `order_customer_item` VALUES ('21', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '21', '0', '12', '1440754148', '20', '1440754148', '20');
INSERT INTO `order_customer_item` VALUES ('22', '17', '主播包月', '主播：漂亮美眉 30 天', '0.00', '1', '10.00', '10.00', '21', '0', '11', '1440754148', '20', '1440754148', '20');
INSERT INTO `order_customer_item` VALUES ('23', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '22', '0', null, '1440754823', null, null, null);
INSERT INTO `order_customer_item` VALUES ('24', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '23', '0', '12', '1440992345', '3', '1440992345', '3');
INSERT INTO `order_customer_item` VALUES ('25', null, '单次点播(19)', '单次点播(19)', '0.00', '1', '10.00', '10.00', '24', '0', null, '1440992897', null, null, null);
INSERT INTO `order_customer_item` VALUES ('26', null, '单次点播(4)', '单次点播(4)', '0.00', '1', '200.00', '200.00', '25', '0', null, '1441092419', null, null, null);
INSERT INTO `order_customer_item` VALUES ('27', null, '单次点播(4)', '单次点播(4)', '0.00', '1', '200.00', '200.00', '26', '0', null, '1441092672', null, null, null);
INSERT INTO `order_customer_item` VALUES ('28', null, '单次点播(4)', '单次点播(4)', '0.00', '1', '200.00', '200.00', '27', '0', null, '1441092685', null, null, null);
INSERT INTO `order_customer_item` VALUES ('29', null, '单次点播(56)', '单次点播(56)', '0.00', '1', '30.00', '30.00', '28', '0', null, '1441094345', null, null, null);
INSERT INTO `order_customer_item` VALUES ('30', null, '单次点播(56)', '单次点播(56)', '0.00', '1', '30.00', '30.00', '29', '0', null, '1441094376', null, null, null);
INSERT INTO `order_customer_item` VALUES ('31', null, '单次点播(57)', '单次点播(57)', '0.00', '1', '10.00', '10.00', '30', '0', null, '1441095313', null, null, null);
INSERT INTO `order_customer_item` VALUES ('32', null, '单次点播(13)', '单次点播(13)', '0.00', '1', '10.00', '10.00', '31', '0', null, '1441095987', null, null, null);
INSERT INTO `order_customer_item` VALUES ('33', null, '单次点播(54)', '单次点播(54)', '0.00', '1', '50.00', '50.00', '32', '0', null, '1441096269', null, null, null);
INSERT INTO `order_customer_item` VALUES ('34', null, '单次点播(57)', '单次点播(57)', '0.00', '1', '10.00', '10.00', '33', '0', null, '1441096342', null, null, null);
INSERT INTO `order_customer_item` VALUES ('35', null, '单次点播(56)', '单次点播(56)', '0.00', '1', '30.00', '30.00', '34', '0', null, '1441096839', null, null, null);
INSERT INTO `order_customer_item` VALUES ('36', null, '单次点播(54)', '单次点播(54)', '0.00', '1', '50.00', '50.00', '35', '0', null, '1441096850', null, null, null);
INSERT INTO `order_customer_item` VALUES ('37', null, '单次点播(56)', '单次点播(56)', '0.00', '1', '30.00', '30.00', '36', '0', null, '1441097027', null, null, null);
INSERT INTO `order_customer_item` VALUES ('38', null, '单次点播(55)', '单次点播(55)', '0.00', '1', '30.00', '30.00', '37', '0', null, '1441097573', null, null, null);
INSERT INTO `order_customer_item` VALUES ('39', null, '单次点播(57)', '单次点播(57)', '0.00', '1', '10.00', '10.00', '38', '0', null, '1441098027', null, null, null);
INSERT INTO `order_customer_item` VALUES ('40', null, '单次点播(18)', '单次点播(18)', '0.00', '1', '300.00', '300.00', '39', '0', null, '1441098532', null, null, null);
INSERT INTO `order_customer_item` VALUES ('41', null, '单次点播(5)', '单次点播(5)', '0.00', '1', '0.00', '0.00', '40', '0', null, '1441098662', null, null, null);
INSERT INTO `order_customer_item` VALUES ('42', null, '单次点播(15)', '单次点播(15)', '0.00', '1', '55.00', '55.00', '41', '0', null, '1441099042', null, null, null);
INSERT INTO `order_customer_item` VALUES ('43', null, '单次点播(29)', '单次点播(29)', '0.00', '1', '20.00', '20.00', '42', '0', null, '1441100359', null, null, null);
INSERT INTO `order_customer_item` VALUES ('44', null, '单次点播(3)', '单次点播(3)', '0.00', '1', '100.00', '100.00', '43', '0', null, '1441100372', null, null, null);
INSERT INTO `order_customer_item` VALUES ('45', null, '单次点播(14)', '单次点播(14)', '0.00', '1', '99.00', '99.00', '44', '0', null, '1441188162', null, null, null);
INSERT INTO `order_customer_item` VALUES ('46', null, '单次点播(12)', '单次点播(12)', '0.00', '1', '100.00', '100.00', '45', '0', null, '1441509005', null, null, null);
INSERT INTO `order_customer_item` VALUES ('47', null, '单次点播(55)', '单次点播(55)', '0.00', '1', '30.00', '30.00', '46', '0', null, '1441509098', null, null, null);
INSERT INTO `order_customer_item` VALUES ('48', null, '单次点播(59)', '单次点播(59)', '0.00', '1', '444.00', '444.00', '47', '0', null, '1441509587', null, null, null);
INSERT INTO `order_customer_item` VALUES ('49', null, '单次点播(25)', '单次点播(25)', '0.00', '1', '50.00', '50.00', '48', '0', null, '1441512232', null, null, null);
INSERT INTO `order_customer_item` VALUES ('50', null, '单次点播(21)', '单次点播(21)', '0.00', '1', '20.00', '20.00', '49', '0', null, '1441512472', null, null, null);
INSERT INTO `order_customer_item` VALUES ('51', null, '单次点播(59)', '单次点播(59)', '0.00', '1', '444.00', '444.00', '50', '0', null, '1441521853', null, null, null);
INSERT INTO `order_customer_item` VALUES ('52', null, '单次点播(48)', '单次点播(48)', '0.00', '1', '50.00', '50.00', '51', '0', null, '1441532036', null, null, null);
INSERT INTO `order_customer_item` VALUES ('53', null, '单次点播(62)', '单次点播(62)', '0.00', '1', '20.00', '20.00', '52', '0', null, '1441533395', null, null, null);
INSERT INTO `order_customer_item` VALUES ('54', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '53', '0', '12', '1441591921', '3', '1441591921', '3');
INSERT INTO `order_customer_item` VALUES ('55', null, '单次点播(13)', '单次点播(13)', '0.00', '1', '10.00', '10.00', '54', '0', null, '1441591993', null, null, null);
INSERT INTO `order_customer_item` VALUES ('56', null, '单次点播(61)', '单次点播(61)', '0.00', '1', '10.00', '10.00', '55', '0', null, '1441605064', null, null, null);
INSERT INTO `order_customer_item` VALUES ('57', null, '单次点播(63)', '单次点播(63)', '0.00', '1', '30.00', '30.00', '56', '0', null, '1441605560', null, null, null);
INSERT INTO `order_customer_item` VALUES ('58', null, '单次点播(1)', '单次点播(1)', '0.00', '1', '123.00', '123.00', '57', '0', null, '1441960783', null, null, null);
INSERT INTO `order_customer_item` VALUES ('59', null, '单次点播(48)', '单次点播(48)', '0.00', '1', '50.00', '50.00', '58', '0', null, '1441960845', null, null, null);
INSERT INTO `order_customer_item` VALUES ('60', null, '单次点播(54)', '单次点播(54)', '0.00', '1', '50.00', '50.00', '59', '0', null, '1441960912', null, null, null);
INSERT INTO `order_customer_item` VALUES ('61', null, '单次点播(63)', '单次点播(63)', '0.00', '1', '30.00', '30.00', '60', '0', null, '1441960943', null, null, null);
INSERT INTO `order_customer_item` VALUES ('62', null, '单次点播(56)', '单次点播(56)', '0.00', '1', '30.00', '30.00', '61', '0', null, '1441960979', null, null, null);
INSERT INTO `order_customer_item` VALUES ('63', null, '单次点播(46)', '单次点播(46)', '0.00', '1', '50.00', '50.00', '62', '0', null, '1441960996', null, null, null);
INSERT INTO `order_customer_item` VALUES ('64', null, '单次点播(3)', '单次点播(3)', '0.00', '1', '100.00', '100.00', '63', '0', null, '1441961044', null, null, null);
INSERT INTO `order_customer_item` VALUES ('65', null, '单次点播(12)', '单次点播(12)', '0.00', '1', '100.00', '100.00', '64', '0', null, '1441961059', null, null, null);
INSERT INTO `order_customer_item` VALUES ('66', null, '单次点播(19)', '单次点播(19)', '0.00', '1', '10.00', '10.00', '65', '0', null, '1441961076', null, null, null);
INSERT INTO `order_customer_item` VALUES ('67', '17', '主播包月', '主播：萌萌达 30 天', '1.00', '1', '10.00', '10.00', '66', '0', '9', '1441962009', '15', '1441962009', '15');
INSERT INTO `order_customer_item` VALUES ('68', null, '单次点播(60)', '单次点播(60)', '0.00', '1', '5.00', '5.00', '67', '0', null, '1442386561', null, null, null);
INSERT INTO `order_customer_item` VALUES ('69', null, '单次点播(54)', '单次点播(54)', '0.00', '1', '50.00', '50.00', '68', '0', null, '1442389354', null, null, null);
INSERT INTO `order_customer_item` VALUES ('70', null, '单次点播(63)', '单次点播(63)', '0.00', '1', '30.00', '30.00', '69', '0', null, '1442390534', null, null, null);
INSERT INTO `order_customer_item` VALUES ('71', null, '单次点播(4)', '单次点播(4)', '0.00', '1', '200.00', '200.00', '70', '0', null, '1442392907', null, null, null);
INSERT INTO `order_customer_item` VALUES ('72', null, '单次点播(42)', '单次点播(42)', '0.00', '1', '20.00', '20.00', '71', '0', null, '1442482076', null, null, null);
INSERT INTO `order_customer_item` VALUES ('73', null, '单次点播(68)', '单次点播(68)', '0.00', '1', '20.00', '20.00', '72', '0', null, '1442557382', null, null, null);
INSERT INTO `order_customer_item` VALUES ('74', null, '单次点播(67)', '单次点播(67)', '0.00', '1', '10.00', '10.00', '73', '0', null, '1442559299', null, null, null);
INSERT INTO `order_customer_item` VALUES ('75', '17', '主播包月', '主播：小刘女生 30 天', '0.00', '1', '10.00', '10.00', '74', '0', '14', '1442570020', '15', '1442570020', '15');
INSERT INTO `order_customer_item` VALUES ('76', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：就比你矮 30 天', '0.00', '1', '0.00', '0.00', '74', '1', '8', '1442570020', '15', '1442570020', '15');
INSERT INTO `order_customer_item` VALUES ('77', '17', '主播包月', '主播：青青草 30 天', '0.00', '1', '10.00', '10.00', '75', '0', '7', '1442570466', '15', '1442570466', '15');
INSERT INTO `order_customer_item` VALUES ('78', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：萌萌达 30 天', '0.00', '1', '0.00', '0.00', '75', '1', '9', '1442570466', '15', '1442570466', '15');
INSERT INTO `order_customer_item` VALUES ('79', null, '单次点播(67)', '单次点播(67)', '0.00', '1', '10.00', '10.00', '76', '0', null, '1442570495', null, null, null);
INSERT INTO `order_customer_item` VALUES ('80', '17', '主播包月', '主播：就比你矮 30 天', '0.00', '1', '10.00', '10.00', '77', '0', '8', '1442902676', '20', '1442902676', '20');
INSERT INTO `order_customer_item` VALUES ('81', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：就比你矮 30 天', '0.00', '1', '0.00', '0.00', '77', '1', '8', '1442902676', '20', '1442902676', '20');
INSERT INTO `order_customer_item` VALUES ('82', null, '单次点播(77)', '单次点播(77)', '0.00', '1', '5.00', '5.00', '78', '0', null, '1442908914', null, null, null);
INSERT INTO `order_customer_item` VALUES ('83', null, '单次点播(77)', '单次点播(77)', '0.00', '1', '5.00', '5.00', '79', '0', null, '1442909414', null, null, null);
INSERT INTO `order_customer_item` VALUES ('84', null, '单次点播(1)', '单次点播(1)', '0.00', '1', '123.00', '123.00', '80', '0', null, '1442912658', null, null, null);
INSERT INTO `order_customer_item` VALUES ('85', null, '单次点播(81)', '单次点播(81)', '0.00', '1', '30.00', '30.00', '81', '0', null, '1442979531', null, null, null);
INSERT INTO `order_customer_item` VALUES ('86', null, '单次点播(84)', '单次点播(84)', '0.00', '1', '20.00', '20.00', '82', '0', null, '1442979557', null, null, null);
INSERT INTO `order_customer_item` VALUES ('87', null, '单次点播(44)', '单次点播(44)', '0.00', '1', '20.00', '20.00', '83', '0', null, '1442988870', null, null, null);
INSERT INTO `order_customer_item` VALUES ('88', null, '单次点播(87)', '单次点播(87)', '0.00', '1', '30.00', '30.00', '84', '0', null, '1442988901', null, null, null);
INSERT INTO `order_customer_item` VALUES ('89', null, '单次点播(88)', '单次点播(88)', '0.00', '1', '20.00', '20.00', '85', '0', null, '1442989342', null, null, null);
INSERT INTO `order_customer_item` VALUES ('90', null, '单次点播(88)', '单次点播(88)', '0.00', '1', '20.00', '20.00', '86', '0', null, '1442989393', null, null, null);
INSERT INTO `order_customer_item` VALUES ('91', null, '单次点播(5)', '单次点播(5)', '0.00', '1', '0.00', '0.00', '87', '0', null, '1442989721', null, null, null);
INSERT INTO `order_customer_item` VALUES ('92', null, '单次点播(65)', '单次点播(65)', '0.00', '1', '0.00', '0.00', '88', '0', null, '1442989880', null, null, null);
INSERT INTO `order_customer_item` VALUES ('93', null, '单次点播(13)', '单次点播(13)', '0.00', '1', '10.00', '10.00', '89', '0', null, '1442993774', null, null, null);
INSERT INTO `order_customer_item` VALUES ('94', null, '单次点播(89)', '单次点播(89)', '0.00', '1', '10.00', '10.00', '90', '0', null, '1442995100', null, null, null);
INSERT INTO `order_customer_item` VALUES ('95', null, '单次点播(97)', '单次点播(97)', '0.00', '1', '10.00', '10.00', '91', '0', null, '1442999455', null, null, null);
INSERT INTO `order_customer_item` VALUES ('96', null, '单次点播(97)', '单次点播(97)', '0.00', '1', '10.00', '10.00', '92', '0', null, '1443081223', null, null, null);
INSERT INTO `order_customer_item` VALUES ('97', null, '单次点播(13)', '单次点播(13)', '0.00', '1', '20.00', '20.00', '93', '0', null, '1443081638', null, null, null);
INSERT INTO `order_customer_item` VALUES ('98', null, '单次点播(92)', '单次点播(92)', '0.00', '1', '0.00', '0.00', '94', '0', null, '1443081882', null, null, null);
INSERT INTO `order_customer_item` VALUES ('99', '17', '主播包月', '主播：就比你矮 30 天', '0.00', '1', '10.00', '10.00', '95', '0', '8', '1443082379', '25', '1443082379', '25');
INSERT INTO `order_customer_item` VALUES ('100', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：豆豆 30 天', '0.00', '1', '0.00', '0.00', '95', '1', '1', '1443082379', '25', '1443082379', '25');
INSERT INTO `order_customer_item` VALUES ('101', '17', '主播包月', '主播：豆豆 30 天', '0.00', '1', '10.00', '10.00', '96', '0', '1', '1443083071', '25', '1443083071', '25');
INSERT INTO `order_customer_item` VALUES ('102', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：小刘女生 30 天', '0.00', '1', '0.00', '0.00', '96', '1', '14', '1443083071', '25', '1443083071', '25');
INSERT INTO `order_customer_item` VALUES ('103', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '97', '0', '12', '1443423883', '25', '1443423883', '25');
INSERT INTO `order_customer_item` VALUES ('104', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：就比你矮 30 天', '0.00', '1', '0.00', '0.00', '97', '1', '8', '1443423883', '25', '1443423883', '25');
INSERT INTO `order_customer_item` VALUES ('105', null, '单次点播(68)', '单次点播(68)', '0.00', '1', '20.00', '20.00', '98', '0', null, '1443428675', null, null, null);
INSERT INTO `order_customer_item` VALUES ('106', null, '单次点播(53)', '单次点播(53)', '0.00', '1', '10.00', '10.00', '99', '0', null, '1443428698', null, null, null);
INSERT INTO `order_customer_item` VALUES ('107', null, '单次点播(93)', '单次点播(93)', '0.00', '1', '10.00', '10.00', '100', '0', null, '1443429103', null, null, null);
INSERT INTO `order_customer_item` VALUES ('108', '17', '主播包月', '主播：只要你飞 30 天', '0.00', '1', '10.00', '10.00', '101', '0', '6', '1443430522', '25', '1443430522', '25');
INSERT INTO `order_customer_item` VALUES ('109', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：为了将来不后悔 30 天', '0.00', '1', '0.00', '0.00', '101', '1', '5', '1443430522', '25', '1443430522', '25');
INSERT INTO `order_customer_item` VALUES ('110', null, '单次点播(94)', '单次点播(94)', '0.00', '1', '5.00', '5.00', '102', '0', null, '1443430620', null, null, null);
INSERT INTO `order_customer_item` VALUES ('111', null, '单次点播(66)', '单次点播(66)', '0.00', '1', '5.00', '5.00', '103', '0', null, '1443433226', null, null, null);
INSERT INTO `order_customer_item` VALUES ('112', null, '单次点播(91)', '单次点播(91)', '0.00', '1', '20.00', '20.00', '104', '0', null, '1443600755', null, null, null);
INSERT INTO `order_customer_item` VALUES ('113', null, '单次点播(101)', '单次点播(101)', '0.00', '1', '10.00', '10.00', '105', '0', null, '1443603247', null, null, null);
INSERT INTO `order_customer_item` VALUES ('114', null, '单次点播(95)', '单次点播(95)', '0.00', '1', '20.00', '20.00', '106', '0', null, '1443605582', null, null, null);
INSERT INTO `order_customer_item` VALUES ('115', null, '单次点播(86)', '单次点播(86)', '0.00', '1', '0.00', '0.00', '107', '0', null, '1444028930', null, null, null);
INSERT INTO `order_customer_item` VALUES ('116', null, '单次点播(92)', '单次点播(92)', '0.00', '1', '0.00', '0.00', '108', '0', null, '1444028978', null, null, null);
INSERT INTO `order_customer_item` VALUES ('117', null, '单次点播(108)', '单次点播(108)', '0.00', '1', '2.00', '2.00', '109', '0', null, '1444377734', null, null, null);
INSERT INTO `order_customer_item` VALUES ('118', '17', '主播包月', '主播：小刘女生 30 天', '69.00', '3', '10.00', '30.00', '110', '0', '14', '1444378668', '30', '1444378668', '30');
INSERT INTO `order_customer_item` VALUES ('119', '17', '主播包月', '主播：liu 30 天', '690.00', '30', '10.00', '300.00', '111', '0', '17', '1444378884', '30', '1444378884', '30');
INSERT INTO `order_customer_item` VALUES ('120', '17', '主播包月', '主播：分卡拉奇 30 天', '0.00', '1', '10.00', '10.00', '112', '0', '4', '1444381929', '31', '1444381929', '31');
INSERT INTO `order_customer_item` VALUES ('121', '26', '主播包年', '主播：模特身材 365 天', '0.00', '1', '100.00', '100.00', '113', '0', '12', '1444382067', '31', '1444382067', '31');
INSERT INTO `order_customer_item` VALUES ('122', null, '单次点播(100)', '单次点播(100)', '0.00', '1', '5.00', '5.00', '114', '0', null, '1444382922', null, null, null);
INSERT INTO `order_customer_item` VALUES ('123', null, '单次点播(53)', '单次点播(53)', '0.00', '1', '10.00', '10.00', '115', '0', null, '1444442339', null, null, null);
INSERT INTO `order_customer_item` VALUES ('124', null, '单次点播(92)', '单次点播(92)', '0.00', '1', '0.00', '0.00', '116', '0', null, '1444442350', null, null, null);
INSERT INTO `order_customer_item` VALUES ('125', '17', '主播包月', '主播：就比你矮 30 天', '200.00', '1', '10.00', '10.00', '117', '0', '8', '1444490207', '34', '1444490207', '34');
INSERT INTO `order_customer_item` VALUES ('126', '14', '全站VIP', '主播：test_06 365 天', '400.00', '2', '10.00', '20.00', '117', '0', '35', '1444490207', '34', '1444490207', '34');
INSERT INTO `order_customer_item` VALUES ('127', '32', '曲终人散', '主播：test_06 365 天', '200.00', '1', '5.00', '5.00', '117', '0', '35', '1444490207', '34', '1444490207', '34');
INSERT INTO `order_customer_item` VALUES ('128', '20', '[特价] 终身VIP', '30 天', '0.00', '1', '1000.00', '1000.00', '117', '1', '-1', '1444490207', '34', '1444490207', '34');
INSERT INTO `order_customer_item` VALUES ('129', '32', '曲终人散', '主播：xiaolei 365 天', '0.00', '1', '5.00', '5.00', '118', '0', '26', '1444490747', '34', '1444490747', '34');
INSERT INTO `order_customer_item` VALUES ('130', '17', '主播包月', '主播：xiaolei 30 天', '0.00', '1', '10.00', '10.00', '118', '0', '26', '1444490747', '34', '1444490747', '34');
INSERT INTO `order_customer_item` VALUES ('131', '20', '[特价] 终身VIP', '30 天', '0.00', '1', '1000.00', '1000.00', '118', '1', '-1', '1444490747', '34', '1444490747', '34');
INSERT INTO `order_customer_item` VALUES ('132', null, '单次点播(103)', '单次点播(103)', '0.00', '1', '1.00', '1.00', '119', '0', null, '1444564591', null, null, null);
INSERT INTO `order_customer_item` VALUES ('133', null, '单次点播(46)', '单次点播(46)', '0.00', '1', '50.00', '50.00', '120', '0', null, '1444618454', null, null, null);
INSERT INTO `order_customer_item` VALUES ('134', null, '单次点播(105)', '单次点播(105)', '0.00', '1', '20.00', '20.00', '121', '0', null, '1444618503', null, null, null);
INSERT INTO `order_customer_item` VALUES ('135', null, '单次点播(111)', '单次点播(111)', '0.00', '1', '30.00', '30.00', '122', '0', null, '1444658901', null, null, null);
INSERT INTO `order_customer_item` VALUES ('136', null, '单次点播(67)', '单次点播(67)', '0.00', '1', '10.00', '10.00', '123', '0', null, '1444659159', null, null, null);
INSERT INTO `order_customer_item` VALUES ('137', '17', '主播包月', '主播：模特身材 30 天', '0.00', '1', '10.00', '10.00', '124', '0', '12', '1444709362', '33', '1444709362', '33');
INSERT INTO `order_customer_item` VALUES ('138', '14', '全站VIP', '主播：小刘女生 365 天', '0.00', '1', '10.00', '10.00', '124', '0', '14', '1444709362', '33', '1444709362', '33');
INSERT INTO `order_customer_item` VALUES ('139', null, '单次点播(43)', '单次点播(43)', '0.00', '1', '10.00', '10.00', '125', '0', null, '1444728121', null, null, null);
INSERT INTO `order_customer_item` VALUES ('140', null, '单次点播(86)', '单次点播(86)', '0.00', '1', '0.00', '0.00', '126', '0', null, '1444728882', null, null, null);
INSERT INTO `order_customer_item` VALUES ('141', null, '单次点播(13)', '单次点播(13)', '0.00', '1', '20.00', '20.00', '127', '0', null, '1444729465', null, null, null);
INSERT INTO `order_customer_item` VALUES ('142', null, '单次点播(113)', '单次点播(113)', '0.00', '1', '20.00', '20.00', '128', '0', null, '1444749639', null, null, null);
INSERT INTO `order_customer_item` VALUES ('143', '27', '包年全站VIP', '365 天', '0.00', '1', '200.00', '200.00', '129', '0', '-1', '1444752000', '35', '1444752000', '35');
INSERT INTO `order_customer_item` VALUES ('144', '32', '曲终人散', '主播：liu 365 天', '0.00', '1', '5.00', '5.00', '129', '0', '17', '1444752000', '35', '1444752000', '35');
INSERT INTO `order_customer_item` VALUES ('145', '17', '主播包月', '主播：xiaoyao 30 天', '0.00', '1', '10.00', '10.00', '129', '0', '16', '1444752000', '35', '1444752000', '35');
INSERT INTO `order_customer_item` VALUES ('146', '27', '[赠品] 包年全站VIP', '365 天', '0.00', '1', '0.00', '0.00', '129', '1', '-1', '1444752000', '35', '1444752000', '35');
INSERT INTO `order_customer_item` VALUES ('147', null, '单次点播(113)', '单次点播(113)', '0.00', '1', '20.00', '20.00', '130', '0', null, '1444900599', null, null, null);
INSERT INTO `order_customer_item` VALUES ('148', null, '单次点播(112)', '单次点播(112)', '0.00', '1', '0.00', '0.00', '131', '0', null, '1444900679', null, null, null);
INSERT INTO `order_customer_item` VALUES ('149', null, '单次点播(77)', '单次点播(77)', '0.00', '1', '5.00', '5.00', '132', '0', null, '1444985895', null, null, null);
INSERT INTO `order_customer_item` VALUES ('150', null, '单次点播(78)', '单次点播(78)', '0.00', '1', '30.00', '30.00', '133', '0', null, '1444985925', null, null, null);
INSERT INTO `order_customer_item` VALUES ('151', null, '单次点播(95)', '单次点播(95)', '0.00', '1', '20.00', '20.00', '134', '0', null, '1444989152', null, null, null);
INSERT INTO `order_customer_item` VALUES ('152', null, '单次点播(86)', '单次点播(86)', '0.00', '1', '0.00', '0.00', '135', '0', null, '1445221338', null, null, null);
INSERT INTO `order_customer_item` VALUES ('153', null, '单次点播(88)', '单次点播(88)', '0.00', '1', '20.00', '20.00', '136', '0', null, '1445221542', null, null, null);
INSERT INTO `order_customer_item` VALUES ('154', null, '单次点播(80)', '单次点播(80)', '0.00', '1', '10.00', '10.00', '137', '0', null, '1445221788', null, null, null);
INSERT INTO `order_customer_item` VALUES ('155', null, '单次点播(84)', '单次点播(84)', '0.00', '1', '20.00', '20.00', '138', '0', null, '1445222073', null, null, null);
INSERT INTO `order_customer_item` VALUES ('156', null, '单次点播(47)', '单次点播(47)', '0.00', '1', '30.00', '30.00', '139', '0', null, '1445223003', null, null, null);
INSERT INTO `order_customer_item` VALUES ('157', null, '单次点播(75)', '单次点播(75)', '0.00', '1', '10.00', '10.00', '140', '0', null, '1445223387', null, null, null);
INSERT INTO `order_customer_item` VALUES ('158', null, '单次点播(75)', '单次点播(75)', '0.00', '1', '10.00', '10.00', '141', '0', null, '1445223478', null, null, null);
INSERT INTO `order_customer_item` VALUES ('159', null, '单次点播(102)', '单次点播(102)', '0.00', '1', '10.00', '10.00', '142', '0', null, '1445223545', null, null, null);
INSERT INTO `order_customer_item` VALUES ('160', null, '单次点播(54)', '单次点播(54)', '0.00', '1', '50.00', '50.00', '143', '0', null, '1445224271', null, null, null);
INSERT INTO `order_customer_item` VALUES ('161', null, '单次点播(100)', '单次点播(100)', '0.00', '1', '5.00', '5.00', '144', '0', null, '1445224326', null, null, null);
INSERT INTO `order_customer_item` VALUES ('162', '17', '主播包月', '主播：test-liurong 30 天', '0.00', '1', '10.00', '10.00', '145', '0', '39', '1445249542', '30', '1445249542', '30');
INSERT INTO `order_customer_item` VALUES ('163', null, '单次点播(64)', '单次点播(64)', '0.00', '1', '20.00', '20.00', '146', '0', null, '1445249724', null, null, null);
INSERT INTO `order_customer_item` VALUES ('164', null, '单次点播(93)', '单次点播(93)', '0.00', '1', '10.00', '10.00', '147', '0', null, '1445308118', null, null, null);
INSERT INTO `order_customer_item` VALUES ('165', null, '单次点播(77)', '单次点播(77)', '0.00', '1', '5.00', '5.00', '148', '0', null, '1445667560', null, null, null);
INSERT INTO `order_customer_item` VALUES ('166', '33', '测试1015', '11 天', '17.60', '4', '11.00', '44.00', '149', '0', '-1', '1445667836', '34', '1445667836', '34');
INSERT INTO `order_customer_item` VALUES ('167', '16', '图片包月', '30 天', '0.00', '2', '10.00', '20.00', '150', '0', '-1', '1445752947', '34', '1445752947', '34');
INSERT INTO `order_customer_item` VALUES ('168', null, '单次点播(121)', '单次点播(121)', '0.00', '1', '111.00', '111.00', '151', '0', null, '1445776555', null, null, null);
INSERT INTO `order_customer_item` VALUES ('169', null, '单次点播(143)', '单次点播(143)', '0.00', '1', '10.00', '10.00', '152', '0', null, '1446175408', null, null, null);
INSERT INTO `order_customer_item` VALUES ('170', null, '单次点播(142)', '单次点播(142)', '0.00', '1', '0.20', '0.20', '153', '0', null, '1446175566', null, null, null);
INSERT INTO `order_customer_item` VALUES ('171', '40', '视频会员1天1102fas', '1 天', '0.00', '1', '6.00', '6.00', '154', '0', '-1', '1446433296', '40', '1446433296', '40');
INSERT INTO `order_customer_item` VALUES ('175', '28', 'NULL', '3 天', '0.00', '10', '10.00', '100.00', '158', '0', '-1', '1446447463', '40', '1446447463', '40');
INSERT INTO `order_customer_item` VALUES ('176', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_04 30 天', '0.00', '1', '0.00', '0.00', '158', '1', '33', '1446447463', '40', '1446447463', '40');
INSERT INTO `order_customer_item` VALUES ('179', '16', '图片包月', '30 天', '0.00', '3', '10.00', '30.00', '161', '0', '-1', '1446448011', '40', '1446448011', '40');
INSERT INTO `order_customer_item` VALUES ('180', '40', '[赠品] 视频会员1天1102fas', '1 天', '0.00', '1', '0.00', '0.00', '161', '1', '-1', '1446448011', '40', '1446448011', '40');
INSERT INTO `order_customer_item` VALUES ('182', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '163', '0', null, '1446449882', null, null, null);
INSERT INTO `order_customer_item` VALUES ('183', '16', '图片包月', '30 天', '0.00', '1', '10.00', '10.00', '164', '0', '-1', '1446451341', '44', '1446451341', '44');
INSERT INTO `order_customer_item` VALUES ('184', null, '单次点播(144)', '单次点播(144)', '0.00', '1', '50.05', '50.05', '165', '0', null, '1446453155', null, null, null);
INSERT INTO `order_customer_item` VALUES ('185', '20', '终身VIP', '30 天', '0.00', '1', '98.00', '98.00', '166', '0', '-1', '1446453483', '47', '1446453483', '47');
INSERT INTO `order_customer_item` VALUES ('186', '33', '[赠品] 测试1015', '11 天', '0.00', '1', '0.00', '0.00', '166', '1', '-1', '1446453483', '47', '1446453483', '47');
INSERT INTO `order_customer_item` VALUES ('187', '19', '黄昏', '30 天', '3.00', '1', '10.00', '10.00', '167', '0', '-1', '1446454811', '47', '1446454811', '47');
INSERT INTO `order_customer_item` VALUES ('189', '16', '图片包月', '30 天', '60.00', '30', '10.00', '300.00', '169', '0', '-1', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer_item` VALUES ('190', '40', '视频会员1天1102fas', '1 天', '2.40', '2', '6.00', '12.00', '169', '0', '-1', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer_item` VALUES ('191', '28', 'NULL', '3 天', '24.00', '12', '10.00', '120.00', '169', '0', '-1', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer_item` VALUES ('192', '40', '[赠品] 视频会员1天1102fas', '1 天', '0.00', '1', '0.00', '0.00', '169', '1', '-1', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer_item` VALUES ('193', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_05 30 天', '0.00', '1', '0.00', '0.00', '169', '1', '34', '1446456500', '47', '1446456500', '47');
INSERT INTO `order_customer_item` VALUES ('194', null, '单次点播(134)', '单次点播(134)', '0.00', '1', '32.00', '32.00', '170', '0', null, '1446458092', null, null, null);
INSERT INTO `order_customer_item` VALUES ('195', null, '单次点播(66)', '单次点播(66)', '0.00', '1', '5.00', '5.00', '171', '0', null, '1446458228', null, null, null);
INSERT INTO `order_customer_item` VALUES ('196', null, '单次点播(131)', '单次点播(131)', '0.00', '1', '21.00', '21.00', '172', '0', null, '1446458465', null, null, null);
INSERT INTO `order_customer_item` VALUES ('197', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '173', '0', null, '1446532292', null, null, null);
INSERT INTO `order_customer_item` VALUES ('198', null, '单次点播(144)', '单次点播(144)', '0.00', '1', '50.05', '50.05', '174', '0', null, '1446532385', null, null, null);
INSERT INTO `order_customer_item` VALUES ('199', null, '单次点播(77)', '单次点播(77)', '0.00', '1', '5.00', '5.00', '175', '0', null, '1446533938', null, null, null);
INSERT INTO `order_customer_item` VALUES ('200', null, '单次点播(126)', '单次点播(126)', '0.00', '1', '200.00', '200.00', '176', '0', null, '1446534957', null, null, null);
INSERT INTO `order_customer_item` VALUES ('201', null, '单次点播(121)', '单次点播(121)', '0.00', '1', '111.00', '111.00', '177', '0', null, '1446534964', null, null, null);
INSERT INTO `order_customer_item` VALUES ('202', null, '单次点播(127)', '单次点播(127)', '0.00', '1', '10.00', '10.00', '178', '0', null, '1446534973', null, null, null);
INSERT INTO `order_customer_item` VALUES ('203', null, '单次点播(124)', '单次点播(124)', '0.00', '1', '50.00', '50.00', '179', '0', null, '1446534982', null, null, null);
INSERT INTO `order_customer_item` VALUES ('204', null, '单次点播(78)', '单次点播(78)', '0.00', '1', '30.00', '30.00', '180', '0', null, '1446535161', null, null, null);
INSERT INTO `order_customer_item` VALUES ('205', null, '单次点播(79)', '单次点播(79)', '0.00', '1', '20.00', '20.00', '181', '0', null, '1446535189', null, null, null);
INSERT INTO `order_customer_item` VALUES ('206', null, '单次点播(154)', '单次点播(154)', '0.00', '1', '3.22', '3.22', '182', '0', null, '1446536025', null, null, null);
INSERT INTO `order_customer_item` VALUES ('207', null, '单次点播(153)', '单次点播(153)', '0.00', '1', '2.33', '2.33', '183', '0', null, '1446536035', null, null, null);
INSERT INTO `order_customer_item` VALUES ('208', null, '单次点播(152)', '单次点播(152)', '0.00', '1', '5.66', '5.66', '184', '0', null, '1446536044', null, null, null);
INSERT INTO `order_customer_item` VALUES ('209', null, '单次点播(151)', '单次点播(151)', '0.00', '1', '3.66', '3.66', '185', '0', null, '1446536056', null, null, null);
INSERT INTO `order_customer_item` VALUES ('210', null, '单次点播(150)', '单次点播(150)', '0.00', '1', '5.00', '5.00', '186', '0', null, '1446536065', null, null, null);
INSERT INTO `order_customer_item` VALUES ('211', null, '单次点播(149)', '单次点播(149)', '0.00', '1', '5.00', '5.00', '187', '0', null, '1446536079', null, null, null);
INSERT INTO `order_customer_item` VALUES ('212', null, '单次点播(154)', '单次点播(154)', '0.00', '1', '3.22', '3.22', '188', '0', null, '1446536260', null, null, null);
INSERT INTO `order_customer_item` VALUES ('213', null, '单次点播(153)', '单次点播(153)', '0.00', '1', '2.33', '2.33', '189', '0', null, '1446536300', null, null, null);
INSERT INTO `order_customer_item` VALUES ('214', null, '单次点播(152)', '单次点播(152)', '0.00', '1', '5.66', '5.66', '190', '0', null, '1446536317', null, null, null);
INSERT INTO `order_customer_item` VALUES ('215', null, '单次点播(151)', '单次点播(151)', '0.00', '1', '3.66', '3.66', '191', '0', null, '1446536331', null, null, null);
INSERT INTO `order_customer_item` VALUES ('216', null, '单次点播(154)', '单次点播(154)', '0.00', '1', '3.22', '3.22', '192', '0', null, '1446536514', null, null, null);
INSERT INTO `order_customer_item` VALUES ('217', null, '单次点播(153)', '单次点播(153)', '0.00', '1', '2.33', '2.33', '193', '0', null, '1446536521', null, null, null);
INSERT INTO `order_customer_item` VALUES ('218', null, '单次点播(152)', '单次点播(152)', '0.00', '1', '5.66', '5.66', '194', '0', null, '1446536527', null, null, null);
INSERT INTO `order_customer_item` VALUES ('219', null, '单次点播(151)', '单次点播(151)', '0.00', '1', '3.66', '3.66', '195', '0', null, '1446536535', null, null, null);
INSERT INTO `order_customer_item` VALUES ('220', '4', '视频包年', '365 天', '0.00', '5', '20.00', '100.00', '196', '0', '-1', '1446628221', '30', '1446628221', '30');
INSERT INTO `order_customer_item` VALUES ('221', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_05 30 天', '0.00', '1', '0.00', '0.00', '196', '1', '34', '1446628221', '30', '1446628221', '30');
INSERT INTO `order_customer_item` VALUES ('228', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '203', '0', null, '1446691315', null, null, null);
INSERT INTO `order_customer_item` VALUES ('229', '43', '满送优惠（2折）', '主播：gaylen 30 天', '5.60', '1', '7.00', '7.00', '204', '0', '36', '1446719054', '32', '1446719054', '32');
INSERT INTO `order_customer_item` VALUES ('230', '17', '主播包月', '主播：gaylen 30 天', '8.00', '1', '10.00', '10.00', '204', '0', '36', '1446719054', '32', '1446719054', '32');
INSERT INTO `order_customer_item` VALUES ('231', null, '单次点播(154)', '单次点播(154)', '0.00', '1', '3.22', '3.22', '205', '0', null, '1446775981', null, null, null);
INSERT INTO `order_customer_item` VALUES ('232', null, '单次点播(159)', '单次点播(159)', '0.00', '1', '7.63', '7.63', '206', '0', null, '1446776669', null, null, null);
INSERT INTO `order_customer_item` VALUES ('233', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '207', '0', null, '1446778260', null, null, null);
INSERT INTO `order_customer_item` VALUES ('234', null, '单次点播(150)', '单次点播(150)', '0.00', '1', '5.00', '5.00', '208', '0', null, '1446781536', null, null, null);
INSERT INTO `order_customer_item` VALUES ('235', '17', '主播包月', '主播：test_03 30 天', '0.00', '1', '10.00', '10.00', '209', '0', '32', '1446796819', '30', '1446796819', '30');
INSERT INTO `order_customer_item` VALUES ('236', '43', '满送优惠（2折）', '主播：test_03 30 天', '0.00', '1', '7.00', '7.00', '209', '0', '32', '1446796819', '30', '1446796819', '30');
INSERT INTO `order_customer_item` VALUES ('237', '40', '视频会员1天1102fas', '1 天', '0.00', '1', '6.00', '6.00', '210', '0', '-1', '1446796906', '30', '1446796906', '30');
INSERT INTO `order_customer_item` VALUES ('238', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '211', '0', null, '1446812029', null, null, null);
INSERT INTO `order_customer_item` VALUES ('239', null, '单次点播(123)', '单次点播(123)', '0.00', '1', '55.00', '55.00', '212', '0', null, '1446812498', null, null, null);
INSERT INTO `order_customer_item` VALUES ('240', null, '单次点播(122)', '单次点播(122)', '0.00', '1', '100.00', '100.00', '213', '0', null, '1446812502', null, null, null);
INSERT INTO `order_customer_item` VALUES ('241', null, '单次点播(121)', '单次点播(121)', '0.00', '1', '111.00', '111.00', '214', '0', null, '1446812506', null, null, null);
INSERT INTO `order_customer_item` VALUES ('242', null, '单次点播(109)', '单次点播(109)', '0.00', '1', '5.00', '5.00', '215', '0', null, '1446812515', null, null, null);
INSERT INTO `order_customer_item` VALUES ('243', null, '单次点播(120)', '单次点播(120)', '0.00', '1', '10.00', '10.00', '216', '0', null, '1446812679', null, null, null);
INSERT INTO `order_customer_item` VALUES ('244', null, '单次点播(129)', '单次点播(129)', '0.00', '1', '2.39', '2.39', '217', '0', null, '1446813605', null, null, null);
INSERT INTO `order_customer_item` VALUES ('245', null, '单次点播(164)', '单次点播(164)', '0.00', '1', '10.00', '10.00', '218', '0', null, '1446866401', null, null, null);
INSERT INTO `order_customer_item` VALUES ('246', '27', '包年全站VIP', '365 天', '40.00', '1', '200.00', '200.00', '219', '0', '-1', '1446888690', '30', '1446888690', '30');
INSERT INTO `order_customer_item` VALUES ('247', null, '单次点播(129)', '单次点播(129)', '0.00', '1', '2.39', '2.39', '220', '0', null, '1447034279', null, null, null);
INSERT INTO `order_customer_item` VALUES ('248', null, '单次点播(60)', '单次点播(60)', '0.00', '1', '5.00', '5.00', '221', '0', null, '1447035114', null, null, null);
INSERT INTO `order_customer_item` VALUES ('249', null, '单次点播(161)', '单次点播(161)', '0.00', '1', '5.00', '5.00', '222', '0', null, '1447035124', null, null, null);
INSERT INTO `order_customer_item` VALUES ('250', '17', '主播包月', '主播：test-liurong 30 天', '0.00', '1', '10.00', '10.00', '223', '0', '39', '1447086250', '3', '1447086250', '3');
INSERT INTO `order_customer_item` VALUES ('251', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test-liurong 30 天', '0.00', '1', '0.00', '0.00', '223', '1', '39', '1447086250', '3', '1447086250', '3');
INSERT INTO `order_customer_item` VALUES ('252', null, '单次点播(153)', '单次点播(153)', '0.00', '1', '2.33', '2.33', '224', '0', null, '1447136873', null, null, null);
INSERT INTO `order_customer_item` VALUES ('253', null, '单次点播(95)', '单次点播(95)', '0.00', '1', '20.00', '20.00', '225', '0', null, '1447136916', null, null, null);
INSERT INTO `order_customer_item` VALUES ('254', null, '单次点播(161)', '单次点播(161)', '0.00', '1', '5.00', '5.00', '226', '0', null, '1447137038', null, null, null);
INSERT INTO `order_customer_item` VALUES ('255', null, '单次点播(148)', '单次点播(148)', '0.00', '1', '10.00', '10.00', '227', '0', null, '1447137062', null, null, null);
INSERT INTO `order_customer_item` VALUES ('256', null, '单次点播(158)', '单次点播(158)', '0.00', '1', '9.00', '9.00', '228', '0', null, '1447137144', null, null, null);
INSERT INTO `order_customer_item` VALUES ('257', null, '单次点播(145)', '单次点播(145)', '0.00', '1', '30.99', '30.99', '229', '0', null, '1447137214', null, null, null);
INSERT INTO `order_customer_item` VALUES ('258', null, '单次点播(66)', '单次点播(66)', '0.00', '1', '5.00', '5.00', '230', '0', null, '1447137259', null, null, null);
INSERT INTO `order_customer_item` VALUES ('259', null, '单次点播(92)', '单次点播(92)', '0.00', '1', '0.00', '0.00', '231', '0', null, '1447137388', null, null, null);
INSERT INTO `order_customer_item` VALUES ('260', null, '单次点播(57)', '单次点播(57)', '0.00', '1', '10.00', '10.00', '232', '0', null, '1447137441', null, null, null);
INSERT INTO `order_customer_item` VALUES ('261', null, '单次点播(86)', '单次点播(86)', '0.00', '1', '0.00', '0.00', '233', '0', null, '1447138518', null, null, null);
INSERT INTO `order_customer_item` VALUES ('262', null, '单次点播(84)', '单次点播(84)', '0.00', '1', '20.00', '20.00', '234', '0', null, '1447138548', null, null, null);
INSERT INTO `order_customer_item` VALUES ('263', '16', '图片包月', '30 天', '0.00', '2', '10.00', '20.00', '235', '0', '-1', '1447141791', '41', '1447141791', '41');
INSERT INTO `order_customer_item` VALUES ('264', '16', '图片包月', '30 天', '0.00', '2', '10.00', '20.00', '236', '0', '-1', '1447142051', '41', '1447142051', '41');
INSERT INTO `order_customer_item` VALUES ('265', '30', '[赠品] zyTest', '0 天', '0.00', '1', '0.00', '0.00', '236', '1', '-1', '1447142051', '41', '1447142051', '41');
INSERT INTO `order_customer_item` VALUES ('266', null, '单次点播(97)', '单次点播(97)', '0.00', '1', '10.00', '10.00', '237', '0', null, '1447146647', null, null, null);
INSERT INTO `order_customer_item` VALUES ('267', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '238', '0', '-1', '1447149009', '3', '1447149009', '3');
INSERT INTO `order_customer_item` VALUES ('268', '16', '图片包月', '30 天', '0.00', '1', '10.00', '10.00', '239', '0', '-1', '1447149225', '3', '1447149225', '3');
INSERT INTO `order_customer_item` VALUES ('269', '30', '[赠品] zyTest', '0 天', '0.00', '1', '0.00', '0.00', '239', '1', '-1', '1447149225', '3', '1447149225', '3');
INSERT INTO `order_customer_item` VALUES ('270', '17', '主播包月', '主播：gaylen 30 天', '0.00', '1', '10.00', '10.00', '240', '0', '36', '1447209983', '25', '1447209983', '25');
INSERT INTO `order_customer_item` VALUES ('271', '26', '主播包年', '主播：p02 365 天', '0.00', '1', '100.00', '100.00', '241', '0', '45', '1447210107', '30', '1447210107', '30');
INSERT INTO `order_customer_item` VALUES ('272', '26', '主播包年', '主播：xiaosan 365 天', '0.00', '1', '100.00', '100.00', '242', '0', '22', '1447210138', '30', '1447210138', '30');
INSERT INTO `order_customer_item` VALUES ('273', null, '单次点播(148)', '单次点播(148)', '0.00', '1', '10.00', '10.00', '243', '0', null, '1447576223', null, null, null);
INSERT INTO `order_customer_item` VALUES ('274', '33', '测试1015', '11 天', '8.80', '1', '11.00', '11.00', '244', '0', '-1', '1447583001', '40', '1447583001', '40');
INSERT INTO `order_customer_item` VALUES ('275', '32', '曲终人散', '主播：test-liurong 365 天', '8.00', '2', '5.00', '10.00', '244', '0', '39', '1447583002', '40', '1447583002', '40');
INSERT INTO `order_customer_item` VALUES ('276', '32', '[特价] 曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_04 365 天', '0.00', '1', '3.00', '3.00', '244', '1', '33', '1447583002', '40', '1447583002', '40');
INSERT INTO `order_customer_item` VALUES ('277', '40', '视频会员1天1102fas', '1 天', '0.00', '3', '6.00', '18.00', '245', '0', '-1', '1447643570', '40', '1447643570', '40');
INSERT INTO `order_customer_item` VALUES ('278', '17', '主播包月', '主播：test_04 30 天', '0.00', '3', '10.00', '30.00', '245', '0', '33', '1447643570', '40', '1447643570', '40');
INSERT INTO `order_customer_item` VALUES ('279', '19', '黄昏', '30 天', '0.00', '2', '10.00', '20.00', '245', '0', '-1', '1447643570', '40', '1447643570', '40');
INSERT INTO `order_customer_item` VALUES ('280', '38', '[赠品] 资源包年会员Cc123!@#包', '0 天', '0.00', '1', '0.00', '0.00', '245', '1', '-1', '1447643570', '40', '1447643570', '40');
INSERT INTO `order_customer_item` VALUES ('281', null, '单次点播(159)', '单次点播(159)', '0.00', '1', '7.63', '7.63', '246', '0', null, '1447817350', null, null, null);
INSERT INTO `order_customer_item` VALUES ('282', null, '单次点播(134)', '单次点播(134)', '0.00', '1', '32.00', '32.00', '247', '0', null, '1447817374', null, null, null);
INSERT INTO `order_customer_item` VALUES ('283', '16', '图片包月', '30 天', '16.00', '2', '10.00', '20.00', '248', '0', '-1', '1447829161', '41', '1447829161', '41');
INSERT INTO `order_customer_item` VALUES ('284', '26', '[赠品] 主播包年&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_03 365 天', '0.00', '1', '0.00', '0.00', '248', '1', '32', '1447829161', '41', '1447829161', '41');
INSERT INTO `order_customer_item` VALUES ('285', '19', '黄昏', '30 天', '18.00', '2', '10.00', '20.00', '249', '0', '-1', '1447831306', '43', '1447831306', '43');
INSERT INTO `order_customer_item` VALUES ('286', '15', '视频包月', '30 天', '0.00', '2', '10.00', '20.00', '250', '0', '-1', '1447836254', '43', '1447836254', '43');
INSERT INTO `order_customer_item` VALUES ('287', '32', '[特价] 曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test-liurong 365 天', '0.00', '1', '20.00', '20.00', '250', '1', '39', '1447836254', '43', '1447836254', '43');
INSERT INTO `order_customer_item` VALUES ('288', '17', '主播包月', '主播：p02 30 天', '0.00', '1', '10.00', '10.00', '251', '0', '45', '1447836612', '43', '1447836612', '43');
INSERT INTO `order_customer_item` VALUES ('289', '17', '主播包月', '主播：gaylen 30 天', '0.00', '1', '10.00', '10.00', '251', '0', '36', '1447836612', '43', '1447836612', '43');
INSERT INTO `order_customer_item` VALUES ('290', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_03 30 天', '0.00', '1', '0.00', '0.00', '251', '1', '32', '1447836612', '43', '1447836612', '43');
INSERT INTO `order_customer_item` VALUES ('291', null, '单次点播(181)', '单次点播(181)', '0.00', '1', '100.00', '100.00', '252', '0', null, '1447916772', null, null, null);
INSERT INTO `order_customer_item` VALUES ('292', null, '单次点播(182)', '单次点播(182)', '0.00', '1', '20.00', '20.00', '253', '0', null, '1447917122', null, null, null);
INSERT INTO `order_customer_item` VALUES ('293', null, '单次点播(187)', '单次点播(187)', '0.00', '1', '30.00', '30.00', '254', '0', null, '1447926765', null, null, null);
INSERT INTO `order_customer_item` VALUES ('294', null, '单次点播(180)', '单次点播(180)', '0.00', '1', '33.00', '33.00', '255', '0', null, '1447926990', null, null, null);
INSERT INTO `order_customer_item` VALUES ('295', '17', '主播包月', '主播：test-liurong 30 天', '0.00', '1', '10.00', '10.00', '256', '0', '39', '1448009994', '35', '1448009994', '35');
INSERT INTO `order_customer_item` VALUES ('296', '17', '主播包月', '主播：gaylen 30 天', '0.00', '1', '10.00', '10.00', '256', '0', '36', '1448009994', '35', '1448009994', '35');
INSERT INTO `order_customer_item` VALUES ('297', '50', '[赠品] 小飞侠', '50 天', '0.00', '1', '0.00', '0.00', '256', '1', '-1', '1448009994', '35', '1448009994', '35');
INSERT INTO `order_customer_item` VALUES ('298', '17', '主播包月', '主播：test_04 30 天', '0.00', '1', '10.00', '10.00', '257', '0', '33', '1448010116', '35', '1448010116', '35');
INSERT INTO `order_customer_item` VALUES ('299', '17', '主播包月', '主播：test_03 30 天', '0.00', '1', '10.00', '10.00', '257', '0', '32', '1448010116', '35', '1448010116', '35');
INSERT INTO `order_customer_item` VALUES ('300', '50', '[赠品] 小飞侠', '50 天', '0.00', '1', '0.00', '0.00', '257', '1', '-1', '1448010116', '35', '1448010116', '35');
INSERT INTO `order_customer_item` VALUES ('301', '17', '主播包月', '主播：test_03 30 天', '0.00', '1', '10.00', '10.00', '258', '0', '32', '1448011938', '31', '1448011938', '31');
INSERT INTO `order_customer_item` VALUES ('302', '17', '主播包月', '主播：test_02 30 天', '0.00', '1', '10.00', '10.00', '258', '0', '31', '1448011938', '31', '1448011938', '31');
INSERT INTO `order_customer_item` VALUES ('303', '50', '[赠品] 小飞侠', '50 天', '0.00', '1', '0.00', '0.00', '258', '1', '-1', '1448011938', '31', '1448011938', '31');
INSERT INTO `order_customer_item` VALUES ('304', '17', '主播包月', '主播：test_04 30 天', '0.00', '1', '10.00', '10.00', '259', '0', '33', '1448031752', '3', '1448031752', '3');
INSERT INTO `order_customer_item` VALUES ('305', '17', '主播包月', '主播：test-liurong 30 天', '0.00', '2', '10.00', '20.00', '260', '0', '39', '1448270875', '35', '1448270875', '35');
INSERT INTO `order_customer_item` VALUES ('306', '17', '主播包月', '主播：test_02 30 天', '0.00', '1', '10.00', '10.00', '260', '0', '31', '1448270875', '35', '1448270875', '35');
INSERT INTO `order_customer_item` VALUES ('307', '17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_05 30 天', '0.00', '1', '0.00', '0.00', '260', '1', '34', '1448270875', '35', '1448270875', '35');
INSERT INTO `order_customer_item` VALUES ('308', '17', '主播包月', '主播：test_01 30 天', '0.00', '5', '10.00', '50.00', '261', '0', '30', '1448272496', '35', '1448272496', '35');
INSERT INTO `order_customer_item` VALUES ('309', '16', '[赠品] 图片包月', '30 天', '0.00', '1', '0.00', '0.00', '261', '1', '-1', '1448272496', '35', '1448272496', '35');
INSERT INTO `order_customer_item` VALUES ('310', '17', '主播包月', '主播：test-liurong 30 天', '0.00', '2', '10.00', '20.00', '262', '0', '39', '1448333895', '35', '1448333895', '35');
INSERT INTO `order_customer_item` VALUES ('311', '47', 'franktesting', '11 天', '0.00', '2', '10.00', '20.00', '262', '0', '-1', '1448333895', '35', '1448333895', '35');
INSERT INTO `order_customer_item` VALUES ('312', '43', '[赠品] 满送优惠（2折）&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：rr 30 天', '0.00', '1', '0.00', '0.00', '262', '1', '20', '1448333895', '35', '1448333895', '35');
INSERT INTO `order_customer_item` VALUES ('313', '16', '[赠品] 图片包月', '30 天', '0.00', '1', '0.00', '0.00', '262', '1', '-1', '1448333895', '35', '1448333895', '35');
INSERT INTO `order_customer_item` VALUES ('314', '17', '主播包月', '主播：gaylen 30 天', '20.00', '2', '10.00', '20.00', '263', '0', '36', '1448373137', '30', '1448373137', '30');
INSERT INTO `order_customer_item` VALUES ('315', '18', '全站包年', '365 天', '10.00', '1', '200.00', '200.00', '263', '0', '-1', '1448373137', '30', '1448373137', '30');
INSERT INTO `order_customer_item` VALUES ('316', '43', '[赠品] 满送优惠（2折）&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：gaylen 30 天', '0.00', '1', '0.00', '0.00', '263', '1', '36', '1448373137', '30', '1448373137', '30');
INSERT INTO `order_customer_item` VALUES ('317', '17', '主播包月', '主播：test_05 30 天', '0.00', '2', '10.00', '20.00', '264', '0', '34', '1448439472', '42', '1448439472', '42');
INSERT INTO `order_customer_item` VALUES ('318', '29', '[赠品] 产品名称new', '15 天', '0.00', '1', '0.00', '0.00', '264', '1', '-1', '1448439472', '42', '1448439472', '42');
INSERT INTO `order_customer_item` VALUES ('319', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '265', '0', '-1', '1448442432', '42', '1448442432', '42');
INSERT INTO `order_customer_item` VALUES ('320', '15', '视频包月', '30 天', '0.00', '2', '10.00', '20.00', '266', '0', '-1', '1448442707', '42', '1448442707', '42');
INSERT INTO `order_customer_item` VALUES ('321', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '267', '0', '-1', '1448443272', '42', '1448443272', '42');
INSERT INTO `order_customer_item` VALUES ('322', '20', '终身VIP', '30 天', '0.00', '1', '98.00', '98.00', '267', '0', '-1', '1448443272', '42', '1448443272', '42');
INSERT INTO `order_customer_item` VALUES ('323', '42', '满送优惠（免费）', '365 天', '0.00', '1', '3.00', '3.00', '268', '0', '-1', '1448444089', '42', '1448444089', '42');
INSERT INTO `order_customer_item` VALUES ('324', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_05 30 天', '0.00', '3', '10.00', '30.00', '269', '0', '34', '1448511822', '34', '1448511822', '34');
INSERT INTO `order_customer_item` VALUES ('325', '16', '图片包月', '30 天', '0.00', '3', '10.00', '30.00', '269', '0', '-1', '1448511822', '34', '1448511822', '34');
INSERT INTO `order_customer_item` VALUES ('326', '29', '[特价] 产品名称new', '15 天', '0.00', '1', '1.00', '1.00', '269', '1', '-1', '1448511822', '34', '1448511822', '34');
INSERT INTO `order_customer_item` VALUES ('327', '29', '[赠品] 产品名称new', '15 天', '0.00', '1', '0.00', '0.00', '269', '1', '-1', '1448511822', '34', '1448511822', '34');
INSERT INTO `order_customer_item` VALUES ('328', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：gaylen 30 天', '0.00', '3', '10.00', '30.00', '270', '0', '36', '1448511873', '34', '1448511873', '34');
INSERT INTO `order_customer_item` VALUES ('329', '29', '[特价] 产品名称new', '15 天', '0.00', '1', '1.00', '1.00', '270', '1', '-1', '1448511873', '34', '1448511873', '34');
INSERT INTO `order_customer_item` VALUES ('330', '32', '曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test-liurong 365 天', '0.00', '1', '5.00', '5.00', '271', '0', '39', '1448512016', '34', '1448512016', '34');
INSERT INTO `order_customer_item` VALUES ('331', '27', '包年全站VIP', '365 天', '0.00', '1', '200.00', '200.00', '272', '0', '-1', '1448513490', '3', '1448513490', '3');
INSERT INTO `order_customer_item` VALUES ('332', '29', '[赠品] 产品名称new', '15 天', '0.00', '1', '0.00', '0.00', '272', '1', '-1', '1448513490', '3', '1448513490', '3');
INSERT INTO `order_customer_item` VALUES ('333', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：gaylen 30 天', '9.00', '1', '10.00', '10.00', '273', '0', '36', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('334', '4', '视频包年', '365 天', '18.00', '1', '20.00', '20.00', '273', '0', '-1', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('335', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_03 30 天', '9.00', '1', '10.00', '10.00', '273', '0', '32', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('336', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_02 30 天', '18.00', '2', '10.00', '20.00', '273', '0', '31', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('337', '40', '视频会员1天1102fas', '1 天', '5.40', '1', '6.00', '6.00', '273', '0', '-1', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('338', '16', '[赠品] 图片包月', '30 天', '0.00', '1', '0.00', '0.00', '273', '1', '-1', '1448526053', '34', '1448526053', '34');
INSERT INTO `order_customer_item` VALUES ('339', '40', '视频会员1天1102fas', '1 天', '5.40', '1', '6.00', '6.00', '274', '0', '-1', '1448526114', '34', '1448526114', '34');
INSERT INTO `order_customer_item` VALUES ('340', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_06 30 天', '18.00', '2', '10.00', '20.00', '275', '0', '35', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer_item` VALUES ('341', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test-liurong 30 天', '9.00', '1', '10.00', '10.00', '275', '0', '39', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer_item` VALUES ('342', '26', '主播包年&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：小新测试 365 天', '90.00', '1', '100.00', '100.00', '275', '0', '29', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer_item` VALUES ('343', '29', '[特价] 产品名称new', '15 天', '0.00', '1', '1.00', '1.00', '275', '1', '-1', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer_item` VALUES ('344', '44', '[特价] 主播三天', '11 天', '0.00', '1', '1.00', '1.00', '275', '1', '-1', '1448605932', '34', '1448605932', '34');
INSERT INTO `order_customer_item` VALUES ('345', '32', '曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：rr 365 天', '4.50', '1', '5.00', '5.00', '276', '0', '20', '1448605987', '34', '1448605987', '34');
INSERT INTO `order_customer_item` VALUES ('346', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：豆豆 30 天', '9.00', '1', '10.00', '10.00', '277', '0', '1', '1448606082', '34', '1448606082', '34');
INSERT INTO `order_customer_item` VALUES ('347', '44', '[特价] 主播三天', '11 天', '0.00', '1', '1.00', '1.00', '277', '1', '-1', '1448606082', '34', '1448606082', '34');
INSERT INTO `order_customer_item` VALUES ('348', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：豆豆 30 天', '9.00', '1', '10.00', '10.00', '278', '0', '1', '1448606394', '35', '1448606394', '35');
INSERT INTO `order_customer_item` VALUES ('349', '44', '[特价] 主播三天', '11 天', '0.00', '1', '1.00', '1.00', '278', '1', '-1', '1448606394', '35', '1448606394', '35');
INSERT INTO `order_customer_item` VALUES ('350', '32', '曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：小新测试 365 天', '4.50', '1', '5.00', '5.00', '279', '0', '29', '1448606649', '35', '1448606649', '35');
INSERT INTO `order_customer_item` VALUES ('351', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：test_01 30 天', '9.00', '1', '10.00', '10.00', '280', '0', '30', '1448613525', '34', '1448613525', '34');
INSERT INTO `order_customer_item` VALUES ('352', '44', '[特价] 主播三天', '11 天', '0.00', '1', '1.00', '1.00', '280', '1', '-1', '1448613525', '34', '1448613525', '34');
INSERT INTO `order_customer_item` VALUES ('353', '48', '产品价格测试', '365 天', '0.00', '1', '99.00', '99.00', '281', '0', '-1', '1448718843', '41', '1448718843', '41');
INSERT INTO `order_customer_item` VALUES ('354', '44', '主播三天', '11 天', '0.00', '1', '3.00', '3.00', '281', '0', '-1', '1448718843', '41', '1448718843', '41');
INSERT INTO `order_customer_item` VALUES ('355', '52', '[赠品] 论坛权限产品', '6 天', '0.00', '1', '0.00', '0.00', '281', '1', '-1', '1448718843', '41', '1448718843', '41');
INSERT INTO `order_customer_item` VALUES ('356', '33', '测试1015', '11 天', '0.00', '1', '11.00', '11.00', '282', '0', '-1', '1448719357', '41', '1448719357', '41');
INSERT INTO `order_customer_item` VALUES ('357', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '283', '0', '-1', '1448719437', '41', '1448719437', '41');
INSERT INTO `order_customer_item` VALUES ('358', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '284', '0', '-1', '1448770460', '41', '1448770460', '41');
INSERT INTO `order_customer_item` VALUES ('359', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '285', '0', '-1', '1448770520', '41', '1448770520', '41');
INSERT INTO `order_customer_item` VALUES ('360', '18', '全站包年', '365 天', '0.00', '1', '200.00', '200.00', '286', '0', '-1', '1448770643', '41', '1448770643', '41');
INSERT INTO `order_customer_item` VALUES ('361', '26', '[赠品] 主播包年&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：gaylen 365 天', '0.00', '1', '0.00', '0.00', '286', '1', '36', '1448770643', '41', '1448770643', '41');
INSERT INTO `order_customer_item` VALUES ('362', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '287', '0', '-1', '1448848545', '3', '1448848545', '3');
INSERT INTO `order_customer_item` VALUES ('363', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '288', '0', '-1', '1448848596', '3', '1448848596', '3');
INSERT INTO `order_customer_item` VALUES ('364', '15', '视频包月', '30 天', '0.00', '1', '10.00', '10.00', '289', '0', '-1', '1448848626', '3', '1448848626', '3');
INSERT INTO `order_customer_item` VALUES ('365', '18', '全站包年', '365 天', '0.00', '1', '200.00', '200.00', '290', '0', '-1', '1448849553', '3', '1448849553', '3');
INSERT INTO `order_customer_item` VALUES ('366', null, '单次点播(199)', '单次点播(199)', '0.00', '1', '12.00', '12.00', '291', '0', null, '1448867254', null, null, null);
INSERT INTO `order_customer_item` VALUES ('367', '44', '主播三天', '11 天', '2.70', '1', '3.00', '3.00', '292', '0', '-1', '1448870032', '41', '1448870032', '41');
INSERT INTO `order_customer_item` VALUES ('368', '48', '产品价格测试', '365 天', '89.10', '1', '99.00', '99.00', '292', '0', '-1', '1448870032', '41', '1448870032', '41');
INSERT INTO `order_customer_item` VALUES ('369', '52', '[赠品] 论坛权限产品', '6 天', '0.00', '1', '0.00', '0.00', '292', '1', '-1', '1448870032', '41', '1448870032', '41');
INSERT INTO `order_customer_item` VALUES ('370', '40', '视频会员1天1102fas', '1 天', '5.40', '1', '6.00', '6.00', '293', '0', '-1', '1448875355', '41', '1448875355', '41');
INSERT INTO `order_customer_item` VALUES ('371', '15', '视频包月', '30 天', '9.00', '1', '10.00', '10.00', '294', '0', '-1', '1448875457', '41', '1448875457', '41');
INSERT INTO `order_customer_item` VALUES ('372', '27', '包年全站VIP', '365 天', '180.00', '1', '200.00', '200.00', '295', '0', '-1', '1448875557', '41', '1448875557', '41');
INSERT INTO `order_customer_item` VALUES ('373', '44', '主播三天', '11 天', '0.00', '1', '3.00', '3.00', '296', '0', '-1', '1449137894', '41', '1449137894', '41');
INSERT INTO `order_customer_item` VALUES ('374', '48', '产品价格测试', '365 天', '0.00', '1', '99.00', '99.00', '296', '0', '-1', '1449137894', '41', '1449137894', '41');
INSERT INTO `order_customer_item` VALUES ('375', '52', '[赠品] 论坛权限产品', '6 天', '0.00', '1', '0.00', '0.00', '296', '1', '-1', '1449137894', '41', '1449137894', '41');
INSERT INTO `order_customer_item` VALUES ('376', '20', '终身VIP', '30 天', '88.20', '1', '98.00', '98.00', '297', '0', '-1', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer_item` VALUES ('377', '16', '图片包月', '30 天', '9.00', '1', '10.00', '10.00', '297', '0', '-1', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer_item` VALUES ('378', '44', '主播三天', '11 天', '2.70', '1', '3.00', '3.00', '297', '0', '-1', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer_item` VALUES ('379', '48', '产品价格测试', '365 天', '89.10', '1', '99.00', '99.00', '297', '0', '-1', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer_item` VALUES ('380', '52', '[赠品] 论坛权限产品', '6 天', '0.00', '1', '0.00', '0.00', '297', '1', '-1', '1449138101', '41', '1449138101', '41');
INSERT INTO `order_customer_item` VALUES ('381', '17', '主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '主播：gaylen 30 天', '9.00', '1', '10.00', '10.00', '298', '0', '36', '1449138216', '41', '1449138216', '41');

-- ----------------------------
-- Table structure for order_customer_item_promotion
-- ----------------------------
DROP TABLE IF EXISTS `order_customer_item_promotion`;
CREATE TABLE `order_customer_item_promotion` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '消费订单',
  `order_customer_item_id` bigint(20) DEFAULT NULL COMMENT '订单明细',
  `order_customer_promotion_id` bigint(20) DEFAULT NULL COMMENT '订单促销',
  `promotion_type` int(2) DEFAULT NULL COMMENT '促销类型0 满送优惠  1限时折扣',
  `promotion_id` bigint(20) unsigned DEFAULT NULL COMMENT '促销活动',
  `promotion_amount` decimal(16,2) DEFAULT '0.00' COMMENT '优惠金额',
  `promotion_title` varchar(300) DEFAULT NULL COMMENT '促销标题',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='会员消费订单-促销活动-明细对应表';

-- ----------------------------
-- Records of order_customer_item_promotion
-- ----------------------------
INSERT INTO `order_customer_item_promotion` VALUES ('1', '18', '18', null, '1', '8', '0.00', '测试活动', '1440753491', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('2', '21', '21', null, '1', '8', '0.00', '测试活动', '1440754148', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('3', '21', '22', null, '1', '8', '0.00', '测试活动', '1440754148', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('4', '66', '67', null, '1', '9', '1.00', '金秋十月大促销', '1441962009', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('5', '74', '75', null, '0', '64', '0.00', '十月一满送优惠', '1442570020', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('6', '75', '77', null, '0', '64', '0.00', '十月一满送优惠', '1442570466', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('7', '77', '80', null, '0', '64', '0.00', '十月一满送优惠', '1442902676', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('8', '95', '99', null, '0', '64', '0.00', '十月一满送优惠', '1443082379', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('9', '96', '101', null, '0', '64', '0.00', '十月一满送优惠', '1443083071', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('10', '97', '103', null, '0', '64', '0.00', '十月一满送优惠', '1443423883', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('11', '101', '108', null, '0', '64', '0.00', '十月一满送优惠', '1443430522', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('12', '110', '118', null, '1', '21', '69.00', 'test2', '1444378668', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('13', '111', '119', null, '1', '21', '690.00', 'test2', '1444378884', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('14', '117', '125', null, '1', '28', '200.00', 'ms', '1444490207', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('15', '117', '125', null, '0', '72', '200.00', 'ms', '1444490207', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('16', '117', '126', null, '1', '28', '400.00', 'zk200', '1444490207', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('17', '117', '127', null, '1', '28', '200.00', 'zk200', '1444490207', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('18', '118', '130', null, '0', '72', '0.00', 'ms', '1444490747', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('19', '129', '143', null, '0', '80', '0.00', 'ms_zh', '1444752000', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('20', '149', '166', null, '1', '38', '17.60', '活动_03', '1445667836', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('24', '158', '175', null, '0', '88', '0.00', '订单金额100Bb!@#00122', '1446447463', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('27', '161', '179', null, '0', '93', '0.00', '图片包月数量3免费', '1446448011', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('29', '166', '185', null, '0', '98', '0.00', '产品组合所有会员类型', '1446453483', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('30', '167', '187', null, '1', '51', '3.00', '部分折扣-黄昏-', '1446454811', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('33', '169', '189', null, '1', '50', '60.00', '全店折扣，图片包月数量3免费', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('34', '169', '189', null, '0', '93', '60.00', '全店折扣，图片包月数量3免费', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('35', '169', '190', null, '1', '50', '2.40', '全店折扣，订单金额100Bb!@#00122', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('36', '169', '190', null, '0', '88', '2.40', '全店折扣，订单金额100Bb!@#00122', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('37', '169', '191', null, '1', '50', '24.00', '全店折扣，订单金额100Bb!@#00122', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('38', '169', '191', null, '0', '88', '24.00', '全店折扣，订单金额100Bb!@#00122', '1446456500', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('39', '196', '220', null, '0', '88', '0.00', '订单金额100Bb!@#00122', '1446628221', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('46', '204', '229', null, '1', '56', '5.60', '全店参与折扣20%', '1446719054', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('47', '204', '230', null, '1', '56', '8.00', '全店参与折扣20%', '1446719054', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('48', '219', '246', null, '1', '50', '40.00', '全店折扣0.3', '1446888690', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('49', '223', '250', null, '0', '103', '0.00', '满二送一', '1447086250', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('50', '236', '264', null, '0', '103', '0.00', '满二送一', '1447142051', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('51', '239', '268', null, '0', '103', '0.00', '满二送一', '1447149225', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('52', '244', '274', null, '1', '56', '8.80', '全店参与折扣20%，满20送（曲终人散优惠价3）', '1447583001', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('53', '244', '274', null, '0', '107', '8.80', '全店参与折扣20%，满20送（曲终人散优惠价3）', '1447583002', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('54', '244', '275', null, '1', '56', '8.00', '全店参与折扣20%，满20送（曲终人散优惠价3）', '1447583002', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('55', '244', '275', null, '0', '107', '8.00', '全店参与折扣20%，满20送（曲终人散优惠价3）', '1447583002', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('56', '245', '279', null, '0', '109', '0.00', '视频-黄昏买2送1资源包年会员Cc123!@#包', '1447643570', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('57', '248', '283', null, '1', '60', '16.00', 'asdas，产品组合图片、视频包月会员', '1447829161', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('58', '248', '283', null, '0', '100', '16.00', 'asdas，产品组合图片、视频包月会员', '1447829161', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('59', '249', '285', null, '1', '65', '18.00', '1折', '1447831306', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('60', '250', '286', null, '0', '117', '0.00', '特价商品', '1447836254', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('61', '251', '288', null, '0', '112', '0.00', '主播包养满送（二送一测试）', '1447836612', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('62', '251', '289', null, '0', '112', '0.00', '', '1447836612', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('63', '256', '295', null, '0', '112', '0.00', '主播包养满送（二送一测试）', '1448009994', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('64', '256', '296', null, '0', '112', '0.00', '', '1448009994', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('65', '257', '298', null, '0', '112', '0.00', '主播包养满送（二送一测试）', '1448010116', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('66', '257', '299', null, '0', '112', '0.00', '', '1448010116', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('67', '258', '301', null, '0', '112', '0.00', '主播包养满送（二送一测试）', '1448011938', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('68', '258', '302', null, '0', '112', '0.00', '', '1448011938', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('69', '260', '305', null, '0', '119', '0.00', '疯狂11', '1448270875', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('70', '260', '306', null, '0', '119', '0.00', '', '1448270875', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('71', '261', '308', null, '0', '121', '0.00', '金额优惠', '1448272496', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('72', '262', '310', null, '0', '120', '0.00', '抢购双12数量', '1448333895', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('73', '262', '311', null, '0', '119', '0.00', '疯狂11组合', '1448333895', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('74', '263', '314', null, '1', '69', '20.00', '是打发斯蒂芬，抢购双12数量', '1448373137', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('75', '263', '314', null, '0', '120', '20.00', '是打发斯蒂芬，抢购双12数量', '1448373137', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('76', '263', '315', null, '1', '69', '10.00', '是打发斯蒂芬', '1448373137', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('77', '264', '317', null, '0', '126', '0.00', '订单金额满20元优惠', '1448439472', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('78', '269', '324', null, '0', '129', '0.00', '数量满3送', '1448511822', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('79', '269', '325', null, '0', '126', '0.00', '订单金额满30元优惠', '1448511822', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('80', '269', '326', null, '0', '129', '0.00', '', '1448511822', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('81', '269', '327', null, '0', '126', '0.00', '', '1448511822', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('82', '270', '328', null, '0', '129', '0.00', '数量满3送', '1448511873', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('83', '270', '329', null, '0', '129', '0.00', '', '1448511873', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('84', '272', '331', null, '0', '126', '0.00', '订单金额满30元优惠', '1448513490', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('85', '272', '332', null, '0', '126', '0.00', '', '1448513490', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('86', '273', '333', null, '1', '70', '9.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('87', '273', '333', null, '0', '131', '9.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('88', '273', '334', null, '1', '70', '18.00', '打折扣', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('89', '273', '335', null, '1', '70', '9.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('90', '273', '335', null, '0', '131', '9.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('91', '273', '336', null, '1', '70', '18.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('92', '273', '336', null, '0', '131', '18.00', '打折扣，数量测试', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('93', '273', '337', null, '1', '70', '5.40', '打折扣', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('94', '273', '338', null, '0', '131', '0.00', '', '1448526053', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('95', '274', '339', null, '1', '70', '5.40', '打折扣', '1448526114', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('96', '275', '340', null, '1', '70', '18.00', '打折扣，数量满3送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('97', '275', '340', null, '0', '129', '18.00', '打折扣，数量满3送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('98', '275', '341', null, '1', '70', '9.00', '打折扣，数量满3送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('99', '275', '341', null, '0', '129', '9.00', '打折扣，数量满3送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('100', '275', '342', null, '1', '70', '90.00', '打折扣，订单金额满10元赠送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('101', '275', '342', null, '0', '125', '90.00', '打折扣，订单金额满10元赠送', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('102', '275', '343', null, '0', '129', '0.00', '', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('103', '275', '344', null, '0', '125', '0.00', '', '1448605932', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('104', '276', '345', null, '1', '70', '4.50', '打折扣', '1448605987', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('105', '277', '346', null, '1', '70', '9.00', '打折扣，订单金额满10元赠送', '1448606082', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('106', '277', '346', null, '0', '125', '9.00', '打折扣，订单金额满10元赠送', '1448606082', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('107', '277', '347', null, '0', '125', '0.00', '', '1448606082', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('108', '278', '348', null, '1', '70', '9.00', '打折扣，订单金额满10元赠送', '1448606394', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('109', '278', '348', null, '0', '125', '9.00', '打折扣，订单金额满10元赠送', '1448606394', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('110', '278', '349', null, '0', '125', '0.00', '', '1448606394', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('111', '279', '350', null, '1', '70', '4.50', '打折扣', '1448606649', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('112', '280', '351', null, '1', '70', '9.00', '打折扣，订单金额满10元赠送', '1448613525', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('113', '280', '351', null, '0', '125', '9.00', '打折扣，订单金额满10元赠送', '1448613525', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('114', '280', '352', null, '0', '125', '0.00', '', '1448613525', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('115', '281', '353', null, '0', '135', '0.00', '组合赠送2', '1448718843', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('116', '281', '354', null, '0', '135', '0.00', '组合赠送2', '1448718843', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('117', '281', '355', null, '0', '135', '0.00', '', '1448718843', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('118', '286', '360', null, '0', '128', '0.00', '满20元送', '1448770643', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('119', '286', '361', null, '0', '128', '0.00', '', '1448770643', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('120', '292', '367', null, '1', '70', '2.70', '打折扣，组合赠送2', '1448870032', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('121', '292', '367', null, '0', '135', '2.70', '打折扣，组合赠送2', '1448870032', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('122', '292', '368', null, '1', '70', '89.10', '打折扣，组合赠送2', '1448870032', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('123', '292', '368', null, '0', '135', '89.10', '打折扣，组合赠送2', '1448870032', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('124', '292', '369', null, '0', '135', '0.00', '', '1448870032', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('125', '293', '370', null, '1', '70', '5.40', '打折扣', '1448875355', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('126', '294', '371', null, '1', '70', '9.00', '打折扣', '1448875457', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('127', '295', '372', null, '1', '70', '180.00', '打折扣', '1448875557', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('128', '296', '373', null, '0', '134', '0.00', '满送优惠组合产品', '1449137894', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('129', '296', '374', null, '0', '134', '0.00', '满送优惠组合产品', '1449137894', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('130', '296', '375', null, '0', '134', '0.00', '', '1449137894', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('131', '297', '376', null, '1', '70', '88.20', '打折扣', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('132', '297', '377', null, '1', '70', '9.00', '打折扣', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('133', '297', '378', null, '1', '70', '2.70', '打折扣，满送优惠组合产品', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('134', '297', '378', null, '0', '134', '2.70', '打折扣，满送优惠组合产品', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('135', '297', '379', null, '1', '70', '89.10', '打折扣，满送优惠组合产品', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('136', '297', '379', null, '0', '134', '89.10', '打折扣，满送优惠组合产品', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('137', '297', '380', null, '0', '134', '0.00', '', '1449138101', null, null, null);
INSERT INTO `order_customer_item_promotion` VALUES ('138', '298', '381', null, '1', '70', '9.00', '打折扣', '1449138216', null, null, null);

-- ----------------------------
-- Table structure for order_customer_promotion
-- ----------------------------
DROP TABLE IF EXISTS `order_customer_promotion`;
CREATE TABLE `order_customer_promotion` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '消费订单',
  `promotion_type` int(2) DEFAULT NULL COMMENT '促销类型0 满送优惠  1限时折扣',
  `promotion_id` bigint(20) unsigned DEFAULT NULL COMMENT '促销活动',
  `promotion_amount` decimal(16,2) DEFAULT '0.00' COMMENT '优惠金额',
  `promotion_title` varchar(300) DEFAULT NULL COMMENT '促销标题',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员消费订单促销活动';

-- ----------------------------
-- Records of order_customer_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for order_recharge
-- ----------------------------
DROP TABLE IF EXISTS `order_recharge`;
CREATE TABLE `order_recharge` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `socode` varchar(100) DEFAULT NULL COMMENT '订单号 年月日+7位流水号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `recharge_type` int(2) DEFAULT '0' COMMENT '充值类型0 转账支付 1在线支付',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '充值金额',
  `status` int(2) DEFAULT '0' COMMENT '状态 0待支付 1成功 2 支付中 3 失败 ',
  `is_checking` tinyint(4) DEFAULT '0' COMMENT '是否对账 recharge_type为0 时有效',
  `ordertime` bigint(20) DEFAULT NULL COMMENT '下单时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `transfer_order_no` varchar(100) DEFAULT NULL COMMENT '转账流水号',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝',
  `appv_status` int(2) DEFAULT '0' COMMENT '转账审核状态0 未审核   1审核通过  2审核未通过',
  `process_time` bigint(20) DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='用户充值订单';

-- ----------------------------
-- Records of order_recharge
-- ----------------------------
INSERT INTO `order_recharge` VALUES ('1', '201508050000001', '1', '0', '300.00', '1', '0', '1435218020', '1435218020', '1', '1447123548', 'admin', '201502031208221', 'xiaoxin@163.com', '1', '1447123548');
INSERT INTO `order_recharge` VALUES ('2', '201508070000121', '1', '0', '300.00', '0', '0', '1435218020', '1435218020', '1', '1438932163', 'admin', '201508071508889', 'xiaoxin@163.com', '0', null);
INSERT INTO `order_recharge` VALUES ('3', '201508280000001', '19', '1', '50.00', '2', '0', '1440732273', '1440732267', 'xiaohuihui', '1440732273', 'xiaohuihui', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('4', '201508280000002', '20', '0', '2.00', '3', '0', '1440733489', '1440733489', 'rr', '1442291682', 'admin', '12', '1231', '2', null);
INSERT INTO `order_recharge` VALUES ('5', '201508280000003', '20', '1', '50.00', '2', '0', '1440755546', '1440755374', 'rr', '1440755546', 'rr', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('6', '201508280000004', '20', '1', '50.00', '0', '0', '1440755642', '1440755642', 'rr', '1440755642', 'rr', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('7', '201508280000005', '20', '0', '1.00', '1', '0', '1440755738', '1440755738', 'rr', '1440950446', 'admin', '12313213', '1213@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('8', '201508280000006', '20', '1', '50.00', '2', '0', '1440756181', '1440756180', 'rr', '1440756181', 'rr', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('9', '201509060000001', '20', '1', '50.00', '2', '0', '1441511540', '1441511521', 'rr', '1441511540', 'rr', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('10', '201509280000001', '28', '1', '5.00', '2', '0', '1443428438', '1443428435', 'll', '1443428438', 'll', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('11', '201509280000002', '25', '1', '5.00', '2', '0', '1443434234', '1443434220', 'rong', '1443434234', 'rong', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('12', '201509280000003', '25', '1', '5.00', '2', '0', '1443434287', '1443434286', 'rong', '1443434287', 'rong', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('13', '201509280000004', '25', '0', '1.00', '1', '0', '1443434308', '1443434308', 'rong', '1443583793', 'admin', '打发士大夫', '反对法', '1', null);
INSERT INTO `order_recharge` VALUES ('14', '201509280000005', '25', '0', '2.00', '1', '0', '1443434330', '1443434330', 'rong', '1443498094', 'admin', 'SDF', 'SDD', '1', null);
INSERT INTO `order_recharge` VALUES ('15', '201510050000001', '21', '1', '5.00', '2', '0', '1444027938', '1444027935', 'franktester', '1444027938', 'franktester', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('16', '201510050000002', '21', '1', '5.00', '2', '0', '1444027971', '1444027964', 'franktester', '1444027971', 'franktester', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('17', '201510050000003', '21', '1', '5.00', '2', '0', '1444028119', '1444028115', 'franktester', '1444028119', 'franktester', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('18', '201510060000001', '21', '1', '5.00', '2', '0', '1444093837', '1444093834', 'franktester', '1444093837', 'franktester', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('19', '201510060000002', '21', '1', '5.00', '2', '0', '1444100953', '1444100949', 'franktester', '1444100953', 'franktester', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('20', '201510080000001', '32', '0', '10000000.00', '1', '0', '1444277484', '1444277484', 'test_03', '1444277729', 'admin', '123456789', 'test_03@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('21', '201510080000002', '31', '0', '20000000.00', '1', '0', '1444277548', '1444277548', 'test_02', '1444277725', 'admin', '12345678910', 'test_02@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('22', '201510080000003', '30', '0', '30000000.00', '1', '0', '1444277589', '1444277589', 'test_01', '1444277717', 'admin', '1234567892', 'test_01@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('23', '201510080000004', '25', '1', '5.00', '2', '0', '1444289556', '1444289551', 'rong', '1444289556', 'rong', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('24', '201510080000005', '25', '0', '77.00', '1', '0', '1444289613', '1444289613', 'rong', '1444313811', 'admin', '55', '55', '1', null);
INSERT INTO `order_recharge` VALUES ('25', '201510080000006', '25', '0', '111.00', '1', '0', '1444289670', '1444289670', 'rong', '1444382525', 'admin', '12321321', '2222@QQ.CCC', '1', null);
INSERT INTO `order_recharge` VALUES ('26', '201510090000001', '33', '0', '40000000.00', '1', '0', '1444382101', '1444382101', 'test_04', '1444382436', 'admin', '123456785643345', 'test_04@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('27', '201510090000002', '34', '0', '50000000.00', '1', '0', '1444382404', '1444382404', 'test_05', '1444382443', 'admin', '123556756765765', 'test_05@qq.com', '1', null);
INSERT INTO `order_recharge` VALUES ('28', '201510090000003', '25', '0', '1.00', '1', '0', '1444382601', '1444382601', 'rong', '1444382861', 'admin', '123456789', '123@qq.com', '1', '1444382861');
INSERT INTO `order_recharge` VALUES ('29', '201510090000004', '25', '1', '5.00', '2', '0', '1444382639', '1444382632', 'rong', '1444382639', 'rong', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('30', '201510090000005', '35', '0', '1000000.00', '1', '0', '1444382778', '1444382778', 'test_06', '1444382869', 'admin', '12312312321', 'test_06@qq.com', '1', '1444382869');
INSERT INTO `order_recharge` VALUES ('31', '201510120000001', '34', '1', '5.00', '2', '0', '1444659785', '1444659782', 'test_05', '1444659785', 'test_05', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('32', '201510140000001', '33', '1', '5.00', '2', '0', '1444813265', '1444813214', 'test_04', '1444813265', 'test_04', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('33', '201510220000001', '30', '1', '5.00', '2', '0', '1445498254', '1445498250', 'test_01', '1445498254', 'test_01', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('34', '201510240000001', '34', '1', '5.00', '2', '0', '1445667166', '1445667155', 'test_05', '1445667166', 'test_05', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('35', '201510310000001', '34', '0', '123.00', '1', '0', '1446278440', '1446278440', 'test_05', '1446278920', 'test_99', '12345654321', 'test_05@qq.com', '1', '1446278920');
INSERT INTO `order_recharge` VALUES ('36', '201510310000002', '34', '0', '134.00', '3', '0', '1446280384', '1446280384', 'test_05', '1446280658', 'test_99', '1342001', 'test_05@qq.com', '2', '1446280658');
INSERT INTO `order_recharge` VALUES ('37', '201510310000003', '33', '0', '104.50', '1', '0', '1446280538', '1446280538', 'test_04', '1446284325', 'test_99', '104001', 'test_04@qq.com', '1', '1446284325');
INSERT INTO `order_recharge` VALUES ('38', '201510310000004', '33', '0', '105.00', '3', '0', '1446281703', '1446281703', 'test_04', '1446284515', 'test_99', '105001', 'test_04@qq.com', '2', '1446284515');
INSERT INTO `order_recharge` VALUES ('39', '201510310000005', '33', '1', '60.00', '0', '0', '1446282769', '1446282769', 'test_04', '1446282769', 'test_04', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('40', '201511010000001', '40', '1', '5.00', '0', '0', '1446367481', '1446367481', 'test_09', '1446367481', 'test_09', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('41', '201511010000002', '40', '0', '20.00', '1', '0', '1446372886', '1446372886', 'test_09', '1446521785', 'admin', '1101001', 'test_09@qq.com', '1', '1446521785');
INSERT INTO `order_recharge` VALUES ('42', '201511010000003', '40', '0', '30.00', '1', '0', '1446373956', '1446373956', 'test_09', '1446373981', 'test_99', '1101002', 'test_09@qq.com', '1', '1446373981');
INSERT INTO `order_recharge` VALUES ('43', '201511020000001', '40', '0', '100.00', '1', '0', '1446447394', '1446447394', 'test_09', '1446447413', 'test_99', '1102002', 'test_09@qq.com', '1', '1446447413');
INSERT INTO `order_recharge` VALUES ('44', '201511020000002', '40', '0', '20.00', '1', '0', '1446448549', '1446448549', 'test_09', '1446448561', 'test_99', 'asdf', 'test_09@qq.com', '1', '1446448561');
INSERT INTO `order_recharge` VALUES ('45', '201511020000003', '47', '0', '150.00', '1', '0', '1446453462', '1446453462', 'test_08', '1446453478', 'test_99', 'fasdfasdf', 'test_08@qq.com', '1', '1446453478');
INSERT INTO `order_recharge` VALUES ('46', '201511020000004', '44', '1', '5.00', '2', '0', '1446455500', '1446455485', 'p01', '1446455500', 'p01', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('47', '201511020000005', '47', '0', '350.00', '1', '0', '1446456483', '1446456483', 'test_08', '1446456493', 'test_99', '塔顶', '350', '1', '1446456493');
INSERT INTO `order_recharge` VALUES ('48', '201511020000006', '48', '1', '5.00', '2', '0', '1446457982', '1446457980', 'test_99', '1446457982', 'test_99', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('49', '201511020000007', '48', '0', '100.00', '1', '0', '1446458020', '1446458020', 'test_99', '1446458063', 'admin', 'fasdfasd', 'asdfasdf', '1', '1446458063');
INSERT INTO `order_recharge` VALUES ('50', '201511020000008', '48', '0', '500.00', '1', '0', '1446458437', '1446458437', 'test_99', '1446458448', 'admin', 'fasdf', 'fasdf', '1', '1446458448');
INSERT INTO `order_recharge` VALUES ('51', '201511020000009', '40', '1', '5.00', '2', '0', '1446460285', '1446460281', 'test_09', '1446460285', 'test_09', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('52', '201511030000001', '34', '1', '5.00', '0', '0', '1446520544', '1446520544', 'test_05', '1446520544', 'test_05', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('53', '201511030000002', '41', '1', '5.00', '2', '0', '1446521881', '1446521875', 'faa123', '1446521881', 'faa123', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('54', '201511050000001', '3', '0', '100.00', '0', '0', '1446690759', '1446690759', 'admin', '1446690759', 'admin', '1112112311', 'wangli0302@qq.com', '0', null);
INSERT INTO `order_recharge` VALUES ('55', '201511060000001', '30', '1', '130.00', '0', '0', '1446798994', '1446798978', 'test_01', '1446798994', 'test_01', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('56', '201511060000002', '35', '1', '125.00', '0', '0', '1446799058', '1446799058', 'test_06', '1446799058', 'test_06', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('57', '201511060000003', '31', '1', '615.00', '0', '0', '1446799099', '1446799099', 'test_02', '1446799099', 'test_02', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('58', '201511060000004', '30', '0', '26.00', '3', '0', '1446799216', '1446799216', 'test_01', '1446874513', 'admin', '1231321', '123@qq.com', '2', '1446874513');
INSERT INTO `order_recharge` VALUES ('59', '201511060000005', '30', '0', '16.00', '1', '0', '1446799238', '1446799238', 'test_01', '1446874438', 'admin', '123456', '123@qq.com', '1', '1446874438');
INSERT INTO `order_recharge` VALUES ('60', '201511100000001', '3', '0', '1000000.00', '0', '0', '1447086684', '1447086684', 'admin', '1447086684', 'admin', '13213232143', 'sibada300gogogo@sohu.com', '0', null);
INSERT INTO `order_recharge` VALUES ('61', '201511100000002', '30', '0', '1.23', '0', '0', '1447137831', '1447137831', 'test_01', '1447137831', 'test_01', '123456', '123@qq.com', '0', null);
INSERT INTO `order_recharge` VALUES ('62', '201511110000001', '30', '0', '12345.00', '0', '1', '1447227316', '1447227316', 'test_01', '1447227316', 'test_01', '1231321', '123@qq.com', '0', null);
INSERT INTO `order_recharge` VALUES ('63', '201511150000001', '40', '0', '203.67', '3', '1', '1447580902', '1447580902', 'test_09', '1447580970', 'test_99', '20151115001', '123@qq.com', '2', '1447580970');
INSERT INTO `order_recharge` VALUES ('64', '201511150000002', '40', '0', '304.98', '1', '0', '1447581022', '1447581022', 'test_09', '1447581054', 'test_99', '20151115002', '123@qq.com', '1', '1447581054');
INSERT INTO `order_recharge` VALUES ('65', '201511150000003', '40', '0', '30.00', '1', '0', '1447581433', '1447581433', 'test_09', '1447922707', 'admin', '20151115003', '123@qq.com', '1', '1447922707');
INSERT INTO `order_recharge` VALUES ('66', '201511150000004', '40', '0', '40.00', '1', '1', '1447581447', '1447581447', 'test_09', '1447581579', 'test_99', '20151115004', '123@qq.com', '1', '1447581579');
INSERT INTO `order_recharge` VALUES ('67', '201511180000001', '41', '1', '5.00', '2', '0', '1447816847', '1447816841', 'faa123', '1447816847', 'faa123', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('68', '201511180000002', '41', '0', '41.66', '0', '0', '1447817039', '1447817039', 'faa123', '1447817039', 'faa123', '44566666', '2222', '0', null);
INSERT INTO `order_recharge` VALUES ('69', '201511180000003', '41', '1', '5.00', '2', '0', '1447817154', '1447817149', 'faa123', '1447817154', 'faa123', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('70', '201511180000004', '41', '0', '6666.33', '1', '1', '1447817282', '1447817282', 'faa123', '1447817587', 'admin01', '88999', '33333', '1', '1447817587');
INSERT INTO `order_recharge` VALUES ('71', '201511180000005', '41', '0', '1000.00', '0', '1', '1447818439', '1447818439', 'faa123', '1447818439', 'faa123', '222222', '111111', '0', null);
INSERT INTO `order_recharge` VALUES ('72', '201511190000001', '30', '1', '5.00', '2', '0', '1447916215', '1447916210', 'test_01', '1447916215', 'test_01', null, null, '0', null);
INSERT INTO `order_recharge` VALUES ('73', '201511190000002', '3', '0', '500.00', '1', '1', '1447921426', '1447921426', 'admin', '1447921469', 'admin', '123', '12321321', '1', '1447921469');

-- ----------------------------
-- Table structure for order_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `order_recharge_log`;
CREATE TABLE `order_recharge_log` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_recharge_id` bigint(20) unsigned DEFAULT NULL COMMENT '充值订单',
  `logtime` bigint(20) DEFAULT NULL COMMENT '日志时间',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明',
  `loguser` varchar(100) DEFAULT NULL COMMENT '操作人',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='用户充值订单日志';

-- ----------------------------
-- Records of order_recharge_log
-- ----------------------------
INSERT INTO `order_recharge_log` VALUES ('11', '1', '1438931743', '订单状态由:待支付 变更为：成功,审核状态由:未审核 变更为：审核通过', 'admin', '1438931743', 'admin', '1438931743', 'admin');
INSERT INTO `order_recharge_log` VALUES ('12', '2', '1438931817', '订单状态由:待支付 变更为：失败,审核状态由:未审核 变更为：审核未通过', 'admin', '1438931817', 'admin', '1438931817', 'admin');
INSERT INTO `order_recharge_log` VALUES ('13', '2', '1438932163', '订单状态由:待支付 变更为：失败 ,审核状态由:未审核 变更为：审核未通过 备注：不存在的账号，恶意添加', 'admin', '1438932163', 'admin', '1438932163', 'admin');
INSERT INTO `order_recharge_log` VALUES ('14', '3', '1440732267', '在线支付 订单，订单号：201508280000001,订单状态：待支付', 'xiaohuihui', '1440732267', 'xiaohuihui', '1440732267', 'xiaohuihui');
INSERT INTO `order_recharge_log` VALUES ('15', '3', '1440732273', '在线支付 订单，订单号：201508280000001,订单状态：支付中', 'xiaohuihui', '1440732273', 'xiaohuihui', '1440732273', 'xiaohuihui');
INSERT INTO `order_recharge_log` VALUES ('16', '4', '1440733489', '转账支付 订单，订单号：201508280000002,审核状态：未审核', 'rr', '1440733489', 'rr', '1440733489', 'rr');
INSERT INTO `order_recharge_log` VALUES ('17', '5', '1440755374', '在线支付 订单，订单号：201508280000003,订单状态：待支付', 'rr', '1440755374', 'rr', '1440755374', 'rr');
INSERT INTO `order_recharge_log` VALUES ('18', '5', '1440755546', '在线支付 订单，订单号：201508280000003,订单状态：支付中', 'rr', '1440755546', 'rr', '1440755546', 'rr');
INSERT INTO `order_recharge_log` VALUES ('19', '6', '1440755642', '在线支付 订单，订单号：201508280000004,订单状态：待支付', 'rr', '1440755642', 'rr', '1440755642', 'rr');
INSERT INTO `order_recharge_log` VALUES ('20', '7', '1440755738', '转账支付 订单，订单号：201508280000005,审核状态：未审核', 'rr', '1440755738', 'rr', '1440755738', 'rr');
INSERT INTO `order_recharge_log` VALUES ('21', '8', '1440756180', '在线支付 订单，订单号：201508280000006,订单状态：待支付', 'rr', '1440756180', 'rr', '1440756180', 'rr');
INSERT INTO `order_recharge_log` VALUES ('22', '8', '1440756182', '在线支付 订单，订单号：201508280000006,订单状态：支付中', 'rr', '1440756182', 'rr', '1440756182', 'rr');
INSERT INTO `order_recharge_log` VALUES ('23', '7', '1440950446', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1440950446', 'admin', '1440950446', 'admin');
INSERT INTO `order_recharge_log` VALUES ('24', '9', '1441511521', '在线支付 订单，订单号：201509060000001,订单状态：待支付', 'rr', '1441511521', 'rr', '1441511521', 'rr');
INSERT INTO `order_recharge_log` VALUES ('25', '9', '1441511540', '在线支付 订单，订单号：201509060000001,订单状态：支付中', 'rr', '1441511540', 'rr', '1441511540', 'rr');
INSERT INTO `order_recharge_log` VALUES ('26', '4', '1442291682', '订单状态:由待支付 变更为 失败<br/>审核状态:由未审核 变更为 审核未通过<br/>备注：154564', 'admin', '1442291682', 'admin', '1442291682', 'admin');
INSERT INTO `order_recharge_log` VALUES ('27', '10', '1443428435', '在线支付 订单，订单号：201509280000001,订单状态：待支付', 'll', '1443428435', 'll', '1443428435', 'll');
INSERT INTO `order_recharge_log` VALUES ('28', '10', '1443428438', '在线支付 订单，订单号：201509280000001,订单状态：支付中', 'll', '1443428438', 'll', '1443428438', 'll');
INSERT INTO `order_recharge_log` VALUES ('29', '11', '1443434220', '在线支付 订单，订单号：201509280000002,订单状态：待支付', 'rong', '1443434220', 'rong', '1443434220', 'rong');
INSERT INTO `order_recharge_log` VALUES ('30', '11', '1443434234', '在线支付 订单，订单号：201509280000002,订单状态：支付中', 'rong', '1443434234', 'rong', '1443434234', 'rong');
INSERT INTO `order_recharge_log` VALUES ('31', '12', '1443434286', '在线支付 订单，订单号：201509280000003,订单状态：待支付', 'rong', '1443434286', 'rong', '1443434286', 'rong');
INSERT INTO `order_recharge_log` VALUES ('32', '12', '1443434287', '在线支付 订单，订单号：201509280000003,订单状态：支付中', 'rong', '1443434287', 'rong', '1443434287', 'rong');
INSERT INTO `order_recharge_log` VALUES ('33', '13', '1443434308', '转账支付 订单，订单号：201509280000004,审核状态：未审核', 'rong', '1443434308', 'rong', '1443434308', 'rong');
INSERT INTO `order_recharge_log` VALUES ('34', '14', '1443434330', '转账支付 订单，订单号：201509280000005,审核状态：未审核', 'rong', '1443434330', 'rong', '1443434330', 'rong');
INSERT INTO `order_recharge_log` VALUES ('35', '14', '1443498094', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1443498094', 'admin', '1443498094', 'admin');
INSERT INTO `order_recharge_log` VALUES ('36', '13', '1443583793', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1443583793', 'admin', '1443583793', 'admin');
INSERT INTO `order_recharge_log` VALUES ('37', '15', '1444027935', '在线支付 订单，订单号：201510050000001,订单状态：待支付', 'franktester', '1444027935', 'franktester', '1444027935', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('38', '15', '1444027938', '在线支付 订单，订单号：201510050000001,订单状态：支付中', 'franktester', '1444027938', 'franktester', '1444027938', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('39', '16', '1444027964', '在线支付 订单，订单号：201510050000002,订单状态：待支付', 'franktester', '1444027964', 'franktester', '1444027964', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('40', '16', '1444027971', '在线支付 订单，订单号：201510050000002,订单状态：支付中', 'franktester', '1444027971', 'franktester', '1444027971', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('41', '17', '1444028115', '在线支付 订单，订单号：201510050000003,订单状态：待支付', 'franktester', '1444028115', 'franktester', '1444028115', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('42', '17', '1444028119', '在线支付 订单，订单号：201510050000003,订单状态：支付中', 'franktester', '1444028119', 'franktester', '1444028119', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('43', '18', '1444093834', '在线支付 订单，订单号：201510060000001,订单状态：待支付', 'franktester', '1444093834', 'franktester', '1444093834', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('44', '18', '1444093837', '在线支付 订单，订单号：201510060000001,订单状态：支付中', 'franktester', '1444093837', 'franktester', '1444093837', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('45', '19', '1444100949', '在线支付 订单，订单号：201510060000002,订单状态：待支付', 'franktester', '1444100949', 'franktester', '1444100949', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('46', '19', '1444100953', '在线支付 订单，订单号：201510060000002,订单状态：支付中', 'franktester', '1444100953', 'franktester', '1444100953', 'franktester');
INSERT INTO `order_recharge_log` VALUES ('47', '20', '1444277484', '转账支付 订单，订单号：201510080000001,审核状态：未审核', 'test_03', '1444277484', 'test_03', '1444277484', 'test_03');
INSERT INTO `order_recharge_log` VALUES ('48', '21', '1444277548', '转账支付 订单，订单号：201510080000002,审核状态：未审核', 'test_02', '1444277548', 'test_02', '1444277548', 'test_02');
INSERT INTO `order_recharge_log` VALUES ('49', '22', '1444277589', '转账支付 订单，订单号：201510080000003,审核状态：未审核', 'test_01', '1444277589', 'test_01', '1444277589', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('50', '22', '1444277717', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444277717', 'admin', '1444277717', 'admin');
INSERT INTO `order_recharge_log` VALUES ('51', '21', '1444277725', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444277725', 'admin', '1444277725', 'admin');
INSERT INTO `order_recharge_log` VALUES ('52', '20', '1444277729', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444277729', 'admin', '1444277729', 'admin');
INSERT INTO `order_recharge_log` VALUES ('53', '23', '1444289551', '在线支付 订单，订单号：201510080000004,订单状态：待支付', 'rong', '1444289551', 'rong', '1444289551', 'rong');
INSERT INTO `order_recharge_log` VALUES ('54', '23', '1444289556', '在线支付 订单，订单号：201510080000004,订单状态：支付中', 'rong', '1444289556', 'rong', '1444289556', 'rong');
INSERT INTO `order_recharge_log` VALUES ('55', '24', '1444289613', '转账支付 订单，订单号：201510080000005,审核状态：未审核', 'rong', '1444289613', 'rong', '1444289613', 'rong');
INSERT INTO `order_recharge_log` VALUES ('56', '25', '1444289670', '转账支付 订单，订单号：201510080000006,审核状态：未审核', 'rong', '1444289670', 'rong', '1444289670', 'rong');
INSERT INTO `order_recharge_log` VALUES ('57', '24', '1444313811', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444313811', 'admin', '1444313811', 'admin');
INSERT INTO `order_recharge_log` VALUES ('58', '26', '1444382101', '转账支付 订单，订单号：201510090000001,审核状态：未审核', 'test_04', '1444382101', 'test_04', '1444382101', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('59', '27', '1444382404', '转账支付 订单，订单号：201510090000002,审核状态：未审核', 'test_05', '1444382404', 'test_05', '1444382404', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('60', '26', '1444382436', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444382436', 'admin', '1444382436', 'admin');
INSERT INTO `order_recharge_log` VALUES ('61', '27', '1444382443', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444382443', 'admin', '1444382443', 'admin');
INSERT INTO `order_recharge_log` VALUES ('62', '25', '1444382525', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444382525', 'admin', '1444382525', 'admin');
INSERT INTO `order_recharge_log` VALUES ('63', '28', '1444382601', '转账支付 订单，订单号：201510090000003,审核状态：未审核', 'rong', '1444382601', 'rong', '1444382601', 'rong');
INSERT INTO `order_recharge_log` VALUES ('64', '29', '1444382632', '在线支付 订单，订单号：201510090000004,订单状态：待支付', 'rong', '1444382632', 'rong', '1444382632', 'rong');
INSERT INTO `order_recharge_log` VALUES ('65', '29', '1444382639', '在线支付 订单，订单号：201510090000004,订单状态：支付中', 'rong', '1444382639', 'rong', '1444382639', 'rong');
INSERT INTO `order_recharge_log` VALUES ('66', '30', '1444382778', '转账支付 订单，订单号：201510090000005,审核状态：未审核', 'test_06', '1444382778', 'test_06', '1444382778', 'test_06');
INSERT INTO `order_recharge_log` VALUES ('67', '28', '1444382861', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444382861', 'admin', '1444382861', 'admin');
INSERT INTO `order_recharge_log` VALUES ('68', '30', '1444382869', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1444382869', 'admin', '1444382869', 'admin');
INSERT INTO `order_recharge_log` VALUES ('69', '31', '1444659782', '在线支付 订单，订单号：201510120000001,订单状态：待支付', 'test_05', '1444659782', 'test_05', '1444659782', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('70', '31', '1444659785', '在线支付 订单，订单号：201510120000001,订单状态：支付中', 'test_05', '1444659785', 'test_05', '1444659785', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('71', '32', '1444813215', '在线支付 订单，订单号：201510140000001,订单状态：待支付', 'test_04', '1444813215', 'test_04', '1444813215', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('72', '32', '1444813265', '在线支付 订单，订单号：201510140000001,订单状态：支付中', 'test_04', '1444813265', 'test_04', '1444813265', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('73', '33', '1445498250', '在线支付 订单，订单号：201510220000001,订单状态：待支付', 'test_01', '1445498250', 'test_01', '1445498250', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('74', '33', '1445498254', '在线支付 订单，订单号：201510220000001,订单状态：支付中', 'test_01', '1445498254', 'test_01', '1445498254', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('75', '34', '1445667155', '在线支付 订单，订单号：201510240000001,订单状态：待支付', 'test_05', '1445667155', 'test_05', '1445667155', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('76', '34', '1445667166', '在线支付 订单，订单号：201510240000001,订单状态：支付中', 'test_05', '1445667166', 'test_05', '1445667166', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('77', '35', '1446278440', '转账支付 订单，订单号：201510310000001,审核状态：未审核', 'test_05', '1446278440', 'test_05', '1446278440', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('78', '35', '1446278920', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446278920', 'test_99', '1446278920', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('79', '36', '1446280384', '转账支付 订单，订单号：201510310000002,审核状态：未审核', 'test_05', '1446280384', 'test_05', '1446280384', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('80', '37', '1446280538', '转账支付 订单，订单号：201510310000003,审核状态：未审核', 'test_04', '1446280538', 'test_04', '1446280538', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('81', '36', '1446280658', '订单状态:由待支付 变更为 失败<br/>审核状态:由未审核 变更为 审核未通过<br/>备注：fsadf', 'test_99', '1446280658', 'test_99', '1446280658', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('82', '38', '1446281703', '转账支付 订单，订单号：201510310000004,审核状态：未审核', 'test_04', '1446281703', 'test_04', '1446281703', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('83', '39', '1446282769', '在线支付 订单，订单号：201510310000005,订单状态：待支付', 'test_04', '1446282769', 'test_04', '1446282769', 'test_04');
INSERT INTO `order_recharge_log` VALUES ('84', '37', '1446284325', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446284325', 'test_99', '1446284325', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('85', '38', '1446284515', '订单状态:由待支付 变更为 失败<br/>审核状态:由未审核 变更为 审核未通过<br/>备注：审核不Bb!@#By！@#22', 'test_99', '1446284515', 'test_99', '1446284515', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('86', '40', '1446367481', '在线支付 订单，订单号：201511010000001,订单状态：待支付', 'test_09', '1446367481', 'test_09', '1446367481', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('87', '41', '1446372886', '转账支付 订单，订单号：201511010000002,审核状态：未审核', 'test_09', '1446372886', 'test_09', '1446372886', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('88', '42', '1446373956', '转账支付 订单，订单号：201511010000003,审核状态：未审核', 'test_09', '1446373956', 'test_09', '1446373956', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('89', '42', '1446373981', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：fsfds', 'test_99', '1446373981', 'test_99', '1446373981', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('90', '43', '1446447394', '转账支付 订单，订单号：201511020000001,审核状态：未审核', 'test_09', '1446447394', 'test_09', '1446447394', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('91', '43', '1446447413', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446447413', 'test_99', '1446447413', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('92', '44', '1446448549', '转账支付 订单，订单号：201511020000002,审核状态：未审核', 'test_09', '1446448549', 'test_09', '1446448549', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('93', '44', '1446448561', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446448561', 'test_99', '1446448561', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('94', '45', '1446453462', '转账支付 订单，订单号：201511020000003,审核状态：未审核', 'test_08', '1446453462', 'test_08', '1446453462', 'test_08');
INSERT INTO `order_recharge_log` VALUES ('95', '45', '1446453478', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446453478', 'test_99', '1446453478', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('96', '46', '1446455485', '在线支付 订单，订单号：201511020000004,订单状态：待支付', 'p01', '1446455485', 'p01', '1446455485', 'p01');
INSERT INTO `order_recharge_log` VALUES ('97', '46', '1446455500', '在线支付 订单，订单号：201511020000004,订单状态：支付中', 'p01', '1446455500', 'p01', '1446455500', 'p01');
INSERT INTO `order_recharge_log` VALUES ('98', '47', '1446456483', '转账支付 订单，订单号：201511020000005,审核状态：未审核', 'test_08', '1446456483', 'test_08', '1446456483', 'test_08');
INSERT INTO `order_recharge_log` VALUES ('99', '47', '1446456493', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1446456493', 'test_99', '1446456493', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('100', '48', '1446457980', '在线支付 订单，订单号：201511020000006,订单状态：待支付', 'test_99', '1446457980', 'test_99', '1446457980', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('101', '48', '1446457982', '在线支付 订单，订单号：201511020000006,订单状态：支付中', 'test_99', '1446457982', 'test_99', '1446457982', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('102', '49', '1446458020', '转账支付 订单，订单号：201511020000007,审核状态：未审核', 'test_99', '1446458020', 'test_99', '1446458020', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('103', '49', '1446458063', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1446458063', 'admin', '1446458063', 'admin');
INSERT INTO `order_recharge_log` VALUES ('104', '50', '1446458437', '转账支付 订单，订单号：201511020000008,审核状态：未审核', 'test_99', '1446458437', 'test_99', '1446458437', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('105', '50', '1446458448', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1446458448', 'admin', '1446458448', 'admin');
INSERT INTO `order_recharge_log` VALUES ('106', '51', '1446460281', '在线支付 订单，订单号：201511020000009,订单状态：待支付', 'test_09', '1446460281', 'test_09', '1446460281', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('107', '51', '1446460285', '在线支付 订单，订单号：201511020000009,订单状态：支付中', 'test_09', '1446460285', 'test_09', '1446460285', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('108', '52', '1446520544', '在线支付 订单，订单号：201511030000001,订单状态：待支付', 'test_05', '1446520544', 'test_05', '1446520544', 'test_05');
INSERT INTO `order_recharge_log` VALUES ('109', '41', '1446521785', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1446521785', 'admin', '1446521785', 'admin');
INSERT INTO `order_recharge_log` VALUES ('110', '53', '1446521875', '在线支付 订单，订单号：201511030000002,订单状态：待支付', 'faa123', '1446521875', 'faa123', '1446521875', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('111', '53', '1446521881', '在线支付 订单，订单号：201511030000002,订单状态：支付中', 'faa123', '1446521881', 'faa123', '1446521881', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('112', '54', '1446690759', '转账支付 订单，订单号：201511050000001,审核状态：未审核', 'admin', '1446690759', 'admin', '1446690759', 'admin');
INSERT INTO `order_recharge_log` VALUES ('113', '55', '1446798978', '在线支付 订单，订单号：201511060000001,订单状态：待支付', 'test_01', '1446798979', 'test_01', '1446798979', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('114', '56', '1446799058', '在线支付 订单，订单号：201511060000002,订单状态：待支付', 'test_06', '1446799058', 'test_06', '1446799058', 'test_06');
INSERT INTO `order_recharge_log` VALUES ('115', '57', '1446799099', '在线支付 订单，订单号：201511060000003,订单状态：待支付', 'test_02', '1446799099', 'test_02', '1446799099', 'test_02');
INSERT INTO `order_recharge_log` VALUES ('116', '58', '1446799217', '转账支付 订单，订单号：201511060000004,审核状态：未审核', 'test_01', '1446799217', 'test_01', '1446799217', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('117', '59', '1446799238', '转账支付 订单，订单号：201511060000005,审核状态：未审核', 'test_01', '1446799238', 'test_01', '1446799238', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('118', '59', '1446874438', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1446874438', 'admin', '1446874438', 'admin');
INSERT INTO `order_recharge_log` VALUES ('119', '58', '1446874513', '订单状态:由待支付 变更为 失败<br/>审核状态:由未审核 变更为 审核未通过<br/>备注：很健康和恐惧和', 'admin', '1446874513', 'admin', '1446874513', 'admin');
INSERT INTO `order_recharge_log` VALUES ('120', '60', '1447086684', '转账支付 订单，订单号：201511100000001,审核状态：未审核', 'admin', '1447086684', 'admin', '1447086684', 'admin');
INSERT INTO `order_recharge_log` VALUES ('121', '1', '1447123548', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1447123548', 'admin', '1447123548', 'admin');
INSERT INTO `order_recharge_log` VALUES ('122', '61', '1447137831', '转账支付 订单，订单号：201511100000002,审核状态：未审核', 'test_01', '1447137831', 'test_01', '1447137831', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('123', '62', '1447227316', '转账支付 订单，订单号：201511110000001,审核状态：未审核', 'test_01', '1447227316', 'test_01', '1447227316', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('124', '63', '1447580902', '转账支付 订单，订单号：201511150000001,审核状态：未审核', 'test_09', '1447580902', 'test_09', '1447580902', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('125', '63', '1447580970', '订单状态:由待支付 变更为 失败<br/>审核状态:由未审核 变更为 审核未通过<br/>备注：dd', 'test_99', '1447580970', 'test_99', '1447580970', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('126', '64', '1447581022', '转账支付 订单，订单号：201511150000002,审核状态：未审核', 'test_09', '1447581022', 'test_09', '1447581022', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('127', '64', '1447581054', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'test_99', '1447581054', 'test_99', '1447581054', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('128', '65', '1447581433', '转账支付 订单，订单号：201511150000003,审核状态：未审核', 'test_09', '1447581433', 'test_09', '1447581433', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('129', '66', '1447581447', '转账支付 订单，订单号：201511150000004,审核状态：未审核', 'test_09', '1447581447', 'test_09', '1447581447', 'test_09');
INSERT INTO `order_recharge_log` VALUES ('130', '66', '1447581579', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：fasf', 'test_99', '1447581579', 'test_99', '1447581579', 'test_99');
INSERT INTO `order_recharge_log` VALUES ('131', '67', '1447816841', '在线支付 订单，订单号：201511180000001,订单状态：待支付', 'faa123', '1447816841', 'faa123', '1447816841', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('132', '67', '1447816847', '在线支付 订单，订单号：201511180000001,订单状态：支付中', 'faa123', '1447816847', 'faa123', '1447816847', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('133', '68', '1447817039', '转账支付 订单，订单号：201511180000002,审核状态：未审核', 'faa123', '1447817039', 'faa123', '1447817039', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('134', '69', '1447817149', '在线支付 订单，订单号：201511180000003,订单状态：待支付', 'faa123', '1447817149', 'faa123', '1447817149', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('135', '69', '1447817154', '在线支付 订单，订单号：201511180000003,订单状态：支付中', 'faa123', '1447817154', 'faa123', '1447817154', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('136', '70', '1447817282', '转账支付 订单，订单号：201511180000004,审核状态：未审核', 'faa123', '1447817282', 'faa123', '1447817282', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('137', '70', '1447817587', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin01', '1447817587', 'admin01', '1447817587', 'admin01');
INSERT INTO `order_recharge_log` VALUES ('138', '71', '1447818439', '转账支付 订单，订单号：201511180000005,审核状态：未审核', 'faa123', '1447818439', 'faa123', '1447818439', 'faa123');
INSERT INTO `order_recharge_log` VALUES ('139', '72', '1447916210', '在线支付 订单，订单号：201511190000001,订单状态：待支付', 'test_01', '1447916210', 'test_01', '1447916210', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('140', '72', '1447916216', '在线支付 订单，订单号：201511190000001,订单状态：支付中', 'test_01', '1447916216', 'test_01', '1447916216', 'test_01');
INSERT INTO `order_recharge_log` VALUES ('141', '73', '1447921426', '转账支付 订单，订单号：201511190000002,审核状态：未审核', 'admin', '1447921426', 'admin', '1447921426', 'admin');
INSERT INTO `order_recharge_log` VALUES ('142', '73', '1447921469', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1447921469', 'admin', '1447921469', 'admin');
INSERT INTO `order_recharge_log` VALUES ('143', '65', '1447922707', '订单状态:由待支付 变更为 成功<br/>,审核状态:由未审核 变更为 审核通过 <br/>备注：', 'admin', '1447922707', 'admin', '1447922707', 'admin');

-- ----------------------------
-- Table structure for order_transfer_account
-- ----------------------------
DROP TABLE IF EXISTS `order_transfer_account`;
CREATE TABLE `order_transfer_account` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `transfer_order_no` varchar(100) DEFAULT NULL COMMENT '转账流水号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '金额',
  `status` int(2) DEFAULT '0' COMMENT '审核状态0 未审核   1已审核  2审核未通过',
  `transfer_id` bigint(20) DEFAULT NULL COMMENT '交易ID',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明-审核未通过的时候必填-不通过原因',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员转账支付-转账审核成功后生成会员充值订单';

-- ----------------------------
-- Records of order_transfer_account
-- ----------------------------

-- ----------------------------
-- Table structure for order_transfer_account_bak
-- ----------------------------
DROP TABLE IF EXISTS `order_transfer_account_bak`;
CREATE TABLE `order_transfer_account_bak` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `transfer_order_no` varchar(100) DEFAULT NULL COMMENT '转账流水号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '金额',
  `status` int(2) DEFAULT '0' COMMENT '审核状态0 未审核   1已审核  2审核未通过',
  `transfer_id` bigint(20) DEFAULT NULL COMMENT '交易ID',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明-审核未通过的时候必填-不通过原因',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员转账支付-转账审核成功后生成会员充值订单';

-- ----------------------------
-- Records of order_transfer_account_bak
-- ----------------------------

-- ----------------------------
-- Table structure for page_anchor_config
-- ----------------------------
DROP TABLE IF EXISTS `page_anchor_config`;
CREATE TABLE `page_anchor_config` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rank_ids` varchar(300) DEFAULT NULL COMMENT '排行',
  `all_ids` text COMMENT '主播',
  `rendertime` bigint(20) DEFAULT NULL COMMENT '生成HTML时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='主播页面配置';

-- ----------------------------
-- Records of page_anchor_config
-- ----------------------------
INSERT INTO `page_anchor_config` VALUES ('1', '36,35,34,33,32,31,30,29,22,21,20,49', '1,20,21,22,29,30,31,32,33,34,35,36,49', null, null, null, '1449134538', 'admin01');

-- ----------------------------
-- Table structure for page_list_config
-- ----------------------------
DROP TABLE IF EXISTS `page_list_config`;
CREATE TABLE `page_list_config` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `radio_rec_ids` varchar(300) DEFAULT NULL COMMENT '电台推荐',
  `video_rec_ids` varchar(300) DEFAULT NULL COMMENT '视频推荐',
  `selfie_rec_ids` varchar(300) DEFAULT NULL COMMENT '自拍推荐',
  `rendertime` bigint(20) DEFAULT NULL COMMENT '生成HTML时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='列表页面配置';

-- ----------------------------
-- Records of page_list_config
-- ----------------------------
INSERT INTO `page_list_config` VALUES ('1', '159,158,157,71,70,48,47,19,159,158', '1,147,144,67,66,62,64,130,91,91', '179,179,117,46,46,42,31,179,179,179', null, null, null, '1448699357', 'admin01');

-- ----------------------------
-- Table structure for page_main_config
-- ----------------------------
DROP TABLE IF EXISTS `page_main_config`;
CREATE TABLE `page_main_config` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `carousel_first_pic` varchar(400) DEFAULT NULL COMMENT '轮播图1',
  `carousel_first_url` varchar(1000) DEFAULT NULL COMMENT '轮播地址1',
  `carousel_second_pic` varchar(400) DEFAULT NULL COMMENT '轮播图2',
  `carousel_second_url` varchar(1000) DEFAULT NULL COMMENT '轮播地址2',
  `carousel_third_pic` varchar(400) DEFAULT NULL COMMENT '轮播图3',
  `carousel_third_url` varchar(1000) DEFAULT NULL COMMENT '轮播地址3',
  `carousel_fourth_pic` varchar(400) DEFAULT NULL COMMENT '轮播图4',
  `carousel_fourth_url` varchar(1000) DEFAULT NULL COMMENT '轮播地址4',
  `like_radio_ids` varchar(100) DEFAULT NULL COMMENT '喜欢电台',
  `like_video_ids` varchar(100) DEFAULT NULL COMMENT '喜欢视频',
  `like_selfie_ids` varchar(100) DEFAULT NULL COMMENT '喜欢自拍',
  `anchor_ids` varchar(100) DEFAULT NULL COMMENT '主播',
  `radio_hour_rank_ids` varchar(100) DEFAULT NULL COMMENT '电台24小时排行',
  `radio_week_rank_ids` varchar(100) DEFAULT NULL COMMENT '电台本周排行',
  `radio_month_rank_ids` varchar(100) DEFAULT NULL COMMENT '电台本月排行',
  `radio_new_ids` varchar(100) DEFAULT NULL COMMENT '电台最新作品',
  `radio_midnight_ids` varchar(100) DEFAULT NULL COMMENT '午夜故事',
  `radio_burning_ids` varchar(100) DEFAULT NULL COMMENT '激情嗨麦',
  `video_hour_rank_ids` varchar(100) DEFAULT NULL COMMENT '视频24小时排行',
  `video_week_rank_ids` varchar(100) DEFAULT NULL COMMENT '视频本周排行',
  `video_month_rank_ids` varchar(100) DEFAULT NULL COMMENT '视频本月排行',
  `video_new_rank_ids` varchar(100) DEFAULT NULL COMMENT '视频最新作品',
  `video_single_ids` varchar(100) DEFAULT NULL COMMENT '单人视频',
  `video_people_ids` varchar(100) DEFAULT NULL COMMENT '多人视频',
  `video_burning_ids` varchar(100) DEFAULT NULL COMMENT '激情视频',
  `video_street_ids` varchar(100) DEFAULT NULL COMMENT '街拍视频',
  `self_hour_rank_ids` varchar(100) DEFAULT NULL COMMENT '自拍24小时排行',
  `self_week_rank_ids` varchar(100) DEFAULT NULL COMMENT '自拍本周排行',
  `self_month_rank_ids` varchar(100) DEFAULT NULL COMMENT '自拍本月排行',
  `self_new_rank_ids` varchar(100) DEFAULT NULL COMMENT '自拍最新作品',
  `self_single_ids` varchar(100) DEFAULT NULL COMMENT '单人自拍ID',
  `self_people_ids` varchar(100) DEFAULT NULL COMMENT '多人自拍ID',
  `self_burning_ids` varchar(100) DEFAULT NULL COMMENT '激情自拍ID',
  `self_street_ids` varchar(100) DEFAULT NULL COMMENT '街拍ID',
  `randertime` bigint(20) DEFAULT NULL COMMENT '生成HTML时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='首页配置';

-- ----------------------------
-- Records of page_main_config
-- ----------------------------
INSERT INTO `page_main_config` VALUES ('1', 'http://imgm.crabtreechina.com/2014080514071894251060526591407218225.jpg', 'http://www.online.sh.cn', 'http://imgm.crabtreechina.com/1402706327794379543.jpg', 'http://mall.dtjgroup.cn', 'http://imgm.crabtreechina.com/2014080514071894075958602821407218207.jpg', 'http://www.sina.com.cn', 'http://s.img.mix.sina.com.cn/auto/resize?size=560_0&magnify=0&img=http%3A%2F%2Fsinastorage.com%2Fsto', 'http://www.hao123.com', '159,159,159,156,155,134,132,112', '195,91,90,89,74,69,68,68', '159,93,63,56,54,200,200,200', '34,36,35,49', '12,48,47,19,12,71,72,73,159,159', '80,79,78,77,76,75,73,72,132,132', '84,83,82,80,79,77,75,72,132,132', '12,48,47,19,12,159,159,159', '12,13,14,15,18,132,132,132', '15,18,31,12,5,132,132,132', '91,90,92,89,74,69,68,67,130,130', '64,62,61,60,57,55,53,52,130,130', '43,29,25,22,21,20,14,13,130,130', '203,91,90,89,74,69,130,130', '12,13,14,15,18,21,130,130', '46,42,31,25,22,20,130,130', '12,13,14,15,18,21,130,130', '13,14,15,12,5,4,130,130', '95,94,93,63,59,56,54,46,131,131', '31,18,15,5,4,42,46,54,131,131', '104,102,101,100,95,94,93,63,59,131', '88,87,86,85,84,83,131,131', '1,3,5,12,13,14,131,131', '46,42,31,25,22,20,131,131', '46,42,31,25,22,20,131,131', '1,3,5,12,13,14,131,131', null, null, null, '1449137472', 'admin');

-- ----------------------------
-- Table structure for page_works_config
-- ----------------------------
DROP TABLE IF EXISTS `page_works_config`;
CREATE TABLE `page_works_config` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `works_rec_ids` varchar(1000) DEFAULT NULL COMMENT '相关推荐',
  `rendertime` bigint(20) DEFAULT NULL COMMENT '生成HML时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='作品页面配置';

-- ----------------------------
-- Records of page_works_config
-- ----------------------------
INSERT INTO `page_works_config` VALUES ('1', '117,179,158,70,69,66,64,63,99,134', null, null, null, '1448011661', 'admin');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `product_range` bigint(20) unsigned DEFAULT NULL COMMENT '产品系列',
  `price` int(11) DEFAULT '0' COMMENT '产品价格',
  `permission_category` int(4) DEFAULT '0' COMMENT '产品权限类型0 会员权限  1道具权限  2论坛权限  3资源权限',
  `product_permission` bigint(20) unsigned DEFAULT NULL COMMENT '产品权限',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否删除默认0 否 1是',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `pic` varchar(200) DEFAULT '-1' COMMENT '产品图片#-1表示显示默认图片',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='产品管理表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '视频会员（三个月）', '1', '100', '0', '9', '0', '1436348004', 'admin', '1436407672', 'admin', '-1');
INSERT INTO `product` VALUES ('2', '道具加速卡', '2', '600', '1', '5', '1', '1436348084', 'admin', '1439542909', 'admin', '-1');
INSERT INTO `product` VALUES ('3', '全站包月', '2', '20', '0', '4', '1', '1436408689', 'admin', '1439541451', 'admin', '-1');
INSERT INTO `product` VALUES ('4', '视频包年', '1', '20', '0', '8', '0', '1439196141', 'admin', '1439543069', 'admin', '-1');
INSERT INTO `product` VALUES ('5', '嗨嗨嗨', '2', '15', '2', '6', '1', '1439197344', 'admin', '1439542855', 'admin', '-1');
INSERT INTO `product` VALUES ('6', '添加产品', '3', '50', '3', '7', '1', '1439198058', 'admin', '1439542850', 'admin', '-1');
INSERT INTO `product` VALUES ('7', '盛夏玩', '1', '50', '0', '2', '1', '1439371138', 'admin', '1439526579', 'admin', '-1');
INSERT INTO `product` VALUES ('8', '盛夏玩玩', '1', '50', '1', '5', '1', '1439371162', 'admin', '1439371203', 'admin', '-1');
INSERT INTO `product` VALUES ('9', '盛夏玩玩', '2', '50', '0', '4', '1', '1439371229', 'admin', '1439541446', 'admin', '-1');
INSERT INTO `product` VALUES ('10', '炫夜', '4', '5', '3', '7', '1', '1439371285', 'admin', '1439542845', 'admin', '-1');
INSERT INTO `product` VALUES ('11', '华丽转身', '3', '6', '1', '14', '1', '1439371317', 'admin', '1439542848', 'admin', '-1');
INSERT INTO `product` VALUES ('12', '玩一玩', '2', '2', '1', '14', '1', '1439371357', 'admin', '1439542842', 'admin', '-1');
INSERT INTO `product` VALUES ('13', '测试产品', '1', '1', '3', '7', '1', '1439526554', 'admin', '1439542838', 'admin', '-1');
INSERT INTO `product` VALUES ('14', '全站VIP', '1', '10', '0', '4', '0', '1439541376', 'admin', '1439541376', 'admin', '-1');
INSERT INTO `product` VALUES ('15', '视频包月', '1', '10', '0', '1', '0', '1439543024', 'admin', '1444097092', 'admin', '-1');
INSERT INTO `product` VALUES ('16', '图片包月', '2', '10', '0', '2', '0', '1439543216', 'admin', '1439543216', 'admin', '-1');
INSERT INTO `product` VALUES ('17', '主播包月', '4', '10', '0', '3', '0', '1439543241', 'admin', '1439543241', 'admin', '-1');
INSERT INTO `product` VALUES ('18', '全站包年', '3', '200', '0', '8', '0', '1439862427', 'admin', '1444007789', 'admin', '-1');
INSERT INTO `product` VALUES ('19', '黄昏', '1', '10', '0', '1', '1', '1440492500', 'admin', '1447831374', 'admin01', '-1');
INSERT INTO `product` VALUES ('20', '终身VIP', '2', '98', '0', '2', '0', '1442224125', 'admin', '1442224125', 'admin', '-1');
INSERT INTO `product` VALUES ('21', '你好', '1', '120', '0', '8', '1', '1442224239', 'admin', '1442224249', 'admin', '-1');
INSERT INTO `product` VALUES ('22', '测试分页', '3', '0', '0', '8', '1', '1442224296', 'admin', '1442224335', 'admin', '-1');
INSERT INTO `product` VALUES ('23', '小分类', '1', '20', '0', '2', '1', '1442224321', 'admin', '1442224335', 'admin', '-1');
INSERT INTO `product` VALUES ('24', '靓', '2', '5', '0', '8', '0', '1442281495', 'admin', '1444007274', 'admin', '-1');
INSERT INTO `product` VALUES ('25', '测试分页', '1', '20', '0', '3', '1', '1442282142', 'admin', '1442282170', 'admin', '-1');
INSERT INTO `product` VALUES ('26', '主播包年', '4', '100', '0', '4', '0', '1444006857', 'admin', '1444371549', 'admin', '-1');
INSERT INTO `product` VALUES ('27', '包年全站VIP', '3', '200', '0', '27', '0', '1444008034', 'admin', '1444008034', 'admin', '-1');
INSERT INTO `product` VALUES ('28', 'NULL', '3', '10', '0', '21', '1', '1444028465', 'admin', '1447055286', 'admin', '-1');
INSERT INTO `product` VALUES ('29', '产品名称new', '3', '66', '1', '22', '0', '1444310480', 'admin', '1444311011', 'admin', '-1');
INSERT INTO `product` VALUES ('30', 'zyTest', '1', '22', '3', '7', '0', '1444311124', 'admin', '1444311124', 'admin', '-1');
INSERT INTO `product` VALUES ('31', 'lttest', '3', '22', '2', '23', '1', '1444311145', 'admin', '1447054402', 'admin', '-1');
INSERT INTO `product` VALUES ('32', '曲终人散', '2', '5', '0', '4', '0', '1444363693', 'rong', '1444363693', 'rong', '-1');
INSERT INTO `product` VALUES ('33', '测试1015', '2', '11', '0', '32', '0', '1444900997', 'admin', '1444901090', 'admin', '-1');
INSERT INTO `product` VALUES ('34', '放大', '15', '11', '1', '22', '1', '1444901075', 'admin', '1444901083', 'admin', '-1');
INSERT INTO `product` VALUES ('35', '视频包月A30!@#123', '24', '11', '0', '1', '1', '1445999202', 'admin', '1446000031', 'admin', '-1');
INSERT INTO `product` VALUES ('36', '道具权限Bb!@#123包', '15', '12', '1', '22', '0', '1445999353', 'admin', '1445999365', 'admin', '-1');
INSERT INTO `product` VALUES ('37', '论坛图吧权限Cc123!@#包', '4', '134', '2', '30', '1', '1445999633', 'admin', '1445999852', 'admin', '-1');
INSERT INTO `product` VALUES ('38', '资源包年会员Cc123!@#包', '3', '14', '3', '43', '0', '1445999684', 'admin', '1446013334', 'admin', '-1');
INSERT INTO `product` VALUES ('39', 'gasdfg', '26', '13', '1', '22', '1', '1446000023', 'admin', '1446000031', 'admin', '-1');
INSERT INTO `product` VALUES ('40', '视频会员1天1102fas', '1', '6', '0', '34', '0', '1446433150', 'test_99', '1446433150', 'test_99', '-1');
INSERT INTO `product` VALUES ('41', '限时折扣', '27', '5', '0', '32', '0', '1446706718', 'admin01', '1446706718', 'admin01', '-1');
INSERT INTO `product` VALUES ('42', '满送优惠（免费）', '28', '3', '0', '27', '0', '1446706817', 'admin01', '1446706817', 'admin01', '-1');
INSERT INTO `product` VALUES ('43', '满送优惠（2折）', '28', '7', '0', '3', '0', '1446706916', 'admin01', '1446706916', 'admin01', '-1');
INSERT INTO `product` VALUES ('44', '主播三天', '27', '3', '0', '32', '0', '1446719643', 'admin01', '1446719643', 'admin01', '-1');
INSERT INTO `product` VALUES ('45', '发顺丰', '31', '2147483647', '1', '44', '1', '1447746392', 'admin01', '1447922059', 'admin', '-1');
INSERT INTO `product` VALUES ('46', '20151117测试产品01', '26', '2147483647', '1', '22', '1', '1447746503', 'admin01', '1447922057', 'admin', '-1');
INSERT INTO `product` VALUES ('47', 'franktesting', '30', '10', '0', '32', '0', '1447864426', 'admin', '1448332764', 'admin', '-1');
INSERT INTO `product` VALUES ('48', '产品价格测试', '26', '99', '0', '8', '0', '1447917545', 'admin', '1448701355', 'admin01', '-1');
INSERT INTO `product` VALUES ('49', 'dafasdf ', '26', '999999', '0', '20', '1', '1447922050', 'admin', '1447922054', 'admin', '-1');
INSERT INTO `product` VALUES ('50', '小飞侠', '2', '20', '1', '45', '0', '1448009872', 'admin', '1448009872', 'admin', '-1');
INSERT INTO `product` VALUES ('51', '20151124', '30', '999999', '0', '32', '0', '1448333993', 'admin01', '1448333993', 'admin01', '-1');
INSERT INTO `product` VALUES ('52', '论坛权限产品', '30', '5', '2', '23', '0', '1448438229', 'admin01', '1448438229', 'admin01', '-1');

-- ----------------------------
-- Table structure for product_permission
-- ----------------------------
DROP TABLE IF EXISTS `product_permission`;
CREATE TABLE `product_permission` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `permission_category` int(4) DEFAULT '0' COMMENT '产品权限类型0 会员权限  1道具权限  2论坛权限  3资源权限',
  `member_permission_type` int(4) DEFAULT '0' COMMENT '会员权限类型(仅当permission_category=0时有效) 0 视频会员  1图片会员  2主播会员  3全站VIP会员',
  `day_num` int(11) NOT NULL COMMENT '时长(permission_category=3时无效)',
  `name` varchar(200) DEFAULT NULL COMMENT '权限名称',
  `prop_multiple` float(8,2) DEFAULT NULL COMMENT '加速倍数(permission_category=1时有效)',
  `prop_pic` varchar(400) DEFAULT NULL COMMENT '道具图片(permission_category=1时有效)',
  `bbs_user_group` int(4) DEFAULT NULL COMMENT '扩展用户组(permission_category=2时有效)',
  `bbs_user_group_name` varchar(100) DEFAULT NULL COMMENT '扩展用户组-冗余',
  `res_down_url` varchar(1000) DEFAULT NULL COMMENT '下载地址(permission_category=3时有效)',
  `res_pwd` varchar(100) DEFAULT NULL COMMENT '资源密码(permission_category=3有效) 明文存储',
  `res_desc` varchar(500) DEFAULT NULL COMMENT '介绍(permission_category=3有效)',
  `isdelete` tinyint(4) DEFAULT '0',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='产品权限管理表';

-- ----------------------------
-- Records of product_permission
-- ----------------------------
INSERT INTO `product_permission` VALUES ('1', '0', '0', '30', '视频包月会员', '0.00', null, null, null, null, null, null, '0', '1436251475', 'admin', '1436251475', 'admin');
INSERT INTO `product_permission` VALUES ('2', '0', '1', '30', '图片包月会员', '0.00', null, null, null, null, null, null, '0', '1436251509', 'admin', '1436256403', 'admin');
INSERT INTO `product_permission` VALUES ('3', '0', '2', '30', '主播包月会员', '0.00', null, null, null, null, null, null, '0', '1436251535', 'admin', '1436251535', 'admin');
INSERT INTO `product_permission` VALUES ('4', '0', '2', '365', '主播包年会员', '0.00', null, null, null, null, null, null, '0', '1436251559', 'admin', '1444006767', 'admin');
INSERT INTO `product_permission` VALUES ('5', '1', '0', '30', '水果卡牌（加速50%）', '0.50', 'http://www.pic.com/aa.jpg', '0', '影吧扩展', null, null, null, '1', '1436251623', 'admin', '1439542925', 'admin');
INSERT INTO `product_permission` VALUES ('6', '2', '0', '30', '影吧扩展包月会员', '0.00', null, '0', '影吧扩展', null, null, null, '1', '1436251690', 'admin', '1439543592', 'admin');
INSERT INTO `product_permission` VALUES ('7', '3', '0', '0', '资源包年会员', '0.00', 'http://pic.z.com/bb.jpg', null, null, 'http://down.z.com/aa.html', '123456', '资源包年会员 一年内免费下载所有资源', '0', '1436251796', 'admin', '1444007597', 'admin');
INSERT INTO `product_permission` VALUES ('8', '0', '0', '365', '视频包年会员', '0.00', null, null, null, null, null, null, '0', '1436259388', 'admin', '1436259388', 'admin');
INSERT INTO `product_permission` VALUES ('9', '0', '0', '90', '视频会员（三个月）', '0.00', null, null, null, null, null, null, '1', '1436347973', 'admin', '1439543556', 'admin');
INSERT INTO `product_permission` VALUES ('10', '0', '3', '10', '会员-全站', '0.00', null, null, null, null, null, null, '1', '1437965488', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('11', '0', '0', '60', '会员-视频', null, null, null, null, null, null, null, '1', '1439198520', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('12', '0', '1', '30', '会员-图片', null, null, null, null, null, null, null, '1', '1439198717', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('13', '0', '2', '20', '会员-主播', null, null, null, null, null, null, null, '1', '1439199511', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('14', '1', '0', '20', '道具', '1.50', '道具图片', null, null, null, null, null, '1', '1439200217', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('15', '0', '0', '2', '论坛扩展', null, null, null, null, null, null, null, '1', '1439200521', 'admin', '1439353202', 'admin');
INSERT INTO `product_permission` VALUES ('16', '2', '0', '50', '论坛扩展权限', null, null, '1', '图吧扩展', null, null, null, '1', '1439353189', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('17', '1', '0', '-30', '加速三倍道具', '-30.00', '打发', null, null, null, null, null, '1', '1439372256', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('18', '2', '0', '0', '加速论坛扩展', null, null, '1', '图吧扩展', null, null, null, '1', '1439372604', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('19', '3', '0', '0', '精彩资源扩展', null, '发给', null, null, 'www.baidu.com', '1231321', '超梦幻', '1', '1439372890', 'admin', '1439373057', 'admin');
INSERT INTO `product_permission` VALUES ('20', '0', '1', '3', '三天图片权限', null, null, null, null, null, null, null, '0', '1442284215', 'admin', '1442284215', 'admin');
INSERT INTO `product_permission` VALUES ('21', '0', '3', '3', '全免三天', null, null, null, null, null, null, null, '0', '1442284251', 'admin', '1442284251', 'admin');
INSERT INTO `product_permission` VALUES ('22', '1', '0', '15', '京东商家', '56.00', '搞定', null, null, null, null, null, '0', '1442284431', 'admin', '1444361337', 'admin');
INSERT INTO `product_permission` VALUES ('23', '2', '0', '6', '论坛权限扩2', null, null, '1', '图吧扩展', null, null, null, '0', '1442284911', 'admin', '1445418952', 'admin');
INSERT INTO `product_permission` VALUES ('24', '2', '0', '6', '打发', null, null, '0', '影吧扩展', null, null, null, '1', '1442284961', 'admin', '1442285240', 'admin');
INSERT INTO `product_permission` VALUES ('25', '3', '0', '0', ' 你好', null, '打发', null, null, '阿凡达', '打发', '打', '1', '1442285231', 'admin', '1442285240', 'admin');
INSERT INTO `product_permission` VALUES ('26', '2', '0', '5', '星期五', null, null, '1', '图吧扩展', null, null, null, '1', '1442285536', 'admin', '1442285544', 'admin');
INSERT INTO `product_permission` VALUES ('27', '0', '3', '365', '包年全站VIP会员', null, null, null, null, null, null, null, '0', '1444007998', 'admin', '1444007998', 'admin');
INSERT INTO `product_permission` VALUES ('28', '0', '0', '15', '视频半个月无限观看', null, null, null, null, null, null, null, '0', '1444033284', 'admin', '1444033284', 'admin');
INSERT INTO `product_permission` VALUES ('29', '0', '1', '90', '图片季度会员', null, null, null, null, null, null, null, '0', '1444096928', 'admin', '1444096928', 'admin');
INSERT INTO `product_permission` VALUES ('30', '2', '0', '90', '论坛图吧权限', null, null, '1', '图吧扩展', null, null, null, '0', '1444097004', 'admin', '1444097004', 'admin');
INSERT INTO `product_permission` VALUES ('31', '0', '1', '90', '季度视频会员', null, null, null, null, null, null, null, '0', '1444104718', 'admin', '1444104718', 'admin');
INSERT INTO `product_permission` VALUES ('32', '0', '3', '11', '会员测试', null, null, null, null, null, null, null, '0', '1444310300', 'admin', '1444312027', 'admin');
INSERT INTO `product_permission` VALUES ('33', '0', '1', '2', '测试', null, null, null, null, null, null, null, '1', '1444901327', 'admin', '1444901337', 'admin');
INSERT INTO `product_permission` VALUES ('34', '0', '0', '1', '视频会员1天！@#Aa12!@#', null, null, null, null, null, null, null, '0', '1446002774', 'admin', '1446002809', 'admin');
INSERT INTO `product_permission` VALUES ('35', '0', '1', '2', '图片会员2天！@#Aa12!@#', null, null, null, null, null, null, null, '1', '1446002870', 'admin', '1446013165', 'admin');
INSERT INTO `product_permission` VALUES ('36', '0', '2', '3', '主播会员3天！@#Aa12!@#', null, null, null, null, null, null, null, '1', '1446002915', 'admin', '1446013165', 'admin');
INSERT INTO `product_permission` VALUES ('37', '0', '3', '4', '全站VIP会员4天！@#Aa12!@#', null, null, null, null, null, null, null, '0', '1446004037', 'admin', '1446004037', 'admin');
INSERT INTO `product_permission` VALUES ('38', '1', '0', '2', '道具权限2天3.456倍Bb!@#！@#', '3.46', 'http://s.img.mix.sina.com.cn/auto/resize?size=560_0&magnify=0&img=http%3A%2F%2Fsinastorage.com%2Fsto', null, null, null, null, null, '0', '1446004305', 'admin', '1446004305', 'admin');
INSERT INTO `product_permission` VALUES ('39', '1', '0', '3', '道具权限3天4.567Bb!@#！@#', '4.57', 'http://s.img.mix.sina.com.cn/auto/resize?size=560_0&magnify=0&img=http%3A%2F%2Fsinastorage.com%2Fsto', null, null, null, null, null, '0', '1446004711', 'admin', '1446012775', 'admin');
INSERT INTO `product_permission` VALUES ('40', '2', '0', '6', '论坛图吧6天Cc！@#!@#1', null, null, '1', '图吧扩展', null, null, null, '0', '1446004904', 'admin', '1446012486', 'admin');
INSERT INTO `product_permission` VALUES ('41', '0', '0', '5', '论坛影吧5天Cc！@#!@#', null, null, null, null, null, null, null, '1', '1446012355', 'admin', '1446013139', 'admin');
INSERT INTO `product_permission` VALUES ('42', '2', '0', '7', '论坛影吧7天Cc！@#!@#23', null, null, '0', '影吧扩展', null, null, null, '0', '1446012555', 'admin', '1446012757', 'admin');
INSERT INTO `product_permission` VALUES ('43', '3', '0', '0', '资源下载Dd123!@#！@#', null, 'http://s8008.net/forum.php?mod=image&aid=1266088&size=300x300&key=4f5def2be878372f&nocache=yes&type=fixnone', null, null, 'http://demo.sc.chinaz.com//Files/DownLoad/flash2/201504/flash3616.swf', '123456', 'fasdfasv资源下载Dd123!@#！@#1234123\r\nfasd\r\nfasdfasdf', '0', '1446012700', 'admin', '1446447876', 'test_99');
INSERT INTO `product_permission` VALUES ('44', '1', '0', '2', '顶顶', '2.00', '顶顶顶', null, null, null, null, null, '0', '1446521254', 'admin', '1446521254', 'admin');
INSERT INTO `product_permission` VALUES ('45', '1', '0', '50', '道具权限小飞侠', '50.00', 'http://www.photophoto.cn/m6/018/030/0180300271.jpg', null, null, null, null, null, '0', '1448009803', 'admin', '1448011293', 'admin');

-- ----------------------------
-- Table structure for product_range
-- ----------------------------
DROP TABLE IF EXISTS `product_range`;
CREATE TABLE `product_range` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '系列名称',
  `sort` tinyint(8) DEFAULT '0' COMMENT '排序',
  `isvalid` tinyint(2) DEFAULT '1' COMMENT '有效',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否逻辑删除 默认0 不是 1 是',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='产品系列管理';

-- ----------------------------
-- Records of product_range
-- ----------------------------
INSERT INTO `product_range` VALUES ('1', '视频系列2', '0', '1', '0', '1436323746', 'admin', '1445416965', 'admin');
INSERT INTO `product_range` VALUES ('2', '图片系列', '0', '1', '0', '1436323834', 'admin', '1439541264', 'admin');
INSERT INTO `product_range` VALUES ('3', 'VIP系列', '0', '1', '0', '1439197503', 'admin', '1444033406', 'admin');
INSERT INTO `product_range` VALUES ('4', '主播系列', '0', '1', '0', '1439198214', 'admin', '1444360528', 'admin');
INSERT INTO `product_range` VALUES ('5', 'MV系列MV系列MV系列MV系列MV系列', '0', '1', '1', '1439371424', 'admin', '1439371446', 'admin');
INSERT INTO `product_range` VALUES ('6', '终身VIP', '0', '1', '1', '1442224386', 'admin', '1442282348', 'admin');
INSERT INTO `product_range` VALUES ('7', '测试234%^%&^%&^%*(*&(*', '0', '1', '1', '1442282366', 'admin', '1442283878', 'admin');
INSERT INTO `product_range` VALUES ('8', '你好', '0', '1', '1', '1442283892', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('9', '还不错', '0', '1', '1', '1442283896', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('10', '测试分页', '0', '1', '1', '1442283907', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('11', '分页', '0', '1', '1', '1442283912', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('12', '分页01', '0', '1', '1', '1442283920', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('13', '分页02', '0', '1', '1', '1442283925', 'admin', '1442283946', 'admin');
INSERT INTO `product_range` VALUES ('14', '分页023', '0', '1', '1', '1442283930', 'admin', '1442283955', 'admin');
INSERT INTO `product_range` VALUES ('15', '你好', '0', '1', '0', '1444363710', 'rong', '1444363710', 'rong');
INSERT INTO `product_range` VALUES ('16', '测试', '0', '1', '1', '1444901161', 'admin', '1445997130', 'admin');
INSERT INTO `product_range` VALUES ('17', '1产品系列Aa123!@#1012', '0', '1', '1', '1445996958', 'admin', '1445996983', 'admin');
INSERT INTO `product_range` VALUES ('18', 'fasdfd', '0', '1', '1', '1445996986', 'admin', '1445997055', 'admin');
INSERT INTO `product_range` VALUES ('19', 'fasdfasdf', '0', '1', '1', '1445996997', 'admin', '1445997055', 'admin');
INSERT INTO `product_range` VALUES ('20', 'fasdf', '0', '1', '1', '1445997087', 'admin', '1445997130', 'admin');
INSERT INTO `product_range` VALUES ('21', '塔顶f', '0', '1', '1', '1445997090', 'admin', '1445997130', 'admin');
INSERT INTO `product_range` VALUES ('22', '塔顶fd', '0', '1', '1', '1445997097', 'admin', '1445997130', 'admin');
INSERT INTO `product_range` VALUES ('23', 'fsadf', '0', '1', '1', '1445997104', 'admin', '1445997130', 'admin');
INSERT INTO `product_range` VALUES ('24', 'ddddd', '0', '1', '1', '1445997108', 'admin', '1447054416', 'admin');
INSERT INTO `product_range` VALUES ('25', '测试', '0', '1', '1', '1445997141', 'admin', '1445999954', 'admin');
INSERT INTO `product_range` VALUES ('26', '测试', '0', '1', '0', '1445999963', 'admin', '1445999963', 'admin');
INSERT INTO `product_range` VALUES ('27', '购物车测试01', '0', '1', '0', '1446705650', 'admin01', '1446705650', 'admin01');
INSERT INTO `product_range` VALUES ('28', '购物车测试02', '0', '1', '0', '1446705664', 'admin01', '1446705664', 'admin01');
INSERT INTO `product_range` VALUES ('29', '购物车测试03', '0', '1', '0', '1446706123', 'admin01', '1446706123', 'admin01');
INSERT INTO `product_range` VALUES ('30', '测试系类', '0', '1', '0', '1447054853', 'admin', '1447054853', 'admin');
INSERT INTO `product_range` VALUES ('31', '测试系列2', '0', '1', '0', '1447054868', 'admin', '1447054868', 'admin');
INSERT INTO `product_range` VALUES ('32', 'ces ', '0', '1', '0', '1447124704', 'admin', '1447124704', 'admin');
INSERT INTO `product_range` VALUES ('33', '4555', '0', '1', '0', '1447747208', 'admin01', '1447747208', 'admin01');
INSERT INTO `product_range` VALUES ('34', '3333333', '0', '1', '0', '1447747267', 'admin01', '1447747267', 'admin01');
INSERT INTO `product_range` VALUES ('35', '788888', '0', '1', '0', '1447747276', 'admin01', '1447747276', 'admin01');

-- ----------------------------
-- Table structure for sales_full_delivery
-- ----------------------------
DROP TABLE IF EXISTS `sales_full_delivery`;
CREATE TABLE `sales_full_delivery` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(200) DEFAULT NULL COMMENT '促销标题',
  `begintime` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `condition` int(2) DEFAULT '0' COMMENT '促销条件 0 产品数量  1订单金额  2产品组合 默认0',
  `product_range` bigint(20) unsigned DEFAULT NULL COMMENT '产品系列-仅在condition=0有效',
  `product` bigint(20) unsigned DEFAULT NULL COMMENT '产品-仅在condition=0有效',
  `product_num` int(11) DEFAULT '0' COMMENT '数量-仅在condition=0有效',
  `order_amount` decimal(16,2) DEFAULT '0.00' COMMENT '订单金额-仅在condition=1有效',
  `product_permission` bigint(20) unsigned DEFAULT NULL COMMENT '权限分类-仅在condition=2有效',
  `product_permission_items` varchar(400) DEFAULT NULL COMMENT '订单物品-仅在condition=2有效',
  `desc` varchar(400) DEFAULT NULL COMMENT '促销简介',
  `scope` int(2) DEFAULT '0' COMMENT '促销范围 -仅在condition=1有效 0全店参与  1部分参与',
  `give_permission_category` int(4) DEFAULT '0' COMMENT '产品权限类型0 会员权限  1道具权限  2论坛权限  3资源权限',
  `give_permission` bigint(20) unsigned DEFAULT NULL COMMENT '产品权限',
  `give_permission_name` varchar(200) DEFAULT NULL COMMENT '产品权限名称-冗余',
  `give_product` bigint(20) DEFAULT NULL COMMENT '赠送产品ID',
  `give_condition` int(2) DEFAULT '0' COMMENT '满送条件0 免费 1优惠价 默认0',
  `give_sale_amount` int(11) DEFAULT '0' COMMENT '赠品促销金额 仅在give_condition=1时有效',
  `give_achor_id` bigint(20) DEFAULT NULL COMMENT '主播赠送ID，当赠送为主播类型的时候生效',
  `product_list_ids` varchar(2000) DEFAULT NULL COMMENT '产品列表ID 英文逗号隔开 仅在condition=1且scope为1时有效',
  `status` tinyint(4) DEFAULT '0' COMMENT '活动状态 默认0 正在进行 1 暂停 2已经过期 （过期通过时间判断 一般不该次字段',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否删除默认 0未删除',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='满送促销活动';

-- ----------------------------
-- Records of sales_full_delivery
-- ----------------------------
INSERT INTO `sales_full_delivery` VALUES ('1', '测试活动5', '1438358400', '1440950400', '0', '1', '1', '100', null, null, null, '今天是个好日子 测试满就送活动一', null, '0', '8', null, null, '1', '800', null, '3', '0', '0', null, null, '1441007912', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('2', '六月最多优惠活动来了买一送一', '1391097600', '1422633600', '1', null, null, null, '300.00', null, null, '买一送一  活动产品买一送一买一年送一年', '0', '0', '9', null, null, '0', '0', null, '3', '0', '0', null, null, '1437552133', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('3', '产品组合优惠活动', '1437408000', '1450540800', '2', null, null, null, null, '0', '1,4,8', '产品组合优惠活动产品组合优惠活动\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n产品组合优惠活动\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n产品组合优惠活动', null, '0', '9', null, null, '1', '500', null, null, '1', '1', null, null, '1439542649', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('4', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1439370530', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('5', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('6', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('7', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, '1437410144', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('8', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1442221060', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('9', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1442221060', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('10', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1442221060', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('11', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('12', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('13', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('14', '1231', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('15', '12312', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1446172081', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('16', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1446172081', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('17', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('18', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('19', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('20', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('21', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('22', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('23', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '0', null, null, null, null);
INSERT INTO `sales_full_delivery` VALUES ('24', '12313', '1438358400', '17376739200', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '1', '1', null, null, '1444496322', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('25', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('26', '12313', '2015', '2015', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1437469919', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('27', '12313', '1436198400', '1449417600', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '1', '1', null, null, '1437470294', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('28', '12', '1437408000', '1438272000', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('29', '阿斯顿发', '1437408000', '1438099200', '0', null, null, '0', '0.00', null, null, null, '0', '0', null, null, null, '0', '0', null, null, '0', '1', null, null, '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('30', '测试活动3', '1429545600', '1441036800', '1', null, null, null, '200.00', null, null, '12313123123', '0', '1', '5', null, null, '0', '0', null, '1,2,3,5,6,8', '0', '1', null, null, '1439369976', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('31', '测速满就送2', '1437321600', '1438272000', '0', '1', '1', '200', null, null, null, '阿斯顿发送到阿打算发士大夫', null, '0', '2', null, null, '0', '0', null, null, '0', '1', '1437407396', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('32', '测速活动满就送', '1437321600', '1438272000', '0', '2', '2', '100', null, null, null, '200', null, '1', '5', null, null, '0', '0', null, null, '0', '1', '1437407602', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('33', 'test', '1437408000', '1438272000', '1', null, null, null, '300.00', null, null, '促销简介促销简介促销简介促销简介促销简介促销简介\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n促销简介\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n促销简介\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n促销简介', '1', '0', '9', null, null, '0', '0', null, null, '0', '1', '1437447011', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('34', '测试相关', '1437408000', '1438272000', '1', null, null, null, '900.00', null, null, '', '0', '1', '5', null, null, '0', '0', null, null, '0', '1', '1437447807', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('35', 'asdfasdf', '1437408000', '1438272000', '1', null, null, null, '300.00', null, 'Array', 'asdfasd', '1', '3', '7', null, null, '1', '300', null, '2,3,1', '0', '1', '1437451008', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('36', 'test123', '1437494400', '1438272000', '1', null, null, null, '128.00', null, null, 'fasdfsdfasdfs', '0', '1', '5', null, null, '1', '125', null, null, '0', '1', '1437531754', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('37', 'asdsssss', '1437926400', '1438272000', '0', '1', '1', '1200', null, null, null, 'asdfasdfasd', null, '0', '3', null, null, '1', '4545', null, null, '0', '1', '1437978910', 'admin', '1439542643', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('38', '买就送', '1438358400', '1440950400', '0', '1', '1', '100', null, null, null, '品种多多，选着多多', null, '0', '1', null, null, '1', '10', null, null, '1', '1', '1439193887', 'admin', '1439542649', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('39', '买就送1', '1440864000', '1440950400', '0', '2', '2', '50', null, null, null, '买不到的实惠，想不到的惊喜', null, '0', '2', null, null, '0', '0', null, null, '1', '1', '1439193994', 'admin', '1439542649', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('40', '买就送2', '1438444800', '1440950400', '0', '1', '1', '16', null, null, null, '进口量将', null, '0', '3', null, null, '0', '0', null, null, '0', '1', '1439194060', 'admin', '1439542635', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('41', '买就送3', '1438358400', '1440950400', '0', '1', '1', '54', null, null, null, '没联系', null, '0', '3', null, null, '0', '0', null, null, '0', '1', '1439194124', 'admin', '1439542635', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('42', '买就送4', '1438358400', '1440950400', '0', '2', '2', '50', null, null, null, '', null, '0', '4', null, null, '0', '0', null, null, '0', '1', '1439194551', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('43', '满送-订单', '1438358400', '1440950400', '0', '1', '1', '14', null, null, null, '一个岛一个人', null, '1', '5', null, null, '0', '0', null, null, '0', '1', '1439194920', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('44', '满送-订单', '1438617600', '1440950400', '1', null, null, null, '150.00', null, null, '打发', '1', '2', '6', null, null, '0', '0', null, '3,1,6', '0', '1', '1439194956', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('45', '满送-订单', '1438876800', '1440950400', '1', null, null, null, '560.00', null, null, '的说法', '0', '3', '7', null, null, '0', '0', null, null, '0', '1', '1439195163', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('46', '完爆夏天', '1438444800', '1443542400', '0', '1', '1', '50', null, null, null, '', null, '1', '14', null, null, '1', '30', null, null, '0', '1', '1439353659', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('47', '嗨到天亮', '1439049600', '1443542400', '1', null, null, null, '90.00', null, null, '', '0', '3', '7', null, null, '0', '0', null, null, '0', '1', '1439353847', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('48', '嗨到天亮', '1438358400', '1443110400', '1', null, null, null, '200.00', null, null, '', '1', '0', '1', null, null, '0', '0', null, '1,2', '0', '1', '1439354200', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('49', '测试', '1438790400', '1440950400', '1', null, null, null, '50.00', null, null, '', '1', '0', '9', null, null, '1', '32', null, '2,1', '0', '1', '1439367675', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('50', '测试', '1435680000', '1443542400', '2', null, null, null, null, '0', '1,2,3,4,8,9', '', null, '0', '9', null, null, '0', '0', null, null, '0', '1', '1439367936', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('51', '测试', '1440000000', '1440086400', '0', '1', '1', '13', null, null, null, '', null, '1', '5', null, null, '0', '0', null, null, '0', '1', '1439368038', 'admin', '1439542365', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('52', '满送', '1438358400', '1440950400', '0', '1', '15', '10', null, null, null, '送完为止', null, '0', '1', null, null, '0', '0', null, null, '0', '1', '1439543531', 'admin', '1439544652', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('53', '满10个视频送1个视频包月', '1438358400', '1440950400', '0', '1', '15', '10', null, null, null, '送完为止', null, '0', '1', null, '15', '0', '0', null, null, '0', '1', '1439544997', 'admin', '1439797417', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('54', '满50送1一个月视频会员', '1438876800', '1440950400', '1', null, null, null, '50.00', null, null, '', '0', '0', '1', null, '15', '0', '0', null, null, '0', '1', '1439545327', 'admin', '1439797431', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('55', '买图片包月+视频包月优惠10杏币', '1439049600', '1440950400', '2', null, null, null, null, '0', '2,1', '', null, '0', '1', null, '15', '1', '10', null, null, '0', '1', '1439546264', 'admin', '1439797911', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('56', '满2个图片包月送', '1438358400', '1440950400', '0', '2', '16', '2', null, null, null, '', null, '0', '2', null, '16', '0', '0', null, null, '0', '1', '1439547286', 'admin', '1439797911', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('57', '订单金额部分参与', '1438358400', '1440950400', '1', null, null, null, '20.00', null, null, '', '1', '0', '3', null, '17', '0', '0', null, '17,16', '0', '1', '1439783091', 'admin', '1439797915', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('58', '满50订单金额部分部分参与', '1438358400', '1440950400', '1', null, null, null, '50.00', null, null, '', '1', '0', '2', null, '16', '0', '0', null, '17,16', '0', '1', '1439795610', 'admin', '1439798736', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('59', '订单金额满50送图片包月', '1438358400', '1440950400', '1', null, null, null, '50.00', null, null, '', '1', '0', '2', null, '16', '0', '0', null, '17,16', '0', '1', '1439798800', 'admin', '1439801311', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('60', '满40送视频包年', '1438358400', '1440950400', '1', null, null, null, '40.00', null, null, '', '1', '0', '8', null, '4', '0', '0', null, '17,16', '0', '1', '1439801717', 'admin', '1439801847', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('61', '满40送视频包月', '1438704000', '1446220800', '1', null, null, null, '40.00', null, null, '', '0', '0', '1', null, '15', '0', '0', null, null, '0', '1', '1439801886', 'admin', '1446173033', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('62', '满40送主播', '1441036800', '1446220800', '1', null, null, null, '40.00', null, null, '', '0', '0', '1', null, '15', '0', '0', null, null, '0', '1', '1441006174', 'admin', '1446173033', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('63', '满40送主播', '1441036800', '1446220800', '1', null, null, null, '40.00', null, null, '', '1', '0', '3', null, '17', '0', '0', null, '18,17', '1', '1', '1441006231', 'admin', '1446173101', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('64', '十月一满送优惠', '1441641600', '1446220800', '1', null, null, null, '10.00', null, null, '', '1', '0', '3', null, '17', '0', '0', null, '17', '1', '1', '1442216862', 'admin', '1446173101', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('65', '十一大放送', '1443542400', '1444147200', '1', null, null, null, '50.00', null, null, '', '1', '0', '3', null, '17', '0', '0', null, '24,27,17,28,19,26,18,4,14,1', '0', '0', '1443586115', 'admin', '1444030436', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('66', 'sjdhshd', '1444060800', '1444147200', '1', null, null, null, '1222.00', null, null, '232323', '1', '0', '21', null, '28', '0', '0', null, '31,30,29', '0', '0', '1444098752', 'admin', '1444378444', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('67', 'sjdhshd', '1444060800', '1445443200', '1', null, null, null, '1222.00', null, null, '232323', '0', '0', '27', null, '27', '0', '0', null, null, '0', '0', '1444098840', 'admin', '1445407764', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('68', 'wewe', '1443628800', '1443974400', '1', null, null, null, '1111.00', null, null, '', '0', '0', '27', null, '27', '0', '0', null, null, '0', '0', '1444098875', 'admin', '1444311481', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('69', 'sdsdsd', '1443628800', '1444060800', '1', null, null, null, '100.00', null, null, '', '1', '0', '27', null, '27', '0', '0', null, null, '0', '0', '1444098925', 'admin', '1444311533', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('70', 'test', '1443628800', '1444147200', '0', '4', '29', '5', null, null, null, '', null, '0', '32', null, '29', '0', '0', null, null, '0', '0', '1444310633', 'admin', '1444378417', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('71', '跳楼价', '1443628800', '1444147200', '1', null, null, null, '10.00', null, null, '黄金甲', '1', '0', '3', null, '17', '0', '0', null, '26,27,28,29', '0', '0', '1444360183', 'admin', '1444378301', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('72', 'ms', '1444233600', '1444492800', '0', '4', '17', '1', null, null, null, 'test', null, '0', '2', null, '20', '1', '1000', null, null, '1', '0', '1444488423', 'admin', '1444496379', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('73', 'ms2', '1444233600', '1444492800', '1', null, null, null, '10.00', null, null, '', '0', '1', '22', null, '29', '0', '0', null, null, '1', '0', '1444491130', 'admin', '1444496379', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('74', 'ms3', '1444147200', '1444579200', '1', null, null, null, '100.00', null, null, '', '0', '3', '7', null, '30', '0', '0', null, null, '1', '1', '1444496110', 'admin', '1444496322', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('75', 'ms_sl1', '1444233600', '1444579200', '0', '4', '17', '1', null, null, null, '', null, '0', '4', null, '26', '0', '0', null, null, '1', '0', '1444496534', 'admin', '1444497852', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('76', 'ms_ds_100_1', '1444233600', '1444579200', '1', null, null, null, '100.00', null, null, '', '0', '3', '7', null, '30', '0', '0', null, null, '0', '0', '1444496872', 'admin', '1444563986', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('77', 'ms_dd_100', '1444147200', '1444665600', '1', null, null, null, '100.00', null, null, '', '0', '0', '3', null, '17', '0', '0', null, null, '0', '0', '1444496968', 'admin', '1444563986', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('78', 'ms_dd_80', '1444060800', '1444838400', '1', null, null, null, '80.00', null, null, '', '0', '0', '2', null, '16', '0', '0', null, null, '0', '0', '1444497151', 'admin', '1444563986', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('79', 'ms_zh_主播包月', '1444060800', '1445011200', '2', null, null, null, null, '0', '3', '', null, '2', '23', null, '31', '1', '1', null, null, '0', '1', '1444497799', 'admin', '1444900298', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('80', 'ms_zh', '1444147200', '1444752000', '2', null, null, null, null, '0', '27', '', null, '0', '27', null, '27', '0', '0', null, null, '1', '0', '1444563943', 'admin', '1444900407', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('81', '测试1015', '1444924800', '1445011200', '0', '4', '26', '100', null, null, null, '多个地方更多', null, '1', '22', null, '29', '0', '0', null, null, '1', '0', '1444900033', 'admin', '1444900323', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('82', '满送_01', '1445184000', '1445702400', '0', '4', '17', '1', null, null, null, '111', null, '2', '23', null, '31', '0', '0', null, null, '0', '0', '1445309066', 'admin', '1445309066', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('83', 'ms_dd', '1445184000', '1446134400', '1', null, null, null, '1.00', null, null, '111', '0', '0', '32', null, '33', '0', '0', null, null, '0', '0', '1445310426', 'admin', '1446171868', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('84', 'fasd', '1445356800', '1446220800', '1', null, null, null, '100.00', null, 'Array', 'fasd', '1', '3', '7', null, '30', '0', '0', null, '31,30', '0', '0', '1445398498', 'admin', '1446114771', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('85', '满送产品测试1105数量2！@#!@#Aa33', '1446048000', '1447171200', '2', null, null, null, null, '0', '3', '满送产品测试1105数量2！@#!@#Aa222222222222', null, '3', '7', null, '30', '1', '10', null, null, '1', '0', '1446110654', 'test_99', '1447140153', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('86', '产品组合优惠', '1445961600', '1447171200', '2', null, null, null, null, '0', '32,29,21,3', '产品组合：会员测试、图片季度会员\r\n全免三天；主播包月会员', null, '3', '43', null, '38', '0', '0', null, null, '1', '0', '1446111552', 'test_99', '1447140153', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('87', '产品数量2lltest赠送靓3杏币333', '1446048000', '1446825600', '0', '3', '31', '2', null, null, null, '', null, '0', '8', null, '24', '1', '3', null, null, '1', '0', '1446113658', 'test_99', '1446450666', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('88', '订单金额100Bb!@#00122', '1446048000', '1446652800', '1', null, null, null, '100.00', null, null, '订单金额100Bb!@#001!@#', '0', '0', '3', null, '17', '0', '0', null, null, '0', '0', '1446113827', 'test_99', '1446802173', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('89', '订单金额100Bb!@#00233', '1446048000', '1446566400', '1', null, null, null, '101.00', null, null, '订单金额100Bb!@#002！@#', '1', '0', '1', null, '19', '1', '4', null, '31,29,28,40,19', '0', '0', '1446113893', 'test_99', '1446877485', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('90', '视频会员1天数量2', '1447603200', '1447689599', '0', '1', '40', '2', null, null, null, '塔顶fasfas', null, '3', '43', null, '38', '0', '0', null, null, '1', '0', '1446434147', 'test_99', '1447826503', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('91', '视频会员1天数量3优惠价9', '1446393600', '1446566400', '0', '1', '40', '3', null, null, null, '塔顶f', null, '3', '7', null, '30', '1', '9', null, null, '0', '0', '1446434832', 'test_99', '1446877472', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('92', '靓数量3', '1446393600', '1446480000', '0', '2', '24', '3', null, null, null, '', null, '3', '43', null, '38', '0', '0', null, null, '0', '0', '1446447707', 'test_99', '1446797147', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('93', '图片包月数量3免费', '1446393600', '1446480000', '0', '2', '16', '3', null, null, null, '塔顶f', null, '0', '34', null, '40', '0', '0', null, null, '0', '0', '1446447977', 'test_99', '1446877465', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('94', '部分参与曲终人散20送资源zyTest', '1446393600', '1446480000', '1', null, null, null, '20.00', null, null, '', '1', '3', '7', null, '30', '0', '0', null, '32', '0', '0', '1446448393', 'test_99', '1446877443', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('95', '产品组合会员权限：会员测试-全免三天', '1446393600', '1446480000', '2', null, null, null, null, '0', '32,21', '', null, '1', '22', null, '36', '0', '0', null, null, '0', '0', '1446448858', 'test_99', '1447035463', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('96', 'asdfasdf会员测试产品组合', '1446393600', '1448294400', '2', null, null, null, null, '0', '32', '', null, '2', '23', null, '31', '0', '0', null, null, '1', '0', '1446450486', 'test_99', '1448271407', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('97', '视频会员1天产品组合', '1446393600', '1446480000', '2', null, null, null, null, '0', '34', '', null, '0', '32', null, '33', '0', '0', null, null, '1', '0', '1446450814', 'test_99', '1446452507', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('98', '产品组合所有会员类型', '1446393600', '1446480000', '2', null, null, null, null, '0', '37,34,32,31,29,28,27,21,20,8,4,3,2,1', 'fasd', null, '0', '32', null, '33', '0', '0', null, null, '1', '0', '1446452589', 'test_99', '1446453800', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('99', '产品组合图片包月会员', '1447776000', '1448899199', '0', '4', '17', '5', null, null, null, '', null, '0', '32', null, '33', '0', '0', null, null, '1', '0', '1446453362', 'test_99', '1448271407', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('100', '产品组合图片、视频包月会员', '1446393600', '1447862399', '2', null, null, null, null, '0', '4,3', 'fasd', null, '0', '4', null, '26', '0', '0', null, null, '1', '0', '1446453682', 'test_99', '1447834576', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('101', 'fasdf', '1446393600', '1447084800', '1', null, null, null, '100.00', null, null, '', '1', '0', '32', null, '33', '0', '0', null, '36', '1', '0', '1446461234', 'test_99', '1446707608', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('102', '满20送限时折扣', '1447862400', '1447948799', '0', '27', '41', '1', null, null, null, '', null, '0', '32', null, '33', '1', '1', null, null, '1', '0', '1446719742', 'admin01', '1447829098', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('103', '满二送一', '1446307200', '1447257599', '2', null, null, null, null, '0', '4,3', '买就送视频包月会员视频包月会员视频包月会员视频包月会员视频包月会员视频包月会员视频包月会员视频包月会员视频包月会员', null, '3', '7', null, '30', '0', '0', null, null, '0', '0', '1446797385', 'admin', '1447230833', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('104', '美夏', '1446393600', '1446480000', '0', '4', '17', '2', null, null, null, '的方法对方答复', null, '0', '3', null, '17', '0', '0', null, null, '0', '0', '1446870115', 'admin', '1446877410', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('105', '主播包月买二送一22', '1446307200', '1447603200', '0', '4', '17', '2', null, null, 'Array', '主播包月买二送一', null, '0', '3', null, '17', '0', '0', null, null, '0', '0', '1447433130', 'admin', '1447583223', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('106', 'fasdf', '1447516800', '1447603199', '0', '15', '36', '33', null, null, null, 'fasdf', null, '0', '32', null, '44', '1', '3', null, null, '0', '0', '1447580404', 'test_99', '1447580404', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('107', '满20送（曲终人散优惠价3）', '1447516800', '1447603199', '1', null, null, null, '20.00', null, null, '满20送（曲终人散优惠价3）', '0', '0', '4', null, '32', '1', '3', null, null, '0', '0', '1447580484', 'test_99', '1447582684', 'test_99');
INSERT INTO `sales_full_delivery` VALUES ('108', '反反复复50元促销', '1447689600', '1447775999', '1', null, null, null, '50.00', null, null, '反反复复50元促销', '0', '0', '3', null, '17', '0', '0', null, null, '1', '0', '1447640234', 'admin01', '1447826503', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('109', '视频-黄昏买2送1资源包年会员Cc123!@#包', '1447084800', '1447948799', '0', '1', '1', '2', null, null, null, '视频-黄昏买2送1资源包年会员Cc123!@#包', null, '3', '43', null, '38', '0', '0', null, null, '1', '0', '1447643343', 'test_99', '1447826503', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('110', '满送', '1446566400', '1447257600', '0', '4', '17', '2', null, null, null, '大法师', null, '0', '8', null, '4', '0', '0', null, null, '0', '0', '1447815387', 'admin', '1447815709', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('111', '优惠组合活动', '1446480000', '1447948799', '2', null, null, null, null, '0', '2', '打法上放大师傅', null, '0', '4', null, '32', '0', '0', null, null, '1', '0', '1447818447', 'admin', '1447826503', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('112', '主播包养满送（二送一测试）', '1447603200', '1448726399', '0', '4', '17', '2', null, null, null, '主播包养', null, '1', '45', null, '50', '0', '0', null, null, '0', '0', '1447830652', 'admin01', '1448715983', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('113', '测试满送', '1447603200', '1448467199', '0', '4', '17', '2', null, null, null, '大发发', null, '0', '1', null, '15', '0', '0', null, null, '1', '0', '1447833547', 'admin', '1448437833', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('114', '测试满送时间', '1447344000', '1448467199', '0', '3', '29', '2', null, null, null, '发发呆', null, '0', '2', null, '16', '0', '0', null, null, '1', '0', '1447833596', 'admin', '1448437833', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('115', 'dshdjshafkjdah ', '1446393600', '1447775999', '0', '31', '45', '2', null, null, null, 'dsf', null, '0', '32', null, '44', '0', '0', null, null, '1', '0', '1447833954', 'admin', '1447834576', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('116', '恋人心', '1447776000', '1448812799', '0', '27', '41', '2', null, null, null, '大法师', null, '0', '3', null, '17', '0', '0', null, null, '0', '0', '1447834242', 'admin', '1448716025', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('117', '特价商品', '1447776000', '1447862399', '1', null, null, null, '20.00', null, null, '特价', '0', '0', '4', null, '32', '1', '20', null, null, '1', '0', '1447836143', 'admin01', '1447836280', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('118', '地方噶第三方', '1446566400', '1448035199', '1', null, null, null, '20.00', null, null, '', '1', '0', '4', null, '32', '0', '0', null, null, '0', '0', '1447918789', 'admin', '1447918789', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('119', '疯狂11组合', '1448121600', '1448899199', '1', null, null, null, '1.00', null, null, '法发顺丰', '1', '0', '2', null, '16', '0', '0', null, '47', '1', '0', '1448270137', 'admin', '1448437833', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('120', '抢购双12数量', '1448121600', '1448899199', '0', '4', '17', '2', null, null, null, '发达', null, '0', '3', null, '43', '0', '0', null, null, '1', '0', '1448271055', 'admin', '1448437833', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('121', '金额优惠', '1448121600', '1448899199', '1', null, null, null, '50.00', null, null, '发大水发', '0', '0', '2', null, '16', '0', '0', null, '41', '1', '0', '1448271508', 'admin', '1448272533', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('122', '图片买2送1', '1448121600', '1448639999', '0', '2', '16', '2', null, null, null, '', null, '3', '7', null, '30', '0', '0', null, null, '1', '0', '1448299681', 'admin', '1448519653', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('123', '请不要动我的活动，谢谢！', '1448467200', '1448899199', '2', null, null, null, null, '4', '17,15', '打发地方', null, '0', '3', null, '17', '0', '0', null, null, '1', '0', '1448330244', 'admin', '1448519653', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('124', '产品数量满送赠送道具权限', '1448380800', '1448467199', '0', '4', '17', '1', null, null, null, '道具权限赠送', null, '1', '45', null, '50', '0', '0', null, null, '1', '0', '1448437979', 'admin', '1448504700', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('125', '订单金额满10元赠送', '1448380800', '1448726399', '1', null, null, null, '10.00', null, null, '', '0', '0', '32', null, '44', '1', '1', null, '44,48', '1', '0', '1448438254', 'admin', '1448701432', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('126', '订单金额满30元优惠', '1448380800', '1448639999', '1', null, null, null, '30.00', null, null, '', '0', '1', '22', null, '29', '0', '0', null, null, '1', '0', '1448438347', 'admin', '1448519653', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('127', '产品数量满送优惠', '1448380800', '1448639999', '0', '30', '51', '2', null, null, null, '', null, '0', '32', null, '44', '1', '3', null, null, '1', '0', '1448438577', 'admin', '1448504700', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('128', '满20元送', '1448294400', '1448812799', '1', null, null, null, '20.00', null, null, '', '0', '0', '4', null, '26', '0', '0', null, null, '0', '0', '1448470742', 'admin', '1448716637', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('129', '数量满3送', '1448467200', '1448899199', '0', '26', '48', '1', null, null, null, '', null, '1', '22', null, '29', '1', '1', null, null, '0', '0', '1448470926', 'admin', '1448701574', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('130', '主播包月买2送一', '1448294400', '1448553599', '0', '4', '17', '2', null, null, null, '', null, '0', '3', null, '17', '0', '0', null, null, '1', '0', '1448473761', 'admin', '1448504700', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('131', '数量测试', '1448640000', '1448899199', '0', '4', '17', '4', null, null, null, '大事发生', null, '0', '2', null, '16', '0', '0', null, null, '0', '0', '1448510016', 'admin', '1448852415', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('132', '发放', '1447776000', '1448899199', '1', null, null, null, '20.00', null, null, '大事发生', '1', '0', '4', null, '26', '0', '0', null, '44,48', '1', '0', '1448527992', 'admin', '1448701432', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('133', '优惠选择排序测试', '1448640000', '1448899199', '0', '26', '48', '1', null, null, null, '管理局 ', null, '2', '23', null, '52', '0', '0', null, null, '0', '0', '1448701518', 'admin', '1448769606', 'admin01');
INSERT INTO `sales_full_delivery` VALUES ('134', '满送优惠组合产品', '1448640000', '1449158399', '2', null, null, null, null, '27', '48,44', '所颠三倒四颠三倒四d', null, '2', '23', null, '52', '0', '0', null, null, '0', '0', '1448716308', 'admin01', '1448852251', 'admin');
INSERT INTO `sales_full_delivery` VALUES ('135', '组合赠送2', '1448640000', '1448899199', '2', null, null, null, null, '27', '48,44', '发生发顺丰', null, '2', '23', null, '52', '0', '0', null, null, '0', '0', '1448716841', 'admin01', '1448770180', 'admin01');

-- ----------------------------
-- Table structure for sales_limited_discount
-- ----------------------------
DROP TABLE IF EXISTS `sales_limited_discount`;
CREATE TABLE `sales_limited_discount` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(400) DEFAULT NULL COMMENT '标题',
  `begintime` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `scope` int(2) DEFAULT '0' COMMENT '促销范围 0全店参与 1部分参与  默认0',
  `desc` tinytext COMMENT '活动介绍',
  `discount_type` int(2) DEFAULT '0' COMMENT '折扣类型0 折扣  1金额(减去多少元)',
  `discount` decimal(16,2) DEFAULT NULL COMMENT '折扣 (discount_type=0,打多少折，如8折，则输入8即可，discount_type=1减去多少金额，如减掉100，则输入100即可)',
  `product_list_ids` varchar(3000) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '活动状态 默认0 正在进行 1 暂停 2已经过期 （过期通过时间判断 一般不该次字段',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否删除默认 0未删除',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(20) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='限时折扣促销';

-- ----------------------------
-- Records of sales_limited_discount
-- ----------------------------
INSERT INTO `sales_limited_discount` VALUES ('1', '标题', '1437408000', '1443542400', '1', null, '1', '0.00', null, '0', '1', null, null, '1439542372', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('2', '托尔斯泰', '1436803200', '1440950400', '1', 'asdfasasdfasdfsa', null, null, null, '1', '1', '1437496225', 'admin', '1439538802', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('3', 'bbbbbb', '1437926400', '1438272000', '0', '', '0', '1.00', null, '0', '1', '1437978948', 'admin', '1439542670', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('4', '测试活动', '1438876800', '1440518400', '1', '', null, null, null, '1', '1', '1439176702', 'admin', '1439538802', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('5', '限时折扣活动方案一', '1435680000', '1440950400', '0', '', '0', '50.00', null, '0', '1', '1439368397', 'admin', '1439542372', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('6', '测试限时折扣', '1435680000', '1439222400', '1', '', null, null, null, '0', '1', '1439368920', 'admin', '1439542670', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('7', '限时折扣', '1438704000', '1440950400', '0', '', '1', '5.00', null, '0', '1', '1439547566', 'admin', '1439798628', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('8', '测试活动', '1438358400', '1442160000', '1', '', null, null, null, '0', '1', '1440490979', 'admin', '1446186192', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('9', '金秋十月大促销', '1441814400', '1441900800', '1', '金秋十月大促销', null, null, null, '0', '1', '1440950281', 'admin', '1446186192', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('10', '限时活动', '1441036800', '1446220800', '1', '', null, null, null, '0', '1', '1441006516', 'admin', '1446186356', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('11', '十一黄金打折扣', '1441036800', '1446220800', '1', '很好', null, null, null, '1', '1', '1442218394', 'admin', '1446186373', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('12', '今夕', '1443542400', '1446220800', '1', '', null, null, null, '1', '1', '1443586144', 'admin', '1446186373', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('13', '十一大放送', '1443628800', '1443715200', '0', '', '0', '10.00', null, '0', '0', '1444032712', 'admin', '1444032712', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('14', 'sdsdsd', '1444060800', '1444147200', '1', '', null, null, null, '0', '0', '1444099421', 'admin', '1444099421', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('15', 'sdsdsd', '1444060800', '1444147200', '1', '', null, null, null, '0', '0', '1444099451', 'admin', '1444099451', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('16', 'sdsdsd', '1444060800', '1444147200', '1', '', null, null, null, '0', '0', '1444099510', 'admin', '1444099510', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('17', 'sdsdsd', '1444060800', '1444147200', '1', '', null, null, null, '0', '0', '1444099531', 'admin', '1444099531', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('18', 'sdsdsd', '1444060800', '1444147200', '1', '', null, null, null, '0', '0', '1444099548', 'admin', '1444099548', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('19', 'test', '1443628800', '1444060800', '0', '22', '0', '22.00', null, '0', '0', '1444311274', 'admin', '1444378528', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('20', 'www', '1443628800', '1446220800', '0', '', '1', '22.00', null, '0', '1', '1444312825', 'admin', '1446186356', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('21', 'test2', '1443628800', '1445443200', '0', '', '1', '23.00', null, '0', '1', '1444312855', 'admin', '1444484594', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('22', '货送', '1441036800', '1443628800', '0', '', '1', '2.00', null, '1', '0', '1444360368', 'admin', '1444381535', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('23', 'test', '1444233600', '1444492800', '0', '', '1', '100.00', null, '0', '1', '1444484649', 'admin', '1444484764', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('24', 'test2', '1444233600', '1444492800', '0', 'test2', '1', '50.00', null, '0', '1', '1444484733', 'admin', '1444484840', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('25', 'test32', '1444233600', '1444492800', '0', '60', '0', '60.00', null, '0', '1', '1444484811', 'admin', '1444484860', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('26', 'zk100', '1444233600', '1444492800', '0', '', '1', '100.00', null, '1', '0', '1444484883', 'admin', '1444486914', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('27', 'zk50', '1444233600', '1445097600', '0', '', '1', '50.00', null, '0', '0', '1444484913', 'admin', '1444900719', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('28', 'zk200', '1444147200', '1444492800', '0', '', '1', '200.00', null, '1', '0', '1444484945', 'admin', '1444658250', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('29', 'zk50%', '1444233600', '1444492800', '0', '', '0', '10.00', null, '0', '1', '1444485007', 'admin', '1444485120', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('30', 'zk50%', '1444147200', '1444492800', '0', '', '0', '50.00', null, '0', '1', '1444485051', 'admin', '1444485120', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('31', 'zk80%', '1444233600', '1444665600', '0', '', '0', '80.00', null, '0', '1', '1444485090', 'admin', '1444485120', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('32', 'zk10%', '1444233600', '1444492800', '0', '10', '0', '10.00', null, '1', '0', '1444485136', 'admin', '1444486914', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('33', 'zk80%', '1444147200', '1444492800', '0', '', '0', '80.00', null, '1', '0', '1444485167', 'admin', '1444486914', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('34', 'bf1000', '1444233600', '1444492800', '1', '', null, null, null, '1', '0', '1444486444', 'admin', '1444490721', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('35', 'zk_yh1000', '1444147200', '1444752000', '0', 'test', '1', '500.00', null, '1', '0', '1444658275', 'admin', '1444699457', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('36', 'hd_100', '1445184000', '1445616000', '0', 'test', '1', '100.00', null, '1', '0', '1445308097', 'admin', '1445326224', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('37', '活动_02', '1445184000', '1445529600', '0', 'test', '1', '80.00', null, '1', '0', '1445308571', 'admin', '1445326224', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('38', '活动_03', '1445184000', '1445702400', '0', 're', '0', '60.00', null, '0', '0', '1445308904', 'admin', '1445326600', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('39', '折扣-002', '1445184000', '1445529600', '1', 'test', null, null, null, '0', '1', '1445310559', 'admin', '1445310821', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('40', '折扣-002', '1445184000', '1445529600', '1', 'test', null, null, null, '0', '1', '1445310578', 'admin', '1445310821', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('41', '折扣--003', '1444579200', '1445616000', '1', 'test', null, null, null, '0', '0', '1445310789', 'admin', '1445310789', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('42', '测试可作废', '1443628800', '1443715200', '1', '', null, null, null, '0', '0', '1445311592', 'admin', '1445311592', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('43', '批量商品折扣', '1443628800', '1445356800', '1', '', null, null, null, '1', '0', '1445326239', 'admin', '1445326606', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('44', 'fff', '1445356800', '1445443200', '1', 'ddd', null, null, null, '0', '0', '1445407123', 'admin', '1445407123', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('45', 'fff2', '1445356800', '1445443200', '0', 'fasdf', '0', '20.00', null, '0', '0', '1445407414', 'admin', '1445407414', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('46', '全店折扣0.3Aa!@#！@#001', '1446134400', '1446566400', '0', '全店折扣0.3Aa!@#！@#001fasd', '0', '30.00', null, '1', '0', '1446173409', 'test_99', '1446523861', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('47', '全店金额40.56Aa!@#！@#00133344', '1446134400', '1446911999', '0', '', '1', '40.56', null, '0', '0', '1446173461', 'test_99', '1447035528', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('48', '部分参与001！@#!!@#32', '1446134400', '1446307200', '1', '部分参与001！@#!!@#fsdfad', null, null, null, '1', '0', '1446185516', 'test_99', '1446454660', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('49', 'asff', '1446393600', '1446566400', '1', '', null, null, null, '1', '0', '1446436162', 'test_99', '1446454660', 'test_99');
INSERT INTO `sales_limited_discount` VALUES ('50', '全店折扣八折', '1446393600', '1447862399', '0', '塔顶f', '0', '80.00', null, '0', '0', '1446454531', 'test_99', '1447840999', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('51', '部分折扣-黄昏-0.2', '1446307200', '1447862399', '1', '塔顶f', null, null, null, '0', '0', '1446454611', 'test_99', '1447840957', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('52', '全店折扣0.1', '1446480000', '1446566400', '0', '塔顶f', '0', '10.00', null, '1', '0', '1446523917', 'test_99', '1446707284', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('53', '全店参与折扣2.5元', '1446480000', '1446566400', '0', '', '1', '2.50', null, '1', '0', '1446524142', 'test_99', '1446707284', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('54', '限时折扣01', '1446652800', '1448380799', '0', '', '0', '20.00', null, '1', '0', '1446707195', 'admin01', '1448273947', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('55', '限时折扣（8折）', '1446652800', '1446739200', '0', '', '0', '80.00', null, '0', '0', '1446707823', 'admin01', '1446802149', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('56', '全店参与折扣20%', '1446652800', '1448380799', '0', '全店参与折扣20%', '0', '20.00', null, '1', '0', '1446718635', 'test_99', '1448273988', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('57', '全店商品参加8折', '1446652800', '1446739200', '0', '', '0', '80.00', null, '0', '1', '1446719401', 'admin01', '1446801157', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('58', '范德萨', '1446652800', '1446739199', '0', '', '0', '4.00', null, '0', '0', '1446874178', 'admin', '1446874240', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('59', '双11折扣价', '1446307200', '1447862399', '1', '赶快来参加哟', null, null, null, '1', '0', '1447138993', 'admin', '1447829361', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('60', 'asdas', '1446480000', '1447862399', '0', '', '0', '20.00', null, '1', '0', '1447576457', 'admin01', '1447829361', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('61', 'gegr', '1447084800', '1447257599', '0', '', '0', '3.00', null, '0', '0', '1447576513', 'admin01', '1447576513', 'admin01');
INSERT INTO `sales_limited_discount` VALUES ('62', '20151116限时折扣5折', '1446393600', '1446566399', '1', '5折', null, null, null, '0', '0', '1447640112', 'admin01', '1447817186', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('63', '限时折扣', '1446480000', '1447171199', '0', '打发', '0', '10.00', null, '0', '0', '1447816590', 'admin', '1447816590', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('64', '产品金额优惠', '1448726400', '1448899199', '1', '', null, null, null, '0', '0', '1447828069', 'admin01', '1448853577', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('65', '1折', '1447689600', '1447862399', '0', 'ut', '0', '10.00', null, '1', '0', '1447830687', 'admin01', '1447835226', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('66', '是打发打发', '1447084800', '1448035199', '1', '大师傅 ', null, null, null, '0', '0', '1447918601', 'admin', '1447918601', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('67', '26测试折扣', '1448726400', '1448899199', '1', '开心开心', null, null, null, '0', '0', '1448335073', 'admin01', '1448853497', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('68', '折扣', '1447603200', '1448899199', '0', '', '1', '5.00', null, '1', '0', '1448336863', 'admin', '1448701265', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('69', '是打发斯蒂芬', '1448726400', '1448899199', '0', '', '1', '10.00', null, '1', '0', '1448337550', 'admin', '1448853560', 'admin');
INSERT INTO `sales_limited_discount` VALUES ('70', '打折扣', '1448726400', '1449158399', '0', '', '0', '10.00', null, '0', '0', '1448525492', 'admin', '1449137957', 'admin');

-- ----------------------------
-- Table structure for sales_limited_product
-- ----------------------------
DROP TABLE IF EXISTS `sales_limited_product`;
CREATE TABLE `sales_limited_product` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sales_limited_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `product_id` bigint(20) DEFAULT NULL,
  `discount` int(11) DEFAULT '0' COMMENT '优惠',
  `final` int(11) DEFAULT NULL COMMENT '最终价',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(60) DEFAULT NULL COMMENT '添加人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `updatedby` varchar(60) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='满送商品';

-- ----------------------------
-- Records of sales_limited_product
-- ----------------------------
INSERT INTO `sales_limited_product` VALUES ('1', '2', '2', '0', '600', '1439014927', 'admin', '1439014927', 'admin');
INSERT INTO `sales_limited_product` VALUES ('2', '4', '1', '50', '50', '1439176759', 'admin', '1439176759', 'admin');
INSERT INTO `sales_limited_product` VALUES ('3', '4', '2', '100', '500', '1439176800', 'admin', '1439176800', 'admin');
INSERT INTO `sales_limited_product` VALUES ('8', '6', '2', '601', '540', '1439369016', 'admin', '1439369424', 'admin');
INSERT INTO `sales_limited_product` VALUES ('10', '6', '3', '50', '0', '1439369035', 'admin', '1439369432', 'admin');
INSERT INTO `sales_limited_product` VALUES ('11', '6', '1', '0', '100', '1439369420', 'admin', '1439369424', 'admin');
INSERT INTO `sales_limited_product` VALUES ('15', '8', '18', '0', '20', '1440491227', 'admin', '1440491299', 'admin');
INSERT INTO `sales_limited_product` VALUES ('16', '8', '17', '0', '10', '1440491231', 'admin', '1440491299', 'admin');
INSERT INTO `sales_limited_product` VALUES ('21', '8', '16', '0', '10', '1440491267', 'admin', '1440491299', 'admin');
INSERT INTO `sales_limited_product` VALUES ('22', '8', '15', '0', '10', '1440491267', 'admin', '1440491299', 'admin');
INSERT INTO `sales_limited_product` VALUES ('23', '9', '1', '20', '80', '1440950325', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('24', '9', '19', '3', '7', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('25', '9', '18', '2', '18', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('26', '9', '17', '1', '9', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('27', '9', '16', '5', '5', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('28', '9', '15', '2', '8', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('29', '9', '14', '1', '9', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('30', '9', '4', '3', '17', '1440950328', 'admin', '1440950328', 'admin');
INSERT INTO `sales_limited_product` VALUES ('40', '11', '19', '0', '1', '1442220099', 'admin', '1442220099', 'admin');
INSERT INTO `sales_limited_product` VALUES ('41', '11', '18', '0', '20', '1442220100', 'admin', '1442220100', 'admin');
INSERT INTO `sales_limited_product` VALUES ('42', '11', '17', '0', '10', '1442220107', 'admin', '1442220107', 'admin');
INSERT INTO `sales_limited_product` VALUES ('45', '12', '20', '0', '98', '1443586214', 'admin', '1443586214', 'admin');
INSERT INTO `sales_limited_product` VALUES ('46', '34', '32', '4', '0', '1444486531', 'admin', '1444486531', 'admin');
INSERT INTO `sales_limited_product` VALUES ('47', '34', '26', '99', '1', '1444486580', 'admin', '1444486586', 'admin');
INSERT INTO `sales_limited_product` VALUES ('48', '40', '33', '1', '10', '1445310592', 'admin', '1445310592', 'admin');
INSERT INTO `sales_limited_product` VALUES ('49', '41', '33', '1', '10', '1445310805', 'admin', '1445310805', 'admin');
INSERT INTO `sales_limited_product` VALUES ('50', '43', '17', '5', '5', '1445326300', 'admin', '1445326300', 'admin');
INSERT INTO `sales_limited_product` VALUES ('51', '44', '33', '2', '9', '1445407339', 'admin', '1445407339', 'admin');
INSERT INTO `sales_limited_product` VALUES ('52', '48', '31', '4', '18', '1446185550', 'test_99', '1446185550', 'test_99');
INSERT INTO `sales_limited_product` VALUES ('54', '51', '19', '3', '7', '1446454630', 'test_99', '1446454630', 'test_99');
INSERT INTO `sales_limited_product` VALUES ('55', '51', '33', '0', '11', '1447034544', 'admin', '1447034544', 'admin');
INSERT INTO `sales_limited_product` VALUES ('56', '59', '32', '2', '3', '1447139015', 'admin', '1447139015', 'admin');
INSERT INTO `sales_limited_product` VALUES ('57', '62', '44', '0', '3', '1447640155', 'admin01', '1447640155', 'admin01');
INSERT INTO `sales_limited_product` VALUES ('58', '64', '41', '0', '5', '1447828092', 'admin01', '1447828092', 'admin01');
INSERT INTO `sales_limited_product` VALUES ('59', '67', '40', '3', '3', '1448521868', 'admin', '1448521873', 'admin');

-- ----------------------------
-- Table structure for syspermission
-- ----------------------------
DROP TABLE IF EXISTS `syspermission`;
CREATE TABLE `syspermission` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(100) DEFAULT NULL COMMENT '权限项id 唯一，用英文',
  `name` varchar(100) DEFAULT NULL COMMENT '权限项名',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `group` varchar(100) DEFAULT NULL COMMENT '分组',
  `isvalid` int(2) DEFAULT '1' COMMENT '有效',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updateduser` varchar(20) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统权限项表';

-- ----------------------------
-- Records of syspermission
-- ----------------------------
INSERT INTO `syspermission` VALUES ('1', 'sales', '促销管理', '促销管理下面的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('2', 'product', '产品管理', '产品管理下面的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('3', 'product_permission', '产品权限', '产品权限管理下面的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('4', 'works_library', '作品管理', '作品管理下面的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('5', 'works_library_log', '运营管理', '运营管理下面的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('6', 'content', '内容配置', '内容配置下的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('7', 'order_customer', '订单管理', '订单管理下的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('8', 'finance', '财务管理', '财务管理下的所有功能', '0', null, '1', null, null, null, null);
INSERT INTO `syspermission` VALUES ('9', 'system', '系统管理', '系统管理下所有功能', '0', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `isadministrator` int(2) DEFAULT '0' COMMENT '超级管理员',
  `isvalid` int(2) DEFAULT '1' COMMENT '有效',
  `last_login_time` bigint(20) DEFAULT '0' COMMENT '最后登录',
  `current_login_time` bigint(20) DEFAULT '0' COMMENT '本次登录',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `error_count` tinyint(4) DEFAULT NULL COMMENT '登录错误次数',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '1', '1', '1449026316', '1449026316', null, null, '1449026316', null, '0');
INSERT INTO `sysuser` VALUES ('2', 'lr', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1445321141', '1445321141', '1439285708', null, '1445321141', null, '0');
INSERT INTO `sysuser` VALUES ('3', 'rong', '96e79218965eb72c92a549dd5a330112', '0', '1', '1444372758', '0', '1443510852', null, '1444372758', null, null);
INSERT INTO `sysuser` VALUES ('5', 'test1', 'e3ceb5881a0a1fdaad01296d7554868d', '0', '1', '1444481876', '0', '1444481384', null, '1444970237', null, null);
INSERT INTO `sysuser` VALUES ('6', 'admin01', '96e79218965eb72c92a549dd5a330112', '0', '1', '1449133760', '1449133760', '1446107902', null, '1449133760', null, '0');
INSERT INTO `sysuser` VALUES ('7', 'test_99', 'b24331b1a138cde62aa1f679164fc62f', '0', '1', '1447640066', '1447640066', '1446108989', null, '1447640066', null, '0');
INSERT INTO `sysuser` VALUES ('9', 'test_98', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '1446286187', '1446286187', '1446286126', null, '1446286187', null, '0');

-- ----------------------------
-- Table structure for sysuser_permission
-- ----------------------------
DROP TABLE IF EXISTS `sysuser_permission`;
CREATE TABLE `sysuser_permission` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sysuserid` bigint(20) DEFAULT NULL COMMENT '系统用户',
  `syspermissionid` bigint(20) DEFAULT NULL COMMENT '权限项',
  `permission_id` varchar(100) DEFAULT NULL COMMENT '权限项id 唯一  用英文',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='系统用户权限表';

-- ----------------------------
-- Records of sysuser_permission
-- ----------------------------
INSERT INTO `sysuser_permission` VALUES ('13', '1', '1', 'sales', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('14', '1', '2', 'product', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('15', '1', '3', 'product_permission', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('16', '1', '4', 'works_library', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('17', '1', '5', 'works_library_log', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('18', '1', '6', 'content', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('19', '1', '7', 'order_customer', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('20', '1', '8', 'finance', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('21', '1', '9', 'system', '1442298994', 'admin');
INSERT INTO `sysuser_permission` VALUES ('22', '2', '1', 'sales', '1442299341', 'admin');
INSERT INTO `sysuser_permission` VALUES ('23', '2', '2', 'product', '1442299341', 'admin');
INSERT INTO `sysuser_permission` VALUES ('24', '2', '3', 'product_permission', '1442299341', 'admin');
INSERT INTO `sysuser_permission` VALUES ('36', '3', '1', 'sales', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('37', '3', '2', 'product', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('38', '3', '3', 'product_permission', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('39', '3', '4', 'works_library', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('40', '3', '5', 'works_library_log', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('41', '3', '6', 'content', '1444364185', 'admin');
INSERT INTO `sysuser_permission` VALUES ('42', '4', '1', 'sales', '1444481267', 'admin');
INSERT INTO `sysuser_permission` VALUES ('43', '4', '2', 'product', '1444481267', 'admin');
INSERT INTO `sysuser_permission` VALUES ('44', '4', '3', 'product_permission', '1444481267', 'admin');
INSERT INTO `sysuser_permission` VALUES ('56', '5', '1', 'sales', '1444970237', 'admin');
INSERT INTO `sysuser_permission` VALUES ('57', '5', '4', 'works_library', '1444970237', 'admin');
INSERT INTO `sysuser_permission` VALUES ('58', '5', '7', 'order_customer', '1444970237', 'admin');
INSERT INTO `sysuser_permission` VALUES ('59', '5', '9', 'system', '1444970237', 'admin');
INSERT INTO `sysuser_permission` VALUES ('60', '6', '1', 'sales', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('61', '6', '2', 'product', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('62', '6', '3', 'product_permission', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('63', '6', '4', 'works_library', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('64', '6', '5', 'works_library_log', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('65', '6', '6', 'content', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('66', '6', '7', 'order_customer', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('67', '6', '8', 'finance', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('68', '6', '9', 'system', '1446107902', 'admin');
INSERT INTO `sysuser_permission` VALUES ('91', '7', '1', 'sales', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('92', '7', '2', 'product', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('93', '7', '3', 'product_permission', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('94', '7', '4', 'works_library', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('95', '7', '5', 'works_library_log', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('96', '7', '6', 'content', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('97', '7', '7', 'order_customer', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('98', '7', '8', 'finance', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('99', '7', '9', 'system', '1446285978', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('109', '8', '1', 'sales', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('110', '8', '2', 'product', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('111', '8', '3', 'product_permission', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('112', '8', '4', 'works_library', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('113', '8', '5', 'works_library_log', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('114', '8', '6', 'content', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('115', '8', '7', 'order_customer', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('116', '8', '8', 'finance', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('117', '8', '9', 'system', '1446286038', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('126', '9', '1', 'sales', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('127', '9', '2', 'product', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('128', '9', '3', 'product_permission', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('129', '9', '4', 'works_library', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('130', '9', '5', 'works_library_log', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('131', '9', '6', 'content', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('132', '9', '7', 'order_customer', '1446286176', 'test_99');
INSERT INTO `sysuser_permission` VALUES ('133', '9', '8', 'finance', '1446286176', 'test_99');

-- ----------------------------
-- Table structure for sys_profit_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_profit_setting`;
CREATE TABLE `sys_profit_setting` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `first_id` bigint(20) DEFAULT NULL COMMENT '一级分类',
  `discount` int(8) DEFAULT '100' COMMENT '折扣比例 整数 如20 则表示20%',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='单次点播收益计算设置';

-- ----------------------------
-- Records of sys_profit_setting
-- ----------------------------
INSERT INTO `sys_profit_setting` VALUES ('1', '1', '20', '1446196707');
INSERT INTO `sys_profit_setting` VALUES ('2', '2', '30', '1446196707');
INSERT INTO `sys_profit_setting` VALUES ('3', '3', '40', '1446196707');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(400) DEFAULT NULL COMMENT '头像',
  `isvalid` int(2) DEFAULT '1' COMMENT '有效',
  `last_login_time` bigint(20) DEFAULT NULL COMMENT '上次登录',
  `current_login_time` bigint(20) DEFAULT NULL COMMENT '本次登录',
  `user_type` int(2) DEFAULT '0' COMMENT '用户类型0 普通用户   1主播',
  `usersign_id` bigint(20) DEFAULT NULL COMMENT '用户签名 等级资料',
  `bank_id` bigint(20) DEFAULT NULL COMMENT '银行id#对应user_info_bank表',
  `useranchor_id` bigint(20) DEFAULT NULL COMMENT '主播资料',
  `useramount_id` bigint(20) DEFAULT NULL COMMENT '会员账户',
  `fans_num` bigint(20) DEFAULT '0' COMMENT '粉丝数',
  `attention_num` bigint(20) DEFAULT '0' COMMENT '关注数',
  `ucenter_uid` bigint(20) DEFAULT NULL COMMENT 'uc管理用户ID',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `work_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '作品数',
  `sex` int(2) DEFAULT '1' COMMENT '性别 0女 1男',
  `birthday` bigint(20) DEFAULT NULL COMMENT '生日',
  `signature` varchar(225) DEFAULT NULL COMMENT '签名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `is_vip` int(3) DEFAULT '0' COMMENT '是否为终极会员0不是1是',
  `vip_time` bigint(20) DEFAULT NULL COMMENT '成为vip时间',
  `error_count` int(3) DEFAULT '0' COMMENT '密码错误次数#达到指定次数 就无法登陆',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tianhong', '123121', '豆豆', 'photos/1.JPG', '1', '1439173758', '1439173758', '1', null, null, '1', null, '3', '0', null, null, null, '1444384359', null, '13', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('2', '蓝色心情（主播）', '12312', '明年今天', 'photos/2.JPG', '1', '1439173758', '1439173758', '0', '41', null, '7', null, '3', '0', null, null, null, '1444380635', null, '5', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('3', 'admin', '123456', '猫猫', 'photos/5.JPG', '1', '1449025568', '1450418620', '0', '1', '9', '8', null, '0', '0', '1', null, null, '1450418620', null, '5', '1', '631123200', '个性签名啊', '254597263@qqq.ccc', '0', null, '1');
INSERT INTO `users` VALUES ('4', 'tina', '123456', '分卡拉奇', 'photos/4.JPG', '1', '1439173758', '1439173758', '0', '31', null, '9', null, '3', '0', null, null, null, '1445307522', null, '5', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('5', 'moongril', '123456', '为了将来不后悔', 'photos/5.JPG', '1', '1439173758', '1439173758', '0', '43', null, '10', null, '2', '0', null, null, null, '1443428230', null, '5', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('6', 'flytwo', '123456', '只要你飞', 'photos/6.jpg', '1', '1439173758', '1439173758', '0', '44', null, '11', null, '2', '0', null, null, null, '1444380589', null, '1', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('7', 'serven', '123456', '青青草', 'photos/8.JPG', '1', '1439173758', '1439173758', '0', '42', null, '12', null, '1', '0', null, null, null, '1448718776', null, '3', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('8', 'twotree', '123456', '就比你矮', 'c488527290/c488527290b53310c35ce681815fc2df.jpg', '1', '1439173758', '1439173758', '0', '30', null, '5', null, '3', '0', null, null, null, '1445307286', null, '1', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('9', 'tree', '123456', '萌萌达', 'photos/2.JPG', '1', '1439173758', '1439173758', '0', '45', null, '4', null, '1', '0', null, null, null, '1443430444', null, '1', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('10', 'iccool', '123456', '我很美', 'photos/1.JPG', '1', '1439173758', '1439173758', '0', '26', null, '3', null, '1', '0', null, null, null, '1441528608', null, '4', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('11', 'kooew', '123456', '漂亮美眉', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '1', '1439173758', '1439173758', '0', '47', null, '2', null, '3', '0', null, null, null, '1443428514', null, '1', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('12', 'sheik', '123456', '模特身材', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '1', '1439173758', '1439173758', '0', '46', null, '14', null, '2', '0', null, null, null, '1444380495', null, '2', '1', null, null, null, '0', null, '0');
INSERT INTO `users` VALUES ('13', 'yaolei', '8dd8b602c0cc264d4782ffc9e1f31d35', '我是女生', 'photos/1.JPG', '1', '1444372953', '1444372965', '0', '10', null, '21', null, '0', '0', '4', '1439536661', null, '1444372965', null, '0', '1', null, null, null, '0', null, '3');
INSERT INTO `users` VALUES ('14', '地平线上的泪水', '9ba9bcd4f585f0817820a9ab79053d2d', '小刘女生', 'photos/5.JPG', '1', '1443409437', '1443409437', '0', '9', null, '16', null, '3', '3', '5', '1439536799', null, '1444709348', null, '3', '2', '631123200', '', '', '0', null, '0');
INSERT INTO `users` VALUES ('15', 'lr', '30837b47c1911597629c8b4f9b09b0e8', '刘小姐', 'photos/1.JPG', '1', '1448508981', '1448508981', '0', '2', null, '18', null, '0', '1', '6', '1440382923', null, '1448508981', null, '1', '1', '631123200', null, null, '0', null, '0');
INSERT INTO `users` VALUES ('16', 'xiaoyao', '661a1a9ae135424a796747a80b89d248', 'xiaoyao', 'photos/10.jpg', '1', null, '1443060425', '0', null, null, '19', null, '0', '0', '7', '1440730363', null, '1443413059', null, '0', '1', null, null, '2323@qq.com', '0', null, '3');
INSERT INTO `users` VALUES ('17', 'liu', '4629a2d25831038c2cf5738f4fad295c', 'liu', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '1', '1443149373', '1443149373', '0', null, null, '15', null, '0', '1', '8', '1440730396', null, '1443153825', null, '0', '1', null, null, 'lr@dtjgroup.cn', '0', null, '3');
INSERT INTO `users` VALUES ('18', 'xiaoyaoyao', '57c08d8770990ccc24e851caf9556b53', 'xiaoyaoyao', 'photos/10.jpg', '1', null, '1444356309', '0', null, null, '23', null, '0', '0', '9', '1440730404', null, '1444356309', null, '0', '1', null, null, '2221123@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('19', 'xiaohuihui', '8cf76e6ee5cb87f5eb84101ba4bdb04d', 'xiaohuihui', 'photos/6.jpg', '1', null, '1440730685', '0', '6', '4', '24', '9', '0', '0', '10', '1440730685', null, '1440730685', null, '0', '1', null, null, '23212321@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('20', 'rr', '05b24134953d72ff303e8cb5402509a5', 'rr', 'photos/1.JPG', '1', '1443153558', '1443153558', '1', '7', '5', '14', '10', '3', '9', '11', '1440732845', null, '1447051310', null, '6', '1', '631123200', '', '123@qq.com', '1', '1443061654', '3');
INSERT INTO `users` VALUES ('21', 'franktester', 'b4e376dd15dcbe14d6feef121e19663c', 'franktester', 'photos/1.JPG', '1', '1444393513', '1444394823', '1', '8', '6', '15', '11', '0', '2', '12', '1440952043', null, '1444394823', null, '0', '1', '631123200', null, 'frank@gmail.com', '0', null, '1');
INSERT INTO `users` VALUES ('22', 'xiaosan', 'aae60722b844fc3cf4c78403603a340f', 'xiaosan', 'photos/4.JPG', '1', '1446775973', '1446775973', '1', '11', '7', '16', '12', '2', '0', '13', '1441506186', null, '1446775973', null, '1', '1', null, null, '254545454@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('23', 'test', '48340d1fc1f4f9b4211a4fad654c9893', 'test', 'photos/3.JPG', '1', null, '1441699794', '0', '12', '8', '28', '13', '0', '0', '14', '1441699794', null, '1441699794', null, '0', '1', null, null, 'aa@aa.com', '0', null, '0');
INSERT INTO `users` VALUES ('24', 'test111111', 'a9595cbcd9bf4d22f7a1e58cd434511a', 'test111111', 'photos/2.JPG', '1', null, '1441703176', '0', '13', '9', '29', '14', '0', '0', '15', '1441703176', null, '1441703176', null, '0', '1', null, null, 'aa@aac.com', '0', null, '0');
INSERT INTO `users` VALUES ('25', 'rong', '0ca4ab593381918195a7a2f00cc57db3', 'rong', 'photos/7.JPG', '1', '1448009450', '1448009450', '0', '14', '10', '30', '30', '2', '7', '16', '1442373629', null, '1448009450', null, '3', '0', '631123200', '你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔', '234@qq.com', '1', '1443594834', '0');
INSERT INTO `users` VALUES ('26', 'xiaolei', '620dc7e2f21f3912add4a370d60b42bc', 'xiaolei', 'photos/10.jpg', '1', null, '1442460487', '0', '15', '11', '31', '31', '0', '0', '17', '1442460487', null, '1442460487', null, '0', '1', null, null, 'as2@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('27', 'mayi', 'a96a163fe82e46953ff2f4223dfdd2bb', 'mayi', 'photos/4.JPG', '1', null, '1442547667', '0', '16', '12', '32', '32', '0', '0', '18', '1442547667', null, '1442547667', null, '0', '1', null, null, '212312@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('28', 'll', '609b754808ff399b1a6cf2ba37eb7fd2', 'll', 'photos/10.jpg', '1', '1443427865', '1443427865', '0', '17', '13', null, '33', '0', '0', '19', '1443426709', null, '1443595030', null, '0', '1', null, null, '1039@qq.com', '0', null, '3');
INSERT INTO `users` VALUES ('29', '小新测试', 'a73b8a9ce11633e5ebed4110c6695de2', '小新测试', 'photos/10.jpg', '1', null, '1444027121', '1', '18', '14', '13', '34', '1', '0', '20', '1444027120', null, '1444278359', null, '1', '1', null, null, 'xiaooxinceshe@126.com', '0', null, '0');
INSERT INTO `users` VALUES ('30', 'test_01', 'a86562c46e450cd891619eb6f738594f', 'test_01', 'photos/6.jpg', '1', '1449023735', '1449023735', '1', '19', '8', '12', '35', '2', '12', '21', '1444277339', null, '1449023735', null, '12', '1', '631123200', '你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好你好你好你好喔喔喔喔喔喔喔喔喔喔你好你好', '555@qq.com', '1', '1445309030', '0');
INSERT INTO `users` VALUES ('31', 'test_02', '3195e0b9f426387a0ed6566c9ea406bd', 'test_02', 'photos/11.jpg', '1', '1448957651', '1448957651', '1', '20', '6', '3', '36', '0', '3', '22', '1444277380', null, '1448957651', null, '1', '1', '631123200', '', 'test_02@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('32', 'test_03', 'dc7a29d4195a1b23a6ffa73ef8d0473f', 'test_03', 'photos/11.jpg', '1', '1448009512', '1448009512', '1', '21', '17', '4', '37', '2', '4', '23', '1444277402', null, '1448009512', null, '14', '1', '631123200', '', 'test_03@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('33', 'test_04', '717f0d824f911a34a2ecbe33414a1ee3', 'test_04', 'photos/6.jpg', '1', '1448009493', '1448009493', '1', '22', '18', '5', '38', '2', '4', '24', '1444380086', null, '1448009493', null, '8', '1', '631123200', 'dsf sdf sdf slfljks al', 'test_04@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('34', 'test_05', 'ee383ac546b3bef8f5773b10e8edfd8d', 'test_05', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '1', '1448611837', '1448611837', '1', '23', '19', '6', '39', '1', '2', '25', '1444382375', null, '1448613580', null, '10', '1', '631123200', '发射点发射点萨芬啊手动阀撒', 'test_01@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('35', 'test_06', '1fcf020179db24ba379eeb90adcab709', 'test_06', 'photos/11.jpg', '1', '1448606321', '1448606321', '1', '24', '20', '7', '40', '2', '0', '26', '1444382759', null, '1448606321', null, '10', '1', '631123200', '', 'test_06@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('36', 'gaylen', '0092f2a40a437bdc2d15d753aa4cca02', 'gaylen', 'photos/10.jpg', '1', '1444614719', '1444614719', '1', '25', '21', '8', '41', '2', '0', '27', '1444613354', null, '1448613580', null, '10', '1', null, null, 'gaylen@moonjoy.net', '0', null, '0');
INSERT INTO `users` VALUES ('37', 'test-yaolei', 'e5876ce36153002e8a43fff03c455e5b', 'test-yaolei', 'photos/10.jpg', '1', null, '1445235572', '0', '27', '22', null, '42', '0', '0', '28', '1445235572', null, '1445235572', null, '3', '1', '631123200', '', '2321@qq.ccc', '0', null, '0');
INSERT INTO `users` VALUES ('38', 'test-ulir', 'dbe8f574cfcb9d6688fc739c3ae9a424', 'test-ulir', 'photos/10.jpg', '1', null, '1445239022', '0', '28', '23', null, '43', '0', '0', '29', '1445239022', null, '1445239022', null, '0', '1', null, null, '12321@qq.ccc', '0', null, '0');
INSERT INTO `users` VALUES ('39', 'test-liurong', '946eec12e13b228b064b387e5247445b', 'test-liurong', 'photos/10.jpg', '1', '1445239766', '1445239766', '0', '29', '24', '9', '44', '2', '0', '30', '1445239269', null, '1446365177', null, '7', '1', null, null, 'adsa@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('40', 'test_09', '8b5b7f6f6ee5537206f082d291047d63', 'test_09', '2b04df3ecc/2b04df3ecc1d94afddff082d139c6f15.jpg', '1', '1447642640', '1447642640', '0', '32', '25', '17', '45', '1', '1', '31', '1445753339', null, '1447642640', null, '2', '1', null, null, 'test_09@163.com', '0', null, '0');
INSERT INTO `users` VALUES ('41', 'faa123', '9f3388ca455a3274b7c56444b6042f64', 'faa123', 'photos/7.JPG', '1', '1449136722', '1449136722', '0', '33', '11', '18', '46', '1', '2', '32', '1446025830', null, '1449138363', null, '9', '1', '631123200', '测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的测试测试的世界世界的mm', '331585682@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('42', 'faa12', '18fda63de3530fe0e0c85213b2ae3b8f', 'faa12', 'photos/10.jpg', '1', '1448523346', '1448523346', '0', '34', '27', null, '47', '0', '0', '33', '1446026050', null, '1448523346', null, '1', '1', null, null, '33151@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('43', 'test01', 'e7aac266cd51020cceb87a71cc5f8944', 'test01', 'photos/10.jpg', '1', '1447836181', '1448504301', '0', '35', '28', null, '48', '0', '0', '34', '1446026730', null, '1448504301', null, '1', '1', null, null, '331585682@qq.com', '0', null, '1');
INSERT INTO `users` VALUES ('44', 'p01', '243db761ef6f91562696f5f439dc6a61', 'p01', 'http://pic2.ooopic.com/10/23/79/75bOOOPICa3.jpg', '1', '1448866547', '1448866547', '0', '36', '29', null, '49', '0', '0', '35', '1446370322', null, '1448866547', null, '5', '1', '631123200', '', 'fasfs@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('45', 'p02', '145728d72603991f12c2064841407efc', 'p02', 'photos/10.jpg', '1', '1446537431', '1446537431', '0', '37', '30', '19', '50', '1', '1', '36', '1446371067', null, '1447150122', null, '4', '1', null, null, 'ff@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('46', 'p03', '1f2a7b9ebd052914f4b003ad9554d1ca', 'p03', 'photos/10.jpg', '1', '1448866615', '1448866615', '0', '38', '31', null, '51', '1', '0', '37', '1446371313', null, '1449138363', null, '1', '1', null, null, 'vdcv@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('47', 'test_08', '0d1ae8a83f68a7ca68138699553dfd2a', 'test_08', 'photos/10.jpg', '1', '1448351198', '1448351198', '0', '39', '32', null, '52', '0', '0', '38', '1446451534', null, '1448351198', null, '0', '1', null, null, 'test_08@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('48', 'test_99', 'fc2cd44bec8140f03ccc922540981723', 'test_99', 'photos/10.jpg', '1', null, '1446457932', '0', '40', '33', null, '53', '0', '0', '39', '1446457932', null, '1446457932', null, '0', '1', null, null, 'test_99@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('49', 'dfsgda', '0e3e5dc80abc0c1c5d268d6ea8b11d24', 'dfsgda', 'photos/10.jpg', '1', null, '1446791195', '1', '48', '34', '20', '54', '0', '0', '40', '1446791195', null, '1446791195', null, '1', '1', null, null, 'kkkk@qq.com', '0', null, '0');
INSERT INTO `users` VALUES ('50', 'xiaoliu', 'baf1a8efd883366ee7917744334c3ae4', 'xiaoliu', 'http://p8.qhimg.com/dmt/509_351_/t01582ce773ae9b72b3.jpg', '1', null, '1446797673', '0', '49', '35', null, '55', '0', '0', '41', '1446797672', null, '1446797673', null, '1', '1', '631123200', '', 'ccc@qq.com', '0', null, '0');

-- ----------------------------
-- Table structure for users_account_record
-- ----------------------------
DROP TABLE IF EXISTS `users_account_record`;
CREATE TABLE `users_account_record` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '金额',
  `io_type` int(2) DEFAULT '0' COMMENT '收支 0收入 1支出',
  `actiontime` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `action_type` int(4) DEFAULT '0' COMMENT '操作类型 0 在线支付 1转账支付 2单次点播 3开通服务',
  `record_id` bigint(20) DEFAULT NULL COMMENT '记录ID',
  `useramount` decimal(16,2) DEFAULT '0.00' COMMENT '会员余额',
  `lockamount` decimal(16,2) DEFAULT NULL COMMENT '用户锁定金币',
  `status` int(2) DEFAULT NULL COMMENT '状态 0初始状态 1成功 2失败',
  `desc` varchar(500) DEFAULT NULL COMMENT '操作说明',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 COMMENT='会员杏币收支明细';

-- ----------------------------
-- Records of users_account_record
-- ----------------------------
INSERT INTO `users_account_record` VALUES ('4', '1', '200.00', '0', '1438931743', '1', '1', '400.00', '0.00', '1', '转账成功 充值金额：200.00', '1438931743', 'admin', '1438931743', 'admin');
INSERT INTO `users_account_record` VALUES ('5', '14', '50.00', '1', '1439538497', '2', '46', '999950.00', '0.00', '1', '单次点播(46)', '1439538497', null, null, null);
INSERT INTO `users_account_record` VALUES ('6', '14', '20.00', '1', '1439538522', '2', '42', '999930.00', '0.00', '1', '单次点播(42)', '1439538522', null, null, null);
INSERT INTO `users_account_record` VALUES ('7', '14', '20.00', '1', '1439538612', '2', '44', '999910.00', '0.00', '1', '单次点播(44)', '1439538612', null, null, null);
INSERT INTO `users_account_record` VALUES ('8', '14', '10.00', '1', '1439539811', '2', '19', '999900.00', '0.00', '1', '单次点播(19)', '1439539811', null, null, null);
INSERT INTO `users_account_record` VALUES ('9', '14', '10.00', '1', '1439540000', '2', '43', '999890.00', '0.00', '1', '单次点播(43)', '1439540000', null, null, null);
INSERT INTO `users_account_record` VALUES ('10', '14', '10.00', '1', '1439540014', '2', '43', '999880.00', '0.00', '1', '单次点播(43)', '1439540014', null, null, null);
INSERT INTO `users_account_record` VALUES ('11', '14', '10.00', '1', '1439540023', '2', '43', '999870.00', '0.00', '1', '单次点播(43)', '1439540023', null, null, null);
INSERT INTO `users_account_record` VALUES ('12', '14', '40.00', '1', '1439540043', '2', '45', '999830.00', '0.00', '1', '单次点播(45)', '1439540043', null, null, null);
INSERT INTO `users_account_record` VALUES ('13', '3', '50.00', '1', '1440151168', '2', '46', '99950.00', '0.00', '1', '单次点播(46)', '1440151168', null, null, null);
INSERT INTO `users_account_record` VALUES ('14', '3', '15.00', '0', '1440151168', '2', '46', '99965.00', '0.00', '1', '单次点播(46)', '1440151168', null, null, null);
INSERT INTO `users_account_record` VALUES ('15', '3', '50.00', '1', '1440151179', '2', '31', '99915.00', '0.00', '1', '单次点播(31)', '1440151179', null, null, null);
INSERT INTO `users_account_record` VALUES ('16', '3', '15.00', '0', '1440151179', '2', '31', '99930.00', '0.00', '1', '单次点播(31)', '1440151179', null, null, null);
INSERT INTO `users_account_record` VALUES ('17', '3', '40.00', '1', '1440151204', '2', '45', '99890.00', '0.00', '1', '单次点播(45)', '1440151204', null, null, null);
INSERT INTO `users_account_record` VALUES ('18', '3', '8.00', '0', '1440151204', '2', '45', '99898.00', '0.00', '1', '单次点播(45)', '1440151204', null, null, null);
INSERT INTO `users_account_record` VALUES ('19', '15', '20.00', '1', '1440389592', '2', '42', '978.00', '0.00', '1', '单次点播(42)', '1440389592', null, null, null);
INSERT INTO `users_account_record` VALUES ('20', '15', '6.00', '0', '1440389592', '2', '42', '984.00', '0.00', '1', '单次点播(42)', '1440389592', null, null, null);
INSERT INTO `users_account_record` VALUES ('21', '15', '20.00', '1', '1440389596', '2', '42', '964.00', '0.00', '1', '单次点播(42)', '1440389596', null, null, null);
INSERT INTO `users_account_record` VALUES ('22', '15', '6.00', '0', '1440389596', '2', '42', '970.00', '0.00', '1', '单次点播(42)', '1440389596', null, null, null);
INSERT INTO `users_account_record` VALUES ('23', '15', '20.00', '1', '1440389604', '2', '42', '950.00', '0.00', '1', '单次点播(42)', '1440389604', null, null, null);
INSERT INTO `users_account_record` VALUES ('24', '15', '6.00', '0', '1440389604', '2', '42', '956.00', '0.00', '1', '单次点播(42)', '1440389604', null, null, null);
INSERT INTO `users_account_record` VALUES ('25', '15', '20.00', '1', '1440389616', '2', '42', '936.00', '0.00', '1', '单次点播(42)', '1440389616', null, null, null);
INSERT INTO `users_account_record` VALUES ('26', '15', '6.00', '0', '1440389616', '2', '42', '942.00', '0.00', '1', '单次点播(42)', '1440389616', null, null, null);
INSERT INTO `users_account_record` VALUES ('27', '15', '10.00', '1', '1440406024', '2', '43', '932.00', '0.00', '1', '单次点播(43)', '1440406024', null, null, null);
INSERT INTO `users_account_record` VALUES ('28', '15', '2.00', '0', '1440406024', '2', '43', '934.00', '0.00', '1', '单次点播(43)', '1440406024', null, null, null);
INSERT INTO `users_account_record` VALUES ('29', '15', '20.00', '1', '1440406045', '2', '44', '914.00', '0.00', '1', '单次点播(44)', '1440406045', null, null, null);
INSERT INTO `users_account_record` VALUES ('30', '15', '4.00', '0', '1440406045', '2', '44', '918.00', '0.00', '1', '单次点播(44)', '1440406045', null, null, null);
INSERT INTO `users_account_record` VALUES ('31', '20', '10.00', '1', '1440753491', '3', '18', '99990.00', '0.00', '1', '批量订单', '1440753491', null, null, null);
INSERT INTO `users_account_record` VALUES ('32', '20', '10.00', '1', '1440753590', '2', '19', '99980.00', '0.00', '1', '单次点播(19)', '1440753590', null, null, null);
INSERT INTO `users_account_record` VALUES ('33', '20', '4.00', '0', '1440753590', '2', '19', '99984.00', '0.00', '1', '单次点播(19)', '1440753590', null, null, null);
INSERT INTO `users_account_record` VALUES ('34', '20', '30.00', '1', '1440753935', '2', '47', '99954.00', '0.00', '1', '单次点播(47)', '1440753935', null, null, null);
INSERT INTO `users_account_record` VALUES ('35', '20', '12.00', '0', '1440753935', '2', '47', '99966.00', '0.00', '1', '单次点播(47)', '1440753935', null, null, null);
INSERT INTO `users_account_record` VALUES ('36', '20', '20.00', '1', '1440754148', '3', '21', '99946.00', '0.00', '1', '批量订单', '1440754148', null, null, null);
INSERT INTO `users_account_record` VALUES ('37', '20', '10.00', '1', '1440754823', '2', '43', '99936.00', '0.00', '1', '单次点播(43)', '1440754823', null, null, null);
INSERT INTO `users_account_record` VALUES ('38', '20', '2.00', '0', '1440754823', '2', '43', '99938.00', '0.00', '1', '单次点播(43)', '1440754823', null, null, null);
INSERT INTO `users_account_record` VALUES ('39', '20', '1.00', '0', '1440950446', '1', '7', '99939.00', '0.00', '1', '转账成功 充值金额：1.00', '1440950446', 'admin', '1440950446', 'admin');
INSERT INTO `users_account_record` VALUES ('40', '3', '10.00', '1', '1440992345', '3', '23', '99888.00', '0.00', '1', '批量订单', '1440992345', null, null, null);
INSERT INTO `users_account_record` VALUES ('41', '3', '10.00', '1', '1440992897', '2', '19', '99878.00', '0.00', '1', '单次点播(19)', '1440992897', null, null, null);
INSERT INTO `users_account_record` VALUES ('42', '3', '4.00', '0', '1440992897', '2', '19', '99882.00', '0.00', '1', '单次点播(19)', '1440992897', null, null, null);
INSERT INTO `users_account_record` VALUES ('43', '13', '200.00', '1', '1441092419', '2', '4', '99800.00', '0.00', '1', '单次点播(4)', '1441092419', null, null, null);
INSERT INTO `users_account_record` VALUES ('44', '13', '60.00', '0', '1441092419', '2', '4', '99860.00', '0.00', '1', '单次点播(4)', '1441092419', null, null, null);
INSERT INTO `users_account_record` VALUES ('45', '14', '200.00', '1', '1441092672', '2', '4', '999630.00', '0.00', '1', '单次点播(4)', '1441092672', null, null, null);
INSERT INTO `users_account_record` VALUES ('46', '14', '60.00', '0', '1441092672', '2', '4', '999690.00', '0.00', '1', '单次点播(4)', '1441092672', null, null, null);
INSERT INTO `users_account_record` VALUES ('47', '14', '200.00', '1', '1441092685', '2', '4', '999490.00', '0.00', '1', '单次点播(4)', '1441092685', null, null, null);
INSERT INTO `users_account_record` VALUES ('48', '14', '60.00', '0', '1441092685', '2', '4', '999550.00', '0.00', '1', '单次点播(4)', '1441092685', null, null, null);
INSERT INTO `users_account_record` VALUES ('49', '14', '30.00', '1', '1441094345', '2', '56', '999520.00', '0.00', '1', '单次点播(56)', '1441094345', null, null, null);
INSERT INTO `users_account_record` VALUES ('50', '14', '9.00', '0', '1441094345', '2', '56', '999529.00', '0.00', '1', '单次点播(56)', '1441094345', null, null, null);
INSERT INTO `users_account_record` VALUES ('51', '14', '30.00', '1', '1441094376', '2', '56', '999499.00', '0.00', '1', '单次点播(56)', '1441094376', null, null, null);
INSERT INTO `users_account_record` VALUES ('52', '14', '9.00', '0', '1441094376', '2', '56', '999508.00', '0.00', '1', '单次点播(56)', '1441094376', null, null, null);
INSERT INTO `users_account_record` VALUES ('53', '14', '10.00', '1', '1441095313', '2', '57', '999498.00', '0.00', '1', '单次点播(57)', '1441095313', null, null, null);
INSERT INTO `users_account_record` VALUES ('54', '14', '2.00', '0', '1441095313', '2', '57', '999500.00', '0.00', '1', '单次点播(57)', '1441095313', null, null, null);
INSERT INTO `users_account_record` VALUES ('55', '14', '10.00', '1', '1441095987', '2', '13', '999490.00', '0.00', '1', '单次点播(13)', '1441095987', null, null, null);
INSERT INTO `users_account_record` VALUES ('56', '14', '2.00', '0', '1441095987', '2', '13', '999492.00', '0.00', '1', '单次点播(13)', '1441095987', null, null, null);
INSERT INTO `users_account_record` VALUES ('57', '14', '50.00', '1', '1441096269', '2', '54', '999442.00', '0.00', '1', '单次点播(54)', '1441096269', null, null, null);
INSERT INTO `users_account_record` VALUES ('58', '14', '15.00', '0', '1441096269', '2', '54', '999457.00', '0.00', '1', '单次点播(54)', '1441096269', null, null, null);
INSERT INTO `users_account_record` VALUES ('59', '20', '10.00', '1', '1441096342', '2', '57', '99929.00', '0.00', '1', '单次点播(57)', '1441096342', null, null, null);
INSERT INTO `users_account_record` VALUES ('60', '20', '2.00', '0', '1441096342', '2', '57', '99931.00', '0.00', '1', '单次点播(57)', '1441096342', null, null, null);
INSERT INTO `users_account_record` VALUES ('61', '20', '30.00', '1', '1441096839', '2', '56', '99901.00', '0.00', '1', '单次点播(56)', '1441096839', null, null, null);
INSERT INTO `users_account_record` VALUES ('62', '20', '9.00', '0', '1441096839', '2', '56', '99910.00', '0.00', '1', '单次点播(56)', '1441096839', null, null, null);
INSERT INTO `users_account_record` VALUES ('63', '3', '50.00', '1', '1441096850', '2', '54', '99832.00', '0.00', '1', '单次点播(54)', '1441096850', null, null, null);
INSERT INTO `users_account_record` VALUES ('64', '3', '15.00', '0', '1441096850', '2', '54', '99847.00', '0.00', '1', '单次点播(54)', '1441096850', null, null, null);
INSERT INTO `users_account_record` VALUES ('65', '3', '30.00', '1', '1441097027', '2', '56', '99817.00', '0.00', '1', '单次点播(56)', '1441097027', null, null, null);
INSERT INTO `users_account_record` VALUES ('66', '3', '9.00', '0', '1441097027', '2', '56', '99826.00', '0.00', '1', '单次点播(56)', '1441097027', null, null, null);
INSERT INTO `users_account_record` VALUES ('67', '3', '30.00', '1', '1441097573', '2', '55', '99796.00', '0.00', '1', '单次点播(55)', '1441097573', null, null, null);
INSERT INTO `users_account_record` VALUES ('68', '3', '6.00', '0', '1441097573', '2', '55', '99802.00', '0.00', '1', '单次点播(55)', '1441097573', null, null, null);
INSERT INTO `users_account_record` VALUES ('69', '3', '10.00', '1', '1441098027', '2', '57', '99792.00', '0.00', '1', '单次点播(57)', '1441098027', null, null, null);
INSERT INTO `users_account_record` VALUES ('70', '20', '2.00', '0', '1441098027', '2', '57', '99912.00', '0.00', '1', '单次点播(57)', '1441098027', null, null, null);
INSERT INTO `users_account_record` VALUES ('71', '20', '300.00', '1', '1441098532', '2', '18', '99612.00', '0.00', '1', '单次点播(18)', '1441098532', null, null, null);
INSERT INTO `users_account_record` VALUES ('72', '3', '0.00', '1', '1441098662', '2', '5', '99792.00', '0.00', '1', '单次点播(5)', '1441098662', null, null, null);
INSERT INTO `users_account_record` VALUES ('73', '3', '55.00', '1', '1441099042', '2', '15', '99737.00', '0.00', '1', '单次点播(15)', '1441099042', null, null, null);
INSERT INTO `users_account_record` VALUES ('74', '20', '20.00', '1', '1441100359', '2', '29', '99592.00', '0.00', '1', '单次点播(29)', '1441100359', null, null, null);
INSERT INTO `users_account_record` VALUES ('75', '20', '100.00', '1', '1441100372', '2', '3', '99492.00', '0.00', '1', '单次点播(3)', '1441100372', null, null, null);
INSERT INTO `users_account_record` VALUES ('76', '3', '99.00', '1', '1441188162', '2', '14', '99638.00', '0.00', '1', '单次点播(14)', '1441188162', null, null, null);
INSERT INTO `users_account_record` VALUES ('77', '20', '100.00', '1', '1441509005', '2', '12', '99392.00', '0.00', '1', '单次点播(12)', '1441509005', null, null, null);
INSERT INTO `users_account_record` VALUES ('78', '20', '30.00', '1', '1441509098', '2', '55', '99362.00', '0.00', '1', '单次点播(55)', '1441509098', null, null, null);
INSERT INTO `users_account_record` VALUES ('79', '20', '6.00', '0', '1441509098', '2', '55', '99368.00', '0.00', '1', '单次点播(55)', '1441509098', null, null, null);
INSERT INTO `users_account_record` VALUES ('80', '20', '444.00', '1', '1441509587', '2', '59', '98924.00', '0.00', '1', '单次点播(59)', '1441509587', null, null, null);
INSERT INTO `users_account_record` VALUES ('81', '22', '133.20', '0', '1441509587', '2', '59', '133.20', '0.00', '1', '单次点播(59)', '1441509587', null, null, null);
INSERT INTO `users_account_record` VALUES ('82', '20', '50.00', '1', '1441512232', '2', '25', '98874.00', '0.00', '1', '单次点播(25)', '1441512232', null, null, null);
INSERT INTO `users_account_record` VALUES ('83', '20', '20.00', '1', '1441512472', '2', '21', '98854.00', '0.00', '1', '单次点播(21)', '1441512472', null, null, null);
INSERT INTO `users_account_record` VALUES ('84', '14', '444.00', '1', '1441521853', '2', '59', '999013.00', '0.00', '1', '单次点播(59)', '1441521853', null, null, null);
INSERT INTO `users_account_record` VALUES ('85', '22', '133.20', '0', '1441521853', '2', '59', '266.40', '0.00', '1', '单次点播(59)', '1441521853', null, null, null);
INSERT INTO `users_account_record` VALUES ('86', '14', '50.00', '1', '1441532036', '2', '48', '998963.00', '0.00', '1', '单次点播(48)', '1441532036', null, null, null);
INSERT INTO `users_account_record` VALUES ('87', '14', '20.00', '1', '1441533395', '2', '62', '998943.00', '0.00', '1', '单次点播(62)', '1441533395', null, null, null);
INSERT INTO `users_account_record` VALUES ('88', '20', '4.00', '0', '1441533395', '2', '62', '98858.00', '0.00', '1', '单次点播(62)', '1441533395', null, null, null);
INSERT INTO `users_account_record` VALUES ('89', '3', '10.00', '1', '1441591921', '3', '53', '99628.00', '0.00', '1', '批量订单', '1441591921', null, null, null);
INSERT INTO `users_account_record` VALUES ('90', '3', '10.00', '1', '1441591993', '2', '13', '99618.00', '0.00', '1', '单次点播(13)', '1441591993', null, null, null);
INSERT INTO `users_account_record` VALUES ('91', '3', '10.00', '1', '1441605064', '2', '61', '99608.00', '0.00', '1', '单次点播(61)', '1441605064', null, null, null);
INSERT INTO `users_account_record` VALUES ('92', '20', '2.00', '0', '1441605064', '2', '61', '98860.00', '0.00', '1', '单次点播(61)', '1441605064', null, null, null);
INSERT INTO `users_account_record` VALUES ('93', '3', '30.00', '1', '1441605560', '2', '63', '99578.00', '0.00', '1', '单次点播(63)', '1441605560', null, null, null);
INSERT INTO `users_account_record` VALUES ('94', '14', '9.00', '0', '1441605560', '2', '63', '998952.00', '0.00', '1', '单次点播(63)', '1441605560', null, null, null);
INSERT INTO `users_account_record` VALUES ('95', '15', '123.00', '1', '1441960783', '2', '1', '795.00', '0.00', '1', '单次点播(1)', '1441960783', null, null, null);
INSERT INTO `users_account_record` VALUES ('96', '7', '24.60', '0', '1441960783', '2', '1', '24.60', '0.00', '1', '单次点播(1)', '1441960783', null, null, null);
INSERT INTO `users_account_record` VALUES ('97', '15', '50.00', '1', '1441960845', '2', '48', '745.00', '0.00', '1', '单次点播(48)', '1441960845', null, null, null);
INSERT INTO `users_account_record` VALUES ('98', '11', '20.00', '0', '1441960845', '2', '48', '20.00', '0.00', '1', '单次点播(48)', '1441960845', null, null, null);
INSERT INTO `users_account_record` VALUES ('99', '15', '50.00', '1', '1441960912', '2', '54', '695.00', '0.00', '1', '单次点播(54)', '1441960912', null, null, null);
INSERT INTO `users_account_record` VALUES ('100', '20', '15.00', '0', '1441960912', '2', '54', '98875.00', '0.00', '1', '单次点播(54)', '1441960912', null, null, null);
INSERT INTO `users_account_record` VALUES ('101', '15', '30.00', '1', '1441960943', '2', '63', '665.00', '0.00', '1', '单次点播(63)', '1441960943', null, null, null);
INSERT INTO `users_account_record` VALUES ('102', '14', '9.00', '0', '1441960943', '2', '63', '998961.00', '0.00', '1', '单次点播(63)', '1441960943', null, null, null);
INSERT INTO `users_account_record` VALUES ('103', '15', '30.00', '1', '1441960979', '2', '56', '635.00', '0.00', '1', '单次点播(56)', '1441960979', null, null, null);
INSERT INTO `users_account_record` VALUES ('104', '20', '9.00', '0', '1441960979', '2', '56', '98884.00', '0.00', '1', '单次点播(56)', '1441960979', null, null, null);
INSERT INTO `users_account_record` VALUES ('105', '15', '50.00', '1', '1441960996', '2', '46', '585.00', '0.00', '1', '单次点播(46)', '1441960996', null, null, null);
INSERT INTO `users_account_record` VALUES ('106', '7', '15.00', '0', '1441960996', '2', '46', '39.60', '0.00', '1', '单次点播(46)', '1441960996', null, null, null);
INSERT INTO `users_account_record` VALUES ('107', '15', '100.00', '1', '1441961044', '2', '3', '485.00', '0.00', '1', '单次点播(3)', '1441961044', null, null, null);
INSERT INTO `users_account_record` VALUES ('108', '5', '20.00', '0', '1441961044', '2', '3', '20.00', '0.00', '1', '单次点播(3)', '1441961044', null, null, null);
INSERT INTO `users_account_record` VALUES ('109', '15', '100.00', '1', '1441961059', '2', '12', '385.00', '0.00', '1', '单次点播(12)', '1441961059', null, null, null);
INSERT INTO `users_account_record` VALUES ('110', '1', '40.00', '0', '1441961059', '2', '12', '40.00', '0.00', '1', '单次点播(12)', '1441961059', null, null, null);
INSERT INTO `users_account_record` VALUES ('111', '15', '10.00', '1', '1441961076', '2', '19', '375.00', '0.00', '1', '单次点播(19)', '1441961076', null, null, null);
INSERT INTO `users_account_record` VALUES ('112', '1', '4.00', '0', '1441961076', '2', '19', '44.00', '0.00', '1', '单次点播(19)', '1441961076', null, null, null);
INSERT INTO `users_account_record` VALUES ('113', '15', '9.00', '1', '1441962009', '3', '66', '366.00', '0.00', '1', '批量订单', '1441962009', null, null, null);
INSERT INTO `users_account_record` VALUES ('114', '20', '5.00', '1', '1442386561', '2', '60', '98879.00', '0.00', '1', '单次点播(60)', '1442386561', null, null, null);
INSERT INTO `users_account_record` VALUES ('115', '20', '1.00', '0', '1442386561', '2', '60', '98880.00', '0.00', '1', '单次点播(60)', '1442386561', null, null, null);
INSERT INTO `users_account_record` VALUES ('116', '20', '50.00', '1', '1442389354', '2', '54', '98830.00', '0.00', '1', '单次点播(54)', '1442389354', null, null, null);
INSERT INTO `users_account_record` VALUES ('117', '20', '15.00', '0', '1442389354', '2', '54', '98845.00', '0.00', '1', '单次点播(54)', '1442389354', null, null, null);
INSERT INTO `users_account_record` VALUES ('118', '20', '30.00', '1', '1442390534', '2', '63', '98815.00', '0.00', '1', '单次点播(63)', '1442390534', null, null, null);
INSERT INTO `users_account_record` VALUES ('119', '14', '9.00', '0', '1442390534', '2', '63', '998970.00', '0.00', '1', '单次点播(63)', '1442390534', null, null, null);
INSERT INTO `users_account_record` VALUES ('120', '20', '200.00', '1', '1442392907', '2', '4', '98615.00', '0.00', '1', '单次点播(4)', '1442392907', null, null, null);
INSERT INTO `users_account_record` VALUES ('121', '14', '60.00', '0', '1442392907', '2', '4', '999030.00', '0.00', '1', '单次点播(4)', '1442392907', null, null, null);
INSERT INTO `users_account_record` VALUES ('122', '20', '20.00', '1', '1442482076', '2', '42', '98595.00', '0.00', '1', '单次点播(42)', '1442482076', null, null, null);
INSERT INTO `users_account_record` VALUES ('123', '1', '6.00', '0', '1442482076', '2', '42', '50.00', '0.00', '1', '单次点播(42)', '1442482076', null, null, null);
INSERT INTO `users_account_record` VALUES ('124', '14', '20.00', '1', '1442557382', '2', '68', '999010.00', '0.00', '1', '单次点播(68)', '1442557382', null, null, null);
INSERT INTO `users_account_record` VALUES ('125', '20', '4.00', '0', '1442557382', '2', '68', '98599.00', '0.00', '1', '单次点播(68)', '1442557382', null, null, null);
INSERT INTO `users_account_record` VALUES ('126', '14', '10.00', '1', '1442559299', '2', '67', '999000.00', '0.00', '1', '单次点播(67)', '1442559299', null, null, null);
INSERT INTO `users_account_record` VALUES ('127', '20', '2.00', '0', '1442559299', '2', '67', '98601.00', '0.00', '1', '单次点播(67)', '1442559299', null, null, null);
INSERT INTO `users_account_record` VALUES ('128', '15', '10.00', '1', '1442570020', '3', '74', '356.00', '0.00', '1', '批量订单', '1442570020', null, null, null);
INSERT INTO `users_account_record` VALUES ('129', '15', '10.00', '1', '1442570466', '3', '75', '346.00', '0.00', '1', '批量订单', '1442570466', null, null, null);
INSERT INTO `users_account_record` VALUES ('130', '15', '10.00', '1', '1442570495', '2', '67', '336.00', '0.00', '1', '单次点播(67)', '1442570495', null, null, null);
INSERT INTO `users_account_record` VALUES ('131', '20', '2.00', '0', '1442570495', '2', '67', '98603.00', '0.00', '1', '单次点播(67)', '1442570495', null, null, null);
INSERT INTO `users_account_record` VALUES ('132', '3', '2.00', '0', '1442826184', '5', '0', '99580.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1442826184', null, '1442826184', null);
INSERT INTO `users_account_record` VALUES ('133', '20', '10.00', '1', '1442902676', '3', '77', '98593.00', '0.00', '1', '批量订单', '1442902676', null, null, null);
INSERT INTO `users_account_record` VALUES ('134', '20', '5.00', '1', '1442908914', '2', '77', '98588.00', '0.00', '1', '单次点播(77)', '1442908914', null, null, null);
INSERT INTO `users_account_record` VALUES ('135', '5', '1.00', '0', '1442908914', '2', '77', '21.00', '0.00', '1', '单次点播(77)', '1442908914', null, null, null);
INSERT INTO `users_account_record` VALUES ('136', '3', '5.00', '1', '1442909414', '2', '77', '99575.00', '0.00', '1', '单次点播(77)', '1442909414', null, null, null);
INSERT INTO `users_account_record` VALUES ('137', '5', '1.00', '0', '1442909414', '2', '77', '22.00', '0.00', '1', '单次点播(77)', '1442909414', null, null, null);
INSERT INTO `users_account_record` VALUES ('138', '20', '123.00', '1', '1442912658', '2', '1', '98465.00', '0.00', '1', '单次点播(1)', '1442912658', null, null, null);
INSERT INTO `users_account_record` VALUES ('139', '7', '24.60', '0', '1442912658', '2', '1', '64.20', '0.00', '1', '单次点播(1)', '1442912658', null, null, null);
INSERT INTO `users_account_record` VALUES ('140', '20', '30.00', '1', '1442979531', '2', '81', '98435.00', '0.00', '1', '单次点播(81)', '1442979531', null, null, null);
INSERT INTO `users_account_record` VALUES ('141', '5', '6.00', '0', '1442979531', '2', '81', '28.00', '0.00', '1', '单次点播(81)', '1442979531', null, null, null);
INSERT INTO `users_account_record` VALUES ('142', '20', '20.00', '1', '1442979557', '2', '84', '98415.00', '0.00', '1', '单次点播(84)', '1442979557', null, null, null);
INSERT INTO `users_account_record` VALUES ('143', '9', '4.00', '0', '1442979558', '2', '84', '4.00', '0.00', '1', '单次点播(84)', '1442979558', null, null, null);
INSERT INTO `users_account_record` VALUES ('144', '20', '20.00', '1', '1442988870', '2', '44', '98395.00', '0.00', '1', '单次点播(44)', '1442988870', null, null, null);
INSERT INTO `users_account_record` VALUES ('145', '4', '4.00', '0', '1442988870', '2', '44', '4.00', '0.00', '1', '单次点播(44)', '1442988870', null, null, null);
INSERT INTO `users_account_record` VALUES ('146', '20', '30.00', '1', '1442988901', '2', '87', '98365.00', '0.00', '1', '单次点播(87)', '1442988901', null, null, null);
INSERT INTO `users_account_record` VALUES ('147', '4', '6.00', '0', '1442988901', '2', '87', '10.00', '0.00', '1', '单次点播(87)', '1442988901', null, null, null);
INSERT INTO `users_account_record` VALUES ('148', '20', '20.00', '1', '1442989342', '2', '88', '98345.00', '0.00', '1', '单次点播(88)', '1442989342', null, null, null);
INSERT INTO `users_account_record` VALUES ('149', '1', '4.00', '0', '1442989342', '2', '88', '54.00', '0.00', '1', '单次点播(88)', '1442989342', null, null, null);
INSERT INTO `users_account_record` VALUES ('150', '15', '20.00', '1', '1442989393', '2', '88', '316.00', '0.00', '1', '单次点播(88)', '1442989393', null, null, null);
INSERT INTO `users_account_record` VALUES ('151', '1', '4.00', '0', '1442989393', '2', '88', '58.00', '0.00', '1', '单次点播(88)', '1442989393', null, null, null);
INSERT INTO `users_account_record` VALUES ('152', '15', '0.00', '1', '1442989721', '2', '5', '316.00', '0.00', '1', '单次点播(5)', '1442989721', null, null, null);
INSERT INTO `users_account_record` VALUES ('153', '2', '0.00', '0', '1442989721', '2', '5', '0.00', '0.00', '1', '单次点播(5)', '1442989721', null, null, null);
INSERT INTO `users_account_record` VALUES ('154', '15', '0.00', '1', '1442989880', '2', '65', '316.00', '0.00', '1', '单次点播(65)', '1442989880', null, null, null);
INSERT INTO `users_account_record` VALUES ('155', '15', '0.00', '0', '1442989880', '2', '65', '316.00', '0.00', '1', '单次点播(65)', '1442989880', null, null, null);
INSERT INTO `users_account_record` VALUES ('156', '15', '10.00', '1', '1442993774', '2', '13', '306.00', '0.00', '1', '单次点播(13)', '1442993774', null, null, null);
INSERT INTO `users_account_record` VALUES ('157', '6', '2.00', '0', '1442993774', '2', '13', '2.00', '0.00', '1', '单次点播(13)', '1442993774', null, null, null);
INSERT INTO `users_account_record` VALUES ('158', '15', '10.00', '1', '1442995100', '2', '89', '296.00', '0.00', '1', '单次点播(89)', '1442995100', null, null, null);
INSERT INTO `users_account_record` VALUES ('159', '3', '2.00', '0', '1442995100', '2', '89', '99577.00', '0.00', '1', '单次点播(89)', '1442995100', null, null, null);
INSERT INTO `users_account_record` VALUES ('160', '12', '3.00', '0', '1442995971', '5', '0', '3.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1442995971', null, '1442995971', null);
INSERT INTO `users_account_record` VALUES ('161', '1', '3.00', '0', '1442995974', '5', '0', '61.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1442995974', null, '1442995974', null);
INSERT INTO `users_account_record` VALUES ('162', '8', '3.00', '0', '1442995977', '5', '0', '3.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1442995977', null, '1442995977', null);
INSERT INTO `users_account_record` VALUES ('163', '20', '10.00', '1', '1442999455', '2', '97', '98335.00', '0.00', '1', '单次点播(97)', '1442999455', null, null, null);
INSERT INTO `users_account_record` VALUES ('164', '7', '2.00', '0', '1442999455', '2', '97', '66.20', '0.00', '1', '单次点播(97)', '1442999455', null, null, null);
INSERT INTO `users_account_record` VALUES ('165', '25', '10.00', '1', '1443081223', '2', '97', '999989.00', '0.00', '1', '单次点播(97)', '1443081223', null, null, null);
INSERT INTO `users_account_record` VALUES ('166', '7', '2.00', '0', '1443081223', '2', '97', '68.20', '0.00', '1', '单次点播(97)', '1443081223', null, null, null);
INSERT INTO `users_account_record` VALUES ('167', '25', '20.00', '1', '1443081638', '2', '13', '999969.00', '0.00', '1', '单次点播(13)', '1443081638', null, null, null);
INSERT INTO `users_account_record` VALUES ('168', '6', '4.00', '0', '1443081638', '2', '13', '6.00', '0.00', '1', '单次点播(13)', '1443081638', null, null, null);
INSERT INTO `users_account_record` VALUES ('169', '25', '0.00', '1', '1443081882', '2', '92', '999969.00', '0.00', '1', '单次点播(92)', '1443081882', null, null, null);
INSERT INTO `users_account_record` VALUES ('170', '4', '0.00', '0', '1443081882', '2', '92', '10.00', '0.00', '1', '单次点播(92)', '1443081882', null, null, null);
INSERT INTO `users_account_record` VALUES ('171', '25', '10.00', '1', '1443082379', '3', '95', '999959.00', '0.00', '1', '批量订单', '1443082379', null, null, null);
INSERT INTO `users_account_record` VALUES ('172', '25', '10.00', '1', '1443083071', '3', '96', '999949.00', '0.00', '1', '批量订单', '1443083071', null, null, null);
INSERT INTO `users_account_record` VALUES ('173', '25', '10.00', '1', '1443423883', '3', '97', '999939.00', '0.00', '1', '批量订单', '1443423883', null, null, null);
INSERT INTO `users_account_record` VALUES ('174', '28', '5.00', '0', '1443426709', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1443426709', null, '1443426709', null);
INSERT INTO `users_account_record` VALUES ('175', '25', '20.00', '1', '1443428675', '2', '68', '999919.00', '0.00', '1', '单次点播(68)', '1443428675', null, null, null);
INSERT INTO `users_account_record` VALUES ('176', '20', '4.00', '0', '1443428675', '2', '68', '98339.00', '0.00', '1', '单次点播(68)', '1443428675', null, null, null);
INSERT INTO `users_account_record` VALUES ('177', '25', '10.00', '1', '1443428698', '2', '53', '999909.00', '0.00', '1', '单次点播(53)', '1443428698', null, null, null);
INSERT INTO `users_account_record` VALUES ('178', '14', '2.00', '0', '1443428698', '2', '53', '999002.00', '0.00', '1', '单次点播(53)', '1443428698', null, null, null);
INSERT INTO `users_account_record` VALUES ('179', '25', '10.00', '1', '1443429103', '2', '93', '999899.00', '0.00', '1', '单次点播(93)', '1443429103', null, null, null);
INSERT INTO `users_account_record` VALUES ('180', '8', '3.00', '0', '1443429103', '2', '93', '6.00', '0.00', '1', '单次点播(93)', '1443429103', null, null, null);
INSERT INTO `users_account_record` VALUES ('181', '25', '10.00', '1', '1443430522', '3', '101', '999889.00', '0.00', '1', '批量订单', '1443430522', null, null, null);
INSERT INTO `users_account_record` VALUES ('182', '25', '5.00', '1', '1443430620', '2', '94', '999884.00', '0.00', '1', '单次点播(94)', '1443430620', null, null, null);
INSERT INTO `users_account_record` VALUES ('183', '1', '1.50', '0', '1443430620', '2', '94', '62.50', '0.00', '1', '单次点播(94)', '1443430620', null, null, null);
INSERT INTO `users_account_record` VALUES ('184', '25', '5.00', '1', '1443433226', '2', '66', '999879.00', '0.00', '1', '单次点播(66)', '1443433226', null, null, null);
INSERT INTO `users_account_record` VALUES ('185', '25', '1.00', '0', '1443433226', '2', '66', '999880.00', '0.00', '1', '单次点播(66)', '1443433226', null, null, null);
INSERT INTO `users_account_record` VALUES ('186', '25', '2.00', '0', '1443498094', '1', '14', '999882.00', '0.00', '1', '转账成功 充值金额：2.00', '1443498094', 'admin', '1443498094', 'admin');
INSERT INTO `users_account_record` VALUES ('187', '25', '1.00', '0', '1443583793', '1', '13', '999883.00', '0.00', '1', '转账成功 充值金额：1.00', '1443583793', 'admin', '1443583793', 'admin');
INSERT INTO `users_account_record` VALUES ('188', '25', '20.00', '1', '1443600755', '2', '91', '999863.00', '0.00', '1', '单次点播(91)', '1443600755', null, null, null);
INSERT INTO `users_account_record` VALUES ('189', '1', '4.00', '0', '1443600755', '2', '91', '66.50', '0.00', '1', '单次点播(91)', '1443600755', null, null, null);
INSERT INTO `users_account_record` VALUES ('190', '25', '10.00', '1', '1443603247', '2', '101', '999853.00', '0.00', '1', '单次点播(101)', '1443603247', null, null, null);
INSERT INTO `users_account_record` VALUES ('191', '2', '3.00', '0', '1443603247', '2', '101', '3.00', '0.00', '1', '单次点播(101)', '1443603247', null, null, null);
INSERT INTO `users_account_record` VALUES ('192', '25', '20.00', '1', '1443605582', '2', '95', '999833.00', '0.00', '1', '单次点播(95)', '1443605582', null, null, null);
INSERT INTO `users_account_record` VALUES ('193', '12', '6.00', '0', '1443605582', '2', '95', '9.00', '0.00', '1', '单次点播(95)', '1443605582', null, null, null);
INSERT INTO `users_account_record` VALUES ('194', '1', '2.00', '0', '1444021795', '5', '0', '68.50', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444021795', null, '1444021795', null);
INSERT INTO `users_account_record` VALUES ('195', '29', '5.00', '0', '1444027120', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444027120', null, '1444027120', null);
INSERT INTO `users_account_record` VALUES ('196', '21', '0.00', '1', '1444028930', '2', '86', '0.00', '0.00', '1', '单次点播(86)', '1444028930', null, null, null);
INSERT INTO `users_account_record` VALUES ('197', '6', '0.00', '0', '1444028930', '2', '86', '6.00', '0.00', '1', '单次点播(86)', '1444028930', null, null, null);
INSERT INTO `users_account_record` VALUES ('198', '21', '0.00', '1', '1444028978', '2', '92', '0.00', '0.00', '1', '单次点播(92)', '1444028978', null, null, null);
INSERT INTO `users_account_record` VALUES ('199', '4', '0.00', '0', '1444028978', '2', '92', '10.00', '0.00', '1', '单次点播(92)', '1444028978', null, null, null);
INSERT INTO `users_account_record` VALUES ('200', '15', '2.00', '0', '1444029354', '5', '0', '298.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444029354', null, '1444029354', null);
INSERT INTO `users_account_record` VALUES ('201', '25', '1.00', '0', '1444029361', '5', '0', '999834.00', '0.00', '1', '发布作品审核通过获赠:1杏币', '1444029361', null, '1444029361', null);
INSERT INTO `users_account_record` VALUES ('202', '5', '1.00', '0', '1444029368', '5', '0', '29.00', '0.00', '1', '发布作品审核通过获赠:1杏币', '1444029368', null, '1444029368', null);
INSERT INTO `users_account_record` VALUES ('203', '25', '3.00', '0', '1444029375', '5', '0', '999837.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444029375', null, '1444029375', null);
INSERT INTO `users_account_record` VALUES ('204', '30', '5.00', '0', '1444277339', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444277339', null, '1444277339', null);
INSERT INTO `users_account_record` VALUES ('205', '31', '5.00', '0', '1444277380', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444277380', null, '1444277380', null);
INSERT INTO `users_account_record` VALUES ('206', '32', '5.00', '0', '1444277402', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444277402', null, '1444277402', null);
INSERT INTO `users_account_record` VALUES ('207', '30', '30000000.00', '0', '1444277717', '1', '22', '30000005.00', '0.00', '1', '转账成功 充值金额：30000000.00', '1444277717', 'admin', '1444277717', 'admin');
INSERT INTO `users_account_record` VALUES ('208', '31', '20000000.00', '0', '1444277725', '1', '21', '20000005.00', '0.00', '1', '转账成功 充值金额：20000000.00', '1444277725', 'admin', '1444277725', 'admin');
INSERT INTO `users_account_record` VALUES ('209', '32', '10000000.00', '0', '1444277729', '1', '20', '10000005.00', '0.00', '1', '转账成功 充值金额：10000000.00', '1444277729', 'admin', '1444277729', 'admin');
INSERT INTO `users_account_record` VALUES ('210', '25', '3.00', '0', '1444278741', '5', '0', '999840.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444278741', null, '1444278741', null);
INSERT INTO `users_account_record` VALUES ('211', '25', '77.00', '0', '1444313811', '1', '24', '999917.00', '0.00', '1', '转账成功 充值金额：77.00', '1444313811', 'admin', '1444313811', 'admin');
INSERT INTO `users_account_record` VALUES ('212', '18', '3.00', '0', '1444356181', '5', '0', '3.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444356181', null, '1444356181', null);
INSERT INTO `users_account_record` VALUES ('213', '30', '3.00', '0', '1444377720', '5', '0', '30000008.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444377720', null, '1444377720', null);
INSERT INTO `users_account_record` VALUES ('214', '30', '2.00', '1', '1444377734', '2', '108', '30000006.00', '0.00', '1', '单次点播(108)', '1444377734', null, null, null);
INSERT INTO `users_account_record` VALUES ('215', '30', '0.60', '0', '1444377734', '2', '108', '30000006.60', '0.00', '1', '单次点播(108)', '1444377734', null, null, null);
INSERT INTO `users_account_record` VALUES ('216', '30', '-39.00', '1', '1444378668', '3', '110', '30000045.60', '0.00', '1', '批量订单', '1444378668', null, null, null);
INSERT INTO `users_account_record` VALUES ('217', '30', '-390.00', '1', '1444378884', '3', '111', '30000435.60', '0.00', '1', '批量订单', '1444378884', null, null, null);
INSERT INTO `users_account_record` VALUES ('218', '33', '5.00', '0', '1444380086', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444380086', null, '1444380086', null);
INSERT INTO `users_account_record` VALUES ('219', '31', '10.00', '1', '1444381929', '3', '112', '19999995.00', '0.00', '1', '批量订单', '1444381929', null, null, null);
INSERT INTO `users_account_record` VALUES ('220', '31', '100.00', '1', '1444382067', '3', '113', '19999895.00', '0.00', '1', '批量订单', '1444382067', null, null, null);
INSERT INTO `users_account_record` VALUES ('221', '34', '5.00', '0', '1444382375', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444382375', null, '1444382375', null);
INSERT INTO `users_account_record` VALUES ('222', '33', '40000000.00', '0', '1444382436', '1', '26', '40000005.00', '0.00', '1', '转账成功 充值金额：40000000.00', '1444382436', 'admin', '1444382436', 'admin');
INSERT INTO `users_account_record` VALUES ('223', '34', '50000000.00', '0', '1444382443', '1', '27', '50000005.00', '0.00', '1', '转账成功 充值金额：50000000.00', '1444382443', 'admin', '1444382443', 'admin');
INSERT INTO `users_account_record` VALUES ('224', '25', '111.00', '0', '1444382525', '1', '25', '1000028.00', '0.00', '1', '转账成功 充值金额：111.00', '1444382525', 'admin', '1444382525', 'admin');
INSERT INTO `users_account_record` VALUES ('225', '35', '5.00', '0', '1444382759', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444382759', null, '1444382759', null);
INSERT INTO `users_account_record` VALUES ('226', '25', '1.00', '0', '1444382861', '1', '28', '1000029.00', '0.00', '1', '转账成功 充值金额：1.00', '1444382861', 'admin', '1444382861', 'admin');
INSERT INTO `users_account_record` VALUES ('227', '35', '1000000.00', '0', '1444382869', '1', '30', '1000005.00', '0.00', '1', '转账成功 充值金额：1000000.00', '1444382869', 'admin', '1444382869', 'admin');
INSERT INTO `users_account_record` VALUES ('228', '25', '5.00', '1', '1444382922', '2', '100', '1000024.00', '0.00', '1', '单次点播(100)', '1444382922', null, null, null);
INSERT INTO `users_account_record` VALUES ('229', '1', '1.50', '0', '1444382922', '2', '100', '70.00', '0.00', '1', '单次点播(100)', '1444382922', null, null, null);
INSERT INTO `users_account_record` VALUES ('230', '30', '10.00', '1', '1444442339', '2', '53', '30000425.60', '0.00', '1', '单次点播(53)', '1444442339', null, null, null);
INSERT INTO `users_account_record` VALUES ('231', '14', '2.00', '0', '1444442339', '2', '53', '999004.00', '0.00', '1', '单次点播(53)', '1444442339', null, null, null);
INSERT INTO `users_account_record` VALUES ('232', '30', '0.00', '1', '1444442350', '2', '92', '30000425.60', '0.00', '1', '单次点播(92)', '1444442350', null, null, null);
INSERT INTO `users_account_record` VALUES ('233', '4', '0.00', '0', '1444442350', '2', '92', '10.00', '0.00', '1', '单次点播(92)', '1444442350', null, null, null);
INSERT INTO `users_account_record` VALUES ('234', '34', '235.00', '1', '1444490207', '3', '117', '49999770.00', '0.00', '1', '批量订单', '1444490207', null, null, null);
INSERT INTO `users_account_record` VALUES ('235', '34', '1015.00', '1', '1444490747', '3', '118', '49998755.00', '0.00', '1', '批量订单', '1444490747', null, null, null);
INSERT INTO `users_account_record` VALUES ('236', '5', '3.00', '0', '1444564347', '5', '0', '32.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444564347', null, '1444564347', null);
INSERT INTO `users_account_record` VALUES ('237', '34', '1.00', '1', '1444564591', '2', '103', '49998754.00', '0.00', '1', '单次点播(103)', '1444564591', null, null, null);
INSERT INTO `users_account_record` VALUES ('238', '25', '0.20', '0', '1444564591', '2', '103', '1000024.20', '0.00', '1', '单次点播(103)', '1444564591', null, null, null);
INSERT INTO `users_account_record` VALUES ('239', '36', '5.00', '0', '1444613354', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1444613354', null, '1444613354', null);
INSERT INTO `users_account_record` VALUES ('240', '33', '50.00', '1', '1444618454', '2', '46', '39999955.00', '0.00', '1', '单次点播(46)', '1444618454', null, null, null);
INSERT INTO `users_account_record` VALUES ('241', '7', '15.00', '0', '1444618454', '2', '46', '83.20', '0.00', '1', '单次点播(46)', '1444618454', null, null, null);
INSERT INTO `users_account_record` VALUES ('242', '33', '20.00', '1', '1444618503', '2', '105', '39999935.00', '0.00', '1', '单次点播(105)', '1444618503', null, null, null);
INSERT INTO `users_account_record` VALUES ('243', '18', '6.00', '0', '1444618503', '2', '105', '9.00', '0.00', '1', '单次点播(105)', '1444618503', null, null, null);
INSERT INTO `users_account_record` VALUES ('244', '30', '30.00', '1', '1444658901', '2', '111', '30000395.60', '0.00', '1', '单次点播(111)', '1444658901', null, null, null);
INSERT INTO `users_account_record` VALUES ('245', '34', '9.00', '0', '1444658901', '2', '111', '49998763.00', '0.00', '1', '单次点播(111)', '1444658901', null, null, null);
INSERT INTO `users_account_record` VALUES ('246', '34', '10.00', '1', '1444659159', '2', '67', '49998753.00', '0.00', '1', '单次点播(67)', '1444659159', null, null, null);
INSERT INTO `users_account_record` VALUES ('247', '20', '2.00', '0', '1444659159', '2', '67', '98341.00', '0.00', '1', '单次点播(67)', '1444659159', null, null, null);
INSERT INTO `users_account_record` VALUES ('248', '33', '20.00', '1', '1444709362', '3', '124', '39999915.00', '0.00', '1', '批量订单', '1444709362', null, null, null);
INSERT INTO `users_account_record` VALUES ('249', '33', '10.00', '1', '1444728121', '2', '43', '39999905.00', '0.00', '1', '单次点播(43)', '1444728121', null, null, null);
INSERT INTO `users_account_record` VALUES ('250', '2', '2.00', '0', '1444728121', '2', '43', '5.00', '0.00', '1', '单次点播(43)', '1444728121', null, null, null);
INSERT INTO `users_account_record` VALUES ('251', '33', '0.00', '1', '1444728882', '2', '86', '39999905.00', '0.00', '1', '单次点播(86)', '1444728882', null, null, null);
INSERT INTO `users_account_record` VALUES ('252', '6', '0.00', '0', '1444728882', '2', '86', '6.00', '0.00', '1', '单次点播(86)', '1444728882', null, null, null);
INSERT INTO `users_account_record` VALUES ('253', '33', '20.00', '1', '1444729465', '2', '13', '39999885.00', '0.00', '1', '单次点播(13)', '1444729465', null, null, null);
INSERT INTO `users_account_record` VALUES ('254', '6', '4.00', '0', '1444729465', '2', '13', '10.00', '0.00', '1', '单次点播(13)', '1444729465', null, null, null);
INSERT INTO `users_account_record` VALUES ('255', '35', '2.00', '0', '1444748768', '5', '0', '1000007.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444748768', null, '1444748768', null);
INSERT INTO `users_account_record` VALUES ('256', '35', '3.00', '0', '1444749430', '5', '0', '1000010.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444749430', null, '1444749430', null);
INSERT INTO `users_account_record` VALUES ('257', '33', '20.00', '1', '1444749639', '2', '113', '39999865.00', '0.00', '1', '单次点播(113)', '1444749639', null, null, null);
INSERT INTO `users_account_record` VALUES ('258', '35', '6.00', '0', '1444749639', '2', '113', '1000016.00', '0.00', '1', '单次点播(113)', '1444749639', null, null, null);
INSERT INTO `users_account_record` VALUES ('259', '35', '3.00', '0', '1444751062', '5', '0', '1000019.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444751062', null, '1444751062', null);
INSERT INTO `users_account_record` VALUES ('260', '35', '215.00', '1', '1444752000', '3', '129', '999804.00', '0.00', '1', '批量订单', '1444752000', null, null, null);
INSERT INTO `users_account_record` VALUES ('261', '30', '20.00', '1', '1444900599', '2', '113', '30000375.60', '0.00', '1', '单次点播(113)', '1444900599', null, null, null);
INSERT INTO `users_account_record` VALUES ('262', '35', '6.00', '0', '1444900599', '2', '113', '999810.00', '0.00', '1', '单次点播(113)', '1444900599', null, null, null);
INSERT INTO `users_account_record` VALUES ('263', '30', '0.00', '1', '1444900679', '2', '112', '30000375.60', '0.00', '1', '单次点播(112)', '1444900679', null, null, null);
INSERT INTO `users_account_record` VALUES ('264', '35', '0.00', '0', '1444900679', '2', '112', '999810.00', '0.00', '1', '单次点播(112)', '1444900679', null, null, null);
INSERT INTO `users_account_record` VALUES ('265', '3', '3.00', '0', '1444901701', '5', '0', '99580.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444901701', null, '1444901701', null);
INSERT INTO `users_account_record` VALUES ('266', '35', '3.00', '0', '1444984098', '5', '0', '999813.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1444984098', null, '1444984098', null);
INSERT INTO `users_account_record` VALUES ('267', '1', '2.00', '0', '1444984101', '5', '0', '72.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444984101', null, '1444984101', null);
INSERT INTO `users_account_record` VALUES ('268', '12', '2.00', '0', '1444984106', '5', '0', '11.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444984106', null, '1444984106', null);
INSERT INTO `users_account_record` VALUES ('269', '30', '2.00', '0', '1444984110', '5', '0', '30000377.60', '0.00', '1', '发布作品审核通过获赠:2杏币', '1444984110', null, '1444984110', null);
INSERT INTO `users_account_record` VALUES ('270', '30', '5.00', '1', '1444985895', '2', '77', '30000572.60', '0.00', '1', '单次点播(77)', '1444985895', null, null, null);
INSERT INTO `users_account_record` VALUES ('271', '36', '1.00', '0', '1444985895', '2', '77', '6.00', '0.00', '1', '单次点播(77)', '1444985895', null, null, null);
INSERT INTO `users_account_record` VALUES ('272', '30', '30.00', '1', '1444985926', '2', '78', '30000542.60', '0.00', '1', '单次点播(78)', '1444985926', null, null, null);
INSERT INTO `users_account_record` VALUES ('273', '35', '6.00', '0', '1444985926', '2', '78', '999819.00', '0.00', '1', '单次点播(78)', '1444985926', null, null, null);
INSERT INTO `users_account_record` VALUES ('274', '30', '20.00', '1', '1444989152', '2', '95', '30000522.60', '0.00', '1', '单次点播(95)', '1444989152', null, null, null);
INSERT INTO `users_account_record` VALUES ('275', '34', '6.00', '0', '1444989152', '2', '95', '49998759.00', '0.00', '1', '单次点播(95)', '1444989152', null, null, null);
INSERT INTO `users_account_record` VALUES ('276', '30', '0.00', '1', '1445221338', '2', '86', '30000522.60', '0.00', '1', '单次点播(86)', '1445221338', null, null, null);
INSERT INTO `users_account_record` VALUES ('277', '33', '0.00', '0', '1445221338', '2', '86', '39999865.00', '0.00', '1', '单次点播(86)', '1445221338', null, null, null);
INSERT INTO `users_account_record` VALUES ('278', '30', '20.00', '1', '1445221542', '2', '88', '30000502.60', '0.00', '1', '单次点播(88)', '1445221542', null, null, null);
INSERT INTO `users_account_record` VALUES ('279', '33', '4.00', '0', '1445221542', '2', '88', '39999869.00', '0.00', '1', '单次点播(88)', '1445221542', null, null, null);
INSERT INTO `users_account_record` VALUES ('280', '30', '10.00', '1', '1445221788', '2', '80', '30000492.60', '0.00', '1', '单次点播(80)', '1445221788', null, null, null);
INSERT INTO `users_account_record` VALUES ('281', '33', '2.00', '0', '1445221788', '2', '80', '39999871.00', '0.00', '1', '单次点播(80)', '1445221788', null, null, null);
INSERT INTO `users_account_record` VALUES ('282', '30', '20.00', '1', '1445222073', '2', '84', '30000472.60', '0.00', '1', '单次点播(84)', '1445222073', null, null, null);
INSERT INTO `users_account_record` VALUES ('283', '33', '4.00', '0', '1445222073', '2', '84', '39999875.00', '0.00', '1', '单次点播(84)', '1445222073', null, null, null);
INSERT INTO `users_account_record` VALUES ('284', '30', '30.00', '1', '1445223003', '2', '47', '30000442.60', '0.00', '1', '单次点播(47)', '1445223003', null, null, null);
INSERT INTO `users_account_record` VALUES ('285', '10', '6.00', '0', '1445223003', '2', '47', '6.00', '0.00', '1', '单次点播(47)', '1445223003', null, null, null);
INSERT INTO `users_account_record` VALUES ('286', '30', '10.00', '1', '1445223387', '2', '75', '30000432.60', '0.00', '1', '单次点播(75)', '1445223387', null, null, null);
INSERT INTO `users_account_record` VALUES ('287', '10', '2.00', '0', '1445223387', '2', '75', '8.00', '0.00', '1', '单次点播(75)', '1445223387', null, null, null);
INSERT INTO `users_account_record` VALUES ('288', '31', '10.00', '1', '1445223478', '2', '75', '19999885.00', '0.00', '1', '单次点播(75)', '1445223478', null, null, null);
INSERT INTO `users_account_record` VALUES ('289', '10', '2.00', '0', '1445223478', '2', '75', '10.00', '0.00', '1', '单次点播(75)', '1445223478', null, null, null);
INSERT INTO `users_account_record` VALUES ('290', '30', '10.00', '1', '1445223545', '2', '102', '30000422.60', '0.00', '1', '单次点播(102)', '1445223545', null, null, null);
INSERT INTO `users_account_record` VALUES ('291', '15', '3.00', '0', '1445223545', '2', '102', '301.00', '0.00', '1', '单次点播(102)', '1445223545', null, null, null);
INSERT INTO `users_account_record` VALUES ('292', '30', '50.00', '1', '1445224271', '2', '54', '30000372.60', '0.00', '1', '单次点播(54)', '1445224271', null, null, null);
INSERT INTO `users_account_record` VALUES ('293', '20', '15.00', '0', '1445224271', '2', '54', '98356.00', '0.00', '1', '单次点播(54)', '1445224271', null, null, null);
INSERT INTO `users_account_record` VALUES ('294', '30', '5.00', '1', '1445224326', '2', '100', '30000367.60', '0.00', '1', '单次点播(100)', '1445224326', null, null, null);
INSERT INTO `users_account_record` VALUES ('295', '33', '1.50', '0', '1445224326', '2', '100', '39999876.50', '0.00', '1', '单次点播(100)', '1445224326', null, null, null);
INSERT INTO `users_account_record` VALUES ('296', '37', '5.00', '0', '1445235572', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1445235572', null, '1445235572', null);
INSERT INTO `users_account_record` VALUES ('297', '38', '5.00', '0', '1445239022', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1445239022', null, '1445239022', null);
INSERT INTO `users_account_record` VALUES ('298', '39', '5.00', '0', '1445239269', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1445239269', null, '1445239269', null);
INSERT INTO `users_account_record` VALUES ('299', '30', '10.00', '1', '1445249542', '3', '145', '30000371.60', '0.00', '1', '批量订单', '1445249542', null, null, null);
INSERT INTO `users_account_record` VALUES ('300', '30', '20.00', '1', '1445249724', '2', '64', '30000351.60', '0.00', '1', '单次点播(64)', '1445249724', null, null, null);
INSERT INTO `users_account_record` VALUES ('301', '36', '4.00', '0', '1445249724', '2', '64', '10.00', '0.00', '1', '单次点播(64)', '1445249724', null, null, null);
INSERT INTO `users_account_record` VALUES ('302', '33', '10.00', '1', '1445308118', '2', '93', '39999866.50', '0.00', '1', '单次点播(93)', '1445308118', null, null, null);
INSERT INTO `users_account_record` VALUES ('303', '8', '3.00', '0', '1445308118', '2', '93', '9.00', '0.00', '1', '单次点播(93)', '1445308118', null, null, null);
INSERT INTO `users_account_record` VALUES ('304', '34', '5.00', '1', '1445667560', '2', '77', '49998754.00', '0.00', '1', '单次点播(77)', '1445667560', null, null, null);
INSERT INTO `users_account_record` VALUES ('305', '36', '1.00', '0', '1445667560', '2', '77', '11.00', '0.00', '1', '单次点播(77)', '1445667560', null, null, null);
INSERT INTO `users_account_record` VALUES ('306', '34', '26.40', '1', '1445667836', '3', '149', '49998727.60', '0.00', '1', '批量订单', '1445667836', null, null, null);
INSERT INTO `users_account_record` VALUES ('307', '34', '20.00', '1', '1445752947', '3', '150', '49998707.60', '0.00', '1', '批量订单', '1445752947', null, null, null);
INSERT INTO `users_account_record` VALUES ('308', '40', '5.00', '0', '1445753339', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1445753339', null, '1445753339', null);
INSERT INTO `users_account_record` VALUES ('309', '30', '111.00', '1', '1445776555', '2', '121', '30000340.60', '0.00', '1', '单次点播(121)', '1445776555', null, null, null);
INSERT INTO `users_account_record` VALUES ('310', '30', '33.30', '0', '1445776555', '2', '121', '30000373.90', '0.00', '1', '单次点播(121)', '1445776555', null, null, null);
INSERT INTO `users_account_record` VALUES ('311', '41', '5.00', '0', '1446025830', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446025830', null, '1446025830', null);
INSERT INTO `users_account_record` VALUES ('312', '42', '5.00', '0', '1446026050', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446026050', null, '1446026050', null);
INSERT INTO `users_account_record` VALUES ('313', '43', '5.00', '0', '1446026730', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446026730', null, '1446026730', null);
INSERT INTO `users_account_record` VALUES ('314', '30', '10.00', '1', '1446175408', '2', '143', '30000363.90', '0.00', '1', '单次点播(143)', '1446175408', null, null, null);
INSERT INTO `users_account_record` VALUES ('315', '41', '3.00', '0', '1446175408', '2', '143', '14.00', '0.00', '1', '单次点播(143)', '1446175408', null, null, null);
INSERT INTO `users_account_record` VALUES ('316', '30', '0.20', '1', '1446175566', '2', '142', '30000363.70', '0.00', '1', '单次点播(142)', '1446175566', null, null, null);
INSERT INTO `users_account_record` VALUES ('317', '41', '0.06', '0', '1446175566', '2', '142', '14.06', '0.00', '1', '单次点播(142)', '1446175566', null, null, null);
INSERT INTO `users_account_record` VALUES ('318', '34', '123.00', '0', '1446278920', '1', '35', '49998832.60', '0.00', '1', '转账成功 充值金额：123.00', '1446278920', 'test_99', '1446278920', 'test_99');
INSERT INTO `users_account_record` VALUES ('319', '33', '104.50', '0', '1446284325', '1', '37', '39999971.00', '0.00', '1', '转账成功 充值金额：104.50', '1446284325', 'test_99', '1446284325', 'test_99');
INSERT INTO `users_account_record` VALUES ('320', '44', '5.00', '0', '1446370322', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446370322', null, '1446370322', null);
INSERT INTO `users_account_record` VALUES ('321', '45', '5.00', '0', '1446371067', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446371067', null, '1446371067', null);
INSERT INTO `users_account_record` VALUES ('322', '46', '5.00', '0', '1446371313', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446371313', null, '1446371313', null);
INSERT INTO `users_account_record` VALUES ('323', '40', '30.00', '0', '1446373981', '1', '42', '52.00', '0.00', '1', '转账成功 充值金额：30.00', '1446373981', 'test_99', '1446373981', 'test_99');
INSERT INTO `users_account_record` VALUES ('324', '40', '6.00', '1', '1446433296', '3', '154', '46.00', '0.00', '1', '批量订单', '1446433296', null, null, null);
INSERT INTO `users_account_record` VALUES ('328', '40', '100.00', '0', '1446447413', '1', '43', '146.00', '0.00', '1', '转账成功 充值金额：100.00', '1446447413', 'test_99', '1446447413', 'test_99');
INSERT INTO `users_account_record` VALUES ('329', '40', '100.00', '1', '1446447463', '3', '158', '46.00', '0.00', '1', '批量订单', '1446447463', null, null, null);
INSERT INTO `users_account_record` VALUES ('332', '40', '30.00', '1', '1446448011', '3', '161', '16.00', '0.00', '1', '批量订单', '1446448011', null, null, null);
INSERT INTO `users_account_record` VALUES ('333', '40', '20.00', '0', '1446448561', '1', '44', '36.00', '0.00', '1', '转账成功 充值金额：20.00', '1446448561', 'test_99', '1446448561', 'test_99');
INSERT INTO `users_account_record` VALUES ('335', '30', '30.99', '1', '1446449882', '2', '145', '30000332.71', '0.00', '1', '单次点播(145)', '1446449882', null, null, null);
INSERT INTO `users_account_record` VALUES ('336', '44', '9.30', '0', '1446449882', '2', '145', '18.81', '0.00', '1', '单次点播(145)', '1446449882', null, null, null);
INSERT INTO `users_account_record` VALUES ('337', '44', '10.00', '1', '1446451341', '3', '164', '8.81', '0.00', '1', '批量订单', '1446451341', null, null, null);
INSERT INTO `users_account_record` VALUES ('338', '47', '5.00', '0', '1446451534', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446451534', null, '1446451534', null);
INSERT INTO `users_account_record` VALUES ('339', '30', '50.05', '1', '1446453155', '2', '144', '30000282.66', '0.00', '1', '单次点播(144)', '1446453155', null, null, null);
INSERT INTO `users_account_record` VALUES ('340', '44', '10.01', '0', '1446453155', '2', '144', '18.82', '0.00', '1', '单次点播(144)', '1446453155', null, null, null);
INSERT INTO `users_account_record` VALUES ('341', '47', '150.00', '0', '1446453478', '1', '45', '155.00', '0.00', '1', '转账成功 充值金额：150.00', '1446453478', 'test_99', '1446453478', 'test_99');
INSERT INTO `users_account_record` VALUES ('342', '47', '98.00', '1', '1446453483', '3', '166', '57.00', '0.00', '1', '批量订单', '1446453483', null, null, null);
INSERT INTO `users_account_record` VALUES ('343', '47', '7.00', '1', '1446454811', '3', '167', '50.00', '0.00', '1', '批量订单', '1446454811', null, null, null);
INSERT INTO `users_account_record` VALUES ('345', '47', '350.00', '0', '1446456493', '1', '47', '400.00', '0.00', '1', '转账成功 充值金额：350.00', '1446456493', 'test_99', '1446456493', 'test_99');
INSERT INTO `users_account_record` VALUES ('346', '47', '345.60', '1', '1446456500', '3', '169', '54.40', '0.00', '1', '批量订单', '1446456500', null, null, null);
INSERT INTO `users_account_record` VALUES ('347', '48', '5.00', '0', '1446457932', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446457932', null, '1446457932', null);
INSERT INTO `users_account_record` VALUES ('348', '48', '100.00', '0', '1446458063', '1', '49', '105.00', '0.00', '1', '转账成功 充值金额：100.00', '1446458063', 'admin', '1446458063', 'admin');
INSERT INTO `users_account_record` VALUES ('349', '48', '32.00', '1', '1446458092', '2', '134', '73.00', '0.00', '1', '单次点播(134)', '1446458092', null, null, null);
INSERT INTO `users_account_record` VALUES ('350', '40', '12.80', '0', '1446458092', '2', '134', '48.80', '0.00', '1', '单次点播(134)', '1446458092', null, null, null);
INSERT INTO `users_account_record` VALUES ('351', '48', '5.00', '1', '1446458228', '2', '66', '68.00', '0.00', '1', '单次点播(66)', '1446458228', null, null, null);
INSERT INTO `users_account_record` VALUES ('352', '36', '1.00', '0', '1446458228', '2', '66', '12.00', '0.00', '1', '单次点播(66)', '1446458228', null, null, null);
INSERT INTO `users_account_record` VALUES ('353', '48', '500.00', '0', '1446458448', '1', '50', '568.00', '0.00', '1', '转账成功 充值金额：500.00', '1446458448', 'admin', '1446458448', 'admin');
INSERT INTO `users_account_record` VALUES ('354', '48', '21.00', '1', '1446458465', '2', '131', '547.00', '0.00', '1', '单次点播(131)', '1446458465', null, null, null);
INSERT INTO `users_account_record` VALUES ('355', '40', '6.30', '0', '1446458465', '2', '131', '55.10', '0.00', '1', '单次点播(131)', '1446458465', null, null, null);
INSERT INTO `users_account_record` VALUES ('356', '40', '20.00', '0', '1446521785', '1', '41', '75.10', '0.00', '1', '转账成功 充值金额：20.00', '1446521785', 'admin', '1446521785', 'admin');
INSERT INTO `users_account_record` VALUES ('357', '31', '30.99', '1', '1446532292', '2', '145', '19999854.01', '0.00', '1', '单次点播(145)', '1446532292', null, null, null);
INSERT INTO `users_account_record` VALUES ('358', '44', '9.30', '0', '1446532292', '2', '145', '28.12', '0.00', '1', '单次点播(145)', '1446532292', null, null, null);
INSERT INTO `users_account_record` VALUES ('359', '31', '50.05', '1', '1446532385', '2', '144', '19999803.96', '0.00', '1', '单次点播(144)', '1446532385', null, null, null);
INSERT INTO `users_account_record` VALUES ('360', '44', '10.01', '0', '1446532385', '2', '144', '38.13', '0.00', '1', '单次点播(144)', '1446532385', null, null, null);
INSERT INTO `users_account_record` VALUES ('361', '31', '5.00', '1', '1446533938', '2', '77', '19999798.96', '0.00', '1', '单次点播(77)', '1446533938', null, null, null);
INSERT INTO `users_account_record` VALUES ('362', '36', '2.00', '0', '1446533938', '2', '77', '14.00', '0.00', '1', '单次点播(77)', '1446533938', null, null, null);
INSERT INTO `users_account_record` VALUES ('363', '31', '200.00', '1', '1446534957', '2', '126', '19999598.96', '0.00', '1', '单次点播(126)', '1446534957', null, null, null);
INSERT INTO `users_account_record` VALUES ('364', '37', '60.00', '0', '1446534957', '2', '126', '77.00', '0.00', '1', '单次点播(126)', '1446534957', null, null, null);
INSERT INTO `users_account_record` VALUES ('365', '31', '111.00', '1', '1446534964', '2', '121', '19999487.96', '0.00', '1', '单次点播(121)', '1446534964', null, null, null);
INSERT INTO `users_account_record` VALUES ('366', '30', '33.30', '0', '1446534964', '2', '121', '30000315.96', '0.00', '1', '单次点播(121)', '1446534964', null, null, null);
INSERT INTO `users_account_record` VALUES ('367', '31', '10.00', '1', '1446534973', '2', '127', '19999477.96', '0.00', '1', '单次点播(127)', '1446534973', null, null, null);
INSERT INTO `users_account_record` VALUES ('368', '39', '3.00', '0', '1446534973', '2', '127', '14.00', '0.00', '1', '单次点播(127)', '1446534973', null, null, null);
INSERT INTO `users_account_record` VALUES ('369', '31', '50.00', '1', '1446534982', '2', '124', '19999427.96', '0.00', '1', '单次点播(124)', '1446534982', null, null, null);
INSERT INTO `users_account_record` VALUES ('370', '37', '15.00', '0', '1446534982', '2', '124', '92.00', '0.00', '1', '单次点播(124)', '1446534982', null, null, null);
INSERT INTO `users_account_record` VALUES ('371', '31', '30.00', '1', '1446535161', '2', '78', '19999397.96', '0.00', '1', '单次点播(78)', '1446535161', null, null, null);
INSERT INTO `users_account_record` VALUES ('372', '35', '12.00', '0', '1446535161', '2', '78', '999837.00', '0.00', '1', '单次点播(78)', '1446535161', null, null, null);
INSERT INTO `users_account_record` VALUES ('373', '31', '20.00', '1', '1446535189', '2', '79', '19999377.96', '0.00', '1', '单次点播(79)', '1446535189', null, null, null);
INSERT INTO `users_account_record` VALUES ('374', '35', '8.00', '0', '1446535189', '2', '79', '999845.00', '0.00', '1', '单次点播(79)', '1446535189', null, null, null);
INSERT INTO `users_account_record` VALUES ('375', '31', '3.22', '1', '1446536025', '2', '154', '19999374.74', '0.00', '1', '单次点播(154)', '1446536025', null, null, null);
INSERT INTO `users_account_record` VALUES ('376', '32', '0.97', '0', '1446536025', '2', '154', '10000025.97', '0.00', '1', '单次点播(154)', '1446536025', null, null, null);
INSERT INTO `users_account_record` VALUES ('377', '31', '2.33', '1', '1446536035', '2', '153', '19999372.41', '0.00', '1', '单次点播(153)', '1446536035', null, null, null);
INSERT INTO `users_account_record` VALUES ('378', '32', '0.70', '0', '1446536035', '2', '153', '10000026.67', '0.00', '1', '单次点播(153)', '1446536035', null, null, null);
INSERT INTO `users_account_record` VALUES ('379', '31', '5.66', '1', '1446536044', '2', '152', '19999366.75', '0.00', '1', '单次点播(152)', '1446536044', null, null, null);
INSERT INTO `users_account_record` VALUES ('380', '32', '1.70', '0', '1446536044', '2', '152', '10000028.37', '0.00', '1', '单次点播(152)', '1446536044', null, null, null);
INSERT INTO `users_account_record` VALUES ('381', '31', '3.66', '1', '1446536056', '2', '151', '19999363.09', '0.00', '1', '单次点播(151)', '1446536056', null, null, null);
INSERT INTO `users_account_record` VALUES ('382', '32', '1.10', '0', '1446536056', '2', '151', '10000029.47', '0.00', '1', '单次点播(151)', '1446536056', null, null, null);
INSERT INTO `users_account_record` VALUES ('383', '31', '5.00', '1', '1446536065', '2', '150', '19999358.09', '0.00', '1', '单次点播(150)', '1446536065', null, null, null);
INSERT INTO `users_account_record` VALUES ('384', '32', '1.50', '0', '1446536065', '2', '150', '10000030.97', '0.00', '1', '单次点播(150)', '1446536065', null, null, null);
INSERT INTO `users_account_record` VALUES ('385', '31', '5.00', '1', '1446536079', '2', '149', '19999353.09', '0.00', '1', '单次点播(149)', '1446536079', null, null, null);
INSERT INTO `users_account_record` VALUES ('386', '32', '1.50', '0', '1446536079', '2', '149', '10000032.47', '0.00', '1', '单次点播(149)', '1446536079', null, null, null);
INSERT INTO `users_account_record` VALUES ('387', '30', '3.22', '1', '1446536260', '2', '154', '30000312.74', '0.00', '1', '单次点播(154)', '1446536260', null, null, null);
INSERT INTO `users_account_record` VALUES ('388', '32', '0.97', '0', '1446536260', '2', '154', '10000033.44', '0.00', '1', '单次点播(154)', '1446536260', null, null, null);
INSERT INTO `users_account_record` VALUES ('389', '30', '2.33', '1', '1446536300', '2', '153', '30000310.41', '0.00', '1', '单次点播(153)', '1446536300', null, null, null);
INSERT INTO `users_account_record` VALUES ('390', '32', '0.70', '0', '1446536300', '2', '153', '10000034.14', '0.00', '1', '单次点播(153)', '1446536300', null, null, null);
INSERT INTO `users_account_record` VALUES ('391', '30', '5.66', '1', '1446536317', '2', '152', '30000304.75', '0.00', '1', '单次点播(152)', '1446536317', null, null, null);
INSERT INTO `users_account_record` VALUES ('392', '32', '1.70', '0', '1446536317', '2', '152', '10000035.84', '0.00', '1', '单次点播(152)', '1446536317', null, null, null);
INSERT INTO `users_account_record` VALUES ('393', '30', '3.66', '1', '1446536331', '2', '151', '30000301.09', '0.00', '1', '单次点播(151)', '1446536331', null, null, null);
INSERT INTO `users_account_record` VALUES ('394', '32', '1.10', '0', '1446536331', '2', '151', '10000036.94', '0.00', '1', '单次点播(151)', '1446536331', null, null, null);
INSERT INTO `users_account_record` VALUES ('395', '33', '3.22', '1', '1446536514', '2', '154', '39999967.78', '0.00', '1', '单次点播(154)', '1446536514', null, null, null);
INSERT INTO `users_account_record` VALUES ('396', '32', '0.97', '0', '1446536514', '2', '154', '10000037.91', '0.00', '1', '单次点播(154)', '1446536514', null, null, null);
INSERT INTO `users_account_record` VALUES ('397', '33', '2.33', '1', '1446536521', '2', '153', '39999965.45', '0.00', '1', '单次点播(153)', '1446536521', null, null, null);
INSERT INTO `users_account_record` VALUES ('398', '32', '0.70', '0', '1446536521', '2', '153', '10000038.61', '0.00', '1', '单次点播(153)', '1446536521', null, null, null);
INSERT INTO `users_account_record` VALUES ('399', '33', '5.66', '1', '1446536527', '2', '152', '39999959.79', '0.00', '1', '单次点播(152)', '1446536527', null, null, null);
INSERT INTO `users_account_record` VALUES ('400', '32', '1.70', '0', '1446536527', '2', '152', '10000040.31', '0.00', '1', '单次点播(152)', '1446536527', null, null, null);
INSERT INTO `users_account_record` VALUES ('401', '33', '3.66', '1', '1446536535', '2', '151', '39999956.13', '0.00', '1', '单次点播(151)', '1446536535', null, null, null);
INSERT INTO `users_account_record` VALUES ('402', '32', '1.10', '0', '1446536535', '2', '151', '10000041.41', '0.00', '1', '单次点播(151)', '1446536535', null, null, null);
INSERT INTO `users_account_record` VALUES ('403', '30', '100.00', '1', '1446628221', '3', '196', '30000201.09', '0.00', '1', '批量订单', '1446628221', null, null, null);
INSERT INTO `users_account_record` VALUES ('410', '3', '30.99', '1', '1446691315', '2', '145', '99549.01', '0.00', '1', '单次点播(145)', '1446691315', null, null, null);
INSERT INTO `users_account_record` VALUES ('411', '44', '9.30', '0', '1446691315', '2', '145', '49.43', '0.00', '1', '单次点播(145)', '1446691315', null, null, null);
INSERT INTO `users_account_record` VALUES ('412', '32', '3.40', '1', '1446719054', '3', '204', '10000058.01', '0.00', '1', '批量订单', '1446719054', null, null, null);
INSERT INTO `users_account_record` VALUES ('413', '22', '3.22', '1', '1446775981', '2', '154', '263.18', '0.00', '1', '单次点播(154)', '1446775981', null, null, null);
INSERT INTO `users_account_record` VALUES ('414', '32', '0.97', '0', '1446775981', '2', '154', '10000058.98', '0.00', '1', '单次点播(154)', '1446775981', null, null, null);
INSERT INTO `users_account_record` VALUES ('415', '30', '7.63', '1', '1446776669', '2', '159', '30000193.46', '0.00', '1', '单次点播(159)', '1446776669', null, null, null);
INSERT INTO `users_account_record` VALUES ('416', '32', '3.05', '0', '1446776669', '2', '159', '10000062.03', '0.00', '1', '单次点播(159)', '1446776669', null, null, null);
INSERT INTO `users_account_record` VALUES ('417', '32', '30.99', '1', '1446778260', '2', '145', '10000031.04', '0.00', '1', '单次点播(145)', '1446778260', null, null, null);
INSERT INTO `users_account_record` VALUES ('418', '44', '9.30', '0', '1446778260', '2', '145', '58.73', '0.00', '1', '单次点播(145)', '1446778260', null, null, null);
INSERT INTO `users_account_record` VALUES ('419', '30', '5.00', '1', '1446781536', '2', '150', '30000188.46', '0.00', '1', '单次点播(150)', '1446781536', null, null, null);
INSERT INTO `users_account_record` VALUES ('420', '32', '1.50', '0', '1446781536', '2', '150', '10000032.54', '0.00', '1', '单次点播(150)', '1446781536', null, null, null);
INSERT INTO `users_account_record` VALUES ('421', '49', '5.00', '0', '1446791195', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446791195', null, '1446791195', null);
INSERT INTO `users_account_record` VALUES ('422', '30', '17.00', '1', '1446796819', '3', '209', '30000171.46', '0.00', '1', '批量订单', '1446796819', null, null, null);
INSERT INTO `users_account_record` VALUES ('423', '30', '6.00', '1', '1446796906', '3', '210', '30000165.46', '0.00', '1', '批量订单', '1446796906', null, null, null);
INSERT INTO `users_account_record` VALUES ('424', '50', '5.00', '0', '1446797672', '4', '0', '5.00', '0.00', '1', '注册会员赠送金额:5杏币', '1446797672', null, '1446797672', null);
INSERT INTO `users_account_record` VALUES ('425', '25', '30.99', '1', '1446812029', '2', '145', '999993.21', '0.00', '1', '单次点播(145)', '1446812029', null, null, null);
INSERT INTO `users_account_record` VALUES ('426', '44', '9.30', '0', '1446812029', '2', '145', '68.03', '0.00', '1', '单次点播(145)', '1446812029', null, null, null);
INSERT INTO `users_account_record` VALUES ('427', '25', '55.00', '1', '1446812498', '2', '123', '999938.21', '0.00', '1', '单次点播(123)', '1446812498', null, null, null);
INSERT INTO `users_account_record` VALUES ('428', '30', '16.50', '0', '1446812498', '2', '123', '30000183.96', '0.00', '1', '单次点播(123)', '1446812498', null, null, null);
INSERT INTO `users_account_record` VALUES ('429', '25', '100.00', '1', '1446812502', '2', '122', '999838.21', '0.00', '1', '单次点播(122)', '1446812502', null, null, null);
INSERT INTO `users_account_record` VALUES ('430', '30', '30.00', '0', '1446812502', '2', '122', '30000213.96', '0.00', '1', '单次点播(122)', '1446812502', null, null, null);
INSERT INTO `users_account_record` VALUES ('431', '25', '111.00', '1', '1446812506', '2', '121', '999727.21', '0.00', '1', '单次点播(121)', '1446812506', null, null, null);
INSERT INTO `users_account_record` VALUES ('432', '30', '33.30', '0', '1446812506', '2', '121', '30000247.26', '0.00', '1', '单次点播(121)', '1446812506', null, null, null);
INSERT INTO `users_account_record` VALUES ('433', '25', '5.00', '1', '1446812515', '2', '109', '999722.21', '0.00', '1', '单次点播(109)', '1446812515', null, null, null);
INSERT INTO `users_account_record` VALUES ('434', '30', '1.00', '0', '1446812515', '2', '109', '30000248.26', '0.00', '1', '单次点播(109)', '1446812515', null, null, null);
INSERT INTO `users_account_record` VALUES ('435', '25', '10.00', '1', '1446812679', '2', '120', '999712.21', '0.00', '1', '单次点播(120)', '1446812679', null, null, null);
INSERT INTO `users_account_record` VALUES ('436', '30', '3.00', '0', '1446812679', '2', '120', '30000251.26', '0.00', '1', '单次点播(120)', '1446812679', null, null, null);
INSERT INTO `users_account_record` VALUES ('437', '25', '2.39', '1', '1446813605', '2', '129', '999709.82', '0.00', '1', '单次点播(129)', '1446813605', null, null, null);
INSERT INTO `users_account_record` VALUES ('438', '30', '0.72', '0', '1446813605', '2', '129', '30000260.98', '0.00', '1', '单次点播(129)', '1446813605', null, null, null);
INSERT INTO `users_account_record` VALUES ('439', '25', '10.00', '1', '1446866401', '2', '164', '999699.82', '0.00', '1', '单次点播(164)', '1446866401', null, null, null);
INSERT INTO `users_account_record` VALUES ('440', '30', '3.00', '0', '1446866401', '2', '164', '30000266.98', '0.00', '1', '单次点播(164)', '1446866401', null, null, null);
INSERT INTO `users_account_record` VALUES ('441', '30', '16.00', '0', '1446874438', '1', '59', '30000282.98', '0.00', '1', '转账成功 充值金额：16.00', '1446874438', 'admin', '1446874438', 'admin');
INSERT INTO `users_account_record` VALUES ('442', '30', '160.00', '1', '1446888690', '3', '219', '30000131.98', '0.00', '1', '批量订单', '1446888690', null, null, null);
INSERT INTO `users_account_record` VALUES ('443', '3', '2.39', '1', '1447034279', '2', '129', '99546.62', '0.00', '1', '单次点播(129)', '1447034279', null, null, null);
INSERT INTO `users_account_record` VALUES ('444', '30', '0.72', '0', '1447034279', '2', '129', '30000132.70', '0.00', '1', '单次点播(129)', '1447034279', null, null, null);
INSERT INTO `users_account_record` VALUES ('445', '3', '5.00', '1', '1447035114', '2', '60', '99541.62', '0.00', '1', '单次点播(60)', '1447035114', null, null, null);
INSERT INTO `users_account_record` VALUES ('446', '36', '1.00', '0', '1447035114', '2', '60', '15.00', '0.00', '1', '单次点播(60)', '1447035114', null, null, null);
INSERT INTO `users_account_record` VALUES ('447', '3', '5.00', '1', '1447035124', '2', '161', '99536.62', '0.00', '1', '单次点播(161)', '1447035124', null, null, null);
INSERT INTO `users_account_record` VALUES ('448', '34', '1.50', '0', '1447035124', '2', '161', '49998837.10', '0.00', '1', '单次点播(161)', '1447035124', null, null, null);
INSERT INTO `users_account_record` VALUES ('449', '3', '10.00', '1', '1447086250', '3', '223', '99526.62', '0.00', '1', '批量订单', '1447086250', null, null, null);
INSERT INTO `users_account_record` VALUES ('450', '1', '300.00', '0', '1447123548', '1', '1', '372.00', '0.00', '1', '转账成功 充值金额：300.00', '1447123548', 'admin', '1447123548', 'admin');
INSERT INTO `users_account_record` VALUES ('451', '15', '2.33', '1', '1447136873', '2', '153', '298.67', '0.00', '1', '单次点播(153)', '1447136873', null, null, null);
INSERT INTO `users_account_record` VALUES ('452', '32', '0.70', '0', '1447136873', '2', '153', '10000033.24', '0.00', '1', '单次点播(153)', '1447136873', null, null, null);
INSERT INTO `users_account_record` VALUES ('453', '15', '20.00', '1', '1447136916', '2', '95', '278.67', '0.00', '1', '单次点播(95)', '1447136916', null, null, null);
INSERT INTO `users_account_record` VALUES ('454', '34', '6.00', '0', '1447136916', '2', '95', '49998843.10', '0.00', '1', '单次点播(95)', '1447136916', null, null, null);
INSERT INTO `users_account_record` VALUES ('455', '15', '5.00', '1', '1447137038', '2', '161', '273.67', '0.00', '1', '单次点播(161)', '1447137038', null, null, null);
INSERT INTO `users_account_record` VALUES ('456', '34', '1.50', '0', '1447137038', '2', '161', '49998844.60', '0.00', '1', '单次点播(161)', '1447137038', null, null, null);
INSERT INTO `users_account_record` VALUES ('457', '15', '10.00', '1', '1447137062', '2', '148', '263.67', '0.00', '1', '单次点播(148)', '1447137062', null, null, null);
INSERT INTO `users_account_record` VALUES ('458', '32', '2.00', '0', '1447137062', '2', '148', '10000035.24', '0.00', '1', '单次点播(148)', '1447137062', null, null, null);
INSERT INTO `users_account_record` VALUES ('459', '15', '9.00', '1', '1447137144', '2', '158', '254.67', '0.00', '1', '单次点播(158)', '1447137144', null, null, null);
INSERT INTO `users_account_record` VALUES ('460', '32', '3.60', '0', '1447137144', '2', '158', '10000038.84', '0.00', '1', '单次点播(158)', '1447137144', null, null, null);
INSERT INTO `users_account_record` VALUES ('461', '15', '30.99', '1', '1447137214', '2', '145', '223.68', '0.00', '1', '单次点播(145)', '1447137214', null, null, null);
INSERT INTO `users_account_record` VALUES ('462', '44', '9.30', '0', '1447137214', '2', '145', '77.33', '0.00', '1', '单次点播(145)', '1447137214', null, null, null);
INSERT INTO `users_account_record` VALUES ('463', '15', '5.00', '1', '1447137259', '2', '66', '218.68', '0.00', '1', '单次点播(66)', '1447137259', null, null, null);
INSERT INTO `users_account_record` VALUES ('464', '36', '1.00', '0', '1447137259', '2', '66', '16.00', '0.00', '1', '单次点播(66)', '1447137259', null, null, null);
INSERT INTO `users_account_record` VALUES ('465', '15', '0.00', '1', '1447137388', '2', '92', '218.68', '0.00', '1', '单次点播(92)', '1447137388', null, null, null);
INSERT INTO `users_account_record` VALUES ('466', '4', '0.00', '0', '1447137388', '2', '92', '10.00', '0.00', '1', '单次点播(92)', '1447137388', null, null, null);
INSERT INTO `users_account_record` VALUES ('467', '15', '10.00', '1', '1447137441', '2', '57', '208.68', '0.00', '1', '单次点播(57)', '1447137441', null, null, null);
INSERT INTO `users_account_record` VALUES ('468', '20', '2.00', '0', '1447137441', '2', '57', '98358.00', '0.00', '1', '单次点播(57)', '1447137441', null, null, null);
INSERT INTO `users_account_record` VALUES ('469', '15', '0.00', '1', '1447138518', '2', '86', '208.68', '0.00', '1', '单次点播(86)', '1447138518', null, null, null);
INSERT INTO `users_account_record` VALUES ('470', '33', '0.00', '0', '1447138518', '2', '86', '39999956.13', '0.00', '1', '单次点播(86)', '1447138518', null, null, null);
INSERT INTO `users_account_record` VALUES ('471', '15', '20.00', '1', '1447138548', '2', '84', '188.68', '0.00', '1', '单次点播(84)', '1447138548', null, null, null);
INSERT INTO `users_account_record` VALUES ('472', '33', '8.00', '0', '1447138548', '2', '84', '39999964.13', '0.00', '1', '单次点播(84)', '1447138548', null, null, null);
INSERT INTO `users_account_record` VALUES ('473', '41', '20.00', '1', '1447141791', '3', '235', '99994.06', '0.00', '1', '批量订单', '1447141791', null, null, null);
INSERT INTO `users_account_record` VALUES ('474', '41', '20.00', '1', '1447142051', '3', '236', '99974.06', '0.00', '1', '批量订单', '1447142051', null, null, null);
INSERT INTO `users_account_record` VALUES ('475', '15', '10.00', '1', '1447146647', '2', '97', '178.68', '0.00', '1', '单次点播(97)', '1447146647', null, null, null);
INSERT INTO `users_account_record` VALUES ('476', '7', '4.00', '0', '1447146647', '2', '97', '87.20', '0.00', '1', '单次点播(97)', '1447146647', null, null, null);
INSERT INTO `users_account_record` VALUES ('477', '3', '10.00', '1', '1447149009', '3', '238', '99516.62', '0.00', '1', '批量订单', '1447149009', null, null, null);
INSERT INTO `users_account_record` VALUES ('478', '3', '10.00', '1', '1447149225', '3', '239', '99506.62', '0.00', '1', '批量订单', '1447149225', null, null, null);
INSERT INTO `users_account_record` VALUES ('479', '25', '10.00', '1', '1447209983', '3', '240', '999689.82', '0.00', '1', '批量订单', '1447209983', null, null, null);
INSERT INTO `users_account_record` VALUES ('480', '30', '100.00', '1', '1447210107', '3', '241', '30000032.70', '0.00', '1', '批量订单', '1447210107', null, null, null);
INSERT INTO `users_account_record` VALUES ('481', '30', '100.00', '1', '1447210138', '3', '242', '29999932.70', '0.00', '1', '批量订单', '1447210138', null, null, null);
INSERT INTO `users_account_record` VALUES ('482', '41', '10.00', '1', '1447576223', '2', '148', '99964.06', '0.00', '1', '单次点播(148)', '1447576223', null, null, null);
INSERT INTO `users_account_record` VALUES ('483', '32', '2.00', '0', '1447576223', '2', '148', '10000040.84', '0.00', '1', '单次点播(148)', '1447576223', null, null, null);
INSERT INTO `users_account_record` VALUES ('484', '40', '304.98', '0', '1447581054', '1', '64', '380.08', '0.00', '1', '转账成功 充值金额：304.98', '1447581054', 'test_99', '1447581054', 'test_99');
INSERT INTO `users_account_record` VALUES ('485', '40', '40.00', '0', '1447581579', '1', '66', '420.08', '0.00', '1', '转账成功 充值金额：40.00', '1447581579', 'test_99', '1447581579', 'test_99');
INSERT INTO `users_account_record` VALUES ('486', '40', '7.20', '1', '1447583001', '3', '244', '412.88', '0.00', '1', '批量订单', '1447583001', null, null, null);
INSERT INTO `users_account_record` VALUES ('487', '40', '68.00', '1', '1447643570', '3', '245', '344.88', '0.00', '1', '批量订单', '1447643570', null, null, null);
INSERT INTO `users_account_record` VALUES ('488', '41', '7.63', '1', '1447817350', '2', '159', '109962.43', '0.00', '1', '单次点播(159)', '1447817350', null, null, null);
INSERT INTO `users_account_record` VALUES ('489', '32', '3.05', '0', '1447817350', '2', '159', '10000043.89', '0.00', '1', '单次点播(159)', '1447817350', null, null, null);
INSERT INTO `users_account_record` VALUES ('490', '41', '32.00', '1', '1447817374', '2', '134', '109930.43', '0.00', '1', '单次点播(134)', '1447817374', null, null, null);
INSERT INTO `users_account_record` VALUES ('491', '40', '12.80', '0', '1447817374', '2', '134', '357.68', '0.00', '1', '单次点播(134)', '1447817374', null, null, null);
INSERT INTO `users_account_record` VALUES ('492', '41', '6666.33', '0', '1447817587', '1', '70', '116596.76', '0.00', '1', '转账成功 充值金额：6666.33', '1447817587', 'admin01', '1447817587', 'admin01');
INSERT INTO `users_account_record` VALUES ('493', '41', '4.00', '1', '1447829161', '3', '248', '116592.76', '0.00', '1', '批量订单', '1447829161', null, null, null);
INSERT INTO `users_account_record` VALUES ('494', '43', '2.00', '1', '1447831306', '3', '249', '1103.00', '0.00', '1', '批量订单', '1447831306', null, null, null);
INSERT INTO `users_account_record` VALUES ('495', '43', '40.00', '1', '1447836254', '3', '250', '1063.00', '0.00', '1', '批量订单', '1447836254', null, null, null);
INSERT INTO `users_account_record` VALUES ('496', '43', '20.00', '1', '1447836612', '3', '251', '1043.00', '0.00', '1', '批量订单', '1447836612', null, null, null);
INSERT INTO `users_account_record` VALUES ('497', '25', '100.00', '1', '1447916772', '2', '181', '999589.82', '0.00', '1', '单次点播(181)', '1447916772', null, null, null);
INSERT INTO `users_account_record` VALUES ('498', '31', '30.00', '0', '1447916772', '2', '181', '19999383.09', '0.00', '1', '单次点播(181)', '1447916772', null, null, null);
INSERT INTO `users_account_record` VALUES ('499', '25', '20.00', '1', '1447917122', '2', '182', '999569.82', '0.00', '1', '单次点播(182)', '1447917122', null, null, null);
INSERT INTO `users_account_record` VALUES ('500', '31', '6.00', '0', '1447917122', '2', '182', '19999392.09', '0.00', '1', '单次点播(182)', '1447917122', null, null, null);
INSERT INTO `users_account_record` VALUES ('501', '3', '500.00', '0', '1447921469', '1', '73', '100016.62', '0.00', '1', '转账成功 充值金额：500.00', '1447921469', 'admin', '1447921469', 'admin');
INSERT INTO `users_account_record` VALUES ('502', '3', '5.00', '0', '1447922632', '5', '0', '100021.62', '0.00', '1', '发布作品审核通过获赠:5杏币', '1447922632', null, '1447922632', null);
INSERT INTO `users_account_record` VALUES ('503', '40', '30.00', '0', '1447922707', '1', '65', '387.68', '0.00', '1', '转账成功 充值金额：30.00', '1447922707', 'admin', '1447922707', 'admin');
INSERT INTO `users_account_record` VALUES ('504', '31', '3.33', '0', '1447925152', '5', '0', '19999395.42', '0.00', '1', '发布作品审核通过获赠:3.33杏币', '1447925152', null, '1447925152', null);
INSERT INTO `users_account_record` VALUES ('505', '33', '30.00', '1', '1447926765', '2', '187', '40009934.13', '0.00', '1', '单次点播(187)', '1447926765', null, null, null);
INSERT INTO `users_account_record` VALUES ('506', '31', '9.00', '0', '1447926765', '2', '187', '19999404.42', '0.00', '1', '单次点播(187)', '1447926765', null, null, null);
INSERT INTO `users_account_record` VALUES ('507', '33', '33.00', '1', '1447926990', '2', '180', '40009901.13', '0.00', '1', '单次点播(180)', '1447926990', null, null, null);
INSERT INTO `users_account_record` VALUES ('508', '41', '6.60', '0', '1447926990', '2', '180', '116604.36', '0.00', '1', '单次点播(180)', '1447926990', null, null, null);
INSERT INTO `users_account_record` VALUES ('509', '35', '20.00', '1', '1448009994', '3', '256', '999828.00', '0.00', '1', '批量订单', '1448009994', null, null, null);
INSERT INTO `users_account_record` VALUES ('510', '35', '20.00', '1', '1448010116', '3', '257', '999808.00', '0.00', '1', '批量订单', '1448010116', null, null, null);
INSERT INTO `users_account_record` VALUES ('511', '31', '20.00', '1', '1448011938', '3', '258', '19999384.42', '0.00', '1', '批量订单', '1448011938', null, null, null);
INSERT INTO `users_account_record` VALUES ('512', '3', '10.00', '1', '1448031752', '3', '259', '100011.62', '0.00', '1', '批量订单', '1448031752', null, null, null);
INSERT INTO `users_account_record` VALUES ('513', '35', '30.00', '1', '1448270875', '3', '260', '999778.00', '0.00', '1', '批量订单', '1448270875', null, null, null);
INSERT INTO `users_account_record` VALUES ('514', '35', '50.00', '1', '1448272496', '3', '261', '999728.00', '0.00', '1', '批量订单', '1448272496', null, null, null);
INSERT INTO `users_account_record` VALUES ('515', '35', '40.00', '1', '1448333895', '3', '262', '999688.00', '0.00', '1', '批量订单', '1448333895', null, null, null);
INSERT INTO `users_account_record` VALUES ('516', '45', '3.00', '0', '1448337205', '5', '0', '8.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1448337205', null, '1448337205', null);
INSERT INTO `users_account_record` VALUES ('517', '36', '3.00', '0', '1448337524', '5', '0', '19.00', '0.00', '1', '发布作品审核通过获赠:3杏币', '1448337524', null, '1448337524', null);
INSERT INTO `users_account_record` VALUES ('518', '42', '100000.00', '0', '1448355960', '5', '0', '100005.00', '0.00', '1', '发布作品审核通过获赠:100000杏币', '1448355960', null, '1448355960', null);
INSERT INTO `users_account_record` VALUES ('519', '30', '190.00', '1', '1448373137', '3', '263', '29999742.70', '0.00', '1', '批量订单', '1448373137', null, null, null);
INSERT INTO `users_account_record` VALUES ('520', '42', '20.00', '1', '1448439472', '3', '264', '99985.00', '0.00', '1', '批量订单', '1448439472', null, null, null);
INSERT INTO `users_account_record` VALUES ('521', '42', '10.00', '1', '1448442432', '3', '265', '99975.00', '0.00', '1', '批量订单', '1448442432', null, null, null);
INSERT INTO `users_account_record` VALUES ('522', '42', '20.00', '1', '1448442707', '3', '266', '99955.00', '0.00', '1', '批量订单', '1448442707', null, null, null);
INSERT INTO `users_account_record` VALUES ('523', '42', '108.00', '1', '1448443272', '3', '267', '99847.00', '0.00', '1', '批量订单', '1448443272', null, null, null);
INSERT INTO `users_account_record` VALUES ('524', '42', '3.00', '1', '1448444089', '3', '268', '99844.00', '0.00', '1', '批量订单', '1448444089', null, null, null);
INSERT INTO `users_account_record` VALUES ('525', '34', '61.00', '1', '1448511822', '3', '269', '49998791.60', '0.00', '1', '批量订单', '1448511822', null, null, null);
INSERT INTO `users_account_record` VALUES ('526', '34', '31.00', '1', '1448511873', '3', '270', '49998760.60', '0.00', '1', '批量订单', '1448511873', null, null, null);
INSERT INTO `users_account_record` VALUES ('527', '34', '5.00', '1', '1448512016', '3', '271', '49998755.60', '0.00', '1', '批量订单', '1448512016', null, null, null);
INSERT INTO `users_account_record` VALUES ('528', '3', '200.00', '1', '1448513490', '3', '272', '99811.62', '0.00', '1', '批量订单', '1448513490', null, null, null);
INSERT INTO `users_account_record` VALUES ('529', '34', '6.60', '1', '1448526053', '3', '273', '49998749.00', '0.00', '1', '批量订单', '1448526053', null, null, null);
INSERT INTO `users_account_record` VALUES ('530', '34', '0.60', '1', '1448526114', '3', '274', '49998748.40', '0.00', '1', '批量订单', '1448526114', null, null, null);
INSERT INTO `users_account_record` VALUES ('531', '34', '15.00', '1', '1448605932', '3', '275', '49998733.40', '0.00', '1', '批量订单', '1448605932', null, null, null);
INSERT INTO `users_account_record` VALUES ('532', '34', '0.50', '1', '1448605987', '3', '276', '49998732.90', '0.00', '1', '批量订单', '1448605987', null, null, null);
INSERT INTO `users_account_record` VALUES ('533', '34', '2.00', '1', '1448606082', '3', '277', '49998730.90', '0.00', '1', '批量订单', '1448606082', null, null, null);
INSERT INTO `users_account_record` VALUES ('534', '35', '2.00', '1', '1448606394', '3', '278', '999686.00', '0.00', '1', '批量订单', '1448606394', null, null, null);
INSERT INTO `users_account_record` VALUES ('535', '35', '0.50', '1', '1448606649', '3', '279', '999685.50', '0.00', '1', '批量订单', '1448606649', null, null, null);
INSERT INTO `users_account_record` VALUES ('536', '39', '2.00', '0', '1448611517', '5', '0', '16.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1448611517', null, '1448611517', null);
INSERT INTO `users_account_record` VALUES ('537', '34', '2.00', '1', '1448613525', '3', '280', '49998728.90', '0.00', '1', '批量订单', '1448613525', null, null, null);
INSERT INTO `users_account_record` VALUES ('538', '41', '102.00', '1', '1448718843', '3', '281', '116502.36', '0.00', '1', '批量订单', '1448718843', null, null, null);
INSERT INTO `users_account_record` VALUES ('539', '41', '11.00', '1', '1448719357', '3', '282', '116491.36', '0.00', '1', '批量订单', '1448719357', null, null, null);
INSERT INTO `users_account_record` VALUES ('540', '41', '10.00', '1', '1448719437', '3', '283', '116481.36', '0.00', '1', '批量订单', '1448719437', null, null, null);
INSERT INTO `users_account_record` VALUES ('541', '41', '10.00', '1', '1448770460', '3', '284', '116471.36', '0.00', '1', '批量订单', '1448770460', null, null, null);
INSERT INTO `users_account_record` VALUES ('542', '41', '10.00', '1', '1448770520', '3', '285', '116461.36', '0.00', '1', '批量订单', '1448770520', null, null, null);
INSERT INTO `users_account_record` VALUES ('543', '41', '200.00', '1', '1448770643', '3', '286', '116261.36', '0.00', '1', '批量订单', '1448770643', null, null, null);
INSERT INTO `users_account_record` VALUES ('544', '3', '10.00', '1', '1448848545', '3', '287', '99801.62', '0.00', '1', '批量订单', '1448848545', null, null, null);
INSERT INTO `users_account_record` VALUES ('545', '3', '10.00', '1', '1448848596', '3', '288', '99791.62', '0.00', '1', '批量订单', '1448848596', null, null, null);
INSERT INTO `users_account_record` VALUES ('546', '3', '10.00', '1', '1448848626', '3', '289', '99781.62', '0.00', '1', '批量订单', '1448848626', null, null, null);
INSERT INTO `users_account_record` VALUES ('547', '3', '200.00', '1', '1448849553', '3', '290', '99581.62', '0.00', '1', '批量订单', '1448849553', null, null, null);
INSERT INTO `users_account_record` VALUES ('548', '41', '3.00', '0', '1448866433', '5', '0', '116264.36', '0.00', '1', '发布作品审核通过获赠:3杏币', '1448866433', null, '1448866433', null);
INSERT INTO `users_account_record` VALUES ('549', '46', '1400000000.00', '0', '1448866940', '5', '0', '1400000005.00', '0.00', '1', '发布作品审核通过获赠:1400000000杏币', '1448866940', null, '1448866940', null);
INSERT INTO `users_account_record` VALUES ('550', '46', '12.00', '1', '1448867254', '2', '199', '1399999993.00', '0.00', '1', '单次点播(199)', '1448867254', null, null, null);
INSERT INTO `users_account_record` VALUES ('551', '41', '3.60', '0', '1448867254', '2', '199', '116267.96', '0.00', '1', '单次点播(199)', '1448867254', null, null, null);
INSERT INTO `users_account_record` VALUES ('552', '41', '10.20', '1', '1448870032', '3', '292', '116257.76', '0.00', '1', '批量订单', '1448870032', null, null, null);
INSERT INTO `users_account_record` VALUES ('553', '41', '0.60', '1', '1448875355', '3', '293', '116257.16', '0.00', '1', '批量订单', '1448875355', null, null, null);
INSERT INTO `users_account_record` VALUES ('554', '41', '1.00', '1', '1448875457', '3', '294', '116256.16', '0.00', '1', '批量订单', '1448875457', null, null, null);
INSERT INTO `users_account_record` VALUES ('555', '41', '20.00', '1', '1448875557', '3', '295', '116236.16', '0.00', '1', '批量订单', '1448875557', null, null, null);
INSERT INTO `users_account_record` VALUES ('556', '39', '2.00', '0', '1449025339', '5', '0', '18.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1449025339', null, '1449025339', null);
INSERT INTO `users_account_record` VALUES ('557', '36', '2.00', '0', '1449025741', '5', '0', '21.00', '0.00', '1', '发布作品审核通过获赠:2杏币', '1449025741', null, '1449025741', null);
INSERT INTO `users_account_record` VALUES ('558', '35', '2.00', '0', '1449028517', '5', '0', '999687.50', '0.00', '1', '发布作品审核通过获赠:2杏币', '1449028517', null, '1449028517', null);
INSERT INTO `users_account_record` VALUES ('559', '41', '102.00', '1', '1449137894', '3', '296', '116134.16', '0.00', '1', '批量订单', '1449137894', null, null, null);
INSERT INTO `users_account_record` VALUES ('560', '41', '21.00', '1', '1449138101', '3', '297', '116113.16', '0.00', '1', '批量订单', '1449138101', null, null, null);
INSERT INTO `users_account_record` VALUES ('561', '41', '1.00', '1', '1449138216', '3', '298', '116112.16', '0.00', '1', '批量订单', '1449138216', null, null, null);

-- ----------------------------
-- Table structure for users_anchor
-- ----------------------------
DROP TABLE IF EXISTS `users_anchor`;
CREATE TABLE `users_anchor` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` bigint(20) DEFAULT NULL COMMENT '会员',
  `anchor_id` bigint(20) DEFAULT NULL COMMENT '主播',
  `begintime` bigint(20) DEFAULT NULL COMMENT '开始日期',
  `endtime` bigint(20) DEFAULT NULL COMMENT '到期日期',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='会员的包养主播表';

-- ----------------------------
-- Records of users_anchor
-- ----------------------------
INSERT INTO `users_anchor` VALUES ('1', '30', '39', '1445249542', '1447841542', '1445249542', '30', '1445249542', '30');
INSERT INTO `users_anchor` VALUES ('2', '40', '33', '1446447463', '1488351463', '1446447463', '40', '1447643570', '40');
INSERT INTO `users_anchor` VALUES ('4', '47', '34', '1446456500', '1449048500', '1446456500', '47', '1446456500', '47');
INSERT INTO `users_anchor` VALUES ('5', '30', '34', '1446628221', '1449220221', '1446628221', '30', '1446628221', '30');
INSERT INTO `users_anchor` VALUES ('6', '32', '36', '1446719054', '1451903054', '1446719054', '32', '1446719054', '32');
INSERT INTO `users_anchor` VALUES ('7', '30', '32', '1446796819', '1451980819', '1446796819', '30', '1446796819', '30');
INSERT INTO `users_anchor` VALUES ('8', '3', '39', '1447086250', '1452270250', '1447086250', '3', '1447086250', '3');
INSERT INTO `users_anchor` VALUES ('9', '25', '36', '1447209983', '1449801983', '1447209983', '25', '1447209983', '25');
INSERT INTO `users_anchor` VALUES ('10', '30', '45', '1447210107', '1478746107', '1447210107', '30', '1447210107', '30');
INSERT INTO `users_anchor` VALUES ('11', '30', '22', '1447210138', '1478746138', '1447210138', '30', '1447210138', '30');
INSERT INTO `users_anchor` VALUES ('12', '40', '39', '1447583002', '1510655002', '1447583002', '40', '1447583002', '40');
INSERT INTO `users_anchor` VALUES ('13', '41', '32', '1447829161', '1479365161', '1447829161', '41', '1447829161', '41');
INSERT INTO `users_anchor` VALUES ('14', '43', '39', '1447836254', '1479372254', '1447836254', '43', '1447836254', '43');
INSERT INTO `users_anchor` VALUES ('15', '43', '45', '1447836612', '1450428612', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_anchor` VALUES ('16', '43', '36', '1447836612', '1450428612', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_anchor` VALUES ('17', '43', '32', '1447836612', '1450428612', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_anchor` VALUES ('18', '35', '39', '1448009994', '1460969994', '1448009994', '35', '1448333895', '35');
INSERT INTO `users_anchor` VALUES ('19', '35', '36', '1448009994', '1450601994', '1448009994', '35', '1448009994', '35');
INSERT INTO `users_anchor` VALUES ('20', '35', '33', '1448010116', '1450602116', '1448010116', '35', '1448010116', '35');
INSERT INTO `users_anchor` VALUES ('21', '35', '32', '1448010116', '1450602116', '1448010116', '35', '1448010116', '35');
INSERT INTO `users_anchor` VALUES ('22', '31', '32', '1448011938', '1450603938', '1448011938', '31', '1448011938', '31');
INSERT INTO `users_anchor` VALUES ('23', '31', '31', '1448011938', '1450603938', '1448011938', '31', '1448011938', '31');
INSERT INTO `users_anchor` VALUES ('24', '3', '33', '1448031752', '1450623752', '1448031752', '3', '1448031752', '3');
INSERT INTO `users_anchor` VALUES ('25', '35', '31', '1448270875', '1450862875', '1448270875', '35', '1448270875', '35');
INSERT INTO `users_anchor` VALUES ('26', '35', '34', '1448270875', '1450862875', '1448270875', '35', '1448270875', '35');
INSERT INTO `users_anchor` VALUES ('27', '35', '30', '1448272496', '1461232496', '1448272496', '35', '1448272496', '35');
INSERT INTO `users_anchor` VALUES ('28', '35', '20', '1448333895', '1450925895', '1448333895', '35', '1448333895', '35');
INSERT INTO `users_anchor` VALUES ('29', '30', '36', '1448373137', '1456149137', '1448373137', '30', '1448373137', '30');
INSERT INTO `users_anchor` VALUES ('30', '42', '34', '1448439472', '1453623472', '1448439472', '42', '1448439472', '42');
INSERT INTO `users_anchor` VALUES ('31', '34', '35', '1448605932', '1453789932', '1448605932', '34', '1448605932', '34');
INSERT INTO `users_anchor` VALUES ('32', '34', '39', '1448605932', '1451197932', '1448605932', '34', '1448605932', '34');
INSERT INTO `users_anchor` VALUES ('33', '34', '30', '1448613525', '1451205525', '1448613525', '34', '1448613525', '34');
INSERT INTO `users_anchor` VALUES ('34', '41', '36', '1448770643', '1482898643', '1448770643', '41', '1449138216', '41');

-- ----------------------------
-- Table structure for users_draft
-- ----------------------------
DROP TABLE IF EXISTS `users_draft`;
CREATE TABLE `users_draft` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(300) NOT NULL COMMENT '标题',
  `first_id` bigint(20) DEFAULT NULL COMMENT '一级分类id',
  `cid` bigint(20) unsigned NOT NULL COMMENT '分类',
  `utype` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型 0 主播  1普通用户',
  `uid` bigint(20) NOT NULL COMMENT '用户编号',
  `uname` varchar(100) NOT NULL COMMENT '用户昵称  冗余字段',
  `desc` text NOT NULL COMMENT '介绍',
  `cover_thumb` varchar(300) NOT NULL COMMENT '封面小图(H：W=3：4等比缩放)',
  `cover_picurl` varchar(300) NOT NULL COMMENT '封面原图',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '价格 单位 杏币',
  `buy_num` int(11) DEFAULT '0' COMMENT '购买数',
  `fav_num` int(11) DEFAULT '0' COMMENT '收藏数',
  `com_num` int(11) DEFAULT '0' COMMENT '评论数',
  `view_num` int(11) DEFAULT '0' COMMENT '查看数',
  `review_status` int(2) DEFAULT '0' COMMENT '审核状态0 待内容审核 1内容审核通过待上线审核 2内容审核未通过 3上线审核通过  4上线审核未通过',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 默认0不是 1 删除',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='作品草稿表';

-- ----------------------------
-- Records of users_draft
-- ----------------------------
INSERT INTO `users_draft` VALUES ('1', '你好啊啊啊', '2', '8', '0', '13', 'yaolei', '12321321321', '7a28bd8df5/400_7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '100.00', '0', '0', '0', '0', '0', '0', '1441188591', '1441188591', 'yaolei', 'yaolei');
INSERT INTO `users_draft` VALUES ('2', '你好啊啊啊', '1', '18', '0', '13', 'yaolei', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1441188689', '1441188698', 'yaolei', 'yaolei');
INSERT INTO `users_draft` VALUES ('4', '海蓝的夏天', '1', '3', '0', '20', 'rr', '', '', '', '50.00', '0', '0', '0', '0', '0', '0', '1441507327', '1441508086', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('5', '海蓝的夏天', '1', '3', '0', '20', 'rr', '', '', '', '50.00', '0', '0', '0', '0', '0', '0', '1441507598', '1441507598', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('6', '海蓝的夏天', '1', '3', '0', '20', 'rr', '', '', '', '50.00', '0', '0', '0', '0', '0', '0', '1441507663', '1441507663', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('7', '海蓝的夏天', '1', '3', '0', '20', 'rr', '', '', '', '50.00', '0', '0', '0', '0', '0', '0', '1441507774', '1441507774', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('8', '海蓝的夏天', '1', '18', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1441507804', '1441508026', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('9', '分公司的风格当', '1', '18', '0', '20', 'rr', '', '38b9dc3c7d/400_38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1441508112', '1441508242', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('10', '分公司的风格当', '1', '18', '0', '20', 'rr', '', '38b9dc3c7d/400_38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1441508119', '1441508119', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('11', '分公司的风格当', '1', '18', '0', '20', 'rr', '', '38b9dc3c7d/400_38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1441508122', '1441508122', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('12', '分公司的风格当', '1', '18', '0', '20', 'rr', '', '38b9dc3c7d/400_38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1441508131', '1441508131', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('13', '分公司的风格当', '1', '18', '0', '20', 'rr', '', '38b9dc3c7d/400_38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1441508167', '1441508167', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('14', '阿发', '1', '1', '0', '20', 'rr', '', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '0.00', '0', '0', '0', '0', '0', '0', '1441508261', '1441508261', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('15', '阿发', '1', '1', '0', '20', 'rr', '', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '0.00', '0', '0', '0', '0', '0', '0', '1441508269', '1441508269', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('16', '阿发', '1', '1', '0', '20', 'rr', '', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '0.00', '0', '0', '0', '0', '0', '0', '1441508272', '1441508884', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('18', 'aasdasdsa', '1', '18', '0', '22', 'xiaosan', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1441508548', '1441508553', 'xiaosan', 'xiaosan');
INSERT INTO `users_draft` VALUES ('19', '辅导费撒打发', '1', '18', '0', '20', 'rr', '', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '21.00', '0', '0', '0', '0', '0', '0', '1441520909', '1441521055', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('21', '123', '1', '18', '0', '14', '地平线上的泪水', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1441533760', '1441533832', '地平线上的泪水', '地平线上的泪水');
INSERT INTO `users_draft` VALUES ('22', '卡卡卡卡i', '1', '15', '0', '14', '地平线上的泪水', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1441533849', '1441533857', '地平线上的泪水', '地平线上的泪水');
INSERT INTO `users_draft` VALUES ('23', '西藏之旅', '1', '2', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442391634', '1442391634', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('24', '西藏之旅', '1', '3', '0', '20', 'rr', '', '70c0061dfc/400_70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '0.00', '0', '0', '0', '0', '0', '0', '1442391702', '1442391702', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('25', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442545348', '1442545348', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('26', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442545626', '1442545626', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('27', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442546235', '1442546235', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('28', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '5.00', '0', '0', '0', '0', '0', '0', '1442546302', '1442546302', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('29', '童话故事', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442546334', '1442546334', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('30', '童话故事', '1', '18', '0', '25', 'rong', '', '', '', '5.00', '0', '0', '0', '0', '0', '0', '1442546427', '1442546427', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('31', 'dsssasaaa', '1', '18', '0', '15', 'lr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442546626', '1442546626', 'lr', 'lr');
INSERT INTO `users_draft` VALUES ('32', '热温热热污染', '2', '16', '0', '25', 'rong', '', '4e100eb43f/400_4e100eb43f23b57fed811452aaffb3ae.png', '4e100eb43f/4e100eb43f23b57fed811452aaffb3ae.png', '0.00', '0', '0', '0', '0', '0', '0', '1442546974', '1442547001', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('33', '热温热热污染', '1', '18', '0', '25', 'rong', '热温热热吻', '4e100eb43f/400_4e100eb43f23b57fed811452aaffb3ae.png', '4e100eb43f/4e100eb43f23b57fed811452aaffb3ae.png', '0.00', '0', '0', '0', '0', '0', '0', '1442546980', '1442546980', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('34', '热温热热污染', '1', '18', '0', '25', 'rong', '热温热热吻', '4e100eb43f/400_4e100eb43f23b57fed811452aaffb3ae.png', '4e100eb43f/4e100eb43f23b57fed811452aaffb3ae.png', '0.00', '0', '0', '0', '0', '0', '0', '1442546983', '1442546983', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('35', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442547421', '1442547421', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('36', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442547531', '1442547531', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('37', '童话世界', '1', '18', '0', '25', 'rong', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442547711', '1442547711', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('38', '童话世界', '1', '18', '0', '25', 'rong', '', '64100da933/400_64100da9339607c2bbddd06a59978310.JPG', '64100da933/64100da9339607c2bbddd06a59978310.JPG', '5.00', '0', '0', '0', '0', '0', '0', '1442547776', '1442547776', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('39', '童话世界', '2', '16', '0', '25', 'rong', '', '', '', '5.00', '0', '0', '0', '0', '0', '0', '1442548282', '1443430217', 'rong', 'rong');
INSERT INTO `users_draft` VALUES ('40', '童话故事', '1', '18', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442548532', '1442548532', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('41', '小儿歌', '1', '18', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442549146', '1442549146', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('42', '黑色星期五', '2', '16', '0', '20', 'rr', '', '', '', '10.00', '0', '0', '0', '0', '0', '0', '1442550246', '1442550434', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('43', '黑色星期五', '1', '18', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442550465', '1442550465', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('44', '记事本', '1', '18', '0', '20', 'rr', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1442550563', '1442550563', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('45', '记事本', '1', '2', '0', '20', 'rr', '', '4eba3833d8/400_4eba3833d8b7770a3a4e37a77797943a.jpg', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '20.00', '0', '0', '0', '0', '0', '0', '1442550686', '1442550686', 'rr', 'rr');
INSERT INTO `users_draft` VALUES ('68', '视频01', '1', '15', '0', '44', 'p01', '', '', '', '100.00', '0', '0', '0', '0', '0', '0', '1446371963', '1446372936', 'p01', 'p01');
INSERT INTO `users_draft` VALUES ('71', 'chaoguchaoguo超过20张', '2', '16', '0', '34', 'test_05', '超过20', '4798b2cec2/400_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '0.00', '0', '0', '0', '0', '0', '0', '1446522872', '1446523663', 'test_05', 'test_05');
INSERT INTO `users_draft` VALUES ('73', '视频数量', '1', '2', '0', '44', 'p01', '感受感受', 'c42a026d31/400_c42a026d31d3ef0899e5ba19e1334ef6.png', 'c42a026d31/c42a026d31d3ef0899e5ba19e1334ef6.png', '100.00', '0', '0', '0', '0', '0', '0', '1446533119', '1446533119', 'p01', 'p01');
INSERT INTO `users_draft` VALUES ('82', 'tyertyrty', '1', '15', '0', '34', 'test_05', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1446719807', '1446719807', 'test_05', 'test_05');
INSERT INTO `users_draft` VALUES ('83', 'erewtwertwer', '2', '16', '0', '34', 'test_05', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1446719814', '1446720218', 'test_05', 'test_05');
INSERT INTO `users_draft` VALUES ('84', 'fsfsf冯绍峰', '1', '15', '0', '34', 'test_05', '43423434', '', '', '4334.00', '0', '0', '0', '0', '0', '0', '1446720227', '1446720626', 'test_05', 'test_05');
INSERT INTO `users_draft` VALUES ('101', '大师傅', '2', '16', '0', '32', 'test_03', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1447819254', '1447819511', 'test_03', 'test_03');
INSERT INTO `users_draft` VALUES ('102', '你好', '2', '16', '0', '32', 'test_03', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1447819534', '1447819534', 'test_03', 'test_03');
INSERT INTO `users_draft` VALUES ('106', '我的作品', '2', '16', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1447921180', '1447921180', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('110', 'gsgsg', '2', '16', '0', '30', 'test_01', 'gsgd', '1dc565f890/400_1dc565f890c652762cb7df4c1e53fc85.jpg', '1dc565f890/1dc565f890c652762cb7df4c1e53fc85.jpg', '22222222.00', '0', '0', '0', '0', '0', '0', '1448372062', '1448372123', 'test_01', 'test_01');
INSERT INTO `users_draft` VALUES ('111', 'Metro', '2', '12', '0', '3', 'admin', 'promotion ad', 'ccf659a17d/400_ccf659a17d6d548f9685431fefff10f5.jpg', 'ccf659a17d/ccf659a17d6d548f9685431fefff10f5.jpg', '200.00', '0', '0', '0', '0', '0', '0', '1448469820', '1448482900', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('112', 'Fortinos', '2', '16', '0', '3', 'admin', 'Promotion', 'e00b741578/400_e00b741578403b1a5a78492cec786de3.jpg', 'e00b741578/e00b741578403b1a5a78492cec786de3.jpg', '23.00', '0', '0', '0', '0', '0', '0', '1448479627', '1448479687', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('113', 'Speedy', '2', '6', '0', '3', 'admin', '', '', '', '100.00', '0', '0', '0', '0', '0', '0', '1448479753', '1448479762', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('114', 'shevol', '1', '2', '0', '3', 'admin', '', '', '', '20.00', '0', '0', '0', '0', '0', '0', '1448479789', '1448479794', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('115', 'Transit', '1', '2', '0', '3', 'admin', '', '', '', '100.00', '0', '0', '0', '0', '0', '0', '1448479813', '1448479821', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('116', 'Need for Speed', '1', '2', '0', '3', 'admin', '', '', '', '5.00', '0', '0', '0', '0', '0', '0', '1448479870', '1448479879', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('117', 'Sim', '2', '16', '0', '3', 'admin', '', '', '', '15.00', '0', '0', '0', '0', '0', '0', '1448479898', '1448479905', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('118', 'Monster City', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448479924', '1448480767', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('120', 'Monster City', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448480815', '1448480815', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('121', 'Target', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448480833', '1448480833', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('122', 'fortinos', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448480892', '1448480892', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('123', 'LOL', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448480965', '1448480993', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('124', 'LOL', '2', '16', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448481005', '1448483208', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('126', 'Frank', '1', '15', '0', '3', 'admin', '', '', '', '0.00', '0', '0', '0', '0', '0', '0', '1448503859', '1448504262', 'admin', 'admin');
INSERT INTO `users_draft` VALUES ('127', '2222222', '1', '15', '0', '42', 'faa12', '', '', '', '12.00', '0', '0', '0', '0', '0', '0', '1448510986', '1448524265', 'faa12', 'faa12');
INSERT INTO `users_draft` VALUES ('128', 'abc2', '2', '16', '0', '30', 'test_01', '1', '', '', '1.00', '0', '0', '0', '0', '0', '0', '1448512117', '1448548303', 'test_01', 'test_01');
INSERT INTO `users_draft` VALUES ('129', '测试03', '2', '16', '0', '42', 'faa12', '测试测试', '', '', '1000.00', '0', '0', '0', '0', '0', '0', '1448524297', '1448525021', 'faa12', 'faa12');
INSERT INTO `users_draft` VALUES ('131', '飞信', '2', '16', '0', '41', 'faa123', '护发哈法哈', '', '', '1222.00', '0', '0', '0', '0', '0', '0', '1448771136', '1448784878', 'faa123', 'faa123');

-- ----------------------------
-- Table structure for users_draft_attach
-- ----------------------------
DROP TABLE IF EXISTS `users_draft_attach`;
CREATE TABLE `users_draft_attach` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `file_type` int(2) DEFAULT '0' COMMENT '文件类型0 上传 1URL',
  `file_url` varchar(1000) DEFAULT NULL COMMENT '文件地址',
  `file_name` varchar(200) NOT NULL COMMENT '文件名称只用于展示 file_type 为0时有效',
  `works_library_id` bigint(20) DEFAULT NULL COMMENT '作品',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8 COMMENT='作品草稿附件表';

-- ----------------------------
-- Records of users_draft_attach
-- ----------------------------
INSERT INTO `users_draft_attach` VALUES ('1', '0', '2e86ebf89e/2e86ebf89e9a5c8115512c7c1643977f.jpg', '11.jpg', '1', '1441188591', 'yaolei', '1441188591', 'yaolei');
INSERT INTO `users_draft_attach` VALUES ('2', '0', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '12.jpg', '1', '1441188591', 'yaolei', '1441188591', 'yaolei');
INSERT INTO `users_draft_attach` VALUES ('13', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '5', '1441507598', 'rr', '1441507598', 'rr');
INSERT INTO `users_draft_attach` VALUES ('14', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '6', '1441507663', 'rr', '1441507663', 'rr');
INSERT INTO `users_draft_attach` VALUES ('15', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '7', '1441507774', 'rr', '1441507774', 'rr');
INSERT INTO `users_draft_attach` VALUES ('17', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '10', '1441508119', 'rr', '1441508119', 'rr');
INSERT INTO `users_draft_attach` VALUES ('18', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '11', '1441508122', 'rr', '1441508122', 'rr');
INSERT INTO `users_draft_attach` VALUES ('19', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '12', '1441508131', 'rr', '1441508131', 'rr');
INSERT INTO `users_draft_attach` VALUES ('20', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '13', '1441508167', 'rr', '1441508167', 'rr');
INSERT INTO `users_draft_attach` VALUES ('53', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '9', '1441508242', 'rr', '1441508242', 'rr');
INSERT INTO `users_draft_attach` VALUES ('54', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '14', '1441508261', 'rr', '1441508261', 'rr');
INSERT INTO `users_draft_attach` VALUES ('55', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '15', '1441508269', 'rr', '1441508269', 'rr');
INSERT INTO `users_draft_attach` VALUES ('65', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '16', '1441508884', 'rr', '1441508884', 'rr');
INSERT INTO `users_draft_attach` VALUES ('89', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '31', '1442546626', 'lr', '1442546626', 'lr');
INSERT INTO `users_draft_attach` VALUES ('91', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '33', '1442546980', 'rong', '1442546980', 'rong');
INSERT INTO `users_draft_attach` VALUES ('92', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '34', '1442546983', 'rong', '1442546983', 'rong');
INSERT INTO `users_draft_attach` VALUES ('362', '0', 'dddfe4286d/dddfe4286de6b0d42e6c3faa79481734.mp4', '如果你 - 谭维维.mp4', '49', '1444442625', 'test_01', '1444442625', 'test_01');
INSERT INTO `users_draft_attach` VALUES ('363', '0', '16d07392bc/16d07392bcf99814f46d2de1c62b2d9f.mp4', '远方的孩子 - 韩红.mp4', '49', '1444442625', 'test_01', '1444442625', 'test_01');
INSERT INTO `users_draft_attach` VALUES ('960', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (2).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('961', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (3).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('962', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (3).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('963', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('964', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('965', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (2) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('966', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (2) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('967', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (4).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('968', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (4).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('969', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (2).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('970', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (2).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('971', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (3) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('972', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (3) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('973', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (5).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('974', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (5).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('975', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (3).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('976', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (3).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('977', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (4) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('978', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (4) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('979', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (6).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('980', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (6).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('981', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (4).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('982', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (4).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('983', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (5) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('984', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (5) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('985', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (7).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('986', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (7).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('987', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (5).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('988', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (5).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('989', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (6) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('990', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (8).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('991', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (8).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('992', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (6).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('993', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (6).png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('994', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (7) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('995', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (7) - 副本.png', '71', '1446523663', 'test_05', '1446523663', 'test_05');
INSERT INTO `users_draft_attach` VALUES ('1001', '0', 'e4082cd6ee/e4082cd6eedab3f01452064efb090564.mp4', '输不起.mp4', '73', '1446533119', 'p01', '1446533119', 'p01');
INSERT INTO `users_draft_attach` VALUES ('1002', '0', 'e9ce81c177/e9ce81c1773d5795960d65165ed60fcf.mp4', 'Last Dance.mp4', '73', '1446533119', 'p01', '1446533119', 'p01');
INSERT INTO `users_draft_attach` VALUES ('1038', '0', '68830e360c/68830e360c78a888de22618996827b33.jpg', '2.jpg', '110', '1448372123', 'test_01', '1448372123', 'test_01');
INSERT INTO `users_draft_attach` VALUES ('1039', '0', '11504dd206/11504dd206fa631ee76d4cec394b29b8.jpg', 'u=3204560093,2571702593&fm=21&gp=0.jpg', '112', '1448479687', 'admin', '1448479687', 'admin');

-- ----------------------------
-- Table structure for users_fav
-- ----------------------------
DROP TABLE IF EXISTS `users_fav`;
CREATE TABLE `users_fav` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `works_library_id` bigint(20) DEFAULT NULL COMMENT '作品',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='会员的收藏列表-收藏作品';

-- ----------------------------
-- Records of users_fav
-- ----------------------------
INSERT INTO `users_fav` VALUES ('1', '20', '19', '1440754941', null, '1440754941', null);
INSERT INTO `users_fav` VALUES ('2', '20', '43', '1440754944', null, '1440754944', null);
INSERT INTO `users_fav` VALUES ('3', '20', '46', '1440754947', null, '1440754947', null);
INSERT INTO `users_fav` VALUES ('4', '14', '4', '1441531025', null, '1441531025', null);
INSERT INTO `users_fav` VALUES ('5', '25', '12', '1442375309', null, '1442375309', null);
INSERT INTO `users_fav` VALUES ('6', '20', '48', '1442392477', null, '1442392477', null);
INSERT INTO `users_fav` VALUES ('7', '25', '81', '1443081101', null, '1443081101', null);
INSERT INTO `users_fav` VALUES ('8', '25', '97', '1443081127', null, '1443081127', null);
INSERT INTO `users_fav` VALUES ('9', '17', '97', '1443149571', null, '1443149571', null);
INSERT INTO `users_fav` VALUES ('10', '25', '96', '1443425819', null, '1443425819', null);
INSERT INTO `users_fav` VALUES ('11', '25', '13', '1443428997', null, '1443428997', null);
INSERT INTO `users_fav` VALUES ('12', '25', '53', '1443433501', null, '1443433501', null);
INSERT INTO `users_fav` VALUES ('13', '25', '95', '1443433530', null, '1443433530', null);
INSERT INTO `users_fav` VALUES ('14', '25', '86', '1443600638', null, '1443600638', null);
INSERT INTO `users_fav` VALUES ('15', '30', '103', '1444380115', null, '1444380115', null);
INSERT INTO `users_fav` VALUES ('16', '33', '108', '1444380217', null, '1444380217', null);
INSERT INTO `users_fav` VALUES ('17', '30', '86', '1444380283', null, '1444380283', null);
INSERT INTO `users_fav` VALUES ('18', '30', '98', '1444380307', null, '1444380307', null);
INSERT INTO `users_fav` VALUES ('19', '33', '53', '1444380913', null, '1444380913', null);
INSERT INTO `users_fav` VALUES ('20', '33', '104', '1444381080', null, '1444381080', null);
INSERT INTO `users_fav` VALUES ('21', '30', '104', '1444381137', null, '1444381137', null);
INSERT INTO `users_fav` VALUES ('22', '30', '100', '1444381152', null, '1444381152', null);
INSERT INTO `users_fav` VALUES ('23', '33', '43', '1444728274', null, '1444728274', null);
INSERT INTO `users_fav` VALUES ('24', '34', '112', '1444748945', null, '1444748945', null);
INSERT INTO `users_fav` VALUES ('25', '35', '113', '1444749920', null, '1444749920', null);
INSERT INTO `users_fav` VALUES ('26', '35', '112', '1444749925', null, '1444749925', null);
INSERT INTO `users_fav` VALUES ('27', '30', '118', '1445225022', null, '1445225022', null);
INSERT INTO `users_fav` VALUES ('28', '30', '121', '1445326337', null, '1445326337', null);
INSERT INTO `users_fav` VALUES ('29', '34', '66', '1445667651', null, '1445667651', null);
INSERT INTO `users_fav` VALUES ('30', '30', '143', '1446175446', null, '1446175446', null);
INSERT INTO `users_fav` VALUES ('31', '41', '143', '1446176739', null, '1446176739', null);
INSERT INTO `users_fav` VALUES ('32', '40', '130', '1446367426', null, '1446367426', null);
INSERT INTO `users_fav` VALUES ('33', '44', '144', '1446533572', null, '1446533572', null);
INSERT INTO `users_fav` VALUES ('34', '30', '182', '1447920692', null, '1447920692', null);
INSERT INTO `users_fav` VALUES ('35', '33', '187', '1447926762', null, '1447926762', null);
INSERT INTO `users_fav` VALUES ('36', '33', '184', '1447926968', null, '1447926968', null);
INSERT INTO `users_fav` VALUES ('37', '33', '180', '1447927014', null, '1447927014', null);

-- ----------------------------
-- Table structure for users_gift
-- ----------------------------
DROP TABLE IF EXISTS `users_gift`;
CREATE TABLE `users_gift` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `desc` varchar(100) DEFAULT NULL COMMENT '说明',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '赠送时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='用户赠品表';

-- ----------------------------
-- Records of users_gift
-- ----------------------------
INSERT INTO `users_gift` VALUES ('1', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '15', '17', '74', '1442570020');
INSERT INTO `users_gift` VALUES ('2', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '15', '17', '75', '1442570466');
INSERT INTO `users_gift` VALUES ('3', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '20', '17', '77', '1442902676');
INSERT INTO `users_gift` VALUES ('4', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '25', '17', '95', '1443082379');
INSERT INTO `users_gift` VALUES ('5', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '25', '17', '96', '1443083071');
INSERT INTO `users_gift` VALUES ('6', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '25', '17', '97', '1443423883');
INSERT INTO `users_gift` VALUES ('7', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '25', '17', '101', '1443430522');
INSERT INTO `users_gift` VALUES ('8', '[特价] 终身VIP', '34', '20', '117', '1444490207');
INSERT INTO `users_gift` VALUES ('9', '[特价] 终身VIP', '34', '20', '118', '1444490747');
INSERT INTO `users_gift` VALUES ('10', '[赠品] 包年全站VIP', '35', '27', '129', '1444752000');
INSERT INTO `users_gift` VALUES ('11', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '40', '17', '158', '1446447463');
INSERT INTO `users_gift` VALUES ('12', '[赠品] 视频会员1天1102fas', '40', '40', '161', '1446448011');
INSERT INTO `users_gift` VALUES ('13', '[赠品] 测试1015', '47', '33', '166', '1446453483');
INSERT INTO `users_gift` VALUES ('14', '[赠品] 视频会员1天1102fas', '47', '40', '169', '1446456500');
INSERT INTO `users_gift` VALUES ('15', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '47', '17', '169', '1446456500');
INSERT INTO `users_gift` VALUES ('16', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '30', '17', '196', '1446628221');
INSERT INTO `users_gift` VALUES ('17', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '3', '17', '223', '1447086250');
INSERT INTO `users_gift` VALUES ('18', '[赠品] zyTest', '41', '30', '236', '1447142051');
INSERT INTO `users_gift` VALUES ('19', '[赠品] zyTest', '3', '30', '239', '1447149225');
INSERT INTO `users_gift` VALUES ('20', '[特价] 曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '40', '32', '244', '1447583002');
INSERT INTO `users_gift` VALUES ('21', '[赠品] 资源包年会员Cc123!@#包', '40', '38', '245', '1447643570');
INSERT INTO `users_gift` VALUES ('22', '[赠品] 主播包年&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '41', '26', '248', '1447829161');
INSERT INTO `users_gift` VALUES ('23', '[特价] 曲终人散&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '43', '32', '250', '1447836254');
INSERT INTO `users_gift` VALUES ('24', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '43', '17', '251', '1447836612');
INSERT INTO `users_gift` VALUES ('25', '[赠品] 小飞侠', '35', '50', '256', '1448009994');
INSERT INTO `users_gift` VALUES ('26', '[赠品] 小飞侠', '35', '50', '257', '1448010116');
INSERT INTO `users_gift` VALUES ('27', '[赠品] 小飞侠', '31', '50', '258', '1448011938');
INSERT INTO `users_gift` VALUES ('28', '[赠品] 主播包月&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '35', '17', '260', '1448270875');
INSERT INTO `users_gift` VALUES ('29', '[赠品] 图片包月', '35', '16', '261', '1448272496');
INSERT INTO `users_gift` VALUES ('30', '[赠品] 满送优惠（2折）&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '35', '43', '262', '1448333895');
INSERT INTO `users_gift` VALUES ('31', '[赠品] 图片包月', '35', '16', '262', '1448333895');
INSERT INTO `users_gift` VALUES ('32', '[赠品] 满送优惠（2折）&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '30', '43', '263', '1448373137');
INSERT INTO `users_gift` VALUES ('33', '[赠品] 产品名称new', '42', '29', '264', '1448439472');
INSERT INTO `users_gift` VALUES ('34', '[特价] 产品名称new', '34', '29', '269', '1448511822');
INSERT INTO `users_gift` VALUES ('35', '[赠品] 产品名称new', '34', '29', '269', '1448511822');
INSERT INTO `users_gift` VALUES ('36', '[特价] 产品名称new', '34', '29', '270', '1448511873');
INSERT INTO `users_gift` VALUES ('37', '[赠品] 产品名称new', '3', '29', '272', '1448513490');
INSERT INTO `users_gift` VALUES ('38', '[赠品] 图片包月', '34', '16', '273', '1448526053');
INSERT INTO `users_gift` VALUES ('39', '[特价] 产品名称new', '34', '29', '275', '1448605932');
INSERT INTO `users_gift` VALUES ('40', '[特价] 主播三天', '34', '44', '275', '1448605932');
INSERT INTO `users_gift` VALUES ('41', '[特价] 主播三天', '34', '44', '277', '1448606082');
INSERT INTO `users_gift` VALUES ('42', '[特价] 主播三天', '35', '44', '278', '1448606394');
INSERT INTO `users_gift` VALUES ('43', '[特价] 主播三天', '34', '44', '280', '1448613525');
INSERT INTO `users_gift` VALUES ('44', '[赠品] 论坛权限产品', '41', '52', '281', '1448718843');
INSERT INTO `users_gift` VALUES ('45', '[赠品] 主播包年&nbsp;&nbsp;&nbsp;&nbsp;选择主播', '41', '26', '286', '1448770643');
INSERT INTO `users_gift` VALUES ('46', '[赠品] 论坛权限产品', '41', '52', '292', '1448870032');
INSERT INTO `users_gift` VALUES ('47', '[赠品] 论坛权限产品', '41', '52', '296', '1449137894');
INSERT INTO `users_gift` VALUES ('48', '[赠品] 论坛权限产品', '41', '52', '297', '1449138101');

-- ----------------------------
-- Table structure for users_gold_record
-- ----------------------------
DROP TABLE IF EXISTS `users_gold_record`;
CREATE TABLE `users_gold_record` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `gold` decimal(16,2) DEFAULT '0.00' COMMENT '金币数量',
  `user_gold` decimal(16,2) DEFAULT '0.00' COMMENT '会员金币余额',
  `log_content` varchar(200) DEFAULT NULL COMMENT '说明',
  `type` int(3) DEFAULT '0' COMMENT '类型 0:获取 1:兑换杏币 2：支出',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_gold_record
-- ----------------------------
INSERT INTO `users_gold_record` VALUES ('10', '30', '1000.00', '99000.00', '兑换:100杏币,消耗:1000金币,兑换比例为1：10', '1', null);
INSERT INTO `users_gold_record` VALUES ('11', '30', '1000.00', '98000.00', '兑换:100杏币,消耗:1000金币,兑换比例为1：10', '1', null);
INSERT INTO `users_gold_record` VALUES ('12', '30', '1000.00', '97000.00', '兑换:100杏币,消耗:1000金币,兑换比例为1：10', '1', null);
INSERT INTO `users_gold_record` VALUES ('13', '30', '20.00', '96980.00', '兑换:2杏币,消耗:20金币,兑换比例为1：10', '1', null);

-- ----------------------------
-- Table structure for users_info_amount
-- ----------------------------
DROP TABLE IF EXISTS `users_info_amount`;
CREATE TABLE `users_info_amount` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` bigint(20) DEFAULT NULL COMMENT '会员',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '可用杏币',
  `lock_amount` decimal(16,2) DEFAULT '0.00' COMMENT '锁定杏币',
  `amount_coin` int(11) DEFAULT '0' COMMENT '可用金币',
  `lock_amount_coin` int(11) DEFAULT '0' COMMENT '锁定金币',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `total_income` decimal(16,2) DEFAULT '0.00' COMMENT '总收益',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='用户资金账户表';

-- ----------------------------
-- Records of users_info_amount
-- ----------------------------
INSERT INTO `users_info_amount` VALUES ('2', '14', '999004.00', '0.00', '10000', '0', '0', null, null, '1438931743', 'admin', '248.00');
INSERT INTO `users_info_amount` VALUES ('3', '13', '99860.00', '0.00', '10000', '0', '0', null, null, '1438931743', 'admin', '60.00');
INSERT INTO `users_info_amount` VALUES ('4', '3', '99581.62', '0.00', '10000', '0', '0', null, null, '1447921469', 'admin', '47.00');
INSERT INTO `users_info_amount` VALUES ('5', '15', '178.68', '0.00', '500', '0', '0', null, null, '1438931743', 'admin', '3.00');
INSERT INTO `users_info_amount` VALUES ('6', '16', '0.00', '0.00', '0', '0', '0', '1440730363', 'Guest', '1440730363', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('7', '17', '0.00', '0.00', '0', '0', '0', '1440730396', 'Guest', '1440730396', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('8', '18', '9.00', '0.00', '0', '0', '0', '1440730404', 'Guest', '1440730404', 'Guest', '6.00');
INSERT INTO `users_info_amount` VALUES ('9', '19', '0.00', '0.00', '0', '0', '0', '1440730685', 'Guest', '1440730685', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('10', '20', '98358.00', '0.00', '0', '0', '0', '1440732845', 'Guest', '1440950446', 'admin', '96.00');
INSERT INTO `users_info_amount` VALUES ('11', '21', '0.00', '0.00', '0', '0', '0', '1440952043', 'Guest', '1440952043', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('12', '22', '263.18', '0.00', '0', '0', '0', '1441506186', 'Guest', '1441506186', 'Guest', '266.40');
INSERT INTO `users_info_amount` VALUES ('13', '23', '0.00', '0.00', '0', '0', '0', '1441699794', 'Guest', '1441699794', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('14', '24', '0.00', '0.00', '0', '0', '0', '1441703176', 'Guest', '1441703176', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('15', '1', '372.00', '0.00', '0', '0', '0', null, null, '1447123548', 'admin', '65.00');
INSERT INTO `users_info_amount` VALUES ('16', '2', '5.00', '0.00', '0', '0', '0', null, null, null, null, '5.00');
INSERT INTO `users_info_amount` VALUES ('17', '4', '10.00', '0.00', '0', '0', '0', null, null, null, null, '10.00');
INSERT INTO `users_info_amount` VALUES ('18', '5', '32.00', '0.00', '0', '0', '0', null, null, null, null, '28.00');
INSERT INTO `users_info_amount` VALUES ('19', '6', '10.00', '0.00', '0', '0', '0', null, null, null, null, '10.00');
INSERT INTO `users_info_amount` VALUES ('20', '7', '87.20', '0.00', '0', '0', '0', null, null, null, null, '87.20');
INSERT INTO `users_info_amount` VALUES ('21', '8', '9.00', '0.00', '0', '0', '0', null, null, null, null, '6.00');
INSERT INTO `users_info_amount` VALUES ('22', '9', '4.00', '0.00', '0', '0', '0', null, null, null, null, '4.00');
INSERT INTO `users_info_amount` VALUES ('23', '10', '10.00', '0.00', '0', '0', '0', null, null, null, null, '10.00');
INSERT INTO `users_info_amount` VALUES ('24', '11', '20.00', '0.00', '0', '0', '0', null, null, null, null, '20.00');
INSERT INTO `users_info_amount` VALUES ('25', '12', '11.00', '0.00', '0', '0', '0', null, null, null, null, '6.00');
INSERT INTO `users_info_amount` VALUES ('30', '25', '999569.82', '0.00', '100000', '0', '0', '1442373629', 'Guest', '1444382861', 'admin', '1.20');
INSERT INTO `users_info_amount` VALUES ('31', '26', '0.00', '0.00', '0', '0', '0', '1442460487', 'Guest', '1442460487', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('32', '27', '0.00', '0.00', '0', '0', '0', '1442547667', 'Guest', '1442547667', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('33', '28', '5.00', '0.00', '0', '0', '0', '1443426709', 'Guest', '1443426709', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('34', '29', '5.00', '0.00', '0', '0', '0', '1444027120', 'Guest', '1444027120', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('35', '30', '29999742.70', '0.00', '96980', '0', '0', '1444277339', 'Guest', '1446874438', 'admin', '190.44');
INSERT INTO `users_info_amount` VALUES ('36', '31', '19999384.42', '0.00', '5', '0', '0', '1444277380', 'Guest', '1444277725', 'admin', '51.33');
INSERT INTO `users_info_amount` VALUES ('37', '32', '10000046.89', '0.00', '100', '0', '0', '1444277402', 'Guest', '1444277729', 'admin', '76.28');
INSERT INTO `users_info_amount` VALUES ('38', '33', '40009901.13', '0.00', '10000', '0', '0', '1444380086', 'Guest', '1446284325', 'test_99', '10019.50');
INSERT INTO `users_info_amount` VALUES ('39', '34', '49998728.90', '0.00', '10000', '0', '0', '1444382375', 'Guest', '1446278920', 'test_99', '37.00');
INSERT INTO `users_info_amount` VALUES ('40', '35', '999687.50', '0.00', '10000', '0', '0', '1444382759', 'Guest', '1444382869', 'admin', '49.00');
INSERT INTO `users_info_amount` VALUES ('41', '36', '21.00', '0.00', '0', '0', '0', '1444613354', 'Guest', '1444613354', 'Guest', '16.00');
INSERT INTO `users_info_amount` VALUES ('42', '37', '92.00', '0.00', '0', '0', '0', '1445235572', 'Guest', '1445235572', 'Guest', '87.00');
INSERT INTO `users_info_amount` VALUES ('43', '38', '5.00', '0.00', '0', '0', '0', '1445239022', 'Guest', '1445239022', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('44', '39', '18.00', '0.00', '0', '0', '0', '1445239269', 'Guest', '1445239269', 'Guest', '13.00');
INSERT INTO `users_info_amount` VALUES ('45', '40', '387.68', '0.00', '0', '0', '0', '1445753339', 'Guest', '1447922707', 'admin', '48.90');
INSERT INTO `users_info_amount` VALUES ('46', '41', '116112.16', '0.00', '0', '0', '0', '1446025830', 'Guest', '1447817587', 'admin01', '110033.26');
INSERT INTO `users_info_amount` VALUES ('47', '42', '99844.00', '0.00', '0', '0', '0', '1446026050', 'Guest', '1446026050', 'Guest', '100000.00');
INSERT INTO `users_info_amount` VALUES ('48', '43', '1043.00', '0.00', '0', '0', '0', '1446026730', 'Guest', '1446026730', 'Guest', '1100.00');
INSERT INTO `users_info_amount` VALUES ('49', '44', '30080.33', '0.00', '0', '0', '0', '1446370322', 'Guest', '1446370322', 'Guest', '30085.33');
INSERT INTO `users_info_amount` VALUES ('50', '45', '8.00', '0.00', '0', '0', '0', '1446371067', 'Guest', '1446371067', 'Guest', '3.00');
INSERT INTO `users_info_amount` VALUES ('51', '46', '1399999993.00', '0.00', '0', '0', '0', '1446371313', 'Guest', '1446371313', 'Guest', '1400000000.00');
INSERT INTO `users_info_amount` VALUES ('52', '47', '54.40', '0.00', '0', '0', '0', '1446451534', 'Guest', '1446456493', 'test_99', '0.00');
INSERT INTO `users_info_amount` VALUES ('53', '48', '547.00', '0.00', '0', '0', '0', '1446457932', 'Guest', '1446458448', 'admin', '0.00');
INSERT INTO `users_info_amount` VALUES ('54', '49', '5.00', '0.00', '0', '0', '0', '1446791195', 'Guest', '1446791195', 'Guest', '0.00');
INSERT INTO `users_info_amount` VALUES ('55', '50', '8.00', '0.00', '0', '0', '0', '1446797672', 'Guest', '1446797672', 'Guest', '3.00');

-- ----------------------------
-- Table structure for users_info_anchor
-- ----------------------------
DROP TABLE IF EXISTS `users_info_anchor`;
CREATE TABLE `users_info_anchor` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` bigint(20) DEFAULT NULL COMMENT '会员',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `star` varchar(50) DEFAULT NULL COMMENT '星座',
  `weight` float(6,2) DEFAULT NULL COMMENT '体重',
  `bust` float(6,2) DEFAULT NULL COMMENT '胸围',
  `waist` float(6,2) DEFAULT NULL COMMENT '腰围',
  `hip` float(6,2) DEFAULT NULL COMMENT '臀围',
  `height` float(6,2) DEFAULT NULL COMMENT '身高',
  `icon` varchar(400) DEFAULT NULL COMMENT '头像',
  `personality` varchar(500) DEFAULT NULL COMMENT '个性宣言',
  `audition_name` varchar(100) DEFAULT NULL COMMENT '试听节目',
  `audition_file` varchar(400) DEFAULT NULL COMMENT '试听节目地址',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='主播资料表';

-- ----------------------------
-- Records of users_info_anchor
-- ----------------------------
INSERT INTO `users_info_anchor` VALUES ('1', '1', null, '22', '白羊d', '90.00', '30.00', '32.00', '33.00', '168.00', '', '就是美丽', null, null, '1444895343', '1444970129');
INSERT INTO `users_info_anchor` VALUES ('3', '31', null, '25', '双鱼座', '48.00', '24.00', '25.00', '26.00', '160.00', '', '读书，这个我们习以为常的平凡过程，实际上是人们心灵和上下古今一切民族的伟大智慧相结合的过程。', null, null, '1444895604', '1444895604');
INSERT INTO `users_info_anchor` VALUES ('4', '32', null, '26', '处女座', '49.00', '23.00', '24.00', '26.00', '168.00', '', '站起来便能成就更好的自已，硬是在地上赖着，自怨自怜，悲叹不已的人注定只能继续哭泣。', null, null, '1444895744', '1444895744');
INSERT INTO `users_info_anchor` VALUES ('5', '33', null, '20', '天蝎座', '45.00', '25.00', '25.00', '25.00', '160.00', '', '学然后知不足，教然后知困。知不足，然后能自反也；知困，然后能自强也', null, null, '1444895921', '1444895921');
INSERT INTO `users_info_anchor` VALUES ('6', '34', null, '18', '狮子座', '45.00', '24.00', '25.00', '25.00', '158.00', '', '把时间用在思考上是最能节省时间的事情', null, null, '1444895972', '1444895972');
INSERT INTO `users_info_anchor` VALUES ('7', '35', null, '19', '双鱼座', '46.00', '25.00', '26.00', '25.00', '160.00', '', '珍珠挂在颈上，友谊嵌在心上', null, null, '1444896044', '1444896044');
INSERT INTO `users_info_anchor` VALUES ('8', '36', null, '88', '88', '88.00', '88.00', '88.00', '88.00', '188.00', '', '88', null, null, '1444970168', '1444970168');
INSERT INTO `users_info_anchor` VALUES ('12', '30', null, '22', '222', '122.00', '22.00', '22.00', '22.00', '122.00', '', '22222', null, null, '1445307831', '1445307831');
INSERT INTO `users_info_anchor` VALUES ('13', '29', null, '22', '122', '122.00', '22.00', '22.00', '22.00', '122.00', '', '22222', null, null, '1445307895', '1445307895');
INSERT INTO `users_info_anchor` VALUES ('14', '20', null, '23', 'capricorn', '65.00', '123.00', '123.00', '123.00', '165.00', '', 'sdsdsdqwqw', null, null, '1446035993', '1446035993');
INSERT INTO `users_info_anchor` VALUES ('15', '21', null, '25', 'dsssf', '60.00', '111.00', '111.00', '111.00', '170.00', '', 'cgfjghj', null, null, '1446036153', '1446036153');
INSERT INTO `users_info_anchor` VALUES ('16', '22', null, '21', 'dfdf', '56.00', '99.00', '99.00', '99.00', '156.00', '', 'dfdfd', null, null, '1446036428', '1446036428');
INSERT INTO `users_info_anchor` VALUES ('20', '49', null, '25', 'jgjg', '60.00', '55.00', '55.00', '55.00', '165.00', '', 'kgjtgt', null, null, '1449134474', '1449134474');

-- ----------------------------
-- Table structure for users_info_bank
-- ----------------------------
DROP TABLE IF EXISTS `users_info_bank`;
CREATE TABLE `users_info_bank` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `bankname` varchar(100) DEFAULT NULL COMMENT '银行',
  `name` varchar(100) DEFAULT NULL COMMENT '户名',
  `account_number` varchar(400) DEFAULT NULL COMMENT '账号',
  `account_address` varchar(100) DEFAULT '' COMMENT '开户行',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员银行表';

-- ----------------------------
-- Records of users_info_bank
-- ----------------------------
INSERT INTO `users_info_bank` VALUES ('1', '招商银行', '招生银行', '11232131232131321321', 'AAAA', '3', '1448955953');
INSERT INTO `users_info_bank` VALUES ('2', '农业银行', '农业银行', '11232131232131321321', 'aaaa', '3', '1448955975');
INSERT INTO `users_info_bank` VALUES ('3', '中国银行', 'chinabank', '12345678922222221', 'chanhiasd', '3', '1448956201');
INSERT INTO `users_info_bank` VALUES ('4', '招商银行', '姚磊', '622222596845621', '上海招商银行', '30', '1448956315');
INSERT INTO `users_info_bank` VALUES ('5', '工商银行', '萝卜', '622226975612345', '工商银行', '30', '1448956831');
INSERT INTO `users_info_bank` VALUES ('6', '工商银行', '小鱼', '6888845612320569', '工商银行', '31', '1448956922');
INSERT INTO `users_info_bank` VALUES ('7', '招商银行', '大鱼', '699994561234562', '招商银行上海第三分行闵行区莘庄分行', '31', '1448957002');
INSERT INTO `users_info_bank` VALUES ('8', '中国银行', '小小鱼儿', '599683214568974', '中国银行', '30', '1448957590');
INSERT INTO `users_info_bank` VALUES ('9', '工商银行', '工商银行', '2335464565656569', 'BBB', '3', '1449025864');
INSERT INTO `users_info_bank` VALUES ('10', '农业银行', 'gdhdhd', '111111111111111111111111', 'dhdhddhdhdhd', '41', '1449134668');
INSERT INTO `users_info_bank` VALUES ('11', '招商银行', 'hkjkkk', '222222222222222222', 'kbhnj', '41', '1449134711');

-- ----------------------------
-- Table structure for users_info_sign
-- ----------------------------
DROP TABLE IF EXISTS `users_info_sign`;
CREATE TABLE `users_info_sign` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `level` int(8) DEFAULT '1' COMMENT '等级',
  `leveltime` bigint(20) DEFAULT NULL COMMENT '升级时间',
  `honor` varchar(100) DEFAULT NULL COMMENT '头衔',
  `contribution` float(10,1) DEFAULT '0.0' COMMENT '贡献值',
  `quicken` float(10,2) DEFAULT '1.00' COMMENT '加速倍数',
  `sign_time` int(11) DEFAULT '0' COMMENT '签到时间',
  `last_sign_time` bigint(20) DEFAULT NULL COMMENT '上次签到',
  `current_sign_time` bigint(20) DEFAULT NULL COMMENT '本次签到',
  `calc_sign` int(11) DEFAULT NULL COMMENT '计算签到次数#超过30天从1累加',
  `continue_sign` int(11) DEFAULT '0' COMMENT '连续签到',
  `total_sign` int(11) DEFAULT '0' COMMENT '累计签到',
  `ranking` int(11) DEFAULT '0' COMMENT '排名',
  `ranking_percent` int(11) DEFAULT '0' COMMENT '排名百分比',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `level_name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `level_number` varchar(100) DEFAULT NULL COMMENT '等级数',
  `exp` bigint(20) DEFAULT '0' COMMENT '经验',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='会员签名统计、等级等信息\n和会员1对1关系';

-- ----------------------------
-- Records of users_info_sign
-- ----------------------------
INSERT INTO `users_info_sign` VALUES ('1', '3', '1', null, '签到头衔1', '30.0', '1.00', '1447050721', '1441591696', null, '1', '1', '3', '0', '0', '1440727087', 'admin', '1447050721', 'admin', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('2', '15', '1', null, '签到头衔1', '10.0', '1.00', '1442546598', '1442546598', null, '0', '1', '1', '0', '0', '1440730013', 'lr', '1442546598', 'lr', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('3', '16', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1440730363', 'Guest', '1440730363', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('4', '17', '1', null, '签到头衔1', '20.0', '1.00', '1442557292', '1442459073', null, '0', '2', '2', '0', '0', '1440730396', 'Guest', '1442557292', 'liu', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('5', '18', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1440730404', 'Guest', '1440730404', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('6', '19', '1', null, '签到头衔1', '10.0', '1.00', '1440731922', '1440731922', null, '1', '1', '1', '0', '0', '1440730685', 'Guest', '1440731922', 'xiaohuihui', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('7', '20', '3', '1441936378', '签到头衔3', '150.0', '1.00', '1443061654', '1442564542', null, '1', '1', '15', '0', '0', '1440732845', 'Guest', '1443061654', 'rr', '从九品', 'Lv.2', '0');
INSERT INTO `users_info_sign` VALUES ('8', '21', '1', null, '签到头衔1', '30.0', '1.00', '1444093784', '1444006173', null, '1', '2', '3', '0', '0', '1440952043', 'Guest', '1444093784', 'franktester', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('9', '14', '1', null, '签到头衔1', '40.0', '1.00', '1443409443', '1442559253', null, '1', '1', '4', '0', '0', '1441092557', '地平线上的泪水', '1443409443', '地平线上的泪水', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('10', '13', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1441188562', 'yaolei', '1441188562', 'yaolei', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('11', '22', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1441506186', 'Guest', '1441506186', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('12', '23', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1441699794', 'Guest', '1441699794', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('13', '24', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, '0', '0', '0', '0', '0', '1441703176', 'Guest', '1441703176', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('14', '25', '2', '1443594834', '签到头衔2', '60.0', '1.00', '1443594834', '1443494545', null, null, '3', '6', '0', '0', '1442373629', 'Guest', '1443594834', 'rong', '未入流', 'Lv.1', '0');
INSERT INTO `users_info_sign` VALUES ('15', '26', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1442460487', 'Guest', '1442460487', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('16', '27', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1442547667', 'Guest', '1442547667', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('17', '28', '1', null, '签到头衔1', '10.0', '1.00', '1443426717', '1443426717', null, null, '1', '1', '0', '0', '1443426709', 'Guest', '1443426717', 'll', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('18', '29', '1', null, '签到头衔1', '10.0', '1.00', '1444027150', '1444027150', null, null, '1', '1', '0', '0', '1444027121', 'Guest', '1444027150', '小新测试', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('19', '30', '3', '1446453280', '签到头衔3', '100.0', '1.00', '1446453280', '1445998514', null, null, '1', '10', '0', '0', '1444277339', 'Guest', '1446453280', 'test_01', '从九品', 'Lv.2', '0');
INSERT INTO `users_info_sign` VALUES ('20', '31', '1', null, '签到头衔1', '30.0', '1.00', '1445843074', '1445757938', null, null, '2', '3', '0', '0', '1444277380', 'Guest', '1445843074', 'test_02', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('21', '32', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1444277402', 'Guest', '1444277402', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('22', '33', '1', null, '签到头衔1', '30.0', '1.00', '1445307270', '1444804329', null, null, '1', '3', '0', '0', '1444380086', 'Guest', '1445307270', 'test_04', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('23', '34', '1', null, '签到头衔1', '40.0', '1.00', '1445738711', '1445667049', null, null, '2', '4', '0', '0', '1444382375', 'Guest', '1445738711', 'test_05', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('24', '35', '1', null, '签到头衔1', '20.0', '1.00', '1444749060', '1444382929', null, null, '1', '2', '0', '0', '1444382759', 'Guest', '1444749060', 'test_06', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('25', '36', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1444613354', 'Guest', '1444613354', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('26', '10', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1444983831', 'Guest', '1444983831', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('27', '37', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445235572', 'Guest', '1445235572', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('28', '38', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445239022', 'Guest', '1445239022', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('29', '39', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445239269', 'Guest', '1445239269', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('30', '8', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445307280', 'test_04', '1445307280', 'test_04', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('31', '4', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445740432', 'test_05', '1445740432', 'test_05', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('32', '40', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1445753339', 'Guest', '1445753339', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('33', '41', '1', null, '签到头衔1', '20.0', '1.00', '1446521959', '1446102392', null, null, '1', '2', '0', '0', '1446025830', 'Guest', '1446521959', 'faa123', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('34', '42', '1', null, '签到头衔1', '10.0', '1.00', '1448437714', '1448437714', null, null, '1', '1', '0', '0', '1446026050', 'Guest', '1448437714', 'faa12', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('35', '43', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446026730', 'Guest', '1446026730', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('36', '44', '1', null, '签到头衔1', '10.0', '1.00', '1446455470', '1446455470', null, null, '1', '1', '0', '0', '1446370322', 'Guest', '1446455470', 'p01', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('37', '45', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446371067', 'Guest', '1446371067', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('38', '46', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446371313', 'Guest', '1446371313', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('39', '47', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446451534', 'Guest', '1446451534', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('40', '48', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446457932', 'Guest', '1446457932', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('41', '2', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529709', 'Guest', '1446529709', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('42', '7', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529710', 'Guest', '1446529710', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('43', '5', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529712', 'Guest', '1446529712', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('44', '6', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529712', 'Guest', '1446529712', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('45', '9', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529712', 'Guest', '1446529712', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('46', '12', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529713', 'Guest', '1446529713', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('47', '11', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446529718', 'Guest', '1446529718', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('48', '49', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446791195', 'Guest', '1446791195', 'Guest', '老百姓', 'Lv.0', '0');
INSERT INTO `users_info_sign` VALUES ('49', '50', '1', null, '签到头衔1', '0.0', '1.00', '0', null, null, null, '0', '0', '0', '0', '1446797673', 'Guest', '1446797673', 'Guest', '老百姓', 'Lv.0', '0');

-- ----------------------------
-- Table structure for users_profit
-- ----------------------------
DROP TABLE IF EXISTS `users_profit`;
CREATE TABLE `users_profit` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `works_library_id` bigint(20) DEFAULT NULL COMMENT '作品',
  `profit` decimal(16,2) DEFAULT '0.00' COMMENT '收益',
  `actiontime` bigint(20) DEFAULT NULL COMMENT '收益时间',
  `profit_type` int(2) DEFAULT '0' COMMENT '收益类型0 单次点播  1会员分成',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COMMENT='会员收益';

-- ----------------------------
-- Records of users_profit
-- ----------------------------
INSERT INTO `users_profit` VALUES ('1', '3', '46', '15.00', '1440151168', '0', '单次点播(46)', '1440151168', null, null, null);
INSERT INTO `users_profit` VALUES ('2', '3', '31', '15.00', '1440151179', '0', '单次点播(31)', '1440151179', null, null, null);
INSERT INTO `users_profit` VALUES ('3', '3', '45', '8.00', '1440151204', '0', '单次点播(45)', '1440151204', null, null, null);
INSERT INTO `users_profit` VALUES ('4', '15', '42', '6.00', '1440389592', '0', '单次点播(42)', '1440389592', null, null, null);
INSERT INTO `users_profit` VALUES ('5', '15', '42', '6.00', '1440389596', '0', '单次点播(42)', '1440389596', null, null, null);
INSERT INTO `users_profit` VALUES ('6', '15', '42', '6.00', '1440389604', '0', '单次点播(42)', '1440389604', null, null, null);
INSERT INTO `users_profit` VALUES ('7', '15', '42', '6.00', '1440389616', '0', '单次点播(42)', '1440389616', null, null, null);
INSERT INTO `users_profit` VALUES ('8', '15', '43', '2.00', '1440406024', '0', '单次点播(43)', '1440406024', null, null, null);
INSERT INTO `users_profit` VALUES ('9', '15', '44', '4.00', '1440406045', '0', '单次点播(44)', '1440406045', null, null, null);
INSERT INTO `users_profit` VALUES ('10', '20', '19', '4.00', '1440753590', '0', '单次点播(19)', '1440753590', null, null, null);
INSERT INTO `users_profit` VALUES ('11', '20', '47', '12.00', '1440753935', '0', '单次点播(47)', '1440753935', null, null, null);
INSERT INTO `users_profit` VALUES ('12', '20', '43', '2.00', '1440754823', '0', '单次点播(43)', '1440754823', null, null, null);
INSERT INTO `users_profit` VALUES ('13', '3', '19', '4.00', '1440992897', '0', '单次点播(19)', '1440992897', null, null, null);
INSERT INTO `users_profit` VALUES ('14', '13', '4', '60.00', '1441092419', '0', '单次点播(4)', '1441092419', null, null, null);
INSERT INTO `users_profit` VALUES ('15', '14', '4', '60.00', '1441092672', '0', '单次点播(4)', '1441092672', null, null, null);
INSERT INTO `users_profit` VALUES ('16', '14', '4', '60.00', '1441092685', '0', '单次点播(4)', '1441092685', null, null, null);
INSERT INTO `users_profit` VALUES ('17', '14', '56', '9.00', '1441094345', '0', '单次点播(56)', '1441094345', null, null, null);
INSERT INTO `users_profit` VALUES ('18', '14', '56', '9.00', '1441094376', '0', '单次点播(56)', '1441094376', null, null, null);
INSERT INTO `users_profit` VALUES ('19', '14', '57', '2.00', '1441095313', '0', '单次点播(57)', '1441095313', null, null, null);
INSERT INTO `users_profit` VALUES ('20', '14', '13', '2.00', '1441095987', '0', '单次点播(13)', '1441095987', null, null, null);
INSERT INTO `users_profit` VALUES ('21', '14', '54', '15.00', '1441096269', '0', '单次点播(54)', '1441096269', null, null, null);
INSERT INTO `users_profit` VALUES ('22', '20', '57', '2.00', '1441096342', '0', '单次点播(57)', '1441096342', null, null, null);
INSERT INTO `users_profit` VALUES ('23', '20', '56', '9.00', '1441096839', '0', '单次点播(56)', '1441096839', null, null, null);
INSERT INTO `users_profit` VALUES ('24', '20', '54', '15.00', '1441096850', '0', '单次点播(54)', '1441096850', null, null, null);
INSERT INTO `users_profit` VALUES ('25', '20', '56', '9.00', '1441097027', '0', '单次点播(56)', '1441097027', null, null, null);
INSERT INTO `users_profit` VALUES ('26', '20', '55', '6.00', '1441097573', '0', '单次点播(55)', '1441097573', null, null, null);
INSERT INTO `users_profit` VALUES ('27', '20', '57', '2.00', '1441098027', '0', '单次点播(57)', '1441098027', null, null, null);
INSERT INTO `users_profit` VALUES ('28', '1', '18', '90.00', '1441098532', '0', '单次点播(18)', '1441098532', null, null, null);
INSERT INTO `users_profit` VALUES ('29', '2', '5', '0.00', '1441098662', '0', '单次点播(5)', '1441098662', null, null, null);
INSERT INTO `users_profit` VALUES ('30', '1', '15', '16.50', '1441099042', '0', '单次点播(15)', '1441099042', null, null, null);
INSERT INTO `users_profit` VALUES ('31', '2', '29', '4.00', '1441100359', '0', '单次点播(29)', '1441100359', null, null, null);
INSERT INTO `users_profit` VALUES ('32', '5', '3', '20.00', '1441100372', '0', '单次点播(3)', '1441100372', null, null, null);
INSERT INTO `users_profit` VALUES ('33', '1', '14', '19.80', '1441188162', '0', '单次点播(14)', '1441188162', null, null, null);
INSERT INTO `users_profit` VALUES ('34', '1', '12', '40.00', '1441509005', '0', '单次点播(12)', '1441509005', null, null, null);
INSERT INTO `users_profit` VALUES ('35', '20', '55', '6.00', '1441509098', '0', '单次点播(55)', '1441509098', null, null, null);
INSERT INTO `users_profit` VALUES ('36', '22', '59', '133.20', '1441509587', '0', '单次点播(59)', '1441509587', null, null, null);
INSERT INTO `users_profit` VALUES ('37', '1', '25', '10.00', '1441512232', '0', '单次点播(25)', '1441512232', null, null, null);
INSERT INTO `users_profit` VALUES ('38', '1', '21', '4.00', '1441512472', '0', '单次点播(21)', '1441512472', null, null, null);
INSERT INTO `users_profit` VALUES ('39', '22', '59', '133.20', '1441521853', '0', '单次点播(59)', '1441521853', null, null, null);
INSERT INTO `users_profit` VALUES ('40', '11', '48', '20.00', '1441532036', '0', '单次点播(48)', '1441532036', null, null, null);
INSERT INTO `users_profit` VALUES ('41', '20', '62', '4.00', '1441533395', '0', '单次点播(62)', '1441533395', null, null, null);
INSERT INTO `users_profit` VALUES ('42', '1', '13', '2.00', '1441591993', '0', '单次点播(13)', '1441591993', null, null, null);
INSERT INTO `users_profit` VALUES ('43', '20', '61', '2.00', '1441605064', '0', '单次点播(61)', '1441605064', null, null, null);
INSERT INTO `users_profit` VALUES ('44', '14', '63', '9.00', '1441605560', '0', '单次点播(63)', '1441605560', null, null, null);
INSERT INTO `users_profit` VALUES ('45', '7', '1', '24.60', '1441960783', '0', '单次点播(1)', '1441960783', null, null, null);
INSERT INTO `users_profit` VALUES ('46', '11', '48', '20.00', '1441960845', '0', '单次点播(48)', '1441960845', null, null, null);
INSERT INTO `users_profit` VALUES ('47', '20', '54', '15.00', '1441960912', '0', '单次点播(54)', '1441960912', null, null, null);
INSERT INTO `users_profit` VALUES ('48', '14', '63', '9.00', '1441960943', '0', '单次点播(63)', '1441960943', null, null, null);
INSERT INTO `users_profit` VALUES ('49', '20', '56', '9.00', '1441960979', '0', '单次点播(56)', '1441960979', null, null, null);
INSERT INTO `users_profit` VALUES ('50', '7', '46', '15.00', '1441960996', '0', '单次点播(46)', '1441960996', null, null, null);
INSERT INTO `users_profit` VALUES ('51', '5', '3', '20.00', '1441961044', '0', '单次点播(3)', '1441961044', null, null, null);
INSERT INTO `users_profit` VALUES ('52', '1', '12', '40.00', '1441961059', '0', '单次点播(12)', '1441961059', null, null, null);
INSERT INTO `users_profit` VALUES ('53', '1', '19', '4.00', '1441961076', '0', '单次点播(19)', '1441961076', null, null, null);
INSERT INTO `users_profit` VALUES ('54', '20', '60', '1.00', '1442386561', '0', '单次点播(60)', '1442386561', null, null, null);
INSERT INTO `users_profit` VALUES ('55', '20', '54', '15.00', '1442389354', '0', '单次点播(54)', '1442389354', null, null, null);
INSERT INTO `users_profit` VALUES ('56', '14', '63', '9.00', '1442390534', '0', '单次点播(63)', '1442390534', null, null, null);
INSERT INTO `users_profit` VALUES ('57', '14', '4', '60.00', '1442392907', '0', '单次点播(4)', '1442392907', null, null, null);
INSERT INTO `users_profit` VALUES ('58', '1', '42', '6.00', '1442482076', '0', '单次点播(42)', '1442482076', null, null, null);
INSERT INTO `users_profit` VALUES ('59', '20', '68', '4.00', '1442557382', '0', '单次点播(68)', '1442557382', null, null, null);
INSERT INTO `users_profit` VALUES ('60', '20', '67', '2.00', '1442559299', '0', '单次点播(67)', '1442559299', null, null, null);
INSERT INTO `users_profit` VALUES ('61', '20', '67', '2.00', '1442570495', '0', '单次点播(67)', '1442570495', null, null, null);
INSERT INTO `users_profit` VALUES ('62', '5', '77', '1.00', '1442908914', '0', '单次点播(77)', '1442908914', null, null, null);
INSERT INTO `users_profit` VALUES ('63', '5', '77', '1.00', '1442909414', '0', '单次点播(77)', '1442909414', null, null, null);
INSERT INTO `users_profit` VALUES ('64', '7', '1', '24.60', '1442912658', '0', '单次点播(1)', '1442912658', null, null, null);
INSERT INTO `users_profit` VALUES ('65', '5', '81', '6.00', '1442979531', '0', '单次点播(81)', '1442979531', null, null, null);
INSERT INTO `users_profit` VALUES ('66', '9', '84', '4.00', '1442979558', '0', '单次点播(84)', '1442979558', null, null, null);
INSERT INTO `users_profit` VALUES ('67', '4', '44', '4.00', '1442988870', '0', '单次点播(44)', '1442988870', null, null, null);
INSERT INTO `users_profit` VALUES ('68', '4', '87', '6.00', '1442988901', '0', '单次点播(87)', '1442988901', null, null, null);
INSERT INTO `users_profit` VALUES ('69', '1', '88', '4.00', '1442989342', '0', '单次点播(88)', '1442989342', null, null, null);
INSERT INTO `users_profit` VALUES ('70', '1', '88', '4.00', '1442989393', '0', '单次点播(88)', '1442989393', null, null, null);
INSERT INTO `users_profit` VALUES ('71', '2', '5', '0.00', '1442989721', '0', '单次点播(5)', '1442989721', null, null, null);
INSERT INTO `users_profit` VALUES ('72', '15', '65', '0.00', '1442989880', '0', '单次点播(65)', '1442989880', null, null, null);
INSERT INTO `users_profit` VALUES ('73', '6', '13', '2.00', '1442993774', '0', '单次点播(13)', '1442993774', null, null, null);
INSERT INTO `users_profit` VALUES ('74', '3', '89', '2.00', '1442995100', '0', '单次点播(89)', '1442995100', null, null, null);
INSERT INTO `users_profit` VALUES ('75', '7', '97', '2.00', '1442999455', '0', '单次点播(97)', '1442999455', null, null, null);
INSERT INTO `users_profit` VALUES ('76', '7', '97', '2.00', '1443081223', '0', '单次点播(97)', '1443081223', null, null, null);
INSERT INTO `users_profit` VALUES ('77', '6', '13', '4.00', '1443081638', '0', '单次点播(13)', '1443081638', null, null, null);
INSERT INTO `users_profit` VALUES ('78', '4', '92', '0.00', '1443081882', '0', '单次点播(92)', '1443081882', null, null, null);
INSERT INTO `users_profit` VALUES ('79', '20', '68', '4.00', '1443428675', '0', '单次点播(68)', '1443428675', null, null, null);
INSERT INTO `users_profit` VALUES ('80', '14', '53', '2.00', '1443428698', '0', '单次点播(53)', '1443428698', null, null, null);
INSERT INTO `users_profit` VALUES ('81', '8', '93', '3.00', '1443429103', '0', '单次点播(93)', '1443429103', null, null, null);
INSERT INTO `users_profit` VALUES ('82', '1', '94', '1.50', '1443430620', '0', '单次点播(94)', '1443430620', null, null, null);
INSERT INTO `users_profit` VALUES ('83', '25', '66', '1.00', '1443433226', '0', '单次点播(66)', '1443433226', null, null, null);
INSERT INTO `users_profit` VALUES ('84', '1', '91', '4.00', '1443600755', '0', '单次点播(91)', '1443600755', null, null, null);
INSERT INTO `users_profit` VALUES ('85', '2', '101', '3.00', '1443603247', '0', '单次点播(101)', '1443603247', null, null, null);
INSERT INTO `users_profit` VALUES ('86', '12', '95', '6.00', '1443605582', '0', '单次点播(95)', '1443605582', null, null, null);
INSERT INTO `users_profit` VALUES ('87', '6', '86', '0.00', '1444028930', '0', '单次点播(86)', '1444028930', null, null, null);
INSERT INTO `users_profit` VALUES ('88', '4', '92', '0.00', '1444028978', '0', '单次点播(92)', '1444028978', null, null, null);
INSERT INTO `users_profit` VALUES ('89', '30', '108', '0.60', '1444377734', '0', '单次点播(108)', '1444377734', null, null, null);
INSERT INTO `users_profit` VALUES ('90', '1', '100', '1.50', '1444382922', '0', '单次点播(100)', '1444382922', null, null, null);
INSERT INTO `users_profit` VALUES ('91', '14', '53', '2.00', '1444442339', '0', '单次点播(53)', '1444442339', null, null, null);
INSERT INTO `users_profit` VALUES ('92', '4', '92', '0.00', '1444442350', '0', '单次点播(92)', '1444442350', null, null, null);
INSERT INTO `users_profit` VALUES ('93', '25', '103', '0.20', '1444564591', '0', '单次点播(103)', '1444564591', null, null, null);
INSERT INTO `users_profit` VALUES ('94', '7', '46', '15.00', '1444618454', '0', '单次点播(46)', '1444618454', null, null, null);
INSERT INTO `users_profit` VALUES ('95', '18', '105', '6.00', '1444618503', '0', '单次点播(105)', '1444618503', null, null, null);
INSERT INTO `users_profit` VALUES ('96', '34', '111', '9.00', '1444658901', '0', '单次点播(111)', '1444658901', null, null, null);
INSERT INTO `users_profit` VALUES ('97', '20', '67', '2.00', '1444659159', '0', '单次点播(67)', '1444659159', null, null, null);
INSERT INTO `users_profit` VALUES ('98', '2', '43', '2.00', '1444728121', '0', '单次点播(43)', '1444728121', null, null, null);
INSERT INTO `users_profit` VALUES ('99', '6', '86', '0.00', '1444728882', '0', '单次点播(86)', '1444728882', null, null, null);
INSERT INTO `users_profit` VALUES ('100', '6', '13', '4.00', '1444729465', '0', '单次点播(13)', '1444729465', null, null, null);
INSERT INTO `users_profit` VALUES ('101', '35', '113', '6.00', '1444749639', '0', '单次点播(113)', '1444749639', null, null, null);
INSERT INTO `users_profit` VALUES ('102', '35', '113', '6.00', '1444900599', '0', '单次点播(113)', '1444900599', null, null, null);
INSERT INTO `users_profit` VALUES ('103', '35', '112', '0.00', '1444900679', '0', '单次点播(112)', '1444900679', null, null, null);
INSERT INTO `users_profit` VALUES ('104', '36', '77', '1.00', '1444985895', '0', '单次点播(77)', '1444985895', null, null, null);
INSERT INTO `users_profit` VALUES ('105', '35', '78', '6.00', '1444985926', '0', '单次点播(78)', '1444985926', null, null, null);
INSERT INTO `users_profit` VALUES ('106', '34', '95', '6.00', '1444989152', '0', '单次点播(95)', '1444989152', null, null, null);
INSERT INTO `users_profit` VALUES ('107', '33', '86', '0.00', '1445221338', '0', '单次点播(86)', '1445221338', null, null, null);
INSERT INTO `users_profit` VALUES ('108', '33', '88', '4.00', '1445221542', '0', '单次点播(88)', '1445221542', null, null, null);
INSERT INTO `users_profit` VALUES ('109', '33', '80', '2.00', '1445221788', '0', '单次点播(80)', '1445221788', null, null, null);
INSERT INTO `users_profit` VALUES ('110', '33', '84', '4.00', '1445222073', '0', '单次点播(84)', '1445222073', null, null, null);
INSERT INTO `users_profit` VALUES ('111', '10', '47', '6.00', '1445223003', '0', '单次点播(47)', '1445223003', null, null, null);
INSERT INTO `users_profit` VALUES ('112', '10', '75', '2.00', '1445223387', '0', '单次点播(75)', '1445223387', null, null, null);
INSERT INTO `users_profit` VALUES ('113', '10', '75', '2.00', '1445223478', '0', '单次点播(75)', '1445223478', null, null, null);
INSERT INTO `users_profit` VALUES ('114', '15', '102', '3.00', '1445223545', '0', '单次点播(102)', '1445223545', null, null, null);
INSERT INTO `users_profit` VALUES ('115', '20', '54', '15.00', '1445224271', '0', '单次点播(54)', '1445224271', null, null, null);
INSERT INTO `users_profit` VALUES ('116', '33', '100', '1.50', '1445224326', '0', '单次点播(100)', '1445224326', null, null, null);
INSERT INTO `users_profit` VALUES ('117', '30', '123', '3.00', '1445229909', '2', '发布作品审核通过获赠:3杏币', '1445229909', null, '1445229909', null);
INSERT INTO `users_profit` VALUES ('118', '37', '124', '3.00', '1445235664', '2', '发布作品审核通过获赠:3杏币', '1445235664', null, '1445235664', null);
INSERT INTO `users_profit` VALUES ('119', '37', '125', '3.00', '1445235829', '2', '发布作品审核通过获赠:3杏币', '1445235829', null, '1445235829', null);
INSERT INTO `users_profit` VALUES ('120', '39', '127', '3.00', '1445239552', '2', '发布作品审核通过获赠:3杏币', '1445239552', null, '1445239552', null);
INSERT INTO `users_profit` VALUES ('121', '39', '128', '3.00', '1445239879', '2', '发布作品审核通过获赠:3杏币', '1445239879', null, '1445239879', null);
INSERT INTO `users_profit` VALUES ('122', '36', '64', '4.00', '1445249724', '0', '单次点播(64)', '1445249724', null, null, null);
INSERT INTO `users_profit` VALUES ('123', '8', '93', '3.00', '1445308118', '0', '单次点播(93)', '1445308118', null, null, null);
INSERT INTO `users_profit` VALUES ('124', '36', '77', '1.00', '1445667560', '0', '单次点播(77)', '1445667560', null, null, null);
INSERT INTO `users_profit` VALUES ('125', '30', '121', '33.30', '1445776555', '0', '单次点播(121)', '1445776555', null, null, null);
INSERT INTO `users_profit` VALUES ('126', '34', '130', '2.00', '1445849663', '2', '发布作品审核通过获赠:2杏币', '1445849663', null, '1445849663', null);
INSERT INTO `users_profit` VALUES ('127', '40', '131', '3.00', '1445914067', '2', '发布作品审核通过获赠:3杏币', '1445914067', null, '1445914067', null);
INSERT INTO `users_profit` VALUES ('128', '40', '132', '4.00', '1445915305', '2', '发布作品审核通过获赠:4杏币', '1445915305', null, '1445915305', null);
INSERT INTO `users_profit` VALUES ('129', '35', '116', '3.00', '1445932574', '2', '发布作品审核通过获赠:3杏币', '1445932574', null, '1445932574', null);
INSERT INTO `users_profit` VALUES ('130', '37', '126', '3.00', '1445932728', '2', '发布作品审核通过获赠:3杏币', '1445932728', null, '1445932728', null);
INSERT INTO `users_profit` VALUES ('131', '37', '126', '3.00', '1445932923', '2', '发布作品审核通过获赠:3杏币', '1445932923', null, '1445932923', null);
INSERT INTO `users_profit` VALUES ('132', '40', '134', '4.00', '1445940876', '2', '发布作品审核通过获赠:4杏币', '1445940876', null, '1445940876', null);
INSERT INTO `users_profit` VALUES ('133', '40', '141', '3.00', '1445940943', '2', '发布作品审核通过获赠:3杏币', '1445940943', null, '1445940943', null);
INSERT INTO `users_profit` VALUES ('134', '40', '141', '3.00', '1445940982', '2', '发布作品审核通过获赠:3杏币', '1445940982', null, '1445940982', null);
INSERT INTO `users_profit` VALUES ('135', '35', '116', '3.00', '1445942026', '2', '发布作品审核通过获赠:3杏币', '1445942026', null, '1445942026', null);
INSERT INTO `users_profit` VALUES ('136', '41', '143', '3.00', '1446103944', '2', '发布作品审核通过获赠:3杏币', '1446103944', null, '1446103944', null);
INSERT INTO `users_profit` VALUES ('137', '41', '142', '3.00', '1446103963', '2', '发布作品审核通过获赠:3杏币', '1446103963', null, '1446103963', null);
INSERT INTO `users_profit` VALUES ('138', '41', '143', '3.00', '1446175408', '0', '单次点播(143)', '1446175408', null, null, null);
INSERT INTO `users_profit` VALUES ('139', '41', '142', '0.06', '1446175566', '0', '单次点播(142)', '1446175566', null, null, null);
INSERT INTO `users_profit` VALUES ('140', '44', '145', '0.01', '1446433146', '2', '发布作品审核通过获赠:0.01杏币', '1446433146', null, '1446433146', null);
INSERT INTO `users_profit` VALUES ('141', '44', '144', '4.50', '1446433169', '2', '发布作品审核通过获赠:4.5杏币', '1446433169', null, '1446433169', null);
INSERT INTO `users_profit` VALUES ('142', '44', '145', '9.30', '1446449882', '0', '单次点播(145)', '1446449882', null, null, null);
INSERT INTO `users_profit` VALUES ('143', '44', '144', '10.01', '1446453155', '0', '单次点播(144)', '1446453155', null, null, null);
INSERT INTO `users_profit` VALUES ('144', '40', '134', '12.80', '1446458092', '0', '单次点播(134)', '1446458092', null, null, null);
INSERT INTO `users_profit` VALUES ('145', '36', '66', '1.00', '1446458228', '0', '单次点播(66)', '1446458228', null, null, null);
INSERT INTO `users_profit` VALUES ('146', '40', '131', '6.30', '1446458465', '0', '单次点播(131)', '1446458465', null, null, null);
INSERT INTO `users_profit` VALUES ('147', '44', '145', '9.30', '1446532292', '0', '单次点播(145)', '1446532292', null, null, null);
INSERT INTO `users_profit` VALUES ('148', '44', '144', '10.01', '1446532385', '0', '单次点播(144)', '1446532385', null, null, null);
INSERT INTO `users_profit` VALUES ('149', '36', '77', '2.00', '1446533938', '0', '单次点播(77)', '1446533938', null, null, null);
INSERT INTO `users_profit` VALUES ('150', '32', '148', '2.00', '1446534298', '2', '发布作品审核通过获赠:2杏币', '1446534298', null, '1446534298', null);
INSERT INTO `users_profit` VALUES ('151', '37', '126', '60.00', '1446534957', '0', '单次点播(126)', '1446534957', null, null, null);
INSERT INTO `users_profit` VALUES ('152', '30', '121', '33.30', '1446534964', '0', '单次点播(121)', '1446534964', null, null, null);
INSERT INTO `users_profit` VALUES ('153', '39', '127', '3.00', '1446534973', '0', '单次点播(127)', '1446534973', null, null, null);
INSERT INTO `users_profit` VALUES ('154', '37', '124', '15.00', '1446534982', '0', '单次点播(124)', '1446534982', null, null, null);
INSERT INTO `users_profit` VALUES ('155', '35', '78', '12.00', '1446535161', '0', '单次点播(78)', '1446535161', null, null, null);
INSERT INTO `users_profit` VALUES ('156', '35', '79', '8.00', '1446535189', '0', '单次点播(79)', '1446535189', null, null, null);
INSERT INTO `users_profit` VALUES ('157', '32', '154', '3.00', '1446535937', '2', '发布作品审核通过获赠:3杏币', '1446535937', null, '1446535937', null);
INSERT INTO `users_profit` VALUES ('158', '32', '153', '3.00', '1446535942', '2', '发布作品审核通过获赠:3杏币', '1446535942', null, '1446535942', null);
INSERT INTO `users_profit` VALUES ('159', '32', '152', '3.00', '1446535945', '2', '发布作品审核通过获赠:3杏币', '1446535945', null, '1446535945', null);
INSERT INTO `users_profit` VALUES ('160', '32', '151', '3.00', '1446535948', '2', '发布作品审核通过获赠:3杏币', '1446535948', null, '1446535948', null);
INSERT INTO `users_profit` VALUES ('161', '32', '150', '3.00', '1446535952', '2', '发布作品审核通过获赠:3杏币', '1446535952', null, '1446535952', null);
INSERT INTO `users_profit` VALUES ('162', '32', '149', '3.00', '1446535956', '2', '发布作品审核通过获赠:3杏币', '1446535956', null, '1446535956', null);
INSERT INTO `users_profit` VALUES ('163', '44', '147', '2.00', '1446535962', '2', '发布作品审核通过获赠:2杏币', '1446535962', null, '1446535962', null);
INSERT INTO `users_profit` VALUES ('164', '32', '154', '0.97', '1446536025', '0', '单次点播(154)', '1446536025', null, null, null);
INSERT INTO `users_profit` VALUES ('165', '32', '153', '0.70', '1446536035', '0', '单次点播(153)', '1446536035', null, null, null);
INSERT INTO `users_profit` VALUES ('166', '32', '152', '1.70', '1446536044', '0', '单次点播(152)', '1446536044', null, null, null);
INSERT INTO `users_profit` VALUES ('167', '32', '151', '1.10', '1446536056', '0', '单次点播(151)', '1446536056', null, null, null);
INSERT INTO `users_profit` VALUES ('168', '32', '150', '1.50', '1446536065', '0', '单次点播(150)', '1446536065', null, null, null);
INSERT INTO `users_profit` VALUES ('169', '32', '149', '1.50', '1446536079', '0', '单次点播(149)', '1446536079', null, null, null);
INSERT INTO `users_profit` VALUES ('170', '32', '154', '0.97', '1446536260', '0', '单次点播(154)', '1446536260', null, null, null);
INSERT INTO `users_profit` VALUES ('171', '32', '153', '0.70', '1446536300', '0', '单次点播(153)', '1446536300', null, null, null);
INSERT INTO `users_profit` VALUES ('172', '32', '152', '1.70', '1446536317', '0', '单次点播(152)', '1446536317', null, null, null);
INSERT INTO `users_profit` VALUES ('173', '32', '151', '1.10', '1446536331', '0', '单次点播(151)', '1446536331', null, null, null);
INSERT INTO `users_profit` VALUES ('174', '32', '154', '0.97', '1446536514', '0', '单次点播(154)', '1446536514', null, null, null);
INSERT INTO `users_profit` VALUES ('175', '32', '153', '0.70', '1446536521', '0', '单次点播(153)', '1446536521', null, null, null);
INSERT INTO `users_profit` VALUES ('176', '32', '152', '1.70', '1446536527', '0', '单次点播(152)', '1446536527', null, null, null);
INSERT INTO `users_profit` VALUES ('177', '32', '151', '1.10', '1446536535', '0', '单次点播(151)', '1446536535', null, null, null);
INSERT INTO `users_profit` VALUES ('178', '32', '155', '4.00', '1446538444', '2', '发布作品审核通过获赠:4杏币', '1446538444', null, '1446538444', null);
INSERT INTO `users_profit` VALUES ('179', '32', '158', '4.00', '1446539755', '2', '发布作品审核通过获赠:4杏币', '1446539755', null, '1446539755', null);
INSERT INTO `users_profit` VALUES ('180', '32', '157', '4.00', '1446539759', '2', '发布作品审核通过获赠:4杏币', '1446539759', null, '1446539759', null);
INSERT INTO `users_profit` VALUES ('181', '32', '156', '4.00', '1446539763', '2', '发布作品审核通过获赠:4杏币', '1446539763', null, '1446539763', null);
INSERT INTO `users_profit` VALUES ('182', '32', '159', '4.00', '1446539861', '2', '发布作品审核通过获赠:4杏币', '1446539861', null, '1446539861', null);
INSERT INTO `users_profit` VALUES ('183', '44', '145', '9.30', '1446691315', '0', '单次点播(145)', '1446691315', null, null, null);
INSERT INTO `users_profit` VALUES ('184', '32', '154', '0.97', '1446775981', '0', '单次点播(154)', '1446775981', null, null, null);
INSERT INTO `users_profit` VALUES ('185', '32', '159', '3.05', '1446776669', '0', '单次点播(159)', '1446776669', null, null, null);
INSERT INTO `users_profit` VALUES ('186', '44', '145', '9.30', '1446778260', '0', '单次点播(145)', '1446778260', null, null, null);
INSERT INTO `users_profit` VALUES ('187', '32', '150', '1.50', '1446781536', '0', '单次点播(150)', '1446781536', null, null, null);
INSERT INTO `users_profit` VALUES ('188', '34', '161', '3.00', '1446782694', '2', '发布作品审核通过获赠:3杏币', '1446782694', null, '1446782694', null);
INSERT INTO `users_profit` VALUES ('189', '35', '162', '3.00', '1446792860', '2', '发布作品审核通过获赠:3杏币', '1446792860', null, '1446792860', null);
INSERT INTO `users_profit` VALUES ('190', '44', '145', '9.30', '1446812029', '0', '单次点播(145)', '1446812029', null, null, null);
INSERT INTO `users_profit` VALUES ('191', '30', '123', '16.50', '1446812498', '0', '单次点播(123)', '1446812498', null, null, null);
INSERT INTO `users_profit` VALUES ('192', '30', '122', '30.00', '1446812502', '0', '单次点播(122)', '1446812502', null, null, null);
INSERT INTO `users_profit` VALUES ('193', '30', '121', '33.30', '1446812506', '0', '单次点播(121)', '1446812506', null, null, null);
INSERT INTO `users_profit` VALUES ('194', '30', '109', '1.00', '1446812515', '0', '单次点播(109)', '1446812515', null, null, null);
INSERT INTO `users_profit` VALUES ('195', '30', '120', '3.00', '1446812679', '0', '单次点播(120)', '1446812679', null, null, null);
INSERT INTO `users_profit` VALUES ('196', '30', '163', '3.00', '1446812773', '2', '发布作品审核通过获赠:3杏币', '1446812773', null, '1446812773', null);
INSERT INTO `users_profit` VALUES ('197', '30', '129', '3.00', '1446813547', '2', '发布作品审核通过获赠:3杏币', '1446813547', null, '1446813547', null);
INSERT INTO `users_profit` VALUES ('198', '30', '119', '3.00', '1446813569', '2', '发布作品审核通过获赠:3杏币', '1446813569', null, '1446813569', null);
INSERT INTO `users_profit` VALUES ('199', '30', '129', '0.72', '1446813605', '0', '单次点播(129)', '1446813605', null, null, null);
INSERT INTO `users_profit` VALUES ('200', '30', '164', '3.00', '1446866311', '2', '发布作品审核通过获赠:3杏币', '1446866311', null, '1446866311', null);
INSERT INTO `users_profit` VALUES ('201', '30', '164', '3.00', '1446866401', '0', '单次点播(164)', '1446866401', null, null, null);
INSERT INTO `users_profit` VALUES ('202', '30', '168', '3.00', '1446878236', '2', '发布作品审核通过获赠:3杏币', '1446878236', null, '1446878236', null);
INSERT INTO `users_profit` VALUES ('203', '30', '167', '3.00', '1446878246', '2', '发布作品审核通过获赠:3杏币', '1446878246', null, '1446878246', null);
INSERT INTO `users_profit` VALUES ('204', '30', '166', '3.00', '1446878276', '2', '发布作品审核通过获赠:3杏币', '1446878276', null, '1446878276', null);
INSERT INTO `users_profit` VALUES ('205', '30', '129', '0.72', '1447034279', '0', '单次点播(129)', '1447034279', null, null, null);
INSERT INTO `users_profit` VALUES ('206', '36', '60', '1.00', '1447035114', '0', '单次点播(60)', '1447035114', null, null, null);
INSERT INTO `users_profit` VALUES ('207', '34', '161', '1.50', '1447035124', '0', '单次点播(161)', '1447035124', null, null, null);
INSERT INTO `users_profit` VALUES ('208', '32', '153', '0.70', '1447136873', '0', '单次点播(153)', '1447136873', null, null, null);
INSERT INTO `users_profit` VALUES ('209', '34', '95', '6.00', '1447136916', '0', '单次点播(95)', '1447136916', null, null, null);
INSERT INTO `users_profit` VALUES ('210', '34', '161', '1.50', '1447137038', '0', '单次点播(161)', '1447137038', null, null, null);
INSERT INTO `users_profit` VALUES ('211', '32', '148', '2.00', '1447137062', '0', '单次点播(148)', '1447137062', null, null, null);
INSERT INTO `users_profit` VALUES ('212', '32', '158', '3.60', '1447137144', '0', '单次点播(158)', '1447137144', null, null, null);
INSERT INTO `users_profit` VALUES ('213', '44', '145', '9.30', '1447137214', '0', '单次点播(145)', '1447137214', null, null, null);
INSERT INTO `users_profit` VALUES ('214', '36', '66', '1.00', '1447137259', '0', '单次点播(66)', '1447137259', null, null, null);
INSERT INTO `users_profit` VALUES ('215', '4', '92', '0.00', '1447137388', '0', '单次点播(92)', '1447137388', null, null, null);
INSERT INTO `users_profit` VALUES ('216', '20', '57', '2.00', '1447137441', '0', '单次点播(57)', '1447137441', null, null, null);
INSERT INTO `users_profit` VALUES ('217', '33', '86', '0.00', '1447138518', '0', '单次点播(86)', '1447138518', null, null, null);
INSERT INTO `users_profit` VALUES ('218', '33', '84', '8.00', '1447138548', '0', '单次点播(84)', '1447138548', null, null, null);
INSERT INTO `users_profit` VALUES ('219', '33', '117', '10000.00', '1447140731', '2', '发布作品审核通过获赠:10000杏币', '1447140731', null, '1447140731', null);
INSERT INTO `users_profit` VALUES ('220', '41', '169', '100000.00', '1447141172', '2', '发布作品审核通过获赠:100000杏币', '1447141172', null, '1447141172', null);
INSERT INTO `users_profit` VALUES ('221', '7', '97', '4.00', '1447146647', '0', '单次点播(97)', '1447146647', null, null, null);
INSERT INTO `users_profit` VALUES ('222', '32', '148', '2.00', '1447576223', '0', '单次点播(148)', '1447576223', null, null, null);
INSERT INTO `users_profit` VALUES ('223', '34', '171', '8.00', '1447578166', '2', '发布作品审核通过获赠:8杏币', '1447578166', null, '1447578166', null);
INSERT INTO `users_profit` VALUES ('224', '44', '172', '3.00', '1447749776', '2', '发布作品审核通过获赠:3杏币', '1447749776', null, '1447749776', null);
INSERT INTO `users_profit` VALUES ('225', '41', '174', '10000.00', '1447751628', '2', '发布作品审核通过获赠:10000杏币', '1447751628', null, '1447751628', null);
INSERT INTO `users_profit` VALUES ('226', '44', '173', '30000.00', '1447751642', '2', '发布作品审核通过获赠:30000杏币', '1447751642', null, '1447751642', null);
INSERT INTO `users_profit` VALUES ('227', '41', '175', '3.00', '1447755985', '2', '发布作品审核通过获赠:3杏币', '1447755985', null, '1447755985', null);
INSERT INTO `users_profit` VALUES ('228', '41', '176', '3.00', '1447756400', '2', '发布作品审核通过获赠:3杏币', '1447756400', null, '1447756400', null);
INSERT INTO `users_profit` VALUES ('229', '32', '159', '3.05', '1447817350', '0', '单次点播(159)', '1447817350', null, null, null);
INSERT INTO `users_profit` VALUES ('230', '40', '134', '12.80', '1447817374', '0', '单次点播(134)', '1447817374', null, null, null);
INSERT INTO `users_profit` VALUES ('231', '43', '177', '1100.00', '1447829584', '2', '发布作品审核通过获赠:1100杏币', '1447829584', null, '1447829584', null);
INSERT INTO `users_profit` VALUES ('232', '50', '178', '3.00', '1447864946', '2', '发布作品审核通过获赠:3杏币', '1447864946', null, '1447864946', null);
INSERT INTO `users_profit` VALUES ('233', '41', '179', '3.00', '1447897899', '2', '发布作品审核通过获赠:3杏币', '1447897899', null, '1447897899', null);
INSERT INTO `users_profit` VALUES ('234', '41', '180', '2.00', '1447898075', '2', '发布作品审核通过获赠:2杏币', '1447898075', null, '1447898075', null);
INSERT INTO `users_profit` VALUES ('235', '32', '181', '3.00', '1447915539', '2', '发布作品审核通过获赠:3杏币', '1447915539', null, '1447915539', null);
INSERT INTO `users_profit` VALUES ('236', '31', '181', '30.00', '1447916772', '0', '单次点播(181)', '1447916772', null, null, null);
INSERT INTO `users_profit` VALUES ('237', '31', '182', '3.00', '1447917046', '2', '发布作品审核通过获赠:3杏币', '1447917046', null, '1447917046', null);
INSERT INTO `users_profit` VALUES ('238', '31', '182', '6.00', '1447917122', '0', '单次点播(182)', '1447917122', null, null, null);
INSERT INTO `users_profit` VALUES ('239', '3', '183', '10.00', '1447921285', '2', '发布作品审核通过获赠:10杏币', '1447921285', null, '1447921285', null);
INSERT INTO `users_profit` VALUES ('240', '3', '184', '5.00', '1447922632', '2', '发布作品审核通过获赠:5杏币', '1447922632', null, '1447922632', null);
INSERT INTO `users_profit` VALUES ('241', '31', '187', '3.33', '1447925152', '2', '发布作品审核通过获赠:3.33杏币', '1447925152', null, '1447925152', null);
INSERT INTO `users_profit` VALUES ('242', '31', '187', '9.00', '1447926765', '0', '单次点播(187)', '1447926765', null, null, null);
INSERT INTO `users_profit` VALUES ('243', '41', '180', '6.60', '1447926990', '0', '单次点播(180)', '1447926990', null, null, null);
INSERT INTO `users_profit` VALUES ('244', '45', '188', '3.00', '1448337205', '2', '发布作品审核通过获赠:3杏币', '1448337205', null, '1448337205', null);
INSERT INTO `users_profit` VALUES ('245', '36', '189', '3.00', '1448337524', '2', '发布作品审核通过获赠:3杏币', '1448337524', null, '1448337524', null);
INSERT INTO `users_profit` VALUES ('246', '42', '192', '100000.00', '1448355960', '2', '发布作品审核通过获赠:100000杏币', '1448355960', null, '1448355960', null);
INSERT INTO `users_profit` VALUES ('247', '39', '195', '2.00', '1448611517', '2', '发布作品审核通过获赠:2杏币', '1448611517', null, '1448611517', null);
INSERT INTO `users_profit` VALUES ('248', '41', '199', '3.00', '1448866433', '2', '发布作品审核通过获赠:3杏币', '1448866433', null, '1448866433', null);
INSERT INTO `users_profit` VALUES ('249', '46', '200', '1400000000.00', '1448866940', '2', '发布作品审核通过获赠:1400000000杏币', '1448866940', null, '1448866940', null);
INSERT INTO `users_profit` VALUES ('250', '41', '199', '3.60', '1448867254', '0', '单次点播(199)', '1448867254', null, null, null);
INSERT INTO `users_profit` VALUES ('251', '39', '201', '2.00', '1449025339', '2', '发布作品审核通过获赠:2杏币', '1449025339', null, '1449025339', null);
INSERT INTO `users_profit` VALUES ('252', '36', '202', '2.00', '1449025741', '2', '发布作品审核通过获赠:2杏币', '1449025741', null, '1449025741', null);
INSERT INTO `users_profit` VALUES ('253', '35', '203', '2.00', '1449028517', '2', '发布作品审核通过获赠:2杏币', '1449028517', null, '1449028517', null);

-- ----------------------------
-- Table structure for users_receive
-- ----------------------------
DROP TABLE IF EXISTS `users_receive`;
CREATE TABLE `users_receive` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `month` int(10) DEFAULT '0' COMMENT '月数',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `createdtime` bigint(20) DEFAULT NULL,
  `receivetime` bigint(20) DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员签到奖励领取表';

-- ----------------------------
-- Records of users_receive
-- ----------------------------
INSERT INTO `users_receive` VALUES ('1', '0', '22', '1440814471', '1441252231');
INSERT INTO `users_receive` VALUES ('2', '0', '20', '1441099239', '1441099248');

-- ----------------------------
-- Table structure for users_relation
-- ----------------------------
DROP TABLE IF EXISTS `users_relation`;
CREATE TABLE `users_relation` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ownid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `relationtime` bigint(20) DEFAULT NULL,
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='会员关系表-关注 粉丝 差粉丝ownid 查关注userid';

-- ----------------------------
-- Records of users_relation
-- ----------------------------
INSERT INTO `users_relation` VALUES ('1', '15', '2', '1440383877', '1440383877', null, '1440383877', null);
INSERT INTO `users_relation` VALUES ('2', '20', '1', '1440750738', '1440750738', null, '1440750738', null);
INSERT INTO `users_relation` VALUES ('11', '20', '22', '1441509796', '1441509796', null, '1441509796', null);
INSERT INTO `users_relation` VALUES ('13', '20', '8', '1441512374', '1441512374', null, '1441512374', null);
INSERT INTO `users_relation` VALUES ('15', '14', '22', '1441521873', '1441521873', null, '1441521873', null);
INSERT INTO `users_relation` VALUES ('18', '14', '11', '1441522204', '1441522204', null, '1441522204', null);
INSERT INTO `users_relation` VALUES ('20', '20', '10', '1441528608', '1441528608', null, '1441528608', null);
INSERT INTO `users_relation` VALUES ('22', '20', '14', '1441600429', '1441600429', null, '1441600429', null);
INSERT INTO `users_relation` VALUES ('28', '25', '1', '1442375220', '1442375220', null, '1442375220', null);
INSERT INTO `users_relation` VALUES ('31', '25', '11', '1442385650', '1442385650', null, '1442385650', null);
INSERT INTO `users_relation` VALUES ('32', '20', '11', '1442392023', '1442392023', null, '1442392023', null);
INSERT INTO `users_relation` VALUES ('35', '20', '2', '1442393330', '1442393330', null, '1442393330', null);
INSERT INTO `users_relation` VALUES ('42', '20', '5', '1442475200', '1442475200', null, '1442475200', null);
INSERT INTO `users_relation` VALUES ('45', '20', '4', '1442475234', '1442475234', null, '1442475234', null);
INSERT INTO `users_relation` VALUES ('47', '17', '20', '1442482281', '1442482281', null, '1442482281', null);
INSERT INTO `users_relation` VALUES ('48', '14', '20', '1442557392', '1442557392', null, '1442557392', null);
INSERT INTO `users_relation` VALUES ('49', '25', '5', '1443081108', '1443081108', null, '1443081108', null);
INSERT INTO `users_relation` VALUES ('50', '25', '4', '1443081835', '1443081835', null, '1443081835', null);
INSERT INTO `users_relation` VALUES ('57', '25', '12', '1443427411', '1443427411', null, '1443427411', null);
INSERT INTO `users_relation` VALUES ('66', '25', '20', '1443429272', '1443429272', null, '1443429272', null);
INSERT INTO `users_relation` VALUES ('67', '25', '9', '1443430444', '1443430444', null, '1443430444', null);
INSERT INTO `users_relation` VALUES ('68', '21', '14', '1444006147', '1444006147', null, '1444006147', null);
INSERT INTO `users_relation` VALUES ('69', '21', '6', '1444028227', '1444028227', null, '1444028227', null);
INSERT INTO `users_relation` VALUES ('71', '32', '29', '1444278359', '1444278359', null, '1444278359', null);
INSERT INTO `users_relation` VALUES ('72', '32', '25', '1444278445', '1444278445', null, '1444278445', null);
INSERT INTO `users_relation` VALUES ('74', '30', '14', '1444380485', '1444380485', null, '1444380485', null);
INSERT INTO `users_relation` VALUES ('76', '30', '12', '1444380495', '1444380495', null, '1444380495', null);
INSERT INTO `users_relation` VALUES ('82', '30', '6', '1444380589', '1444380589', null, '1444380589', null);
INSERT INTO `users_relation` VALUES ('86', '30', '2', '1444380635', '1444380635', null, '1444380635', null);
INSERT INTO `users_relation` VALUES ('87', '31', '30', '1444380777', '1444380777', null, '1444380777', null);
INSERT INTO `users_relation` VALUES ('88', '33', '25', '1444381108', '1444381108', null, '1444381108', null);
INSERT INTO `users_relation` VALUES ('90', '33', '7', '1444381201', '1444381201', null, '1444381201', null);
INSERT INTO `users_relation` VALUES ('92', '30', '8', '1444381261', '1444381261', null, '1444381261', null);
INSERT INTO `users_relation` VALUES ('95', '30', '1', '1444384359', '1444384359', null, '1444384359', null);
INSERT INTO `users_relation` VALUES ('100', '34', '35', '1444752615', '1444752615', null, '1444752615', null);
INSERT INTO `users_relation` VALUES ('102', '31', '33', '1445226891', '1445226891', null, '1445226891', null);
INSERT INTO `users_relation` VALUES ('103', '31', '35', '1445227467', '1445227467', null, '1445227467', null);
INSERT INTO `users_relation` VALUES ('108', '30', '36', '1445249510', '1445249510', null, '1445249510', null);
INSERT INTO `users_relation` VALUES ('113', '30', '39', '1445250840', '1445250840', null, '1445250840', null);
INSERT INTO `users_relation` VALUES ('114', '30', '32', '1445251125', '1445251125', null, '1445251125', null);
INSERT INTO `users_relation` VALUES ('115', '33', '8', '1445307286', '1445307286', null, '1445307286', null);
INSERT INTO `users_relation` VALUES ('116', '33', '4', '1445307522', '1445307522', null, '1445307522', null);
INSERT INTO `users_relation` VALUES ('122', '30', '33', '1445326467', '1445326467', null, '1445326467', null);
INSERT INTO `users_relation` VALUES ('126', '30', '41', '1446365158', '1446365158', null, '1446365158', null);
INSERT INTO `users_relation` VALUES ('127', '41', '39', '1446365177', '1446365177', null, '1446365177', null);
INSERT INTO `users_relation` VALUES ('128', '32', '30', '1446365649', '1446365649', null, '1446365649', null);
INSERT INTO `users_relation` VALUES ('132', '40', '34', '1446367706', '1446367706', null, '1446367706', null);
INSERT INTO `users_relation` VALUES ('133', '45', '32', '1446538490', '1446538490', null, '1446538490', null);
INSERT INTO `users_relation` VALUES ('135', '30', '40', '1446781679', '1446781679', null, '1446781679', null);
INSERT INTO `users_relation` VALUES ('137', '32', '45', '1447150122', '1447150122', null, '1447150122', null);
INSERT INTO `users_relation` VALUES ('138', '34', '36', '1448613580', '1448613580', null, '1448613580', null);
INSERT INTO `users_relation` VALUES ('140', '41', '46', '1449138363', '1449138363', null, '1449138363', null);

-- ----------------------------
-- Table structure for users_service
-- ----------------------------
DROP TABLE IF EXISTS `users_service`;
CREATE TABLE `users_service` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userid` bigint(20) DEFAULT NULL COMMENT '会员',
  `permission_category` int(4) DEFAULT '0' COMMENT '产品权限类型0 会员权限  1道具权限  2论坛权限  3资源权限',
  `member_permission_type` int(4) DEFAULT NULL COMMENT '0 视频会员  1图片会员  2主播会员  3全站VIP会员',
  `anchor_id` bigint(20) DEFAULT NULL COMMENT '主播',
  `begintime` bigint(20) DEFAULT NULL COMMENT '开始日期',
  `endtime` bigint(20) DEFAULT NULL COMMENT '到期日期-到期日期当天还是有效',
  `status` int(2) DEFAULT '0' COMMENT '状态 0未知 1开通 2过期 3即将到期',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='会员服务表';

-- ----------------------------
-- Records of users_service
-- ----------------------------
INSERT INTO `users_service` VALUES ('1', '20', '0', '2', '12', '1440753491', '1445937491', '1', '1440753491', '20', '1440754148', '20');
INSERT INTO `users_service` VALUES ('2', '20', '0', '2', '11', '1440754148', '1443346148', '1', '1440754148', '20', '1440754148', '20');
INSERT INTO `users_service` VALUES ('3', '3', '0', '2', '12', '1440992345', '1446176345', '1', '1440992345', '3', '1441591921', '3');
INSERT INTO `users_service` VALUES ('4', '15', '0', '2', '9', '1441962009', '1447146009', '1', '1441962009', '15', '1442570466', '15');
INSERT INTO `users_service` VALUES ('5', '15', '0', '2', '14', '1442570020', '1445162020', '1', '1442570020', '15', '1442570020', '15');
INSERT INTO `users_service` VALUES ('6', '15', '0', '2', '8', '1442570020', '1445162020', '1', '1442570020', '15', '1442570020', '15');
INSERT INTO `users_service` VALUES ('7', '15', '0', '2', '7', '1442570466', '1445162466', '1', '1442570466', '15', '1442570466', '15');
INSERT INTO `users_service` VALUES ('8', '20', '0', '2', '8', '1442902676', '1448086676', '1', '1442902676', '20', '1442902676', '20');
INSERT INTO `users_service` VALUES ('9', '25', '0', '2', '8', '1443082379', '1448266379', '1', '1443082379', '25', '1443423883', '25');
INSERT INTO `users_service` VALUES ('10', '25', '0', '2', '1', '1443082379', '1448266379', '1', '1443082379', '25', '1443083071', '25');
INSERT INTO `users_service` VALUES ('11', '25', '0', '2', '14', '1443083071', '1445675071', '1', '1443083071', '25', '1443083071', '25');
INSERT INTO `users_service` VALUES ('12', '25', '0', '2', '12', '1443423883', '1446015883', '1', '1443423883', '25', '1443423883', '25');
INSERT INTO `users_service` VALUES ('13', '25', '0', '2', '6', '1443430522', '1446022522', '1', '1443430522', '25', '1443430522', '25');
INSERT INTO `users_service` VALUES ('14', '25', '0', '2', '5', '1443430522', '1446022522', '1', '1443430522', '25', '1443430522', '25');
INSERT INTO `users_service` VALUES ('15', '30', '0', '2', '14', '1444378668', '1452154668', '1', '1444378668', '30', '1444378668', '30');
INSERT INTO `users_service` VALUES ('16', '30', '0', '2', '17', '1444378884', '1522138884', '1', '1444378884', '30', '1444378884', '30');
INSERT INTO `users_service` VALUES ('17', '31', '0', '2', '4', '1444381929', '1446973929', '1', '1444381929', '31', '1444381929', '31');
INSERT INTO `users_service` VALUES ('18', '31', '0', '2', '12', '1444382067', '1475918067', '1', '1444382067', '31', '1444382067', '31');
INSERT INTO `users_service` VALUES ('19', '34', '0', '2', '8', '1444490207', '1447082207', '1', '1444490207', '34', '1444490207', '34');
INSERT INTO `users_service` VALUES ('20', '34', '0', '2', '35', '1444490207', '1544282207', '1', '1444490207', '34', '1448605932', '34');
INSERT INTO `users_service` VALUES ('21', '34', '0', '1', '-1', '1444490207', '1465226207', '1', '1444490207', '34', '1448526053', '34');
INSERT INTO `users_service` VALUES ('22', '34', '0', '2', '26', '1444490747', '1478618747', '1', '1444490747', '34', '1444490747', '34');
INSERT INTO `users_service` VALUES ('23', '33', '0', '2', '12', '1444709362', '1447301362', '1', '1444709362', '33', '1444709362', '33');
INSERT INTO `users_service` VALUES ('24', '33', '0', '2', '14', '1444709362', '1476245362', '1', '1444709362', '33', '1444709362', '33');
INSERT INTO `users_service` VALUES ('25', '35', '0', '3', '-1', '1444752000', '1510675200', '1', '1444752000', '35', '1448606394', '35');
INSERT INTO `users_service` VALUES ('26', '35', '0', '2', '17', '1444752000', '1476288000', '1', '1444752000', '35', '1444752000', '35');
INSERT INTO `users_service` VALUES ('27', '35', '0', '2', '16', '1444752000', '1447344000', '1', '1444752000', '35', '1444752000', '35');
INSERT INTO `users_service` VALUES ('28', '30', '0', '2', '39', '1445249542', '1447841542', '1', '1445249542', '30', '1445249542', '30');
INSERT INTO `users_service` VALUES ('29', '34', '0', '3', '-1', '1445667836', '1452320636', '1', '1445667836', '34', '1448613525', '34');
INSERT INTO `users_service` VALUES ('30', '40', '0', '0', '-1', '1447643570', '1453086770', '1', '1446433296', '40', '1447643570', '40');
INSERT INTO `users_service` VALUES ('31', '40', '0', '3', '-1', '1446447463', '1449989863', '1', '1446447463', '40', '1447583002', '40');
INSERT INTO `users_service` VALUES ('32', '40', '0', '2', '33', '1446447463', '1488351463', '1', '1446447463', '40', '1447643570', '40');
INSERT INTO `users_service` VALUES ('33', '40', '0', '1', '-1', '1446448011', '1454224011', '1', '1446448011', '40', '1446448011', '40');
INSERT INTO `users_service` VALUES ('35', '44', '0', '1', '-1', '1446451341', '1449043341', '1', '1446451341', '44', '1446451341', '44');
INSERT INTO `users_service` VALUES ('36', '47', '0', '1', '-1', '1446453483', '1526805483', '1', '1446453483', '47', '1446456500', '47');
INSERT INTO `users_service` VALUES ('37', '47', '0', '3', '-1', '1446453483', '1450514283', '1', '1446453483', '47', '1446456500', '47');
INSERT INTO `users_service` VALUES ('38', '47', '0', '0', '-1', '1446454811', '1449306011', '1', '1446454811', '47', '1446456500', '47');
INSERT INTO `users_service` VALUES ('39', '47', '0', '2', '34', '1446456500', '1449048500', '1', '1446456500', '47', '1446456500', '47');
INSERT INTO `users_service` VALUES ('40', '30', '0', '0', '-1', '1446628221', '1635930621', '1', '1446628221', '30', '1448373137', '30');
INSERT INTO `users_service` VALUES ('41', '30', '0', '2', '34', '1446628221', '1449220221', '1', '1446628221', '30', '1446628221', '30');
INSERT INTO `users_service` VALUES ('42', '32', '0', '2', '36', '1446719054', '1451903054', '1', '1446719054', '32', '1446719054', '32');
INSERT INTO `users_service` VALUES ('43', '30', '0', '2', '32', '1446796819', '1451980819', '1', '1446796819', '30', '1446796819', '30');
INSERT INTO `users_service` VALUES ('44', '30', '0', '3', '-1', '1446888690', '1478424690', '1', '1446888690', '30', '1446888690', '30');
INSERT INTO `users_service` VALUES ('45', '3', '0', '2', '39', '1447086250', '1452270250', '1', '1447086250', '3', '1447086250', '3');
INSERT INTO `users_service` VALUES ('46', '41', '0', '1', '-1', '1447141791', '1467877791', '1', '1447141791', '41', '1449138101', '41');
INSERT INTO `users_service` VALUES ('47', '41', '3', '0', '-1', '1447142051', '1447142051', '1', '1447142051', '41', '1447142051', '41');
INSERT INTO `users_service` VALUES ('48', '3', '0', '0', '-1', '1447149009', '1489053009', '1', '1447149009', '3', '1448849553', '3');
INSERT INTO `users_service` VALUES ('49', '3', '0', '1', '-1', '1447149225', '1449741225', '1', '1447149225', '3', '1447149225', '3');
INSERT INTO `users_service` VALUES ('50', '3', '3', '0', '-1', '1447149225', '1447149225', '1', '1447149225', '3', '1447149225', '3');
INSERT INTO `users_service` VALUES ('51', '25', '0', '2', '36', '1447209983', '1449801983', '1', '1447209983', '25', '1447209983', '25');
INSERT INTO `users_service` VALUES ('52', '30', '0', '2', '45', '1447210107', '1478746107', '1', '1447210107', '30', '1447210107', '30');
INSERT INTO `users_service` VALUES ('53', '30', '0', '2', '22', '1447210138', '1478746138', '1', '1447210138', '30', '1447210138', '30');
INSERT INTO `users_service` VALUES ('54', '40', '0', '2', '39', '1447583002', '1510655002', '1', '1447583002', '40', '1447583002', '40');
INSERT INTO `users_service` VALUES ('55', '40', '3', '0', '-1', '1447643570', '1447643570', '1', '1447643570', '40', '1447643570', '40');
INSERT INTO `users_service` VALUES ('56', '41', '0', '2', '32', '1447829161', '1479365161', '1', '1447829161', '41', '1447829161', '41');
INSERT INTO `users_service` VALUES ('57', '43', '0', '0', '-1', '1447831306', '1458199306', '1', '1447831306', '43', '1447836254', '43');
INSERT INTO `users_service` VALUES ('58', '43', '0', '2', '39', '1447836254', '1479372254', '1', '1447836254', '43', '1447836254', '43');
INSERT INTO `users_service` VALUES ('59', '43', '0', '2', '45', '1447836612', '1450428612', '1', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_service` VALUES ('60', '43', '0', '2', '36', '1447836612', '1450428612', '1', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_service` VALUES ('61', '43', '0', '2', '32', '1447836612', '1450428612', '1', '1447836612', '43', '1447836612', '43');
INSERT INTO `users_service` VALUES ('62', '35', '0', '2', '39', '1448009994', '1460969994', '1', '1448009994', '35', '1448333895', '35');
INSERT INTO `users_service` VALUES ('63', '35', '0', '2', '36', '1448009994', '1450601994', '1', '1448009994', '35', '1448009994', '35');
INSERT INTO `users_service` VALUES ('64', '35', '1', '0', '-1', '1448009994', '1456649994', '1', '1448009994', '35', '1448010116', '35');
INSERT INTO `users_service` VALUES ('65', '35', '0', '2', '33', '1448010116', '1450602116', '1', '1448010116', '35', '1448010116', '35');
INSERT INTO `users_service` VALUES ('66', '35', '0', '2', '32', '1448010116', '1450602116', '1', '1448010116', '35', '1448010116', '35');
INSERT INTO `users_service` VALUES ('67', '31', '0', '2', '32', '1448011938', '1450603938', '1', '1448011938', '31', '1448011938', '31');
INSERT INTO `users_service` VALUES ('68', '31', '0', '2', '31', '1448011938', '1450603938', '1', '1448011938', '31', '1448011938', '31');
INSERT INTO `users_service` VALUES ('69', '31', '1', '0', '-1', '1448011938', '1452331938', '1', '1448011938', '31', '1448011938', '31');
INSERT INTO `users_service` VALUES ('70', '3', '0', '2', '33', '1448031752', '1450623752', '1', '1448031752', '3', '1448031752', '3');
INSERT INTO `users_service` VALUES ('71', '35', '0', '2', '31', '1448270875', '1450862875', '1', '1448270875', '35', '1448270875', '35');
INSERT INTO `users_service` VALUES ('72', '35', '0', '2', '34', '1448270875', '1450862875', '1', '1448270875', '35', '1448270875', '35');
INSERT INTO `users_service` VALUES ('73', '35', '0', '2', '30', '1448272496', '1461232496', '1', '1448272496', '35', '1448272496', '35');
INSERT INTO `users_service` VALUES ('74', '35', '0', '1', '-1', '1448272496', '1453456496', '1', '1448272496', '35', '1448333895', '35');
INSERT INTO `users_service` VALUES ('75', '35', '0', '2', '20', '1448333895', '1450925895', '1', '1448333895', '35', '1448333895', '35');
INSERT INTO `users_service` VALUES ('76', '30', '0', '2', '36', '1448373137', '1456149137', '1', '1448373137', '30', '1448373137', '30');
INSERT INTO `users_service` VALUES ('77', '42', '0', '2', '34', '1448439472', '1453623472', '1', '1448439472', '42', '1448439472', '42');
INSERT INTO `users_service` VALUES ('78', '42', '1', '0', '-1', '1448439472', '1449735472', '1', '1448439472', '42', '1448439472', '42');
INSERT INTO `users_service` VALUES ('79', '42', '0', '0', '-1', '1448442432', '1458810432', '1', '1448442432', '42', '1448443272', '42');
INSERT INTO `users_service` VALUES ('80', '42', '0', '1', '-1', '1448443272', '1451035272', '1', '1448443272', '42', '1448443272', '42');
INSERT INTO `users_service` VALUES ('81', '42', '0', '3', '-1', '1448444089', '1479980089', '1', '1448444089', '42', '1448444089', '42');
INSERT INTO `users_service` VALUES ('82', '34', '0', '2', '34', '1448511822', '1456287822', '1', '1448511822', '34', '1448511822', '34');
INSERT INTO `users_service` VALUES ('83', '34', '1', '0', '-1', '1448511822', '1453695822', '1', '1448511822', '34', '1448605932', '34');
INSERT INTO `users_service` VALUES ('84', '34', '0', '2', '36', '1448511873', '1458879873', '1', '1448511873', '34', '1448526053', '34');
INSERT INTO `users_service` VALUES ('85', '34', '0', '2', '39', '1448512016', '1482640016', '1', '1448512016', '34', '1448605932', '34');
INSERT INTO `users_service` VALUES ('86', '3', '0', '3', '-1', '1448513490', '1480049490', '1', '1448513490', '3', '1448513490', '3');
INSERT INTO `users_service` VALUES ('87', '3', '1', '0', '-1', '1448513490', '1449809490', '1', '1448513490', '3', '1448513490', '3');
INSERT INTO `users_service` VALUES ('88', '34', '0', '0', '-1', '1448526053', '1480234853', '1', '1448526053', '34', '1448526114', '34');
INSERT INTO `users_service` VALUES ('89', '34', '0', '2', '32', '1448526053', '1451118053', '1', '1448526053', '34', '1448526053', '34');
INSERT INTO `users_service` VALUES ('90', '34', '0', '2', '31', '1448526053', '1453710053', '1', '1448526053', '34', '1448526053', '34');
INSERT INTO `users_service` VALUES ('91', '34', '0', '2', '29', '1448605932', '1480141932', '1', '1448605932', '34', '1448605932', '34');
INSERT INTO `users_service` VALUES ('92', '34', '0', '2', '20', '1448605987', '1480141987', '1', '1448605987', '34', '1448605987', '34');
INSERT INTO `users_service` VALUES ('93', '34', '0', '2', '1', '1448606082', '1451198082', '1', '1448606082', '34', '1448606082', '34');
INSERT INTO `users_service` VALUES ('94', '35', '0', '2', '1', '1448606394', '1451198394', '1', '1448606394', '35', '1448606394', '35');
INSERT INTO `users_service` VALUES ('95', '35', '0', '2', '29', '1448606649', '1480142649', '1', '1448606649', '35', '1448606649', '35');
INSERT INTO `users_service` VALUES ('96', '34', '0', '2', '30', '1448613525', '1451205525', '1', '1448613525', '34', '1448613525', '34');
INSERT INTO `users_service` VALUES ('97', '41', '0', '0', '-1', '1448718843', '1616853243', '1', '1448718843', '41', '1449138101', '41');
INSERT INTO `users_service` VALUES ('98', '41', '0', '3', '-1', '1448718843', '1485006843', '1', '1448718843', '41', '1449138101', '41');
INSERT INTO `users_service` VALUES ('99', '41', '2', '0', '-1', '1448718843', '1450792443', '1', '1448718843', '41', '1449138101', '41');
INSERT INTO `users_service` VALUES ('100', '41', '0', '2', '36', '1448770643', '1482898643', '1', '1448770643', '41', '1449138216', '41');

-- ----------------------------
-- Table structure for users_sign_record
-- ----------------------------
DROP TABLE IF EXISTS `users_sign_record`;
CREATE TABLE `users_sign_record` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `sign_time` bigint(20) DEFAULT NULL COMMENT '签到时间',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='会员签名记录';

-- ----------------------------
-- Records of users_sign_record
-- ----------------------------
INSERT INTO `users_sign_record` VALUES ('1', '22', '1440641490', '1440641490', 'yaoleiinchina', '1440641490', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('2', '22', '1440727923', '1440727923', 'yaoleiinchina', '1440727923', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('3', '22', '1440814471', '1440814471', 'yaoleiinchina', '1440814471', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('4', '22', '1440900936', '1440900936', 'yaoleiinchina', '1440900936', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('5', '22', '1440987545', '1440987545', 'yaoleiinchina', '1440987545', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('6', '22', '1441073962', '1441073962', 'yaoleiinchina', '1441073962', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('7', '22', '1441161106', '1441161106', 'yaoleiinchina', '1441161106', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('8', '22', '1441247913', '1441247913', 'yaoleiinchina', '1441247913', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('9', '22', '1441340320', '1441340320', 'yaoleiinchina', '1441340320', 'yaoleiinchina');
INSERT INTO `users_sign_record` VALUES ('10', '17', '1441348835', '1441348835', 'xiaosan', '1441348835', 'xiaosan');
INSERT INTO `users_sign_record` VALUES ('11', '17', '1441440956', '1441440956', 'xiaosan', '1441440956', 'xiaosan');
INSERT INTO `users_sign_record` VALUES ('12', '28', '1441441498', '1441441498', 'xiaose', '1441441498', 'xiaose');
INSERT INTO `users_sign_record` VALUES ('13', '19', '1440731922', '1440731922', 'xiaohuihui', '1440731922', 'xiaohuihui');
INSERT INTO `users_sign_record` VALUES ('14', '20', '1440732858', '1440732858', 'rr', '1440732858', 'rr');
INSERT INTO `users_sign_record` VALUES ('15', '21', '1440952328', '1440952328', 'franktester', '1440952328', 'franktester');
INSERT INTO `users_sign_record` VALUES ('16', '3', '1440983680', '1440983680', 'admin', '1440983680', 'admin');
INSERT INTO `users_sign_record` VALUES ('17', '14', '1441092583', '1441092583', '地平线上的泪水', '1441092583', '地平线上的泪水');
INSERT INTO `users_sign_record` VALUES ('18', '20', '1441097321', '1441097321', 'rr', '1441097321', 'rr');
INSERT INTO `users_sign_record` VALUES ('19', '20', '1441098876', '1441098876', 'rr', '1441098876', 'rr');
INSERT INTO `users_sign_record` VALUES ('20', '20', '1441098998', '1441098998', 'rr', '1441098998', 'rr');
INSERT INTO `users_sign_record` VALUES ('21', '20', '1441099239', '1441099239', 'rr', '1441099239', 'rr');
INSERT INTO `users_sign_record` VALUES ('22', '20', '1441179263', '1441179263', 'rr', '1441179263', 'rr');
INSERT INTO `users_sign_record` VALUES ('23', '20', '1441506705', '1441506705', 'rr', '1441506705', 'rr');
INSERT INTO `users_sign_record` VALUES ('24', '14', '1441525515', '1441525515', '地平线上的泪水', '1441525515', '地平线上的泪水');
INSERT INTO `users_sign_record` VALUES ('25', '3', '1441591696', '1441591696', 'admin', '1441591696', 'admin');
INSERT INTO `users_sign_record` VALUES ('26', '20', '1441605898', '1441605898', 'rr', '1441605898', 'rr');
INSERT INTO `users_sign_record` VALUES ('27', '20', '1441702059', '1441702059', 'rr', '1441702059', 'rr');
INSERT INTO `users_sign_record` VALUES ('28', '20', '1441936378', '1441936378', 'rr', '1441936378', 'rr');
INSERT INTO `users_sign_record` VALUES ('29', '20', '1442197153', '1442197153', 'rr', '1442197153', 'rr');
INSERT INTO `users_sign_record` VALUES ('30', '20', '1442373231', '1442373231', 'rr', '1442373231', 'rr');
INSERT INTO `users_sign_record` VALUES ('31', '25', '1442375558', '1442375558', 'rong', '1442375558', 'rong');
INSERT INTO `users_sign_record` VALUES ('32', '25', '1442454175', '1442454175', 'rong', '1442454175', 'rong');
INSERT INTO `users_sign_record` VALUES ('33', '20', '1442455444', '1442455444', 'rr', '1442455444', 'rr');
INSERT INTO `users_sign_record` VALUES ('34', '17', '1442459073', '1442459073', 'liu', '1442459073', 'liu');
INSERT INTO `users_sign_record` VALUES ('35', '15', '1442546598', '1442546598', 'lr', '1442546598', 'lr');
INSERT INTO `users_sign_record` VALUES ('36', '17', '1442557292', '1442557292', 'liu', '1442557292', 'liu');
INSERT INTO `users_sign_record` VALUES ('37', '14', '1442559253', '1442559253', '地平线上的泪水', '1442559253', '地平线上的泪水');
INSERT INTO `users_sign_record` VALUES ('38', '20', '1442564542', '1442564542', 'rr', '1442564542', 'rr');
INSERT INTO `users_sign_record` VALUES ('39', '20', '1443061654', '1443061654', 'rr', '1443061654', 'rr');
INSERT INTO `users_sign_record` VALUES ('40', '25', '1443147546', '1443147546', 'rong', '1443147546', 'rong');
INSERT INTO `users_sign_record` VALUES ('41', '25', '1443409301', '1443409301', 'rong', '1443409301', 'rong');
INSERT INTO `users_sign_record` VALUES ('42', '14', '1443409443', '1443409443', '地平线上的泪水', '1443409443', '地平线上的泪水');
INSERT INTO `users_sign_record` VALUES ('43', '28', '1443426717', '1443426717', 'll', '1443426717', 'll');
INSERT INTO `users_sign_record` VALUES ('44', '25', '1443494545', '1443494545', 'rong', '1443494545', 'rong');
INSERT INTO `users_sign_record` VALUES ('45', '25', '1443594834', '1443594834', 'rong', '1443594834', 'rong');
INSERT INTO `users_sign_record` VALUES ('46', '21', '1444006173', '1444006173', 'franktester', '1444006173', 'franktester');
INSERT INTO `users_sign_record` VALUES ('47', '29', '1444027150', '1444027150', '小新测试', '1444027150', '小新测试');
INSERT INTO `users_sign_record` VALUES ('48', '21', '1444093784', '1444093784', 'franktester', '1444093784', 'franktester');
INSERT INTO `users_sign_record` VALUES ('49', '30', '1444373059', '1444373059', 'test_01', '1444373059', 'test_01');
INSERT INTO `users_sign_record` VALUES ('50', '31', '1444374575', '1444374575', 'test_02', '1444374575', 'test_02');
INSERT INTO `users_sign_record` VALUES ('51', '35', '1444382929', '1444382929', 'test_06', '1444382929', 'test_06');
INSERT INTO `users_sign_record` VALUES ('52', '30', '1444410381', '1444410381', 'test_01', '1444410381', 'test_01');
INSERT INTO `users_sign_record` VALUES ('53', '30', '1444658960', '1444658960', 'test_01', '1444658960', 'test_01');
INSERT INTO `users_sign_record` VALUES ('54', '34', '1444659028', '1444659028', 'test_05', '1444659028', 'test_05');
INSERT INTO `users_sign_record` VALUES ('55', '33', '1444727613', '1444727613', 'test_04', '1444727613', 'test_04');
INSERT INTO `users_sign_record` VALUES ('56', '34', '1444748866', '1444748866', 'test_05', '1444748866', 'test_05');
INSERT INTO `users_sign_record` VALUES ('57', '35', '1444749060', '1444749060', 'test_06', '1444749060', 'test_06');
INSERT INTO `users_sign_record` VALUES ('58', '33', '1444804329', '1444804329', 'test_04', '1444804329', 'test_04');
INSERT INTO `users_sign_record` VALUES ('59', '30', '1444984993', '1444984993', 'test_01', '1444984993', 'test_01');
INSERT INTO `users_sign_record` VALUES ('60', '30', '1445250759', '1445250759', 'test_01', '1445250759', 'test_01');
INSERT INTO `users_sign_record` VALUES ('61', '33', '1445307270', '1445307270', 'test_04', '1445307270', 'test_04');
INSERT INTO `users_sign_record` VALUES ('62', '30', '1445309030', '1445309030', 'test_01', '1445309030', 'test_01');
INSERT INTO `users_sign_record` VALUES ('63', '34', '1445667049', '1445667049', 'test_05', '1445667049', 'test_05');
INSERT INTO `users_sign_record` VALUES ('64', '34', '1445738711', '1445738711', 'test_05', '1445738711', 'test_05');
INSERT INTO `users_sign_record` VALUES ('65', '30', '1445756667', '1445756667', 'test_01', '1445756667', 'test_01');
INSERT INTO `users_sign_record` VALUES ('66', '31', '1445757938', '1445757938', 'test_02', '1445757938', 'test_02');
INSERT INTO `users_sign_record` VALUES ('67', '31', '1445843074', '1445843074', 'test_02', '1445843074', 'test_02');
INSERT INTO `users_sign_record` VALUES ('68', '30', '1445918411', '1445918411', 'test_01', '1445918411', 'test_01');
INSERT INTO `users_sign_record` VALUES ('69', '30', '1445998514', '1445998514', 'test_01 ', '1445998514', 'test_01 ');
INSERT INTO `users_sign_record` VALUES ('70', '41', '1446102392', '1446102392', 'faa123', '1446102392', 'faa123');
INSERT INTO `users_sign_record` VALUES ('71', '30', '1446453280', '1446453280', 'test_01', '1446453280', 'test_01');
INSERT INTO `users_sign_record` VALUES ('72', '44', '1446455470', '1446455470', 'p01', '1446455470', 'p01');
INSERT INTO `users_sign_record` VALUES ('73', '41', '1446521959', '1446521959', 'faa123', '1446521959', 'faa123');
INSERT INTO `users_sign_record` VALUES ('74', '3', '1447050721', '1447050721', 'admin', '1447050721', 'admin');
INSERT INTO `users_sign_record` VALUES ('75', '42', '1448437714', '1448437714', 'faa12', '1448437714', 'faa12');

-- ----------------------------
-- Table structure for users_sign_reward
-- ----------------------------
DROP TABLE IF EXISTS `users_sign_reward`;
CREATE TABLE `users_sign_reward` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `pic` varchar(200) DEFAULT NULL COMMENT '奖品图片',
  `desc` varchar(500) DEFAULT NULL COMMENT '说明',
  `month` int(4) DEFAULT '0' COMMENT '月份',
  `enabled` int(2) DEFAULT '1' COMMENT '开启',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='签到奖励表';

-- ----------------------------
-- Records of users_sign_reward
-- ----------------------------
INSERT INTO `users_sign_reward` VALUES ('1', '一个月', 'c610c53796/400_c610c5379604bbfd4e7efe836f4c3444.jpg', null, '1', '1', '1440641490', '1440641490');
INSERT INTO `users_sign_reward` VALUES ('2', '二个月', 'dafb8cfceb/400_dafb8cfceb01be457949ce7964679468.jpg', null, '2', '1', '1440641490', '1440641490');
INSERT INTO `users_sign_reward` VALUES ('3', '三个月', 'd415251193/400_d4152511931173a375d6fef5c2509deb.jpg', null, '3', '1', '1440641490', '1440641490');
INSERT INTO `users_sign_reward` VALUES ('4', '六个月', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', null, '6', '1', '1440641490', '1440641490');
INSERT INTO `users_sign_reward` VALUES ('5', '十二个月', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', null, '12', '1', '1440641490', '1440641490');

-- ----------------------------
-- Table structure for users_sign_to_reward
-- ----------------------------
DROP TABLE IF EXISTS `users_sign_to_reward`;
CREATE TABLE `users_sign_to_reward` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `reward_id` bigint(20) DEFAULT NULL,
  `createdtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='领取奖品关联表';

-- ----------------------------
-- Records of users_sign_to_reward
-- ----------------------------
INSERT INTO `users_sign_to_reward` VALUES ('1', '22', '1', '1441251490');
INSERT INTO `users_sign_to_reward` VALUES ('2', '22', '4', '1441251605');
INSERT INTO `users_sign_to_reward` VALUES ('3', '22', '5', '1441251735');
INSERT INTO `users_sign_to_reward` VALUES ('4', '22', '3', '1441252231');
INSERT INTO `users_sign_to_reward` VALUES ('5', '20', '1', '1441099248');

-- ----------------------------
-- Table structure for users_vod_record
-- ----------------------------
DROP TABLE IF EXISTS `users_vod_record`;
CREATE TABLE `users_vod_record` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `works_library_id` bigint(20) DEFAULT NULL COMMENT '作品',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='会员的点播记录';

-- ----------------------------
-- Records of users_vod_record
-- ----------------------------
INSERT INTO `users_vod_record` VALUES ('1', '14', '46', '1439538497', null, null, null);
INSERT INTO `users_vod_record` VALUES ('2', '14', '42', '1439538522', null, null, null);
INSERT INTO `users_vod_record` VALUES ('3', '14', '44', '1439538612', null, null, null);
INSERT INTO `users_vod_record` VALUES ('4', '14', '19', '1439539811', null, null, null);
INSERT INTO `users_vod_record` VALUES ('5', '14', '43', '1439540000', null, null, null);
INSERT INTO `users_vod_record` VALUES ('6', '14', '43', '1439540014', null, null, null);
INSERT INTO `users_vod_record` VALUES ('7', '14', '43', '1439540023', null, null, null);
INSERT INTO `users_vod_record` VALUES ('8', '14', '45', '1439540043', null, null, null);
INSERT INTO `users_vod_record` VALUES ('9', '3', '46', '1440151168', null, null, null);
INSERT INTO `users_vod_record` VALUES ('10', '3', '31', '1440151179', null, null, null);
INSERT INTO `users_vod_record` VALUES ('11', '3', '45', '1440151204', null, null, null);
INSERT INTO `users_vod_record` VALUES ('12', '15', '42', '1440389592', null, null, null);
INSERT INTO `users_vod_record` VALUES ('13', '15', '42', '1440389596', null, null, null);
INSERT INTO `users_vod_record` VALUES ('14', '15', '42', '1440389604', null, null, null);
INSERT INTO `users_vod_record` VALUES ('15', '15', '42', '1440389616', null, null, null);
INSERT INTO `users_vod_record` VALUES ('16', '15', '43', '1440406024', null, null, null);
INSERT INTO `users_vod_record` VALUES ('17', '15', '44', '1440406045', null, null, null);
INSERT INTO `users_vod_record` VALUES ('18', '20', '19', '1440753590', null, null, null);
INSERT INTO `users_vod_record` VALUES ('19', '20', '47', '1440753935', null, null, null);
INSERT INTO `users_vod_record` VALUES ('20', '20', '43', '1440754823', null, null, null);
INSERT INTO `users_vod_record` VALUES ('21', '3', '19', '1440992897', null, null, null);
INSERT INTO `users_vod_record` VALUES ('22', '13', '4', '1441092419', null, null, null);
INSERT INTO `users_vod_record` VALUES ('23', '14', '4', '1441092672', null, null, null);
INSERT INTO `users_vod_record` VALUES ('24', '14', '4', '1441092685', null, null, null);
INSERT INTO `users_vod_record` VALUES ('25', '14', '56', '1441094345', null, null, null);
INSERT INTO `users_vod_record` VALUES ('26', '14', '56', '1441094376', null, null, null);
INSERT INTO `users_vod_record` VALUES ('27', '14', '57', '1441095313', null, null, null);
INSERT INTO `users_vod_record` VALUES ('28', '14', '13', '1441095987', null, null, null);
INSERT INTO `users_vod_record` VALUES ('29', '14', '54', '1441096269', null, null, null);
INSERT INTO `users_vod_record` VALUES ('30', '20', '57', '1441096342', null, null, null);
INSERT INTO `users_vod_record` VALUES ('31', '20', '56', '1441096839', null, null, null);
INSERT INTO `users_vod_record` VALUES ('32', '3', '54', '1441096850', null, null, null);
INSERT INTO `users_vod_record` VALUES ('33', '3', '56', '1441097027', null, null, null);
INSERT INTO `users_vod_record` VALUES ('34', '3', '55', '1441097573', null, null, null);
INSERT INTO `users_vod_record` VALUES ('35', '3', '57', '1441098027', null, null, null);
INSERT INTO `users_vod_record` VALUES ('36', '20', '18', '1441098532', null, null, null);
INSERT INTO `users_vod_record` VALUES ('37', '3', '5', '1441098662', null, null, null);
INSERT INTO `users_vod_record` VALUES ('38', '3', '15', '1441099042', null, null, null);
INSERT INTO `users_vod_record` VALUES ('39', '20', '29', '1441100359', null, null, null);
INSERT INTO `users_vod_record` VALUES ('40', '20', '3', '1441100372', null, null, null);
INSERT INTO `users_vod_record` VALUES ('41', '3', '14', '1441188162', null, null, null);
INSERT INTO `users_vod_record` VALUES ('42', '20', '12', '1441509005', null, null, null);
INSERT INTO `users_vod_record` VALUES ('43', '20', '55', '1441509098', null, null, null);
INSERT INTO `users_vod_record` VALUES ('44', '20', '59', '1441509587', null, null, null);
INSERT INTO `users_vod_record` VALUES ('45', '20', '25', '1441512232', null, null, null);
INSERT INTO `users_vod_record` VALUES ('46', '20', '21', '1441512472', null, null, null);
INSERT INTO `users_vod_record` VALUES ('47', '14', '59', '1441521853', null, null, null);
INSERT INTO `users_vod_record` VALUES ('48', '14', '48', '1441532036', null, null, null);
INSERT INTO `users_vod_record` VALUES ('49', '14', '62', '1441533395', null, null, null);
INSERT INTO `users_vod_record` VALUES ('50', '3', '13', '1441591993', null, null, null);
INSERT INTO `users_vod_record` VALUES ('51', '3', '61', '1441605064', null, null, null);
INSERT INTO `users_vod_record` VALUES ('52', '3', '63', '1441605560', null, null, null);
INSERT INTO `users_vod_record` VALUES ('53', '15', '1', '1441960783', null, null, null);
INSERT INTO `users_vod_record` VALUES ('54', '15', '48', '1441960845', null, null, null);
INSERT INTO `users_vod_record` VALUES ('55', '15', '54', '1441960912', null, null, null);
INSERT INTO `users_vod_record` VALUES ('56', '15', '63', '1441960943', null, null, null);
INSERT INTO `users_vod_record` VALUES ('57', '15', '56', '1441960979', null, null, null);
INSERT INTO `users_vod_record` VALUES ('58', '15', '46', '1441960996', null, null, null);
INSERT INTO `users_vod_record` VALUES ('59', '15', '3', '1441961044', null, null, null);
INSERT INTO `users_vod_record` VALUES ('60', '15', '12', '1441961059', null, null, null);
INSERT INTO `users_vod_record` VALUES ('61', '15', '19', '1441961076', null, null, null);
INSERT INTO `users_vod_record` VALUES ('62', '20', '60', '1442386561', null, null, null);
INSERT INTO `users_vod_record` VALUES ('63', '20', '54', '1442389354', null, null, null);
INSERT INTO `users_vod_record` VALUES ('64', '20', '63', '1442390534', null, null, null);
INSERT INTO `users_vod_record` VALUES ('65', '20', '4', '1442392907', null, null, null);
INSERT INTO `users_vod_record` VALUES ('66', '20', '42', '1442482076', null, null, null);
INSERT INTO `users_vod_record` VALUES ('67', '14', '68', '1442557382', null, null, null);
INSERT INTO `users_vod_record` VALUES ('68', '14', '67', '1442559299', null, null, null);
INSERT INTO `users_vod_record` VALUES ('69', '15', '67', '1442570495', null, null, null);
INSERT INTO `users_vod_record` VALUES ('70', '20', '77', '1442908914', null, null, null);
INSERT INTO `users_vod_record` VALUES ('71', '3', '77', '1442909414', null, null, null);
INSERT INTO `users_vod_record` VALUES ('72', '20', '1', '1442912658', null, null, null);
INSERT INTO `users_vod_record` VALUES ('73', '20', '81', '1442979531', null, null, null);
INSERT INTO `users_vod_record` VALUES ('74', '20', '84', '1442979557', null, null, null);
INSERT INTO `users_vod_record` VALUES ('75', '20', '44', '1442988870', null, null, null);
INSERT INTO `users_vod_record` VALUES ('76', '20', '87', '1442988901', null, null, null);
INSERT INTO `users_vod_record` VALUES ('77', '20', '88', '1442989342', null, null, null);
INSERT INTO `users_vod_record` VALUES ('78', '15', '88', '1442989393', null, null, null);
INSERT INTO `users_vod_record` VALUES ('79', '15', '5', '1442989721', null, null, null);
INSERT INTO `users_vod_record` VALUES ('80', '15', '65', '1442989880', null, null, null);
INSERT INTO `users_vod_record` VALUES ('81', '15', '13', '1442993774', null, null, null);
INSERT INTO `users_vod_record` VALUES ('82', '15', '89', '1442995100', null, null, null);
INSERT INTO `users_vod_record` VALUES ('83', '20', '97', '1442999455', null, null, null);
INSERT INTO `users_vod_record` VALUES ('84', '25', '97', '1443081223', null, null, null);
INSERT INTO `users_vod_record` VALUES ('85', '25', '13', '1443081638', null, null, null);
INSERT INTO `users_vod_record` VALUES ('86', '25', '92', '1443081882', null, null, null);
INSERT INTO `users_vod_record` VALUES ('87', '25', '68', '1443428675', null, null, null);
INSERT INTO `users_vod_record` VALUES ('88', '25', '53', '1443428698', null, null, null);
INSERT INTO `users_vod_record` VALUES ('89', '25', '93', '1443429103', null, null, null);
INSERT INTO `users_vod_record` VALUES ('90', '25', '94', '1443430620', null, null, null);
INSERT INTO `users_vod_record` VALUES ('91', '25', '66', '1443433226', null, null, null);
INSERT INTO `users_vod_record` VALUES ('92', '25', '91', '1443600755', null, null, null);
INSERT INTO `users_vod_record` VALUES ('93', '25', '101', '1443603247', null, null, null);
INSERT INTO `users_vod_record` VALUES ('94', '25', '95', '1443605582', null, null, null);
INSERT INTO `users_vod_record` VALUES ('95', '21', '86', '1444028930', null, null, null);
INSERT INTO `users_vod_record` VALUES ('96', '21', '92', '1444028978', null, null, null);
INSERT INTO `users_vod_record` VALUES ('97', '30', '108', '1444377734', null, null, null);
INSERT INTO `users_vod_record` VALUES ('98', '25', '100', '1444382922', null, null, null);
INSERT INTO `users_vod_record` VALUES ('99', '30', '53', '1444442339', null, null, null);
INSERT INTO `users_vod_record` VALUES ('100', '30', '92', '1444442350', null, null, null);
INSERT INTO `users_vod_record` VALUES ('101', '34', '103', '1444564591', null, null, null);
INSERT INTO `users_vod_record` VALUES ('102', '33', '46', '1444618454', null, null, null);
INSERT INTO `users_vod_record` VALUES ('103', '33', '105', '1444618503', null, null, null);
INSERT INTO `users_vod_record` VALUES ('104', '30', '111', '1444658901', null, null, null);
INSERT INTO `users_vod_record` VALUES ('105', '34', '67', '1444659159', null, null, null);
INSERT INTO `users_vod_record` VALUES ('106', '33', '43', '1444728121', null, null, null);
INSERT INTO `users_vod_record` VALUES ('107', '33', '86', '1444728882', null, null, null);
INSERT INTO `users_vod_record` VALUES ('108', '33', '13', '1444729465', null, null, null);
INSERT INTO `users_vod_record` VALUES ('109', '33', '113', '1444749639', null, null, null);
INSERT INTO `users_vod_record` VALUES ('110', '30', '113', '1444900599', null, null, null);
INSERT INTO `users_vod_record` VALUES ('111', '30', '112', '1444900679', null, null, null);
INSERT INTO `users_vod_record` VALUES ('112', '30', '77', '1444985895', null, null, null);
INSERT INTO `users_vod_record` VALUES ('113', '30', '78', '1444985926', null, null, null);
INSERT INTO `users_vod_record` VALUES ('114', '30', '95', '1444989152', null, null, null);
INSERT INTO `users_vod_record` VALUES ('115', '30', '86', '1445221338', null, null, null);
INSERT INTO `users_vod_record` VALUES ('116', '30', '88', '1445221542', null, null, null);
INSERT INTO `users_vod_record` VALUES ('117', '30', '80', '1445221788', null, null, null);
INSERT INTO `users_vod_record` VALUES ('118', '30', '84', '1445222073', null, null, null);
INSERT INTO `users_vod_record` VALUES ('119', '30', '47', '1445223003', null, null, null);
INSERT INTO `users_vod_record` VALUES ('120', '30', '75', '1445223387', null, null, null);
INSERT INTO `users_vod_record` VALUES ('121', '31', '75', '1445223478', null, null, null);
INSERT INTO `users_vod_record` VALUES ('122', '30', '102', '1445223545', null, null, null);
INSERT INTO `users_vod_record` VALUES ('123', '30', '54', '1445224271', null, null, null);
INSERT INTO `users_vod_record` VALUES ('124', '30', '100', '1445224326', null, null, null);
INSERT INTO `users_vod_record` VALUES ('125', '30', '64', '1445249724', null, null, null);
INSERT INTO `users_vod_record` VALUES ('126', '33', '93', '1445308118', null, null, null);
INSERT INTO `users_vod_record` VALUES ('127', '34', '77', '1445667560', null, null, null);
INSERT INTO `users_vod_record` VALUES ('128', '30', '121', '1445776555', null, null, null);
INSERT INTO `users_vod_record` VALUES ('129', '30', '143', '1446175408', null, null, null);
INSERT INTO `users_vod_record` VALUES ('130', '30', '142', '1446175566', null, null, null);
INSERT INTO `users_vod_record` VALUES ('131', '30', '145', '1446449882', null, null, null);
INSERT INTO `users_vod_record` VALUES ('132', '30', '144', '1446453155', null, null, null);
INSERT INTO `users_vod_record` VALUES ('133', '48', '134', '1446458092', null, null, null);
INSERT INTO `users_vod_record` VALUES ('134', '48', '66', '1446458228', null, null, null);
INSERT INTO `users_vod_record` VALUES ('135', '48', '131', '1446458465', null, null, null);
INSERT INTO `users_vod_record` VALUES ('136', '31', '145', '1446532292', null, null, null);
INSERT INTO `users_vod_record` VALUES ('137', '31', '144', '1446532385', null, null, null);
INSERT INTO `users_vod_record` VALUES ('138', '31', '77', '1446533938', null, null, null);
INSERT INTO `users_vod_record` VALUES ('139', '31', '126', '1446534957', null, null, null);
INSERT INTO `users_vod_record` VALUES ('140', '31', '121', '1446534964', null, null, null);
INSERT INTO `users_vod_record` VALUES ('141', '31', '127', '1446534973', null, null, null);
INSERT INTO `users_vod_record` VALUES ('142', '31', '124', '1446534982', null, null, null);
INSERT INTO `users_vod_record` VALUES ('143', '31', '78', '1446535161', null, null, null);
INSERT INTO `users_vod_record` VALUES ('144', '31', '79', '1446535189', null, null, null);
INSERT INTO `users_vod_record` VALUES ('145', '31', '154', '1446536025', null, null, null);
INSERT INTO `users_vod_record` VALUES ('146', '31', '153', '1446536035', null, null, null);
INSERT INTO `users_vod_record` VALUES ('147', '31', '152', '1446536044', null, null, null);
INSERT INTO `users_vod_record` VALUES ('148', '31', '151', '1446536056', null, null, null);
INSERT INTO `users_vod_record` VALUES ('149', '31', '150', '1446536065', null, null, null);
INSERT INTO `users_vod_record` VALUES ('150', '31', '149', '1446536079', null, null, null);
INSERT INTO `users_vod_record` VALUES ('151', '30', '154', '1446536260', null, null, null);
INSERT INTO `users_vod_record` VALUES ('152', '30', '153', '1446536300', null, null, null);
INSERT INTO `users_vod_record` VALUES ('153', '30', '152', '1446536317', null, null, null);
INSERT INTO `users_vod_record` VALUES ('154', '30', '151', '1446536331', null, null, null);
INSERT INTO `users_vod_record` VALUES ('155', '33', '154', '1446536514', null, null, null);
INSERT INTO `users_vod_record` VALUES ('156', '33', '153', '1446536521', null, null, null);
INSERT INTO `users_vod_record` VALUES ('157', '33', '152', '1446536527', null, null, null);
INSERT INTO `users_vod_record` VALUES ('158', '33', '151', '1446536535', null, null, null);
INSERT INTO `users_vod_record` VALUES ('159', '3', '145', '1446691315', null, null, null);
INSERT INTO `users_vod_record` VALUES ('160', '22', '154', '1446775981', null, null, null);
INSERT INTO `users_vod_record` VALUES ('161', '30', '159', '1446776669', null, null, null);
INSERT INTO `users_vod_record` VALUES ('162', '32', '145', '1446778260', null, null, null);
INSERT INTO `users_vod_record` VALUES ('163', '30', '150', '1446781536', null, null, null);
INSERT INTO `users_vod_record` VALUES ('164', '25', '145', '1446812029', null, null, null);
INSERT INTO `users_vod_record` VALUES ('165', '25', '123', '1446812498', null, null, null);
INSERT INTO `users_vod_record` VALUES ('166', '25', '122', '1446812502', null, null, null);
INSERT INTO `users_vod_record` VALUES ('167', '25', '121', '1446812506', null, null, null);
INSERT INTO `users_vod_record` VALUES ('168', '25', '109', '1446812515', null, null, null);
INSERT INTO `users_vod_record` VALUES ('169', '25', '120', '1446812679', null, null, null);
INSERT INTO `users_vod_record` VALUES ('170', '25', '129', '1446813605', null, null, null);
INSERT INTO `users_vod_record` VALUES ('171', '25', '164', '1446866401', null, null, null);
INSERT INTO `users_vod_record` VALUES ('172', '3', '129', '1447034279', null, null, null);
INSERT INTO `users_vod_record` VALUES ('173', '3', '60', '1447035114', null, null, null);
INSERT INTO `users_vod_record` VALUES ('174', '3', '161', '1447035124', null, null, null);
INSERT INTO `users_vod_record` VALUES ('175', '15', '153', '1447136873', null, null, null);
INSERT INTO `users_vod_record` VALUES ('176', '15', '95', '1447136916', null, null, null);
INSERT INTO `users_vod_record` VALUES ('177', '15', '161', '1447137038', null, null, null);
INSERT INTO `users_vod_record` VALUES ('178', '15', '148', '1447137062', null, null, null);
INSERT INTO `users_vod_record` VALUES ('179', '15', '158', '1447137144', null, null, null);
INSERT INTO `users_vod_record` VALUES ('180', '15', '145', '1447137214', null, null, null);
INSERT INTO `users_vod_record` VALUES ('181', '15', '66', '1447137259', null, null, null);
INSERT INTO `users_vod_record` VALUES ('182', '15', '92', '1447137388', null, null, null);
INSERT INTO `users_vod_record` VALUES ('183', '15', '57', '1447137441', null, null, null);
INSERT INTO `users_vod_record` VALUES ('184', '15', '86', '1447138518', null, null, null);
INSERT INTO `users_vod_record` VALUES ('185', '15', '84', '1447138548', null, null, null);
INSERT INTO `users_vod_record` VALUES ('186', '15', '97', '1447146647', null, null, null);
INSERT INTO `users_vod_record` VALUES ('187', '41', '148', '1447576223', null, null, null);
INSERT INTO `users_vod_record` VALUES ('188', '41', '159', '1447817350', null, null, null);
INSERT INTO `users_vod_record` VALUES ('189', '41', '134', '1447817374', null, null, null);
INSERT INTO `users_vod_record` VALUES ('190', '25', '181', '1447916772', null, null, null);
INSERT INTO `users_vod_record` VALUES ('191', '25', '182', '1447917122', null, null, null);
INSERT INTO `users_vod_record` VALUES ('192', '33', '187', '1447926765', null, null, null);
INSERT INTO `users_vod_record` VALUES ('193', '33', '180', '1447926990', null, null, null);
INSERT INTO `users_vod_record` VALUES ('194', '46', '199', '1448867254', null, null, null);

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `level` varchar(10) DEFAULT NULL COMMENT '等级',
  `level_name` varchar(20) DEFAULT NULL COMMENT '等级名称',
  `rank` varchar(20) DEFAULT NULL COMMENT '头衔',
  `con` int(10) DEFAULT NULL COMMENT '贡献值',
  `exp` bigint(20) DEFAULT '0' COMMENT '经验值',
  `section` int(11) DEFAULT NULL COMMENT '板块数',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户等级';

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES ('1', 'Lv.0', '老百姓', '签到头衔1', '0', '0', '0');
INSERT INTO `user_level` VALUES ('2', 'Lv.1', '未入流', '签到头衔2', '54', '54', '54');
INSERT INTO `user_level` VALUES ('3', 'Lv.2', '从九品', '签到头衔3', '98', '98', '98');
INSERT INTO `user_level` VALUES ('4', 'Lv.3', '正九品', '签到头衔4', '212', '212', '212');
INSERT INTO `user_level` VALUES ('5', 'Lv.4', '从八品', '签到头衔5', '314', '314', '314');
INSERT INTO `user_level` VALUES ('6', 'Lv.5', '正八品', '签到头衔6', '333', '333', '333');
INSERT INTO `user_level` VALUES ('7', 'Lv.6', '从七品', '签到头衔7', '431', '431', '431');
INSERT INTO `user_level` VALUES ('8', 'Lv.7', '正七品', '签到头衔8', '450', '450', '450');
INSERT INTO `user_level` VALUES ('9', 'Lv.8', '从六品', '签到头衔9', '500', '500', '500');
INSERT INTO `user_level` VALUES ('10', 'Lv.9', '正六品', '签到头衔10', '700', '700', '700');

-- ----------------------------
-- Table structure for works_category
-- ----------------------------
DROP TABLE IF EXISTS `works_category`;
CREATE TABLE `works_category` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) NOT NULL COMMENT '分类名称',
  `isvalid` int(2) NOT NULL DEFAULT '1' COMMENT '有效',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '排序 降序+oid排序',
  `amount` decimal(16,2) DEFAULT '0.00' COMMENT '赠送杏币#审核成功后赠送',
  `content_type` int(2) DEFAULT '0' COMMENT '内容类型0 视频 1音频 2图片',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='作品一级分类管理';

-- ----------------------------
-- Records of works_category
-- ----------------------------
INSERT INTO `works_category` VALUES ('1', '原创视频', '1', '0', '2.00', '0', '1435046231', '1435046231', '1', '1');
INSERT INTO `works_category` VALUES ('2', '原创图片', '1', '0', '3.00', '1', '1435046231', '1435046231', '1', '1');
INSERT INTO `works_category` VALUES ('3', '电台嗨麦', '1', '0', '4.00', '2', '1435046231', '1435046231', '1', '1');

-- ----------------------------
-- Table structure for works_category_sec
-- ----------------------------
DROP TABLE IF EXISTS `works_category_sec`;
CREATE TABLE `works_category_sec` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) NOT NULL COMMENT '分类名称',
  `isvalid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '默认 0未删除 1删除',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '排序 降序+oid排序',
  `first_category_id` bigint(20) unsigned DEFAULT NULL COMMENT '一级分类',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='作品二级分类管理';

-- ----------------------------
-- Records of works_category_sec
-- ----------------------------
INSERT INTO `works_category_sec` VALUES ('1', '搞笑视频', '1', '0', '0', '1', '1435218020', '1436237101', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('2', '整蛊视频', '1', '0', '0', '1', '1435218020', '1435218020', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('3', '微电影', '1', '1', '0', '1', '1435218020', '1442981271', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('4', '原创歌曲', '1', '0', '0', '3', '1435218020', '1437200250', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('5', '模仿秀', '1', '0', '0', '3', '1435218020', '1437200264', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('6', '桌面风景', '1', '0', '0', '2', '1435218020', '1437200276', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('7', '美女', '1', '0', '0', '2', '1435218020', '1435218020', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('8', '搞笑图片', '1', '0', '0', '2', '1435218020', '1435218020', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('11', 'test', '1', '1', '0', '1', '1435632859', '1440562796', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('12', '小清新', '1', '0', '0', '2', '1439259421', '1439259421', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('13', '嗨嗨', '1', '1', '0', '3', '1440562808', '1440562811', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('14', '视频', '1', '1', '0', '2', '1440562819', '1440562824', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('15', '金星脱口秀', '1', '0', '0', '1', '1440950087', '1442887326', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('16', '个人写真', '1', '0', '0', '2', '1440950108', '1442887518', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('17', '经典老歌', '1', '0', '0', '3', '1440950128', '1442893925', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('18', '爸爸去哪了第三季', '1', '1', '0', '1', '1440950147', '1442896226', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('19', '视频122', '1', '1', '0', '3', '1445939996', '1445940041', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('20', '图片22', '1', '1', '0', '2', '1445940016', '1445940061', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('21', 'dddd', '1', '1', '0', '1', '1445940052', '1445940061', 'admin', 'admin');
INSERT INTO `works_category_sec` VALUES ('22', '午夜故事', '1', '0', '0', '3', '1446884785', '1446884785', 'admin01', 'admin01');
INSERT INTO `works_category_sec` VALUES ('23', '123', '1', '0', '0', '3', '1446885055', '1446885055', 'admin01', 'admin01');

-- ----------------------------
-- Table structure for works_library
-- ----------------------------
DROP TABLE IF EXISTS `works_library`;
CREATE TABLE `works_library` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(300) NOT NULL COMMENT '标题',
  `first_id` bigint(20) DEFAULT NULL COMMENT '一级分类id',
  `cid` bigint(20) unsigned NOT NULL COMMENT '分类',
  `utype` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型0 普通用户   1主播',
  `uid` bigint(20) NOT NULL COMMENT '用户编号',
  `uname` varchar(100) NOT NULL COMMENT '用户昵称  冗余字段',
  `desc` text NOT NULL COMMENT '介绍',
  `cover_thumb` varchar(300) NOT NULL COMMENT '封面小图(H：W=3：4等比缩放)',
  `cover_picurl` varchar(300) NOT NULL COMMENT '封面原图',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '价格 单位 杏币',
  `buy_num` int(11) DEFAULT '0' COMMENT '购买数',
  `gift_amount` decimal(16,2) DEFAULT '0.00' COMMENT '赠送杏币#审核成功后赠送',
  `fav_num` int(11) DEFAULT '0' COMMENT '收藏数',
  `com_num` int(11) DEFAULT '0' COMMENT '评论数',
  `view_num` int(11) DEFAULT '0' COMMENT '查看数',
  `review_status` int(2) DEFAULT '0' COMMENT '审核状态0 待内容审核 1内容审核通过待上线审核 2内容审核未通过 3上线审核通过  4上线审核未通过',
  `message` varchar(100) DEFAULT NULL COMMENT '审核说明（失败或成功）',
  `isdelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 默认0不是 1 删除',
  `createdtime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updatedtime` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  `is_draft` int(3) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='作品管理表\r\n仅当review_status 等于 3 前台才展示';

-- ----------------------------
-- Records of works_library
-- ----------------------------
INSERT INTO `works_library` VALUES ('1', '这条街', '1', '1', '1', '7', '青青草', 'asdfs', 'b901080c33/400_b901080c3374c85b1e6cedb3061bc453.jpg', 'b901080c33/b901080c3374c85b1e6cedb3061bc453.jpg', '10.00', '2', '0.00', '2147483647', '0', '556', '3', null, '0', '1435218020', '1442997505', '1', 'admin', null);
INSERT INTO `works_library` VALUES ('2', '测量师', '1', '2', '0', '1', 'admin', '大师傅熟练度噶艾斯黛拉额爱疯', 'wq', 'sdfs', '128.00', '0', '0.00', '675', '0', '494', '1', null, '1', '1435218020', '1437208587', '1', 'admin', null);
INSERT INTO `works_library` VALUES ('3', '蓝色眼泪', '1', '2', '1', '5', '为了将来不后悔', '123', 'e8ffeed75b/400_e8ffeed75bb06d55f51bdcd5f4f7ac11.jpg', 'e8ffeed75b/e8ffeed75bb06d55f51bdcd5f4f7ac11.jpg', '20.00', '2', '0.00', '417', '0', '378', '3', null, '0', '1436519720', '1442981225', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('4', '猫星人大战汪星人', '2', '8', '0', '14', '小刘女生', 'asdfasdasd', '9f0c25b650/400_9f0c25b650da01d4b9a41559e9f09170.png', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '10.00', '4', '0.00', '201', '0', '239', '3', null, '0', '1436520026', '1442997710', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('5', '测速作品', '2', '7', '1', '2', '明年今天', '阿萨德法师', '7b0a77cdac/300_7b0a77cdac32c47f772dc65346fd44d2.jpg', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '0.00', '2', '0.00', '200', '1', '230', '3', null, '0', '1437210340', '1444278250', 'admin', 'test_03', null);
INSERT INTO `works_library` VALUES ('6', '测速上传', '2', '7', '0', '2', '蓝色心情（主播）', 'asdfasdfasd', '', '', '200.00', '0', '0.00', '200', '0', '206', '0', null, '1', '1437211271', '1437211930', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('7', '测速上传', '2', '7', '0', '2', '蓝色心情（主播）', 'asdfasdfadsfas', '', '', '300.00', '0', '0.00', '200', '0', '206', '0', null, '1', '1437211367', '1437211927', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('8', '测速上传', '2', '7', '0', '2', '蓝色心情（主播）', 'asdfasdfadsfas', '', '', '300.00', '0', '0.00', '200', '0', '206', '0', null, '1', '1437211466', '1437211924', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('9', '测速上传', '2', '7', '0', '2', '蓝色心情（主播）', 'asdfasdfadsfas', '', '', '300.00', '0', '0.00', '200', '0', '206', '0', null, '1', '1437211485', '1437211920', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('10', '测速上传', '2', '7', '0', '2', '蓝色心情（主播）', 'asdfasdfadsfas', 'thumb/201507231531331993655b09855b3a6b_100.jpg', 'images/201507231531331993655b09855b3a6b.jpg', '300.00', '0', '0.00', '200', '0', '206', '3', null, '1', '1437211537', '1437746130', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('11', '测速上传', '1', '2', '0', '1', 'tianhong', '', 'thumb/201507231528061451555b0978699a87_100.jpg', 'images/201507231528061451555b0978699a87.jpg', '100.00', '0', '0.00', '458', '0', '338', '1', null, '1', '1437287229', '1440660772', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('12', '乡下漂亮妹妹', '3', '4', '0', '1', 'tianhong', '乡下漂亮妹妹', '1bebea5d8f/300_1bebea5d8fbd16f839b7c83b1837e858.jpg', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '100.00', '2', '0.00', '203', '0', '246', '3', null, '0', '1437728892', '1442896450', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('13', '无聊的忏悔', '1', '1', '1', '6', 'flytwo', '无聊的忏悔无聊的忏悔无聊的忏悔', '4c6e932087/400_4c6e9320872fe485e3f24e382ebc1533.jpg', '4c6e932087/4c6e9320872fe485e3f24e382ebc1533.jpg', '20.00', '5', '0.00', '2147483647', '0', '429', '3', null, '0', '1437728931', '1443428997', 'admin', 'rong', null);
INSERT INTO `works_library` VALUES ('14', '开心小布点', '1', '2', '0', '1', 'tianhong', '开心小布点开心小布点开心小布点', '1eeb75c035/400_1eeb75c0355782940fb9af2f733cefb4.jpg', '1eeb75c035/1eeb75c0355782940fb9af2f733cefb4.jpg', '99.00', '1', '0.00', '416', '0', '366', '3', null, '0', '1437728973', '1440989102', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('15', '忘了一夜的情', '2', '6', '0', '1', 'tianhong', '忘了一夜的情忘了一夜的情忘了一夜的情', '0eebd22c82/400_0eebd22c82712c451b2f77aaf42e986d.jpg', '0eebd22c82/0eebd22c82712c451b2f77aaf42e986d.jpg', '55.00', '1', '0.00', '244', '0', '228', '3', null, '0', '1437729021', '1440988940', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('16', '我想静静，静静视乎ui', '3', '4', '0', '1', 'tianhong', '我想静静，静静视乎ui我想静静，静静视乎ui我想静静，静静视乎ui', 'thumb/201507241711052967655b20129b3e41_100.JPG', 'images/201507241711052967655b20129b3e41.JPG', '0.00', '0', '0.00', '200', '0', '206', '3', null, '1', '1437729065', '1440562229', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('17', '萌萌达', '2', '7', '0', '1', 'tianhong', '萌萌达萌萌达萌萌达', 'thumb/201507241712103097055b2016a74386_100.jpg', 'images/201507241712103097055b2016a74386.jpg', '12.00', '0', '0.00', '200', '0', '206', '3', null, '1', '1437729130', '1439460191', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('18', '大家一起来', '2', '8', '0', '1', 'tianhong', '接受', '6fc9f3c83a/400_6fc9f3c83a2e2b615b758a452c22b5c5.png', '6fc9f3c83a/6fc9f3c83a2e2b615b758a452c22b5c5.png', '300.00', '1', '0.00', '200', '0', '233', '3', null, '0', '1437729158', '1440560911', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('19', '情爱的那不是爱情', '3', '4', '0', '1', 'tianhong', '情爱的那不是爱情情爱的那不是爱情情爱的那不是爱情', 'dafb8cfceb/400_dafb8cfceb01be457949ce7964679468.jpg', '', '10.00', '4', '0.00', '201', '0', '320', '3', null, '0', '1437729197', '1440754941', 'admin', 'rr', null);
INSERT INTO `works_library` VALUES ('20', '我就是我', '1', '1', '0', '1', 'tianhong', '我歌我唱，要唱的自由响亮', '439f9945f6/300_439f9945f6720ef7bcf5fe2ccff605ad.jpg', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '20.00', '0', '0.00', '2147483647', '0', '33', '3', null, '0', '1439174974', '1442809476', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('21', '好久不见', '1', '1', '0', '1', 'tianhong', '我歌我唱，要唱的自由响亮', '144fe980de/300_144fe980dec708e500ccc454107a0afb.jpg', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '20.00', '1', '0.00', '2147483647', '0', '47', '3', null, '0', '1439174981', '1442809530', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('22', '测试好大的雨啊', '1', '1', '0', '1', 'tianhong', '测试原创作品', 'd91317d0ac/400_d91317d0ac056c880538da7da3c1c095.gif', 'd91317d0ac/d91317d0ac056c880538da7da3c1c095.gif', '300.00', '0', '0.00', '2147483647', '0', '24', '3', null, '0', '1439175361', '1439175361', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('23', '我歌我唱', '1', '1', '0', '1', 'tianhong', '', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '10.00', '0', '0.00', '2147483647', '0', '12', '1', null, '1', '1439175445', '1440560666', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('24', '我歌我唱', '1', '1', '0', '2', '蓝色心情（主播）', '', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '10.00', '0', '0.00', '2147483647', '0', '12', '1', null, '1', '1439175457', '1440560658', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('25', '我歌我唱', '1', '1', '0', '1', 'tianhong', '我歌我唱，要唱的自由响亮', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '50.00', '1', '0.00', '2147483647', '0', '37', '3', null, '0', '1439175784', '1441011377', 'admin', 'lr', null);
INSERT INTO `works_library` VALUES ('26', '我歌我唱', '1', '1', '0', '1', 'tianhong', '', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '40.00', '0', '0.00', '2147483647', '0', '12', '3', null, '1', '1439175933', '1439351830', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('27', '我歌我唱', '1', '1', '0', '1', 'tianhong', '我歌我唱，要唱的自由响亮', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '50.00', '0', '0.00', '2147483647', '0', '12', '3', null, '1', '1439176016', '1440650377', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('28', '我歌我唱', '1', '1', '0', '1', 'tianhong', '我歌我唱，要唱的自由响亮', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '50.00', '0', '0.00', '2147483647', '0', '12', '3', null, '1', '1439176017', '1440650336', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('29', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '这是一个很好听的歌', '5063b31d0c/300_5063b31d0cbf0fb58bdc7910ab0a6e1b.jpg', '5063b31d0c/5063b31d0cbf0fb58bdc7910ab0a6e1b.jpg', '20.00', '1', '0.00', '20', '0', '34', '3', null, '0', '1439176059', '1442896851', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('30', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439176274', '1439192256', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('31', '羊羊羊', '2', '6', '0', '5', 'moongril', '原创图片，美丽的桌面风景图', '9f0c25b650/400_9f0c25b650da01d4b9a41559e9f09170.png', '', '50.00', '1', '0.00', '22', '0', '51', '3', null, '0', '1439176513', '1439187745', 'admin', 'Guest', null);
INSERT INTO `works_library` VALUES ('32', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439176717', '1439192256', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('33', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439176764', '1439192241', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('34', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439176797', '1439192241', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('35', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439176989', '1439192241', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('36', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439177064', '1439192234', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('37', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439177290', '1439192234', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('38', '方式的发生', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '125.00', '0', '0.00', '20', '0', '12', '3', null, '1', '1439177328', '1439192234', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('39', '小小儿歌', '2', '7', '0', '3', 'admin', '阳光下的雨露', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '20.00', '0', '0.00', '20', '0', '10', '3', null, '1', '1439179221', '1439192224', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('40', '小小儿歌', '2', '7', '0', '3', 'admin', '阳光下的雨露', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '20.00', '0', '0.00', '20', '0', '10', '3', null, '1', '1439179248', '1439192224', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('41', '小小儿歌', '2', '7', '0', '3', 'admin', '阳光下的雨露', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '20.00', '0', '0.00', '20', '0', '10', '3', null, '1', '1439180439', '1439192224', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('42', '水中鱼儿', '2', '7', '0', '1', 'tianhong', '我心飞翔', 'f1698dc24f/300_f1698dc24ff0b585a7cb34620a61564e.jpg', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '20.00', '6', '0.00', '20', '0', '44', '3', null, '0', '1439180503', '1442809778', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('43', '天注定', '1', '2', '0', '2', '蓝色心情（主播）', '阿斯顿发', '4931a5041c/300_4931a5041cf5dbf55bed2d3c5fe06065.jpg', '4931a5041c/4931a5041cf5dbf55bed2d3c5fe06065.jpg', '10.00', '6', '0.00', '22', '11', '78', '3', null, '0', '1439185730', '1444729160', 'admin', 'test_04', null);
INSERT INTO `works_library` VALUES ('44', '可歌可唱', '1', '2', '0', '4', 'tina', '不一样分风格', '16ede1c234/300_16ede1c23424a19c7e7208693dbcca86.jpg', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '20.00', '3', '0.00', '46', '0', '47', '3', null, '0', '1439188003', '1442981325', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('45', '画中之水', '1', '15', '0', '5', 'moongril', '一个人走', '419ab2c6a9/400_419ab2c6a930f7e51b42dfc18f997ef1.jpg', '419ab2c6a9/419ab2c6a930f7e51b42dfc18f997ef1.jpg', '40.00', '2', '0.00', '21', '0', '48', '3', null, '0', '1439189668', '1442981240', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('46', '见见聚聚', '2', '8', '0', '7', 'serven', '许久未见', '4eba3833d8/400_4eba3833d8b7770a3a4e37a77797943a.jpg', '', '50.00', '4', '0.00', '21', '4', '92', '3', null, '0', '1439190513', '1444027915', 'admin', 'franktester', null);
INSERT INTO `works_library` VALUES ('47', '一眼万年', '3', '4', '0', '10', 'iccool', '一眼万年', 'd415251193/400_d4152511931173a375d6fef5c2509deb.jpg', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '30.00', '2', '0.00', '20', '0', '36', '3', null, '0', '1439190866', '1439538967', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('48', '萌小草', '3', '5', '0', '11', 'kooew', '海洋之心', 'c610c53796/400_c610c5379604bbfd4e7efe836f4c3444.jpg', '', '50.00', '2', '0.00', '129', '1', '554', '3', null, '0', '1439190991', '1442392477', 'admin', 'rr', null);
INSERT INTO `works_library` VALUES ('49', '我心飞翔', '3', '4', '0', '6', 'flytwo', '真好听', '1c1a241a9f/400_1c1a241a9ff989a61573a4be6fd9e22b.jpg', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '20.00', '0', '0.00', '10', '0', '0', '3', null, '1', '1439348095', '1440562641', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('50', '我心飞翔', '3', '4', '0', '6', 'flytwo', '不错', '1c1a241a9f/400_1c1a241a9ff989a61573a4be6fd9e22b.jpg', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '20.00', '0', '0.00', '10', '0', '0', '3', null, '1', '1439348095', '1440650309', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('51', '江南风情江南风情江南风情江南风情江南风情江南风情江南风情江南', '1', '1', '1', '8', '就比你矮', '江南风情是有serven主播', 'a6dda09ffd/400_a6dda09ffd5a4011e39e48a7d11bde7e.jpg', 'a6dda09ffd/a6dda09ffd5a4011e39e48a7d11bde7e.jpg', '10.00', '0', '0.00', '2147483647', '0', '2', '3', null, '1', '1440488814', '1440556470', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('52', '不一样的风格', '1', '1', '1', '4', '分卡拉奇', '嗨嗨嗨', 'db52c7adfb/300_db52c7adfbc9497e0df301ea7f13f4b2.jpg', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '10.00', '0', '0.00', '2147483647', '0', '18', '3', null, '0', '1441079640', '1442896466', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('53', '玩具熊猫', '1', '2', '0', '14', '小刘女生', '1231231231', '439ef8b8de/300_439ef8b8de8c87c0f6616219f4e3c56a.jpg', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '10.00', '2', '0.00', '13', '0', '61', '3', null, '0', '1441079914', '1444380913', 'admin', 'test_04', null);
INSERT INTO `works_library` VALUES ('54', 'liu', '2', '16', '0', '20', 'rr', '看看', '1c1a241a9f/400_1c1a241a9ff989a61573a4be6fd9e22b.jpg', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '50.00', '5', '0.00', '10', '1', '59', '3', null, '0', '1441093047', '1443149265', 'rr', 'rong', '0');
INSERT INTO `works_library` VALUES ('55', '月光小夜曲', '1', '15', '0', '20', 'rr', '很好非常好', '9f0c25b650/400_9f0c25b650da01d4b9a41559e9f09170.png', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '30.00', '2', '0.00', '10', '0', '37', '3', null, '0', '1441093477', '1441093477', 'rr', 'rr', '0');
INSERT INTO `works_library` VALUES ('56', '错错错', '2', '12', '0', '20', 'rr', '萌嗒嗒', '095e9efc37/400_095e9efc37ac918fb56a682553f6a1c3.jpg', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '30.00', '5', '0.00', '19', '2', '115', '3', null, '0', '1441093826', '1442305004', 'rr', 'lr', '0');
INSERT INTO `works_library` VALUES ('57', '爸爸去哪儿', '1', '15', '0', '20', 'rr', '你好呀', 'd4b8e1d914/300_d4b8e1d914e9263651e1baabe2389981.jpg', 'd4b8e1d914/d4b8e1d914e9263651e1baabe2389981.jpg', '10.00', '4', '0.00', '10', '0', '49', '3', null, '0', '1441094096', '1442896183', 'rr', 'admin', '0');
INSERT INTO `works_library` VALUES ('58', '你好啊啊啊', '2', '8', '0', '13', 'yaolei', '12321321321', '7a28bd8df5/400_7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '100.00', '0', '0.00', '10', '0', '0', '1', null, '1', '1441188623', '1442288129', 'yaolei', 'admin', null);
INSERT INTO `works_library` VALUES ('59', '最新的啊啊', '2', '16', '0', '22', 'xiaosan', '啊似的撒旦撒旦撒的撒', '7a28bd8df5/400_7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '444.00', '2', '0.00', '10', '2', '31', '3', null, '0', '1441506290', '1441509782', 'xiaosan', 'rr', null);
INSERT INTO `works_library` VALUES ('60', '超有范', '1', '1', '1', '36', 'gaylen', '的说法', '70c0061dfc/300_70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '5.00', '2', '0.00', '2147483647', '1', '34', '3', null, '0', '1441508291', '1445249324', 'rr', 'test_01', null);
INSERT INTO `works_library` VALUES ('61', '第三方', '1', '15', '0', '20', 'rr', '啥发送到发送到风', '095e9efc37/400_095e9efc37ac918fb56a682553f6a1c3.jpg', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '10.00', '1', '0.00', '10', '0', '29', '3', null, '0', '1441508369', '1442896203', 'rr', 'admin', null);
INSERT INTO `works_library` VALUES ('62', 'mini菲儿', '1', '1', '0', '20', 'rr', '很好', '0ae35271e9/300_0ae35271e923bb0a128f386a2fc4e459.jpg', '0ae35271e9/0ae35271e923bb0a128f386a2fc4e459.jpg', '20.00', '1', '0.00', '2147483647', '2', '32', '3', null, '0', '1441508680', '1442896045', 'rr', 'admin', null);
INSERT INTO `works_library` VALUES ('63', '记你一夏', '2', '12', '0', '14', '地平线上的泪水', '很不错很萌', 'c610c53796/400_c610c5379604bbfd4e7efe836f4c3444.jpg', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '30.00', '3', '0.00', '19', '0', '107', '3', null, '0', '1441532615', '1441532615', '地平线上的泪水', '地平线上的泪水', null);
INSERT INTO `works_library` VALUES ('64', '地平线上的泪水之清晨的海边', '1', '1', '1', '36', 'gaylen', '紫陌红尘，蓦然回首。多少的春花秋月;多少的逝水沉香;多少的海誓山盟，如沿途的风景花开花谢。人世间的情缘触痛了多少无言的感慨，情深缘浅的风吹散了多 少相聚离散。花开是有情，花落是无意。来者是萍水相逢，去者是江湖相忘。缘起时，我在人群中看到你。缘灭时，你消失在人群中。', '1b695d4710/300_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '20.00', '1', '0.00', '2147483647', '1', '45', '3', null, '0', '1442205462', '1444984360', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('65', 'sadl', '1', '15', '0', '15', 'lr', 'asasdsadsd', 'ebb802bae3/300_ebb802bae337548f92242201e6434234.jpg', 'ebb802bae3/ebb802bae337548f92242201e6434234.jpg', '0.00', '1', '0.00', '10', '0', '29', '3', null, '1', '1442546651', '1447055199', 'lr', 'admin', null);
INSERT INTO `works_library` VALUES ('66', '世界故事', '1', '15', '1', '36', 'gaylen', '世界童话的故事', '64100da933/400_64100da9339607c2bbddd06a59978310.JPG', '64100da933/64100da9339607c2bbddd06a59978310.JPG', '5.00', '3', '0.00', '11', '0', '49', '3', null, '0', '1442548402', '1445667651', 'rong', 'test_05', null);
INSERT INTO `works_library` VALUES ('67', '黑色星期五', '1', '15', '1', '36', 'gaylen', '达发顺丰大师傅大神范德萨撒的发', '111a6bda23/400_111a6bda23bdd77cf5bba40ac690c171.jpg', '111a6bda23/111a6bda23bdd77cf5bba40ac690c171.jpg', '10.00', '3', '0.00', '10', '1', '54', '3', null, '0', '1442550484', '1444984248', 'rr', 'admin', null);
INSERT INTO `works_library` VALUES ('68', '记事本', '1', '2', '1', '33', 'test_04', '此网站只适合十八岁或以上人士观看。不可将此区的内容派发、传阅、出售、出租、交给或借予年龄未满18岁的人士或将本网站内容向该人士出示、播放或放映.如果你发现某些影片内容不合适，或者你是该影片的版权所有者而要求删除影片的，请联系我们，我们会很快做出回复。', '4eba3833d8/400_4eba3833d8b7770a3a4e37a77797943a.jpg', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '20.00', '2', '0.00', '10', '0', '30', '3', null, '0', '1442550715', '1444983097', 'rr', 'admin', null);
INSERT INTO `works_library` VALUES ('69', 'Qq秘密', '1', '2', '1', '10', 'iccool', '时间总是比我们想象的过的要快，我们来不及抓住，让那些重要的时光走了一个又一个，有太多闪现在脑海里，还有一些做完也来不及回味，结束也觉得心有不甘的事情……也正因残缺不全，回想起才味道十足，正如一桌好的酒菜，从来都是酸甜苦辣咸都要有才好一般。', 'e17cb4a809/300_e17cb4a80994c97d36894614ddabe9b1.jpg', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '10.00', '0', '0.00', '10', '0', '19', '3', null, '0', '1442806112', '1442822093', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('70', '海豚湾恋人', '3', '4', '1', '3', 'admin', '临水而立，望一泓秋水叶舞涟漪，那一片宁静似乎磨去所有似是而非的棱角，徜徉的心扉独留一隅纯净的空间，让那一米阳光的童话干净的就像故事的画面从无主角，而那一眼的回望，懂了心，忘了尘，为谁起，为谁落，我想用…', '7ea8ccddc1/300_7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '5.00', '0', '0.00', '10', '0', '10', '3', null, '0', '1442817193', '1442822075', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('71', '雨在下', '3', '5', '1', '4', 'tina', '岁月忽已晚,相离莫相忘\r\n好长时间不动笔写文字了，并不是淡化了文字在我生命中的含义，而是喜欢把太多的心事隐藏在寂静的心里，让许多无处安放的情感躲避尘世的喧嚣。\r\n人生真的很讽刺，很多快乐的时光总是…', '8146fed2ed/300_8146fed2ed86818410d3db39bfa35b21.jpg', '8146fed2ed/8146fed2ed86818410d3db39bfa35b21.jpg', '0.00', '0', '0.00', '10', '0', '25', '3', null, '0', '1442817567', '1442822393', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('72', '少年中国强', '3', '17', '1', '12', 'sheik', '窗外的阳光，甜而清淡，如指尖滴落的水珠，凉凉的。虽是浅秋，依旧浓绿，这样的时节，令人喜欢。\r\n前几天，应人之约，写篇讲课稿，踌躇多日，未曾动笔。今天终于打下“文字的境界”…', '8745c59738/300_8745c59738e06ccce4d129064a6fbed8.jpg', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '0.00', '0', '0.00', '10', '0', '22', '3', null, '0', '1442818664', '1442818664', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('73', 'Almost Lover', '3', '5', '1', '10', 'iccool', '轻捻时光，记忆的梗上往事开始肆无忌惮。些许情结，是埋在心底不愿提及的疼痛，像一阵轻盈的晚风，掠过，不留任何痕迹。只是来过，来去间，很轻很轻……\r\n生命，只是一场漂泊的漫旅，匆匆的脚步，匆匆的擦肩，来…', '6cf6234992/300_6cf6234992ef7faef4da577c55ad2f77.jpg', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '10.00', '0', '0.00', '10', '0', '12', '3', null, '0', '1442826070', '1442826095', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('74', '测试就是吊', '1', '1', '1', '3', 'admin', '测试就是吊我是测试我怕谁', '4c49e94a89/300_4c49e94a89213a3af23dadaf2c04bc16.jpg', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '10.00', '0', '0.00', '2147483647', '0', '31', '3', null, '0', '1442826099', '1442895962', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('75', 'Almost Lover', '3', '17', '1', '10', 'iccool', '那一年，磕头长匍匍山路/不为觐见/只为贴着您的温暖/那一世/转山转水转佛塔/不为修来世/只为途中与你相见/今天就为这一份薄薄的暖/就为这一缕浅浅的挂牵/我们情如手足。', '3e289a5625/300_3e289a56258d7783cf67837303c0e743.jpg', '3e289a5625/3e289a56258d7783cf67837303c0e743.jpg', '10.00', '2', '0.00', '10', '0', '42', '3', null, '0', '1442826368', '1442826368', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('76', '帝都', '3', '17', '1', '9', 'tree', '如果，情花有毒，思念是蛊，时间是否会稀释那眷恋，情伤是否不再肝肠寸断？——题记\r\n带着前缘旧梦和风尘满身，在三生石上刻下你的名，奈何桥头，望乡台上，一生牵挂，一世浮沉，却不饮那孟婆汤的忘情。一世痴愿…', '573f201591/300_573f2015911d0461e9713bf6e5249028.jpg', '573f201591/573f2015911d0461e9713bf6e5249028.jpg', '20.00', '0', '0.00', '10', '0', '22', '3', null, '0', '1442826687', '1442826687', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('77', '多余的解释', '3', '5', '1', '36', 'gaylen', '都说天涯与海角，只隔了心得距离，若是心在，天涯海角近在咫尺；丈量过后才知，隔着思念的墙，怎么翻越，都是细碎的忧伤，都是无尽的彷徨；原来思念亦如雨亦如风，淋漓在每一处，斑驳着经年，记忆凌乱不堪，踌躇万千…', '7f5c481567/300_7f5c48156783bbce9eb086bb09fa46ab.jpg', '7f5c481567/7f5c48156783bbce9eb086bb09fa46ab.jpg', '5.00', '5', '0.00', '10', '0', '129', '3', null, '0', '1442826811', '1444984234', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('78', '此情可待', '3', '17', '1', '35', 'test_06', '一直记得，你说过一句很暖的话，如果，有生之年我来不及去看你，你就选择在秋雨潇潇中把我忘记。那样，我或许还是你眼中那玲珑唯美的女子，有着青葱的容颜，有着安静的微笑，有着微凉的心事，还有着最寂静的想念。', '4b269c5a70/300_4b269c5a70498ade466431258e3e1230.jpg', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '30.00', '2', '0.00', '10', '0', '45', '3', null, '0', '1442894426', '1444984210', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('79', '爱情专属权', '3', '4', '1', '35', 'test_06', '女：早上起床心情很糟\r\n一直板着脸\r\n现在命令拿个凳子\r\n坐在我面前\r\n两只眼睛不许乱看\r\n盯着我的眼\r\n老实交代昨天晚上\r\n为何回家晚\r\n说出实情坦白从宽\r\n抗拒就从严\r\n遇见美女不许腿软\r\n更不准放电\r\n你要戴我送的项链\r\n挂我的照片\r\n后面写上生生世世\r\n爱我永不变\r\n我要对你实行我的\r\n爱情专属权\r\n你呀 不要委屈\r\n不要抱怨\r\n不要装可怜\r\n我要把你划入我的\r\n爱情包围圈\r\n享受到的男人\r\n最有幸福感\r\n我要对你实行我的\r\n爱情专属权\r\n你呀 不要委屈\r\n不要抱怨\r\n不要装可怜\r\n我要把你划入我的\r\n爱情包围圈\r\n享受到的男人\r\n最有幸福感\r\nrap: yeah yeah\r\n这是你的爱情\r\n我都知道\r\n这是你的拥抱\r\n我都想要\r\nyeah yeah\r\n你的爱情专属权\r\n你的爱情包围圈\r\n多么幸福的感觉\r\n无论海角天边\r\n我会在你身边\r\n不管多少时间\r\n又是一年春天\r\n相爱的誓言\r\n永远陪在你我之间\r\n女：这里不是旧社会\r\n没有三宫和六院\r\n请你一定一定彻底\r\n消除旧观念\r\n别想骗我别想哄我\r\n陪在我身边\r\n别的女人想都别想\r\n我就是永远\r\n心情好时你要请假\r\n陪我逛商店\r\n我想哭泣抱我在怀里\r\n像个男子汉\r\n为我提包\r\n为我刷卡\r\n吻着我的脸\r\n不管多久多远陪我\r\n海角天边\r\n我要对你实行我的\r\n爱情专属权\r\n你呀 不要委屈\r\n不要抱怨\r\n不要装可怜\r\n我要把你划入我的\r\n爱情包围圈\r\n享受到的男人\r\n最有幸福感\r\n我要对你实行\r\n我的爱情专属权\r\n你呀 不要委屈\r\n不要抱怨\r\n不要装可怜\r\n我要把你划入我的\r\n爱情包围圈\r\n享受到的男人\r\n最有幸福感\r\nrap:多么幸福\r\n幸福的感觉\r\n你的爱情我的专属\r\n别的女人我都不想\r\nyeah yeah\r\n你是永远\r\n不管多久 不管多远\r\n生生世世爱你不变\r\n相爱的誓言\r\n永远陪在你我之间\r\n', 'dee51a36cb/300_dee51a36cbafe39e6d32736fb16b98d2.jpg', 'dee51a36cb/dee51a36cbafe39e6d32736fb16b98d2.jpg', '20.00', '1', '0.00', '10', '0', '24', '3', null, '0', '1442976840', '1444984158', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('80', 'I miss you', '3', '4', '1', '33', 'test_04', '这一刻是我给你最后的机会\r\n用不着对我又吼又乱叫\r\n我一定对你是真心真意\r\n这你不用来质疑\r\n你的背叛已经伤了我太深\r\n我这是否应不应该太认真\r\n也许你以后会改变自己\r\n但我已决定必须离开你\r\ni miss you i miss you\r\ni miss you everyday\r\n只想看看你的脸\r\n想念你想念你想念你的欢笑\r\n整颗心已属于你\r\n你的背叛已经伤了我太深\r\n我这是否应不应该太认真\r\n也许你以后会改变自己\r\n但我已决定必须离开你\r\ni miss you i miss you\r\ni miss you everyday\r\n只想看看你的脸\r\n想念你想念你想念你的欢笑\r\n整颗心已属于你\r\ni miss you i miss you\r\ni miss you everyday\r\n只想看看你的脸\r\n想念你想念你想念你的欢笑\r\n整颗心已属于你\r\n罗百吉：i miss you i miss you\r\ni miss you everyday\r\n只想看看你的脸\r\n想念你想念你想念你的欢笑\r\n整颗心已属于你\r\n当时间随着那音乐流走\r\n我轻轻对你唱着这首歌\r\ni miss you i miss you\r\ni miss you everday\r\n只想看看你的脸\r\n想念你想念你想念你的欢笑\r\n整颗心已属于你\r\ni miss you想念你已属于你\r\n', 'aea596415e/300_aea596415e71d0a54e8fb5b3f83702fa.jpg', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '10.00', '1', '0.00', '10', '0', '29', '3', null, '0', '1442977281', '1444983742', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('81', 'Trouble Is A Friend', '3', '4', '1', '35', 'test_06', '--------\r\nTrouble will find you no matter where you go oh oh\r\nNo matter if you\'re fast no matter if you\'re slow oh oh\r\nThe eye of the storm wanna cry in the morn oh oh\r\nYou\'re fine for a while but you start to lose control\r\nHe\'s there in the dark he\'s there in my heart\r\nHe waits in the wings he\'s gotta play a part\r\nTrouble is a friend yeah trouble is a friend of mine\r\nAhh\r\nTrouble is a friend but trouble is a foe oh oh\r\nAnd no matter what I feed him he always seems to grow oh oh\r\nHe sees what I see and he knows what I know oh oh\r\nSo don\'t forget as you ease on down my road\r\nHe\'s there in the dark he\'s there in my heart\r\nHe waits in the wings he\'s gotta play a part\r\nTrouble is a friend yeah trouble is a friend of mine\r\nSo don\'t be alarmed if he takes you by the arm\r\nI roll down the window I\'m a sucker for his charm\r\nTrouble is a friend yeah trouble is a friend of mine\r\nAhh\r\nHow I hate the way he makes me feel\r\nAnd how I try to make him leave\r\nI try oh oh I try\r\nBut he\'s there in the dark he\'s there in my heart\r\nHe waits in the wings he\'s gotta play a part\r\nTrouble is a friend yeah trouble is a friend of mine\r\nSo don\'t be alarmed if he takes you by the arm\r\nI roll down the window I\'m a sucker for his charm\r\nTrouble is a friend yeah trouble is a friend of mine\r\nAhh\r\nOoh\r\nAhh\r\nOoh\r\n', '918d233811/300_918d233811e4ef1ed81ea6f6f9a5862f.jpg', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '30.00', '1', '0.00', '11', '0', '43', '3', null, '0', '1442977584', '1444984137', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('82', '新贵妃醉酒', '3', '5', '1', '34', 'test_05', '那一年的雪花飘落梅花开枝头\r\n那一年的华清池旁留下太多愁\r\n不要说谁是谁非感情错与对\r\n只想梦里与你一起再醉一回\r\n金雀钗玉搔头是你给我的礼物\r\n霓裳羽衣曲几番轮回为你歌舞\r\n剑门关是你对我深深的思念\r\n马嵬坡下愿为真爱魂断红颜\r\n爱恨就在一瞬间\r\n举杯对月情似天\r\n爱恨两茫茫\r\n问君何时恋\r\n菊花台倒影明月\r\n谁知吾爱心中寒\r\n醉在君王怀\r\n梦回大唐爱\r\n陛下 再来一杯吧\r\n我会给你快乐的 香\r\n金雀钗玉搔头是你给我的礼物\r\n霓裳羽衣曲几番轮回为你歌舞\r\n剑门关是你对我深深的思念\r\n马嵬坡下愿为真爱魂断红颜\r\n爱恨就在一瞬间\r\n举杯对月情似天\r\n爱恨两茫茫\r\n问君何时恋\r\n菊花台倒影明月\r\n谁知吾爱心中寒\r\n醉在君王怀\r\n梦回大唐爱\r\n爱恨就在一瞬间\r\n举杯对月情似天\r\n爱恨两茫茫\r\n问君何时恋\r\n菊花台倒影明月\r\n谁知吾爱心中寒\r\n醉在君王怀\r\n梦回大唐爱\r\n', '7fdf7c1a65/300_7fdf7c1a65b4fb3e43726463dda17f67.jpg', '7fdf7c1a65/7fdf7c1a65b4fb3e43726463dda17f67.jpg', '20.00', '0', '0.00', '10', '0', '27', '3', null, '0', '1442978655', '1444984051', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('83', '国色天香', '3', '5', '1', '33', 'test_04', '李玉刚 - 国色天香(Live)\r\n月初升 伶人上妆\r\n我描眉 凤冠配霓裳\r\n水袖轻舞长歌似酒香\r\n长歌似酒香\r\n夜未央 胡琴声扬\r\n弦温热 人聚月倚墙\r\n一阕曲弹出多少真相\r\n国色天香\r\n满堂红 名角登场\r\n我整装 铠甲配银枪\r\n十八般武艺威风亮相\r\n云漫天 搏风击浪\r\n战鼓擂 喊声天响\r\n刀光剑影里荡气回肠\r\n情不知所起 一往而深牡丹亭\r\n(rap rap)\r\n何必说落幕就是散场\r\n我却忍不住一直思量\r\n他们说旧戏文已泛黄\r\n我却当作是国色天香\r\n我却当作是国色天香\r\n一去人难见 芳草天涯桃花扇\r\n', 'e10775b5b2/300_e10775b5b235174e6a1903cb7dfb488a.jpg', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '10.00', '0', '0.00', '10', '0', '24', '3', null, '0', '1442978847', '1444983730', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('84', 'Hold不住的爱', '3', '5', '1', '33', 'test_04', '睁大了眼眸\r\n看不懂太多的理由\r\n人们追寻着自由\r\n却住进拥挤的高楼\r\n走进这人流 \r\n理解不透爱的追求\r\n如今谈的男朋友 \r\n却拉上别人的手\r\nHold不住的爱 \r\n感天动地在溜走\r\n舍不得放手 \r\n你像浮云不停留\r\nHold不住的爱 \r\n也逃不过爱情的忧愁\r\n谁是我的宝马王子 \r\n现实充满诱惑\r\n心里有团火 \r\n说不出来的失落\r\nhold不住的爱 \r\n活活的让人难受\r\n心里有团火 \r\n说不明白的承诺\r\nHold不住的爱 \r\n别再傻傻的等待\r\n经济发展快\r\n了解太多的缘由\r\n手机短信有木有\r\n真假的内容\r\n上网的QQ\r\n卿卿我我成朋友\r\n爱都昏过头\r\n别相信天长地久\r\n我不甘寂寞 \r\n脚步跟上潮流\r\nHold不住的追求\r\n要付诸东流\r\n我锲而不舍 \r\n也要脱胎换骨\r\n满足我的虚荣 \r\n明天会更美好\r\n睁大了眼眸\r\n看不懂太多的理由\r\n人们追寻着自由\r\n却住进拥挤的高楼\r\n走进这人流 \r\n理解不透爱的追求\r\n如今谈的男朋友 \r\n却拉上别人的手\r\nHold不住的爱 \r\n感天动地在溜走\r\n舍不得放手 \r\n你像浮云不停留\r\nHold不住的爱 \r\n也逃不过爱情的忧愁\r\n谁是我的宝马王子 \r\n现实充满诱惑\r\n心里有团火 \r\n说不出来的失落\r\nhold不住的爱 \r\n活活的让人难受\r\n心里有团火 \r\n说不明白的承诺\r\nHold不住的爱 \r\n别再傻傻的等待\r\nHold不住的爱 \r\n感天动地在溜走\r\n舍不得放手 \r\n你像浮云不停留\r\nHold不住的爱 \r\n也逃不过爱情的忧愁\r\n谁是我的宝马王子 \r\n现实充满诱惑\r\n心里有团火 \r\n说不出来的失落\r\nhold不住的爱 \r\n活活的让人难受\r\n心里有团火 \r\n说不明白的承诺\r\nHold不住的爱\r\n别再傻傻的等待\r\n心里有团火 \r\n说不出来的失落\r\nhold不住的爱 \r\n火火的让人难受\r\n心里有团火 \r\n说不明白的承诺\r\nHold不住的爱 \r\n别再傻傻的等待\r\n', '2a1501ae26/300_2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '2a1501ae26/2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '20.00', '3', '0.00', '10', '0', '36', '3', null, '0', '1442979219', '1444983644', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('85', '爱情美酒分给谁', '3', '5', '1', '34', 'test_05', '女：相爱的味道好美\r\n是美酒滋味\r\n幸福的时光太短\r\n过后真的累\r\n美酒掺入了苦水\r\n到底谁的错和罪\r\n为何幸福的日子\r\n容易被摧毁\r\n男：真爱是一杯美酒\r\n我宁愿喝醉\r\n爱情是一杯烈酒\r\n只容你我品味\r\n别人分享这美味\r\n变成毒酒一杯\r\n从此痛心直痛到\r\n灵魂麻醉\r\n合：爱情美酒分给谁\r\n不顾我体会\r\n心如刀割痛心扉\r\n滴滴血与泪\r\n爱情美酒分给谁\r\n爱已被摧毁\r\n柔情蜜意全是梦\r\n往事如烟飞\r\n爱情美酒分给谁\r\n不顾我体会\r\n我痛心你不后悔\r\n坦然去面对\r\n我怎么能去忍受\r\n三人同饮一杯\r\n别人碰过这酒杯\r\n就把爱全撕碎\r\n说唱：爱情是一杯美酒\r\n轻易就能让人喝醉\r\n爱上你是一杯烈酒\r\n容易让人心碎\r\n哪怕是心如刀割\r\n痛彻心扉\r\n再多困苦\r\n我愿把你追随\r\n尘缘如梦\r\n往事如烟\r\n曾经梦想\r\n千山万水\r\n唯有我们的爱\r\n情比金坚\r\n可如今\r\n被人碰过的爱情酒杯\r\n就像逝去的爱情\r\n被摧毁\r\n被撕碎\r\n女：真爱是一杯美酒\r\n我宁愿喝醉\r\n男：爱情是一杯烈酒\r\n只容你我品味\r\n女：别人分享这美味\r\n变成毒酒一杯\r\n合：从此痛心直痛到\r\n灵魂麻醉\r\n爱情美酒分给谁\r\n不顾我体会\r\n心如刀割痛心扉\r\n滴滴血与泪\r\n爱情美酒分给谁\r\n爱已被摧毁\r\n柔情蜜意全是梦\r\n往事如烟飞\r\n爱情美酒分给谁\r\n不顾我体会\r\n我痛心你不后悔\r\n坦然去面对\r\n我怎么能去忍受\r\n三人同饮一杯\r\n别人碰过这酒杯\r\n就把爱全撕碎\r\n', '321379e323/300_321379e323e7a78e27834fce46aa3e50.jpg', '321379e323/321379e323e7a78e27834fce46aa3e50.jpg', '10.00', '0', '0.00', '10', '0', '27', '3', null, '0', '1442979442', '1444982979', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('86', '真的爱你', '3', '17', '1', '33', 'test_04', '无法可修饰的一对手\r\n带出温暖永远在背后\r\n纵使啰嗦始终关注\r\n不懂珍惜太内疚\r\n沉醉于音阶她不赞赏\r\n母亲的爱却永未退让\r\n决心冲开心中挣扎\r\n亲恩终可报答\r\n春风化雨暖透我的心\r\n一生眷顾无言地送赠\r\n是你多么温馨的目光\r\n教我坚毅望着前路\r\n叮嘱我跌倒不应放弃\r\n没法解释怎可报尽亲恩\r\n爱意宽大是无限\r\n请准我说声真的爱你\r\n无法可修饰的一对手\r\n带出温暖永远在背后\r\n纵使啰嗦始终关注\r\n不懂珍惜太内疚\r\n仍记起温馨的一对手\r\n始终给我照顾未变样\r\n理想今天终于等到\r\n分享光辉盼做到\r\n春风化雨暖透我的心\r\n一生眷顾无言地送赠\r\n是你多么温馨的目光\r\n教我坚毅望着前路\r\n叮嘱我跌倒不应放弃\r\n没法解释怎可报尽亲恩\r\n爱意宽大是无限\r\n请准我说声真的爱你\r\n春风化雨暖透我的心\r\n一生眷顾无言地送赠\r\n是你多么温馨的目光\r\n教我坚毅望着前路\r\n叮嘱我跌倒不应放弃\r\n没法解释怎可报尽亲恩\r\n爱意宽大是无限\r\n请准我说声真的爱你\r\n是你多么温馨的目光\r\n教我坚毅望着前路\r\n叮嘱我跌倒不应放弃\r\n没法解释怎可报尽亲恩\r\n爱意宽大是无限\r\n请准我说声真的爱你\r\n', 'fd5e2c670c/300_fd5e2c670c08cf0efea1e381a0faa102.jpg', 'fd5e2c670c/fd5e2c670c08cf0efea1e381a0faa102.jpg', '0.00', '4', '0.00', '12', '12', '62', '3', null, '0', '1442979891', '1444983796', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('87', '爱很美', '3', '17', '1', '4', 'tina', '十月的天气 风吹过你的气息\r\n咬住爱的甜蜜 像夹心巧克力\r\n连懒懒的猫咪 也偷偷看你\r\n难以抗拒你的美丽\r\n裙摆摇不停 只为了与你相遇\r\n握住爱的甜蜜 写幸福的日记\r\n守我们的约定 不要它过期\r\n只想傻傻的赖着你\r\n你是我一首歌\r\n所有寂寞都随你降落\r\n我是你小奇迹\r\n收起任性只怕错过了你\r\nOh baby 爱 爱 爱你这一生只爱你\r\n闭上眼睛听见爱的花语\r\n用白色的蜡笔画一场婚礼\r\n度过每个四季 永不分离\r\nOh baby 愿 愿 愿意我什么都愿意\r\n抱紧我别错过爱的花期\r\n你手心里握着 彩色的秘密\r\n让我们来好好珍惜\r\n未来的记忆 填上的全都是你\r\n给你一个期许 就是如此确定\r\n是注定的命运 你别想逃离\r\n一起开始爱的旅行\r\n嘴角扬上去 两颗心慢慢靠近\r\n跟着爱的频率 心跳加速呼吸\r\n无名指上闪烁 幸福的原因\r\n爱你永远未完待续\r\n你是我一首歌\r\n所有寂寞都随你降落\r\n我是你小奇迹\r\n收起任性只怕错过了你\r\nOh baby 爱 爱 爱你这一生只爱你\r\n闭上眼睛听见爱的花语\r\n用白色的蜡笔画一场婚礼\r\n度过每个四季 永不分离\r\nOh baby 愿 愿 愿意我什么都愿意\r\n抱紧我别错过爱的花期\r\n你手心里握着 彩色的秘密\r\n让我们来好好珍惜\r\nOh baby 爱 爱 爱你这一生只爱你\r\n闭上眼睛听见爱的花语\r\n用白色的蜡笔画一场婚礼\r\n度过每个四季 永不分离\r\nOh baby 愿 愿 愿意我什么都愿意\r\n抱紧我别错过爱的花期\r\n你手心里握着 彩色的秘密\r\n让我们来好好珍惜\r\n你手心里握着 彩色的秘密\r\n让我们来好好珍惜\r\n', '606cab226e/300_606cab226e1f5c6b9fb14186137972a8.jpg', '606cab226e/606cab226e1f5c6b9fb14186137972a8.jpg', '30.00', '1', '0.00', '10', '0', '27', '3', null, '0', '1442980193', '1442981016', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('88', '城府', '3', '17', '1', '33', 'test_04', '你走之后 一个夏季熬成一个秋\r\n我的书上你的正楷眉清目秀\r\n一字一字宣告我们和平分手\r\n好委婉的交流 还带一点征求\r\n你已成风 幻化的雨下错了季候\r\n明媚的眼眸里温柔化为了乌有\r\n一层一层院墙把你的心困守\r\n如果没法回头 这样也没不妥\r\n你的城府有多深\r\n我爱得有多蠢\r\n是我太笨 还是太认真\r\n幻想和你过一生\r\n你的城府有多深\r\n我爱得有多蠢\r\n不想再问 也无法去恨\r\n毕竟你是我最爱的人\r\n曾经你的眼神 看起来那么单纯\r\n嗯 指向你干净的灵魂\r\n什么时候开始变得满是伤痕\r\n戴上假面也好 如果不会疼\r\n爱情这个世界 有那么多的悖论\r\n小心翼翼不见得就会获得满分\r\n我们之间缺少了那么多信任\r\n最后还是没有 打开那扇心门\r\n你的城府有多深\r\n我爱得有多蠢\r\n是我太笨 还是太认真\r\n幻想和你过一生\r\n你的城府有多深\r\n我爱得有多蠢\r\n不想再问 也无法去恨\r\n毕竟你是我最爱的人\r\n我曾经苦笑着问过我自己\r\n在某个夜里 卸下伪装的你\r\n是不是也会哭泣\r\n你的城府有多深\r\n我爱得有多蠢\r\n是我太笨 还是太认真\r\n幻想和你过一生\r\n你的城府有多深\r\n我爱得有多蠢\r\n不想再问 也无法去恨\r\n毕竟你是爱过我的人\r\n', '655707c221/300_655707c221e5b71a1a852244448872f4.jpg', '655707c221/655707c221e5b71a1a852244448872f4.jpg', '20.00', '3', '0.00', '10', '0', '51', '3', null, '0', '1442980349', '1444982964', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('89', '远方的孩子', '1', '2', '1', '3', 'admin', '你可以做阳光下艳丽娇嫩的牡丹，让世人艳羡；你可以做雄伟壮丽的河流，让世人赞许；你可以做山顶上高耸入云的大树，让世人惊叹。但在面对艳羡，赞许，惊叹的同时，不要忘记你的脚下是孕育你的土地，是承载你的河床，是支持你的高山，所以在我们面对一切美名的时候，请不要忘记，是实在的精神与依靠成就了我们。', '4e7bb494ed/300_4e7bb494ede22983f0b3cf3c660f625a.jpg', '4e7bb494ed/4e7bb494ede22983f0b3cf3c660f625a.jpg', '10.00', '1', '0.00', '10', '0', '21', '3', null, '0', '1442990297', '1442990297', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('90', '如果你', '1', '2', '1', '2', '蓝色心情（主播）', '风从水上走过，留下粼粼波纹，时间从树林走过留下圈圈年轮，我们从时代走过，能留下什么？朋友，我们应脚踏实地以待展翅高飞，像雁过留声一样人过留名。', '6cf6234992/300_6cf6234992ef7faef4da577c55ad2f77.jpg', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '20.00', '0', '0.00', '12', '0', '23', '3', null, '0', '1442990648', '1442990648', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('91', '美若黎明', '1', '2', '1', '1', 'tianhong', '有的人说：“我不思想，也可以美丽，因为我母亲赋予我美丽的容貌。”这美丽是暂时的，就像一辆新车，在油漆的掩盖下，他美丽；但随时间推移，油漆脱落，车身斑驳，发动机使用寿命一过，便会被人们所遗忘。思考产生的知识却如崭新的发动机一样是我们持续展示美丽的动力。勤加思考你才不会被时代所遗弃，才会美丽永驻。', 'd4651f7049/300_d4651f7049521e68e7fe0a6558b82cd0.jpg', 'd4651f7049/d4651f7049521e68e7fe0a6558b82cd0.jpg', '20.00', '1', '0.00', '10', '0', '28', '3', null, '0', '1442990738', '1442990738', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('92', '五环之歌', '1', '15', '1', '4', 'tina', '如果只看到太阳的黑点，那你的生活将缺少温暖；如果你只看到月亮的阴影，那么你的生命历程将难以找到光明；如果你总是发现朋友的缺点，你么你的人生旅程将难以找到知音；同样，如果你总希望自己完美无缺，假设你的这一愿望真的能如愿以偿，那么你最大的缺点就是没有缺点。', '144fe980de/300_144fe980dec708e500ccc454107a0afb.jpg', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '0.00', '4', '0.00', '10', '0', '51', '3', null, '0', '1442990880', '1442990880', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('93', '远处的背影', '2', '16', '1', '8', 'twotree', '生命是一枝铅笔，你可以用它为自己的未来设计充满喜悦与渴望的蓝图，也可以用灯下苦读的身影做细线条，勾勒出一幅充满活力的图画。生命是一枝铅笔，它还给予我们这样一个有力的启示——做人，要像它一样，时时刻刻把腰杆挺直！ ', 'db230f1915/300_db230f1915d8f6668f6caf4512c8e10e.jpg', 'db230f1915/db230f1915d8f6668f6caf4512c8e10e.jpg', '10.00', '2', '3.00', '10', '0', '37', '3', null, '0', '1442993433', '1442993433', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('94', '浮云下', '2', '12', '1', '1', 'tianhong', '开辟一方“空白”需要独立的精神，因为只有摆脱了依靠，我们才能真正专注于自己的天地。不愿开辟自己的天地，我想那是一种懦弱，他们怕风雨，怕劳苦，怕播种时节里遇到困难，怕收获季节里没有比别人大的果实。这样的顾虑束缚了多少人的手脚，他们不敢越雷池，更谈不上经历千难万险后拥有一片芬芳怡人的天地。', '6ba71f54a3/300_6ba71f54a3366a0c585ce72fa2f85046.jpg', '6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg', '5.00', '1', '3.00', '19', '0', '41', '3', null, '0', '1442993932', '1443605776', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('95', '五月花', '2', '7', '1', '34', 'test_05', '奔着幸福，我们苦苦寻觅。可是，幸福在哪儿？幸福该是沙漠中一片清凉的绿洲吧？我们跋山涉川，望眼欲穿，最终却只见到几丛沙棘；幸福该是大海中的一 颗闪亮的珍珠吧？我们涉江探海，寻踪觅迹，末了却只捡到几只贝壳；幸福该是旅途中的一座舒适的城堡吧？我们饥餐渴饮，夜往晓行，最后却只找到一处陋室；幸 福该是山那边的一处桃红杏黄的花果园吧？我们千辛万苦，气喘吁吁，终了却只见到几弯垂柳、几丛小草。其实我们不要把幸福太理想化了，世上本没有完整无缺的 幸福。', '6e62d4086d/300_6e62d4086d793fd6b14c4d03d842b70c.jpg', '6e62d4086d/6e62d4086d793fd6b14c4d03d842b70c.jpg', '20.00', '3', '3.00', '11', '0', '54', '3', null, '0', '1442994262', '1444983910', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('96', '想起', '3', '5', '1', '34', 'test_05', '歌曲 想起\r\n歌手 韩雪\r\n专集 飘雪（愤怒的蝴蝶主题曲）\r\n回到相遇的地点\r\n才知我对你不了解\r\n以为爱得深就不怕伤悲\r\n偏偏爱让心成雪\r\n我独自走在寂寞的长街\r\n回忆一幕幕重演\r\n我告诉自己勇敢去面对\r\n就算心碎也完美\r\n想起我和你牵手的画面\r\n泪水化成雨下满天\r\n如果我和你还能再见面\r\n就让情依旧梦能圆\r\n我们在不同的世界\r\n想着每一次的误会\r\n好想再一次依偎你身边\r\n偏偏你有千里远\r\n我独自走在寂寞的长街\r\n回忆一幕幕重演\r\n我告诉自己勇敢去面对\r\n就算心碎也完美\r\n想起我和你牵手的画面\r\n泪水化成雨下满天\r\n如果我和你还能再见面\r\n就让情依旧梦能圆\r\n想起我和你牵手的画面\r\n泪水化成雨下满天\r\n如果我和你还能再见面\r\n就让情依旧梦能圆\r\n想起我和你牵手的画面\r\n泪水化成雨下满天\r\n如果我和你还能再见面\r\n就让情依旧梦能圆\r\n就让情依旧梦能圆\r\n', '16cb976de0/300_16cb976de0bbe848a988b8b522d1fa68.jpg', '16cb976de0/16cb976de0bbe848a988b8b522d1fa68.jpg', '0.00', '0', '0.00', '11', '0', '28', '3', null, '0', '1442998047', '1444983860', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('97', '飘雪', '3', '5', '1', '7', 'serven', '忧郁的一片天\r\n飘着纷飞的雪\r\n这一泓伊豆的温泉\r\n竟是我孤单的思念\r\n飘零的一片叶\r\n就像你我的终结\r\n这一泓伊豆的温泉\r\n充满温暖的从前\r\n你的手曾经拥着我的肩\r\n呢喃着爱我直到永远\r\n雪花像绽放的礼花\r\n天地间肆意地飘洒\r\n纵情在一霎那\r\n为何现在只剩下\r\n风吹乱我的发\r\n撕开我记忆的伤疤\r\n让往事像雾气慢慢地蒸发\r\n让我知道什么叫放不下\r\n为何我的泪会不停地流下\r\n滑过你曾经亲吻的脸颊\r\n所有的对错在顷刻崩塌\r\n忧郁的一片天\r\n飘着纷飞的雪\r\n这一泓伊豆的温泉\r\n竟是我孤单的思念\r\n飘零的一片叶\r\n就像你我的终结\r\n这一泓伊豆的温泉\r\n充满温暖的从前\r\n你的手曾经拥着我的肩\r\n呢喃着爱我直到永远\r\n雪花像绽放的礼花\r\n天地间肆意地飘洒\r\n纵情在一霎那\r\n为何现在只剩下\r\n风吹乱我的发\r\n撕开我记忆的伤疤\r\n让往事像雾气慢慢地蒸发\r\n让我知道什么叫放不下\r\n为何我的泪会不停地流下\r\n滑过你曾经亲吻的脸颊\r\n所有的对错在顷刻崩塌\r\n原来你带走了\r\n我生命的暖春盛夏\r\n就连旧的果实\r\n也只在梦境里悬挂\r\n原来寻找的是\r\n我自己难了的牵挂\r\n这泓伊豆的温泉\r\n是天给的惩罚\r\n如果知道结局\r\n我们还会相爱吗\r\n我猜不到你的回答\r\n冰雪中的誓言是真心的吗\r\n怎么此刻什么也没留下\r\n现在只剩下风\r\n吹乱我的发\r\n雪掩埋记忆的伤疤\r\n往事就像雾气\r\n慢慢地蒸发\r\n痛到麻木也许就放得下\r\n就让我的泪\r\n不停地去冲刷\r\n冲刷你曾经亲吻的脸颊\r\n伸出手像露珠一样的冰雪\r\n那瞬间的落花仿佛在\r\n记得你和我的爱情童话\r\n', 'a688d86748/300_a688d8674800f2caab4493413c57d9d1.jpg', 'a688d86748/a688d8674800f2caab4493413c57d9d1.jpg', '10.00', '3', '0.00', '12', '2', '928', '3', null, '0', '1442998288', '1443149571', 'admin', 'liu', null);
INSERT INTO `works_library` VALUES ('98', '自动化测试', '1', '2', '0', '25', 'rong', '为什么使用自动化测试', '8745c59738/400_8745c59738e06ccce4d129064a6fbed8.jpg', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '5.00', '0', '3.00', '11', '0', '5', '3', null, '0', '1443429975', '1444380307', 'rong', 'test_01', null);
INSERT INTO `works_library` VALUES ('99', '天凉好个秋', '3', '5', '0', '5', 'moongril', '天凉好个秋，最是一年秋沧桑，曾经的群芳斗艳，如今花瓣雨飘满天；曾经的郁郁葱葱，今儿 “草木摇落露为霜”；昨夜西风独自凉，一季薄念，…', '4c49e94a89/300_4c49e94a89213a3af23dadaf2c04bc16.jpg', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '5.00', '0', '1.00', '10', '0', '1', '3', null, '0', '1443499694', '1443499694', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('100', '分公司', '2', '6', '1', '33', 'test_04', '方大化工', 'ba1af89c05/300_ba1af89c05565cbe28d97af07dd1f415.jpg', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '5.00', '2', '2.00', '11', '0', '46', '3', null, '0', '1443500998', '1444983846', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('101', '金秋', '2', '8', '1', '2', '蓝色心情（主播）', 'vfdfds ', '4b269c5a70/300_4b269c5a70498ade466431258e3e1230.jpg', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '10.00', '1', '0.00', '10', '0', '24', '3', null, '0', '1443602982', '1443605136', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('102', 'SDSD', '2', '6', '0', '15', 'lr', 'NULL', '6d7cd67fa8/300_6d7cd67fa84827fce36bee77cd521940.jpg', '6d7cd67fa8/6d7cd67fa84827fce36bee77cd521940.jpg', '10.00', '1', '2.00', '10', '0', '28', '3', null, '0', '1444028679', '1444028679', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('103', '33333', '3', '5', '0', '25', 'rong', '147258369', '57bcf4fceb/300_57bcf4fcebc90a12ba7a2d508b8fd542.jpg', '57bcf4fceb/57bcf4fcebc90a12ba7a2d508b8fd542.jpg', '1.00', '1', '1.00', '11', '0', '32', '3', null, '0', '1444029317', '1444380115', 'admin', 'test_01', null);
INSERT INTO `works_library` VALUES ('104', 'rong的作品', '2', '12', '0', '25', 'rong', 'rong的作品rong的作品rong的作品', 'a6f67ed349/400_a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', '50.00', '0', '3.00', '23', '0', '61', '3', null, '0', '1444278585', '1444381137', 'rong', 'test_01', null);
INSERT INTO `works_library` VALUES ('105', '美图秀秀', '2', '7', '1', '34', 'test_05', '很好看图作品', '439f9945f6/300_439f9945f6720ef7bcf5fe2ccff605ad.jpg', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '20.00', '1', '3.00', '10', '1', '14', '3', null, '0', '1444356155', '1445225128', 'admin', 'test_01', null);
INSERT INTO `works_library` VALUES ('106', '命中注定', '1', '1', '1', '12', 'sheik', 'A Fine Frenzy《Almost Lover》 http://t.cn/R2LTCVp 命中注定 \r\nGoodbye my almost lover，Goodbye my hopeless dream、、、My back is turned on you，Should\'ve known you\'d bring me heartache，Almost lovers always do', '1bebea5d8f/300_1bebea5d8fbd16f839b7c83b1837e858.jpg', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '5.00', '0', '2.00', '2147483647', '0', '1', '3', '0', '0', '1444356944', '1444357053', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('107', '无字碑', '3', '5', '1', '1', 'tianhong', '15', '144fe980de/300_144fe980dec708e500ccc454107a0afb.jpg', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '5.00', '0', '2.00', '10', '0', '3', '3', '0', '0', '1444372987', '1444372987', 'rong', 'rong', null);
INSERT INTO `works_library` VALUES ('108', '北国之春', '2', '6', '1', '36', 'gaylen', '很美', '16ede1c234/400_16ede1c23424a19c7e7208693dbcca86.jpg', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '2.00', '1', '3.00', '11', '0', '21', '3', null, '0', '1444377679', '1444982701', 'test_01', 'admin', null);
INSERT INTO `works_library` VALUES ('109', '如果未来', '1', '1', '0', '30', 'test_01', '远方的孩子', '439ef8b8de/400_439ef8b8de8c87c0f6616219f4e3c56a.jpg', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '5.00', '1', '2.00', '2147483647', '0', '8', '3', '0', '0', '1444442625', '1444442625', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('110', 'test', '2', '7', '1', '5', 'moongril', 'test', '561ca00b66/300_561ca00b66d593b9964bd7c44216203d.png', '561ca00b66/561ca00b66d593b9964bd7c44216203d.png', '1.00', '0', '3.00', '10', '2', '6', '3', null, '0', '1444564166', '1444564403', 'admin', 'test_05', null);
INSERT INTO `works_library` VALUES ('111', 'test图片', '2', '6', '0', '34', 'test_05', '30个杏币，收益应该为30%：70%', '4798b2cec2/300_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '30.00', '1', '0.00', '10', '0', '18', '3', null, '0', '1444658706', '1444658706', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('112', '免费', '3', '4', '1', '35', 'test_06', 'test', '4798b2cec2/300_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '0.00', '1', '2.00', '12', '3', '15', '3', null, '0', '1444748736', '1444749925', 'admin', 'test_06', null);
INSERT INTO `works_library` VALUES ('113', '收入20', '2', '6', '1', '35', 'test_06', 'test', '4798b2cec2/300_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '20.00', '2', '3.00', '11', '0', '22', '3', null, '0', '1444749405', '1444749920', 'admin', 'test_06', null);
INSERT INTO `works_library` VALUES ('114', 'test', '2', '6', '0', '35', 'test_06', 'test', '4798b2cec2/400_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '50.00', '0', '3.00', '10', '0', '5', '3', '0', '0', '1444749845', '1444749845', 'test_06', 'test_06', null);
INSERT INTO `works_library` VALUES ('115', '<script>alert(\'abc\')</script>', '2', '16', '0', '35', 'test_06', '<script>alert(\'abc\')</script>', '4798b2cec2/400_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '2.00', '0', '3.00', '10', '0', '6', '3', null, '1', '1444751000', '1444751876', 'test_06', 'admin', null);
INSERT INTO `works_library` VALUES ('116', '<script>alert(\'abc\')</script>', '2', '12', '0', '35', 'test_06', '<script>alert(\'abc\')</script>22', '7fe65f54a3/400_7fe65f54a3aeeffcf702c3a048958952.png', '7fe65f54a3/7fe65f54a3aeeffcf702c3a048958952.png', '222.00', '0', '3.00', '19', '0', '18', '4', 'fasd', '0', '1444751432', '1445941995', 'test_06', 'admin', null);
INSERT INTO `works_library` VALUES ('117', 'test', '2', '16', '0', '33', 'test_04', 'test', 'f153a4c16f/400_f153a4c16f42565170b040a007fed779.png', 'f153a4c16f/f153a4c16f42565170b040a007fed779.png', '1.00', '0', '10000.00', '10', '0', '6', '3', '0', '0', '1444805954', '1447054172', 'test_04', 'admin', null);
INSERT INTO `works_library` VALUES ('118', '测试1015', '2', '6', '1', '35', 'test_06', 'test', '82a862e687/300_82a862e6875ac1a48b87f633ff64a9bd.png', '82a862e687/82a862e6875ac1a48b87f633ff64a9bd.png', '110.00', '0', '3.00', '11', '1', '29', '3', null, '0', '1444899199', '1445225038', 'admin', 'test_01', null);
INSERT INTO `works_library` VALUES ('119', '秋风落叶', '2', '12', '0', '30', 'test_01', '反攻倒算个地方是公司的风格大概多少', '6ba71f54a3/400_6ba71f54a3366a0c585ce72fa2f85046.jpg', '6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg', '5.00', '0', '3.00', '19', '0', '19', '3', '0', '0', '1444986382', '1446813283', 'test_01', 'admin', null);
INSERT INTO `works_library` VALUES ('120', '美女', '2', '16', '0', '30', 'test_01', '啊实打实打算上的啊山东的撒旦撒啊是多少', '8b69a75c4c/400_8b69a75c4c280a1b002eef592b339252.jpg', '8b69a75c4c/8b69a75c4c280a1b002eef592b339252.jpg', '10.00', '1', '5.00', '10', '0', '9', '3', '0', '0', '1445229263', '1445229263', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('121', 'casd', '2', '16', '0', '30', 'test_01', '21321', '3a103184ca/400_3a103184cace7dfaf2c578385e66b970.jpg', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '111.00', '3', '3.00', '11', '0', '19', '3', '0', '0', '1445229604', '1445326337', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('122', 'ce', '2', '16', '0', '30', 'test_01', '12321', 'f382729526/400_f38272952631f7f0821a5592dde48608.jpg', 'f382729526/f38272952631f7f0821a5592dde48608.jpg', '100.00', '1', '3.00', '10', '0', '6', '3', '0', '0', '1445229760', '1445229760', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('123', '12321', '2', '16', '0', '30', 'test_01', '1231321', '3a103184ca/400_3a103184cace7dfaf2c578385e66b970.jpg', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '55.00', '1', '3.00', '10', '0', '26', '3', '0', '0', '1445229886', '1445229886', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('124', '原创图片啊', '2', '16', '0', '37', 'test-yaolei', '这个是说明啊', '3a103184ca/400_3a103184cace7dfaf2c578385e66b970.jpg', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '50.00', '1', '3.00', '10', '0', '8', '3', '0', '0', '1445235635', '1445235635', 'test-yaolei', 'test-yaolei', null);
INSERT INTO `works_library` VALUES ('125', '作品二', '2', '16', '0', '37', 'test-yaolei', '12321321', 'dcd1949b24/400_dcd1949b242a05c57b43394c3af571db.jpg', 'dcd1949b24/dcd1949b242a05c57b43394c3af571db.jpg', '100.00', '0', '3.00', '10', '0', '3', '3', '0', '0', '1445235733', '1445235733', 'test-yaolei', 'test-yaolei', null);
INSERT INTO `works_library` VALUES ('126', '中文可以打得你知道嘛', '2', '16', '0', '37', 'test-yaolei', '这个是说吗?', '3a103184ca/400_3a103184cace7dfaf2c578385e66b970.jpg', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '200.00', '1', '3.00', '10', '0', '5', '3', '0', '0', '1445238697', '1445932782', 'test-yaolei', 'admin', null);
INSERT INTO `works_library` VALUES ('127', '一二三', '2', '16', '0', '39', 'test-liurong', '后就会哭hihiu', 'ba1af89c05/400_ba1af89c05565cbe28d97af07dd1f415.jpg', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '10.00', '1', '3.00', '10', '0', '4', '3', '0', '0', '1445239528', '1445239528', 'test-liurong', 'test-liurong', null);
INSERT INTO `works_library` VALUES ('128', '秋风落叶', '2', '8', '0', '39', 'test-liurong', '发发生的发生的发生大发发松岛枫', 'bae5e69a4a/400_bae5e69a4a2dc9741dea4e9abe028683.jpg', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '5.00', '0', '3.00', '10', '0', '15', '3', '0', '0', '1445239860', '1445239860', 'test-liurong', 'test-liurong', null);
INSERT INTO `works_library` VALUES ('129', '作品102201', '2', '8', '1', '30', 'test_01', 'ddfasdfjasfksdfas', 'http://n.sinaimg.cn/default/20151021/MQtj-fxizwsm2256359.jpg', 'http://n.sinaimg.cn/default/20151021/MQtj-fxizwsm2256359.jpg', '2.39', '2', '3.00', '10', '0', '23', '3', '0', '0', '1445510065', '1446813297', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('130', '视频Aa001!@#111', '1', '1', '1', '34', 'test_05', '搞笑视频 主播test05111', '9d377b10ce/300_9d377b10ce778c4938b3c7e2c63a229a.jpg', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', '11.00', '0', '2.00', '13', '2', '33', '3', '上线审核通过Aa123!@#', '0', '1445849225', '1446457307', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('131', '原创图片Bb123!@#', '2', '7', '0', '40', 'test_09', '原创图片Bb123!@#fsadfasf', 'http://s.img.mix.sina.com.cn/auto/resize?size=560_0&magnify=0&img=http%3A%2F%2Fsinastorage.com%2Fstorage.service.mix.sina.com.cn%2F6849518710ec2aa71d7a21a98d925e64.jpg', 'http://s.img.mix.sina.com.cn/auto/resize?size=560_0&magnify=0&img=http%3A%2F%2Fsinastorage.com%2Fstorage.service.mix.sina.com.cn%2F6849518710ec2aa71d7a21a98d925e64.jpg', '21.00', '1', '3.00', '10', '0', '23', '3', '0', '1', '1445913918', '1447757193', 'admin', 'admin01', null);
INSERT INTO `works_library` VALUES ('132', '电台嗨麦经典老歌Cc!@#123', '3', '17', '0', '40', 'test_09', '电台嗨麦经典老歌Cc!@#123cccc', '1b695d4710/400_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '301.00', '0', '4.00', '10', '0', '29', '3', '0', '0', '1445915236', '1448955770', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('133', '整蛊视频Aa222!@#123脱口秀333', '1', '15', '1', '33', 'test_04', '整蛊视频Aa222!@#1232222脱口秀333', '52eb9712d5/300_52eb9712d5828d7e58877510d1cb6c3a.png', '52eb9712d5/52eb9712d5828d7e58877510d1cb6c3a.png', '113.00', '0', '0.00', '10', '0', '10', '0', null, '1', '1445917997', '1445926191', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('134', '经典老歌Cc302fa!@#123', '3', '17', '0', '40', 'test_09', '经典老歌Cc302fa!@#123fffffff', 'd6812f0dfe/300_d6812f0dfeb66bc293f87c070140754a.png', 'd6812f0dfe/d6812f0dfeb66bc293f87c070140754a.png', '32.00', '2', '4.00', '26', '0', '113', '3', '0', '0', '1445926338', '1445926338', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('135', 'fasdfasd33', '1', '15', '0', '40', 'test_09', 'fasdfasdfasdf33', '52eb9712d5/300_52eb9712d5828d7e58877510d1cb6c3a.png', '52eb9712d5/52eb9712d5828d7e58877510d1cb6c3a.png', '23.00', '0', '0.00', '10', '0', '10', '1', 'OK', '1', '1445926577', '1445940483', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('136', '栽植asf', '1', '1', '1', '36', 'gaylen', 'fasfafas', 'bdf3bf1da3/300_bdf3bf1da3405725be763540d6601144.jpg', 'bdf3bf1da3/bdf3bf1da3405725be763540d6601144.jpg', '11.00', '0', '0.00', '10', '0', '0', '0', null, '1', '1445940468', '1445940483', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('137', 'fasdfas', '1', '15', '0', '38', 'test-ulir', 'fasdfa', '9d377b10ce/300_9d377b10ce778c4938b3c7e2c63a229a.jpg', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', '11.00', '0', '0.00', '10', '0', '10', '0', null, '1', '1445940658', '1445940834', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('138', 'fasdfasdf', '2', '8', '1', '34', 'test_05', 'fasdfadf', '52eb9712d5/300_52eb9712d5828d7e58877510d1cb6c3a.png', '52eb9712d5/52eb9712d5828d7e58877510d1cb6c3a.png', '22.00', '0', '0.00', '10', '0', '0', '1', '0', '1', '1445940704', '1445940853', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('139', 'fasdfasdf', '3', '5', '0', '38', 'test-ulir', 'fasdfffasd', 'fafa5efeaf/300_fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'fafa5efeaf/fafa5efeaf3cbe3b23b2748d13e629a1.jpg', '33.00', '0', '0.00', '10', '0', '0', '0', null, '1', '1445940752', '1445940834', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('140', 'fasdfasdf', '3', '5', '1', '34', 'test_05', 'fasdfasdffasdfasd', 'fafa5efeaf/300_fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'fafa5efeaf/fafa5efeaf3cbe3b23b2748d13e629a1.jpg', '44.00', '0', '0.00', '10', '0', '0', '1', '0', '1', '1445940791', '1445940853', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('141', 'fasdfasdf', '2', '7', '0', '40', 'test_09', 'fasdfasdfa', 'fafa5efeaf/300_fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'fafa5efeaf/fafa5efeaf3cbe3b23b2748d13e629a1.jpg', '11.00', '0', '3.00', '10', '0', '0', '0', '33', '1', '1445940915', '1445940998', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('142', '测试图片1', '2', '6', '0', '41', 'faa123', '阿发你', '49d6702705/400_49d67027052ec73e9331625089724397.png', '49d6702705/49d67027052ec73e9331625089724397.png', '0.20', '1', '3.00', '10', '0', '6', '3', '0', '0', '1446102723', '1446102723', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('143', '发啊', '2', '7', '0', '41', 'faa123', '公司规定', 'bcbc06db5c/400_bcbc06db5c7edf4d7df3bbdfad667a32.png', 'bcbc06db5c/bcbc06db5c7edf4d7df3bbdfad667a32.png', '10.00', '1', '3.00', '12', '0', '17', '3', '0', '0', '1446102899', '1446176739', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('144', '视频01', '1', '15', '0', '44', 'p01', '放松放松', '602b770764/400_602b7707640aabd977d497df1f6abf33.png', '602b770764/602b7707640aabd977d497df1f6abf33.png', '50.05', '2', '4.50', '11', '1', '24', '3', '0', '0', '1446373271', '1446533572', 'p01', 'p01', null);
INSERT INTO `works_library` VALUES ('145', '图片01', '2', '16', '0', '44', 'p01', '必须的必V型', '22bc0b7db3/400_22bc0b7db32a0e14283d80ab6b7df6c4.jpg', '22bc0b7db3/22bc0b7db32a0e14283d80ab6b7df6c4.jpg', '30.99', '6', '0.01', '10', '1', '34', '3', '0', '0', '1446373387', '1446531577', 'p01', 'test_01', null);
INSERT INTO `works_library` VALUES ('146', 'chaoguchaoguo超过20张', '2', '16', '0', '34', 'test_05', '超过20', '4798b2cec2/400_4798b2cec23591e4783518b550d7173a.png', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', '0.00', '0', '0.00', '0', '0', '0', '0', null, '1', '1446522872', '1446869104', 'test_05', 'admin', null);
INSERT INTO `works_library` VALUES ('147', '视频数量', '1', '2', '0', '44', 'p01', '感受感受', 'c42a026d31/400_c42a026d31d3ef0899e5ba19e1334ef6.png', 'c42a026d31/c42a026d31d3ef0899e5ba19e1334ef6.png', '100.00', '0', '2.00', '0', '0', '4', '3', '0', '0', '1446533116', '1446533156', 'p01', 'admin01', null);
INSERT INTO `works_library` VALUES ('148', '主播test3测试视频', '1', '1', '0', '32', 'test_03', '发大水', '33ebd82836/400_33ebd8283669cc5882bf572f4dd71a98.jpg', '33ebd82836/33ebd8283669cc5882bf572f4dd71a98.jpg', '10.00', '2', '2.00', '0', '0', '25', '3', '0', '0', '1446534248', '1446534248', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('149', '主播测试图片03', '2', '6', '0', '32', 'test_03', '放松放松', '68830e360c/400_68830e360c78a888de22618996827b33.jpg', '68830e360c/68830e360c78a888de22618996827b33.jpg', '5.00', '1', '3.00', '0', '0', '3', '3', '0', '0', '1446534352', '1446534352', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('150', '测试02', '2', '8', '0', '32', 'test_03', '发送方式', '495c49f68c/400_495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '5.00', '2', '3.00', '0', '0', '9', '3', '0', '0', '1446535599', '1446535599', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('151', '测试03', '2', '16', '0', '32', 'test_03', '舒服舒服个个', 'a53802feac/400_a53802feaccd72eac3c8ef9868f3bed4.jpg', 'a53802feac/a53802feaccd72eac3c8ef9868f3bed4.jpg', '3.66', '3', '3.00', '0', '0', '6', '3', '0', '0', '1446535649', '1446535649', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('152', '测试04', '2', '12', '0', '32', 'test_03', '时光隧道', '68830e360c/400_68830e360c78a888de22618996827b33.jpg', '68830e360c/68830e360c78a888de22618996827b33.jpg', '5.66', '3', '3.00', '0', '0', '7', '3', '0', '0', '1446535685', '1446535685', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('153', '测试05', '2', '7', '0', '32', 'test_03', '放松放松', '495c49f68c/400_495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '2.33', '4', '3.00', '0', '0', '8', '3', '0', '0', '1446535777', '1446535777', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('154', '测试06', '2', '12', '0', '32', 'test_03', '舒服舒服', 'a53802feac/400_a53802feaccd72eac3c8ef9868f3bed4.jpg', 'a53802feac/a53802feaccd72eac3c8ef9868f3bed4.jpg', '3.22', '4', '3.00', '0', '0', '12', '3', '0', '0', '1446535811', '1446535811', 'test_03', 'test_03', null);
INSERT INTO `works_library` VALUES ('155', '测试音频01', '3', '5', '1', '32', 'test_03', '和润肤黄飞鸿', '68830e360c/300_68830e360c78a888de22618996827b33.jpg', '68830e360c/68830e360c78a888de22618996827b33.jpg', '10.23', '0', '4.00', '0', '0', '4', '3', '0', '0', '1446538404', '1446538404', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('156', '测试音频02', '3', '5', '1', '32', 'test_03', '更多更多', 'bdf3bf1da3/300_bdf3bf1da3405725be763540d6601144.jpg', 'bdf3bf1da3/bdf3bf1da3405725be763540d6601144.jpg', '2.52', '0', '4.00', '0', '0', '3', '3', '0', '0', '1446539561', '1446539561', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('157', '测试音频03', '3', '4', '1', '32', 'test_03', '孤独感', '9d377b10ce/300_9d377b10ce778c4938b3c7e2c63a229a.jpg', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', '10.00', '0', '4.00', '0', '0', '2', '3', '0', '0', '1446539651', '1446539651', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('158', '测试音频03', '3', '4', '1', '32', 'test_03', '放松放松', '2b04df3ecc/300_2b04df3ecc1d94afddff082d139c6f15.jpg', '2b04df3ecc/2b04df3ecc1d94afddff082d139c6f15.jpg', '9.00', '1', '4.00', '0', '0', '11', '3', '0', '0', '1446539707', '1446539707', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('159', '测试音频04', '3', '22', '1', '32', 'test_03', '飞洒发生吴三桂', 'ba45c8f604/300_ba45c8f60456a672e003a875e469d0eb.jpg', 'ba45c8f604/ba45c8f60456a672e003a875e469d0eb.jpg', '7.63', '2', '4.00', '0', '0', '35', '3', '0', '0', '1446539841', '1446884826', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('160', '测试音频05', '3', '5', '1', '32', 'test_03', '哈你烦不烦', '5a44c7ba5b/300_5a44c7ba5bbe4ec867233d67e4806848.jpg', '5a44c7ba5b/5a44c7ba5bbe4ec867233d67e4806848.jpg', '899999.00', '0', '0.00', '0', '0', '0', '2', '内容不好', '1', '1446540191', '1446881594', 'admin01', 'admin', null);
INSERT INTO `works_library` VALUES ('161', '天上的云懒散的在游走，你可知道我的忧愁', '2', '6', '0', '34', 'test_05', '风景优美', 'http://xx.53shop.com/uploads/allimg/c090325/123O6031L40-10I1R.jpg', 'http://xx.53shop.com/uploads/allimg/c090325/123O6031L40-10I1R.jpg', '5.00', '2', '3.00', '0', '0', '15', '3', '0', '1', '1446782654', '1447756252', 'admin', 'admin01', null);
INSERT INTO `works_library` VALUES ('162', '冬天的节奏', '2', '6', '0', '35', 'test_06', '很好哦', '11508222bb/400_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '5.00', '0', '3.00', '0', '0', '3', '3', '0', '0', '1446784794', '1446784794', 'test_06', 'test_06', null);
INSERT INTO `works_library` VALUES ('163', '12321321', '2', '6', '0', '30', 'test_01', '21321321321', '0eacd2e2e0/400_0eacd2e2e0a12edaf175de508b60b63e.jpg', '0eacd2e2e0/0eacd2e2e0a12edaf175de508b60b63e.jpg', '111.00', '0', '3.00', '0', '0', '0', '3', '0', '0', '1446798983', '1446798983', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('164', '愤怒的小鸟', '2', '8', '0', '30', 'test_01', '愤怒的小鸟', 'bfdd04b79d/400_bfdd04b79d2dedce05f13268d27546eb.jpg', 'bfdd04b79d/bfdd04b79d2dedce05f13268d27546eb.jpg', '10.00', '1', '3.00', '0', '0', '2', '3', '0', '0', '1446865565', '1446865565', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('165', '测试删除', '2', '8', '1', '30', 'test_01', '的撒发生的发生范德萨发生大幅', 'a82d5d789a/300_a82d5d789a427f179a65417bf6fb1792.jpg', 'a82d5d789a/a82d5d789a427f179a65417bf6fb1792.jpg', '5.00', '0', '0.00', '0', '0', '0', '1', '0', '1', '1446869253', '1446869291', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('166', 'ghhgghgh', '2', '16', '0', '30', 'test_01', '多少ADS', 'e0794b0967/400_e0794b09678b237f641d853faa49d676.jpg', 'e0794b0967/e0794b09678b237f641d853faa49d676.jpg', '6.00', '0', '3.00', '0', '0', '2', '3', '0', '0', '1446878026', '1446878026', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('167', '美图秀秀', '2', '12', '0', '30', 'test_01', '比较好将客户', '5c589429aa/400_5c589429aae3c30833fbf283599d26ff.jpg', '5c589429aa/5c589429aae3c30833fbf283599d26ff.jpg', '5.00', '0', '3.00', '0', '0', '9', '3', '0', '0', '1446878086', '1446878086', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('168', 'show', '2', '8', '0', '30', 'test_01', '放大师傅', 'd7c9651c3a/400_d7c9651c3a02089f89653f8e4ba80bee.jpg', 'd7c9651c3a/d7c9651c3a02089f89653f8e4ba80bee.jpg', '7.00', '0', '3.00', '0', '0', '7', '3', '0', '0', '1446878173', '1446878173', 'test_01', 'test_01', null);
INSERT INTO `works_library` VALUES ('169', '1110测试', '2', '16', '0', '41', 'faa123', '发顺丰', 'b24845ba8b/400_b24845ba8b3cf5dca748202c70729bde.png', 'b24845ba8b/b24845ba8b3cf5dca748202c70729bde.png', '5000.00', '0', '100000.00', '0', '0', '2', '3', '0', '0', '1447140151', '1447140151', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('170', '测试作品1501', '1', '2', '0', '48', 'test_99', '塔顶f', 'fc0a15632c/300_fc0a15632c42d7f1051eb2d6f5fcd770.png', 'fc0a15632c/fc0a15632c42d7f1051eb2d6f5fcd770.png', '3.00', '0', '0.00', '0', '0', '0', '1', 'ss', '1', '1447577904', '1447577941', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('171', '测试1502', '2', '7', '1', '34', 'test_05', '塔顶f', '9d377b10ce/400_9d377b10ce778c4938b3c7e2c63a229a.jpg', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', '7.00', '0', '8.00', '0', '0', '12', '3', 'fsd', '0', '1447578072', '1448025408', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('172', '20151117图片测试', '2', '16', '0', '44', 'p01', '发发', 'd3a939422b/400_d3a939422bf2f33ca8468242fcc85c5d.png', 'd3a939422b/d3a939422bf2f33ca8468242fcc85c5d.png', '10.00', '0', '3.00', '0', '0', '0', '3', '0', '0', '1447749721', '1447749721', 'p01', 'p01', null);
INSERT INTO `works_library` VALUES ('173', 'p01图片测试01', '2', '12', '0', '44', 'p01', 'hfhgf', '36c6758111/400_36c6758111a0de3ffb7409f27f64f821.png', '36c6758111/36c6758111a0de3ffb7409f27f64f821.png', '20.00', '0', '30000.00', '0', '0', '0', '3', '0', '0', '1447750593', '1447750593', 'p01', 'p01', null);
INSERT INTO `works_library` VALUES ('174', 'faa视频测试20151117', '1', '2', '0', '41', 'faa123', '哈飞股份', 'd6eed2b399/400_d6eed2b399798ac5f97aa62390ec525a.png', 'd6eed2b399/d6eed2b399798ac5f97aa62390ec525a.png', '100.00', '0', '10000.00', '0', '0', '21', '3', '0', '0', '1447751585', '1447751585', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('175', '图片url测试', '2', '6', '1', '41', 'faa123', '何润东', 'http://imgsrc.baidu.com/forum/pic/item/f59bc633c895d1437cec94d673f082025baf076d.jpg', 'http://imgsrc.baidu.com/forum/pic/item/f59bc633c895d1437cec94d673f082025baf076d.jpg', '100.00', '0', '3.00', '0', '0', '0', '3', '0', '1', '1447755956', '1447757271', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('176', '图片测试3', '2', '12', '0', '41', 'faa123', '瑞丰我堂哥', 'http://img4q.duitang.com/uploads/item/201411/09/20141109224803_GXSri.jpeg', 'http://img4q.duitang.com/uploads/item/201411/09/20141109224803_GXSri.jpeg', '4444.00', '0', '3.00', '0', '0', '0', '3', '0', '0', '1447756386', '1447756386', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('177', '1118', '2', '16', '0', '43', 'test01', 'hfhf', '464b10d616/400_464b10d6166e44a695c07520a94662b9.png', '464b10d616/464b10d6166e44a695c07520a94662b9.png', '10.00', '0', '1100.00', '40', '0', '126', '3', '0', '0', '1447829537', '1447829734', 'test01', 'admin01', null);
INSERT INTO `works_library` VALUES ('178', 'franktestingimg', '2', '7', '0', '50', 'xiaoliu', '测试', '610861a52a/300_610861a52a024ccad1fbf8ebe1d8c35d.jpg', '610861a52a/610861a52a024ccad1fbf8ebe1d8c35d.jpg', '20.00', '0', '3.00', '0', '0', '0', '3', '0', '1', '1447864831', '1447920606', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('179', '1119', '2', '16', '0', '41', 'faa123', 'vv', '076e3caed7/400_076e3caed758a1c18c91a0e9cae3368f.jpg', '076e3caed7/076e3caed758a1c18c91a0e9cae3368f.jpg', '10.00', '0', '3.00', '0', '0', '2', '3', '0', '0', '1447897877', '1447897877', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('180', '冯绍峰的送', '1', '15', '0', '41', 'faa123', '风飞沙', '9d377b10ce/400_9d377b10ce778c4938b3c7e2c63a229a.jpg', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', '33.00', '1', '2.00', '1', '0', '8', '3', '0', '1', '1447898052', '1447927034', 'faa123', 'admin', null);
INSERT INTO `works_library` VALUES ('181', '测试精彩推荐', '2', '12', '1', '31', 'test_02', '很好看', '11508222bb/300_11508222bb7b38e24cbe41c6afa6243c.jpg', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', '100.00', '1', '3.00', '0', '0', '14', '3', '0', '1', '1447915492', '1447920299', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('182', 'ftgregdsf', '2', '8', '1', '31', 'test_02', 'dafdasfdsa', '095e9efc37/300_095e9efc37ac918fb56a682553f6a1c3.jpg', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '20.00', '1', '3.00', '1', '0', '6', '3', '0', '1', '1447916844', '1447920712', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('183', '我的作品啊', '2', '16', '0', '3', 'admin', '请问打的撒的撒打算', '01ae3307d9/400_01ae3307d946baf42ebc5e3a603431ab.jpg', '01ae3307d9/01ae3307d946baf42ebc5e3a603431ab.jpg', '20.00', '0', '10.00', '0', '0', '0', '3', '0', '0', '1447921229', '1447921229', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('184', '最新作品啊啊啊啊啊', '2', '16', '0', '3', 'admin', '阿斯顿撒', '01ae3307d9/400_01ae3307d946baf42ebc5e3a603431ab.jpg', '01ae3307d9/01ae3307d946baf42ebc5e3a603431ab.jpg', '20.00', '0', '5.00', '1', '0', '11', '3', '0', '0', '1447922552', '1447926968', 'admin', 'test_04', null);
INSERT INTO `works_library` VALUES ('185', '手艺（收益）', '2', '12', '1', '31', 'test_02', '第三法师打发斯蒂芬', '4eba3833d8/300_4eba3833d8b7770a3a4e37a77797943a.jpg', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '20.00', '0', '0.00', '0', '0', '0', '0', null, '1', '1447924925', '1447924930', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('186', '手艺（收益）', '2', '8', '1', '31', 'test_02', '手动阀发送到发送到', '4eba3833d8/300_4eba3833d8b7770a3a4e37a77797943a.jpg', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '20.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1447925054', '1447925054', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('187', '花花草草', '2', '7', '1', '31', 'test_02', '大放大时发生', '1b695d4710/300_1b695d47103295f3df69bec23a04e85e.jpg', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', '30.00', '1', '3.33', '1', '0', '6', '3', '0', '1', '1447925124', '1447926823', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('188', '更多更多', '2', '7', '1', '45', 'p02', '孤独感', 'http://img4q.duitang.com/uploads/item/201504/17/20150417H1719_VzWQv.jpeg', 'http://img4q.duitang.com/uploads/item/201504/17/20150417H1719_VzWQv.jpeg', '10.00', '0', '3.00', '0', '0', '3', '3', '0', '0', '1448337179', '1448337179', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('189', '放松放松', '2', '12', '1', '36', 'gaylen', '不舍得vgd', 'http://ww1.sinaimg.cn/mw600/8758e340jw1e80ptpik3sj21hc0u0gxb.jpg', 'http://ww1.sinaimg.cn/mw600/8758e340jw1e80ptpik3sj21hc0u0gxb.jpg', '30.00', '0', '3.00', '0', '0', '0', '3', '0', '0', '1448337494', '1448337494', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('190', 'vs唱收唱付', '2', '12', '1', '45', 'p02', 'vv', 'fafa5efeaf/400_fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'fafa5efeaf/fafa5efeaf3cbe3b23b2748d13e629a1.jpg', '7.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448337713', '1448337713', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('191', 'vs唱收唱付', '2', '12', '1', '45', 'p02', 'vv', 'fafa5efeaf/400_fafa5efeaf3cbe3b23b2748d13e629a1.jpg', 'fafa5efeaf/fafa5efeaf3cbe3b23b2748d13e629a1.jpg', '7.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448337713', '1448337713', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('192', '测试图片', '2', '16', '0', '42', 'faa12', '孤独感风', '495c49f68c/400_495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '10.00', '0', '100000.00', '0', '0', '1', '3', '0', '0', '1448355860', '1448355860', 'faa12', 'faa12', null);
INSERT INTO `works_library` VALUES ('193', 'Lemo Hire', '2', '6', '0', '3', 'admin', 'Promotion', 'e00b741578/400_e00b741578403b1a5a78492cec786de3.jpg', 'e00b741578/e00b741578403b1a5a78492cec786de3.jpg', '10.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448480577', '1448480577', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('194', 'caesar', '2', '12', '0', '3', 'admin', 'sdsdsd', 'e00b741578/400_e00b741578403b1a5a78492cec786de3.jpg', 'e00b741578/e00b741578403b1a5a78492cec786de3.jpg', '23.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448504005', '1448504005', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('195', 'QQ秀', '1', '1', '1', '39', 'test-liurong', '啊大所发生的', '70c0061dfc/400_70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '20.00', '0', '2.00', '0', '0', '0', '3', '0', '0', '1448611476', '1448611476', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('196', '122233', '2', '7', '1', '39', 'test-liurong', 'fsfs', '8c487e742a/400_8c487e742a2763f838c5d17e7c4cda39.png', '8c487e742a/8c487e742a2763f838c5d17e7c4cda39.png', '233.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448699798', '1448699798', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('197', 'cacsca', '2', '8', '0', '49', 'dfsgda', 'ccsc', 'f8dddb234f/400_f8dddb234f467969ad3a1b05798ac828.png', 'f8dddb234f/f8dddb234f467969ad3a1b05798ac828.png', '2222.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448699883', '1448699883', 'admin01', 'admin01', null);
INSERT INTO `works_library` VALUES ('198', 'cshi01', '2', '16', '0', '41', 'faa123', 'hfhf ', 'f8dddb234f/400_f8dddb234f467969ad3a1b05798ac828.png', 'f8dddb234f/f8dddb234f467969ad3a1b05798ac828.png', '14.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1448702372', '1448702372', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('199', 'script type\"textJavaScript\"      alert\"purple会武术谁也挡不住\" script', '2', '16', '0', '41', 'faa123', '飞洒发生', 'cb2604fe21/400_cb2604fe214779da8c5f0c3d73a13933.png', 'cb2604fe21/cb2604fe214779da8c5f0c3d73a13933.png', '12.00', '1', '3.00', '0', '0', '8', '3', '0', '0', '1448866286', '1448866286', 'faa123', 'faa123', null);
INSERT INTO `works_library` VALUES ('200', 'fsfsfs', '2', '16', '0', '46', 'p03', 'gsgsg', 'e154354003/400_e15435400375f43b1d556aa76d69c3b2.jpg', 'e154354003/e15435400375f43b1d556aa76d69c3b2.jpg', '10.00', '0', '1400000000.00', '0', '0', '2', '3', '0', '0', '1448866862', '1448866862', 'p03', 'p03', null);
INSERT INTO `works_library` VALUES ('201', '离开', '1', '15', '1', '39', 'test-liurong', '发过一份关于服用体育', '7752f5b11a/400_7752f5b11a3156d18685b9ffc22bba1b.jpg', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '20.00', '0', '2.00', '0', '0', '1', '3', '0', '0', '1449025319', '1449025319', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('202', '一二一', '1', '1', '1', '36', 'gaylen', '大发生大发', '1c1a241a9f/400_1c1a241a9ff989a61573a4be6fd9e22b.jpg', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '20.00', '0', '2.00', '0', '0', '0', '3', '0', '0', '1449025643', '1449028346', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('203', '北京的春天', '1', '1', '1', '35', 'test_06', '大发发顺丰', '9f0c25b650/400_9f0c25b650da01d4b9a41559e9f09170.png', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '30.00', '0', '2.00', '0', '0', '0', '3', '0', '0', '1449028503', '1449028503', 'admin', 'admin', null);
INSERT INTO `works_library` VALUES ('204', '咱们', '1', '1', '1', '34', 'test_05', '按时大大撒打算', '4eba3833d8/400_4eba3833d8b7770a3a4e37a77797943a.jpg', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '30.00', '0', '0.00', '0', '0', '0', '0', null, '0', '1449029440', '1449029847', 'admin', 'admin', null);

-- ----------------------------
-- Table structure for works_library_attach
-- ----------------------------
DROP TABLE IF EXISTS `works_library_attach`;
CREATE TABLE `works_library_attach` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `file_type` int(2) DEFAULT '0' COMMENT '文件类型0 上传 1URL',
  `file_url` varchar(1000) DEFAULT NULL COMMENT '文件地址',
  `file_name` varchar(200) NOT NULL COMMENT '文件名称只用于展示 file_type 为0时有效',
  `works_library_id` bigint(20) DEFAULT NULL COMMENT '作品',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createduser` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=1614 DEFAULT CHARSET=utf8 COMMENT='作品资源明细-当是视频和音频的时候，只有一条数据\r\n如果是图片，则有多条数据';

-- ----------------------------
-- Records of works_library_attach
-- ----------------------------
INSERT INTO `works_library_attach` VALUES ('55', '0', '1', '1', '22', '1439175361', 'admin', '1439175361', 'admin');
INSERT INTO `works_library_attach` VALUES ('56', '0', '0', '0', '22', '1439175361', 'admin', '1439175361', 'admin');
INSERT INTO `works_library_attach` VALUES ('57', '0', '2', '2', '23', '1439175445', 'admin', '1439175445', 'admin');
INSERT INTO `works_library_attach` VALUES ('58', '0', '', '', '23', '1439175445', 'admin', '1439175445', 'admin');
INSERT INTO `works_library_attach` VALUES ('63', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '24', '1439175792', 'admin', '1439175792', 'admin');
INSERT INTO `works_library_attach` VALUES ('65', '0', '2', '2', '26', '1439175933', 'admin', '1439175933', 'admin');
INSERT INTO `works_library_attach` VALUES ('66', '0', '', '', '26', '1439175933', 'admin', '1439175933', 'admin');
INSERT INTO `works_library_attach` VALUES ('67', '0', '2', '2', '27', '1439176016', 'admin', '1439176016', 'admin');
INSERT INTO `works_library_attach` VALUES ('68', '0', '', '', '27', '1439176016', 'admin', '1439176016', 'admin');
INSERT INTO `works_library_attach` VALUES ('73', '0', '2', '2', '30', '1439176274', 'admin', '1439176274', 'admin');
INSERT INTO `works_library_attach` VALUES ('74', '0', '', '', '30', '1439176274', 'admin', '1439176274', 'admin');
INSERT INTO `works_library_attach` VALUES ('79', '0', '11508222bb/11508222bb7b38e24cbe41c6afa6243c.jpg', 'IMG_20140810_100118.jpg', '31', '1439176556', 'admin', '1439176556', 'admin');
INSERT INTO `works_library_attach` VALUES ('80', '0', '431a4cf194/431a4cf194a7db7738bd1f0ba12eeed5.jpg', 'IMG_20150321_155532.jpg', '31', '1439176556', 'admin', '1439176556', 'admin');
INSERT INTO `works_library_attach` VALUES ('81', '0', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', 'IMG_20150406_134804.jpg', '31', '1439176556', 'admin', '1439176556', 'admin');
INSERT INTO `works_library_attach` VALUES ('82', '0', 'b6c258002e/b6c258002ee6c9194ffab0b5531db499.jpg', 'IMG_20150622_142157.jpg', '31', '1439176556', 'admin', '1439176556', 'admin');
INSERT INTO `works_library_attach` VALUES ('83', '0', '2', '2', '32', '1439176717', 'admin', '1439176717', 'admin');
INSERT INTO `works_library_attach` VALUES ('84', '0', '', '', '32', '1439176717', 'admin', '1439176717', 'admin');
INSERT INTO `works_library_attach` VALUES ('85', '0', '2', '2', '34', '1439176797', 'admin', '1439176797', 'admin');
INSERT INTO `works_library_attach` VALUES ('86', '0', '', '', '34', '1439176797', 'admin', '1439176797', 'admin');
INSERT INTO `works_library_attach` VALUES ('87', '0', '2', '2', '35', '1439176989', 'admin', '1439176989', 'admin');
INSERT INTO `works_library_attach` VALUES ('88', '0', '', '', '35', '1439176989', 'admin', '1439176989', 'admin');
INSERT INTO `works_library_attach` VALUES ('100', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '46', '1439190513', 'admin', '1439190513', 'admin');
INSERT INTO `works_library_attach` VALUES ('101', '0', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '08.jpg', '46', '1439190513', 'admin', '1439190513', 'admin');
INSERT INTO `works_library_attach` VALUES ('108', '0', '1f86fd1bc9/1f86fd1bc9cbde67e1bb729467c31379.mp3', '张韶涵 - 海豚湾恋人 - 张绍涵 完整版 遗失的美好.mp3', '48', '1439538952', 'admin', '1439538952', 'admin');
INSERT INTO `works_library_attach` VALUES ('109', '0', 'bfdd1fbbda/bfdd1fbbdab6622a31a7d5f06e1500b3.mp3', '吉田亚纪子 - 海豚湾恋人.mp3', '47', '1439538967', 'admin', '1439538967', 'admin');
INSERT INTO `works_library_attach` VALUES ('111', '0', '09c1e47bcc/09c1e47bcc1d8b157fe20790eafad942.mp3', '张杰 - 勿忘心安.mp3', '19', '1439539001', 'admin', '1439539001', 'admin');
INSERT INTO `works_library_attach` VALUES ('113', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '51', '1440553968', 'admin', '1440553968', 'admin');
INSERT INTO `works_library_attach` VALUES ('115', '0', '1f86fd1bc9/1f86fd1bc9cbde67e1bb729467c31379.mp3', '张韶涵 - 海豚湾恋人 - 张绍涵 完整版 遗失的美好.mp3', '49', '1440560708', 'admin', '1440560708', 'admin');
INSERT INTO `works_library_attach` VALUES ('116', '0', '84e4d3bdaf/84e4d3bdaf068a98b429ea33ccd5a31a.jpg', 'd6744182e8bae59191dfeb3c515d17c2.jpg', '18', '1440560883', 'admin', '1440560883', 'admin');
INSERT INTO `works_library_attach` VALUES ('117', '0', '04aa050342/04aa05034254b4abacec37f7a9a80a92.jpg', 'e439e80ca7c25e26504824f1d166f56f.jpg', '18', '1440560883', 'admin', '1440560883', 'admin');
INSERT INTO `works_library_attach` VALUES ('118', '0', '1f86fd1bc9/1f86fd1bc9cbde67e1bb729467c31379.mp3', '张韶涵 - 海豚湾恋人 - 张绍涵 完整版 遗失的美好.mp3', '50', '1440562389', 'admin', '1440562389', 'admin');
INSERT INTO `works_library_attach` VALUES ('119', '0', '4c6e932087/4c6e9320872fe485e3f24e382ebc1533.jpg', '4c6e9320872fe485e3f24e382ebc1533.jpg', '15', '1440988940', 'admin', '1440988940', 'admin');
INSERT INTO `works_library_attach` VALUES ('120', '0', 'd81a5bce8a/d81a5bce8aaacde4e4ac16dc9a0bbaab.mp4', '何炅 - 另一个自己.mp4', '14', '1440989102', 'admin', '1440989102', 'admin');
INSERT INTO `works_library_attach` VALUES ('129', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '25', '1441011377', 'lr', '1441011377', 'lr');
INSERT INTO `works_library_attach` VALUES ('132', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '54', '1441093047', 'rr', '1441093047', 'rr');
INSERT INTO `works_library_attach` VALUES ('133', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '54', '1441093047', 'rr', '1441093047', 'rr');
INSERT INTO `works_library_attach` VALUES ('134', '0', '38b9dc3c7d/38b9dc3c7dd8d9e5bb87cd91049ad9be.jpg', 'IMG_20150406_134804.jpg', '54', '1441093047', 'rr', '1441093047', 'rr');
INSERT INTO `works_library_attach` VALUES ('135', '0', 'b6c258002e/b6c258002ee6c9194ffab0b5531db499.jpg', 'IMG_20150622_142157.jpg', '54', '1441093047', 'rr', '1441093047', 'rr');
INSERT INTO `works_library_attach` VALUES ('136', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '55', '1441093477', 'rr', '1441093477', 'rr');
INSERT INTO `works_library_attach` VALUES ('148', '0', '66d369e89e/66d369e89ec8c9f3d835da093a26ba06.jpg', '9.jpg', '59', '1441506291', 'xiaosan', '1441506291', 'xiaosan');
INSERT INTO `works_library_attach` VALUES ('149', '0', '5b2dcd387f/5b2dcd387fa0915af97577c341029303.jpg', '10.jpg', '59', '1441506291', 'xiaosan', '1441506291', 'xiaosan');
INSERT INTO `works_library_attach` VALUES ('150', '0', '2e86ebf89e/2e86ebf89e9a5c8115512c7c1643977f.jpg', '11.jpg', '59', '1441506291', 'xiaosan', '1441506291', 'xiaosan');
INSERT INTO `works_library_attach` VALUES ('151', '0', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '12.jpg', '59', '1441506291', 'xiaosan', '1441506291', 'xiaosan');
INSERT INTO `works_library_attach` VALUES ('152', '0', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '12.jpg', '59', '1441506291', 'xiaosan', '1441506291', 'xiaosan');
INSERT INTO `works_library_attach` VALUES ('156', '0', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '2.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('157', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('158', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('159', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('160', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('161', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('162', '0', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '07.jpg', '63', '1441532615', '地平线上的泪水', '1441532615', '地平线上的泪水');
INSERT INTO `works_library_attach` VALUES ('173', '0', '2e86ebf89e/2e86ebf89e9a5c8115512c7c1643977f.jpg', '11.jpg', '58', '1442287393', 'admin', '1442287393', 'admin');
INSERT INTO `works_library_attach` VALUES ('174', '0', '7a28bd8df5/7a28bd8df5e2658dfbe09d0db5d19c2b.jpg', '12.jpg', '58', '1442287393', 'admin', '1442287393', 'admin');
INSERT INTO `works_library_attach` VALUES ('175', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '58', '1442287393', 'admin', '1442287393', 'admin');
INSERT INTO `works_library_attach` VALUES ('180', '0', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '2.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('181', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('182', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('183', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('184', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('185', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('186', '0', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '07.jpg', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('187', '0', 'bb5dec192b/bb5dec192b3654b4cb996ff37b75fc49.gif', '20051103121023912.gif', '56', '1442305004', 'lr', '1442305004', 'lr');
INSERT INTO `works_library_attach` VALUES ('198', '0', '2', '2', '20', '1442809476', 'admin', '1442809476', 'admin');
INSERT INTO `works_library_attach` VALUES ('199', '0', '2', '2', '21', '1442809530', 'admin', '1442809530', 'admin');
INSERT INTO `works_library_attach` VALUES ('200', '0', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '381f039bfcded87e-5fddde80eebbea4e-aa58306d762d616bc8f0e81eba4d26c5.jpg', '42', '1442809778', 'admin', '1442809778', 'admin');
INSERT INTO `works_library_attach` VALUES ('203', '0', 'ceebf73bec/ceebf73bec1e566eec36e700177ffacb.mp3', '樊凡 - 不要就这样离开我.mp3', '72', '1442818664', 'admin', '1442818664', 'admin');
INSERT INTO `works_library_attach` VALUES ('204', '0', 'bfdd1fbbda/bfdd1fbbdab6622a31a7d5f06e1500b3.mp3', '吉田亚纪子 - 海豚湾恋人.mp3', '70', '1442822075', 'admin', '1442822075', 'admin');
INSERT INTO `works_library_attach` VALUES ('205', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '69', '1442822093', 'admin', '1442822093', 'admin');
INSERT INTO `works_library_attach` VALUES ('207', '0', 'bfdd1fbbda/bfdd1fbbdab6622a31a7d5f06e1500b3.mp3', '吉田亚纪子 - 海豚湾恋人.mp3', '71', '1442822393', 'admin', '1442822393', 'admin');
INSERT INTO `works_library_attach` VALUES ('209', '0', 'bfdd1fbbda/bfdd1fbbdab6622a31a7d5f06e1500b3.mp3', '吉田亚纪子 - 海豚湾恋人.mp3', '73', '1442826095', 'admin', '1442826095', 'admin');
INSERT INTO `works_library_attach` VALUES ('211', '0', '3f31b59549/3f31b59549bb133ccb5a1bb1ddabed9c.mp3', 'A Fine Frenzy - Almost Lover.mp3', '75', '1442826368', 'admin', '1442826368', 'admin');
INSERT INTO `works_library_attach` VALUES ('212', '0', '1f0e7c9d87/1f0e7c9d8708271ef353d5f916ea4c50.mp3', '萌萌哒天团 - 帝都.mp3', '76', '1442826687', 'admin', '1442826687', 'admin');
INSERT INTO `works_library_attach` VALUES ('216', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '74', '1442895962', 'admin', '1442895962', 'admin');
INSERT INTO `works_library_attach` VALUES ('217', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '62', '1442896045', 'admin', '1442896045', 'admin');
INSERT INTO `works_library_attach` VALUES ('221', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '57', '1442896184', 'admin', '1442896184', 'admin');
INSERT INTO `works_library_attach` VALUES ('222', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '61', '1442896203', 'admin', '1442896203', 'admin');
INSERT INTO `works_library_attach` VALUES ('227', '0', '4c6e932087/4c6e9320872fe485e3f24e382ebc1533.jpg', '4c6e9320872fe485e3f24e382ebc1533.jpg', '5', '1442896433', 'admin', '1442896433', 'admin');
INSERT INTO `works_library_attach` VALUES ('228', '0', '1bb32c3fd0/1bb32c3fd0b72f835e96b039681f7b5f.jpg', '大圣.jpg', '12', '1442896450', 'admin', '1442896450', 'admin');
INSERT INTO `works_library_attach` VALUES ('229', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '52', '1442896466', 'admin', '1442896466', 'admin');
INSERT INTO `works_library_attach` VALUES ('233', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '43', '1442896797', 'admin', '1442896797', 'admin');
INSERT INTO `works_library_attach` VALUES ('234', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '29', '1442896852', 'admin', '1442896852', 'admin');
INSERT INTO `works_library_attach` VALUES ('248', '0', 'a1750a0089/a1750a00892b8411bf72ada33a8f5a56.mp3', 'Sara、刘佳 - 爱很美.mp3', '87', '1442981017', 'admin', '1442981017', 'admin');
INSERT INTO `works_library_attach` VALUES ('251', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '3', '1442981225', 'admin', '1442981225', 'admin');
INSERT INTO `works_library_attach` VALUES ('252', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '45', '1442981240', 'admin', '1442981240', 'admin');
INSERT INTO `works_library_attach` VALUES ('254', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '44', '1442981325', 'admin', '1442981325', 'admin');
INSERT INTO `works_library_attach` VALUES ('255', '0', '16d07392bc/16d07392bcf99814f46d2de1c62b2d9f.mp4', '远方的孩子 - 韩红.mp4', '89', '1442990297', 'admin', '1442990297', 'admin');
INSERT INTO `works_library_attach` VALUES ('256', '0', 'dddfe4286d/dddfe4286de6b0d42e6c3faa79481734.mp4', '如果你 - 谭维维.mp4', '90', '1442990648', 'admin', '1442990648', 'admin');
INSERT INTO `works_library_attach` VALUES ('257', '0', '76ce85d099/76ce85d0999cdff104b1e5d77c0390bf.mp4', '美若黎明 - 李健.mp4', '91', '1442990738', 'admin', '1442990738', 'admin');
INSERT INTO `works_library_attach` VALUES ('258', '0', 'cb61870ef2/cb61870ef224edc7d91a993168bcf5b3.mp4', '五环之歌 - 岳云鹏.mp4', '92', '1442990880', 'admin', '1442990880', 'admin');
INSERT INTO `works_library_attach` VALUES ('259', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('260', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('261', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('262', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('263', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('264', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '93', '1442993433', 'admin', '1442993433', 'admin');
INSERT INTO `works_library_attach` VALUES ('277', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '1', '1442997505', 'admin', '1442997505', 'admin');
INSERT INTO `works_library_attach` VALUES ('278', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '53', '1442997518', 'admin', '1442997518', 'admin');
INSERT INTO `works_library_attach` VALUES ('280', '0', 'fe4ec68760/fe4ec687606487a179d27213ccf82b47.mp4', 'TmwUoEIOfD6HgFdBfesOgB6lfesF04vA8tdLqtkIk1ytHrChWoIymcAr.mp4', '13', '1442997563', 'admin', '1442997563', 'admin');
INSERT INTO `works_library_attach` VALUES ('282', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '9f0c25b650da01d4b9a41559e9f09170.png', '4', '1442997710', 'admin', '1442997710', 'admin');
INSERT INTO `works_library_attach` VALUES ('286', '0', '1727a8725f/1727a8725fb8b5cdd4bd80aca0b12491.mp3', '韩雪 - 飘雪.mp3', '97', '1442999220', 'admin', '1442999220', 'admin');
INSERT INTO `works_library_attach` VALUES ('287', '0', 'cb61870ef2/cb61870ef224edc7d91a993168bcf5b3.mp4', '五环之歌 - 岳云鹏.mp4', '98', '1443429975', 'rong', '1443429975', 'rong');
INSERT INTO `works_library_attach` VALUES ('288', '0', '1f0e7c9d87/1f0e7c9d8708271ef353d5f916ea4c50.mp3', '萌萌哒天团 - 帝都.mp3', '99', '1443499694', 'admin', '1443499694', 'admin');
INSERT INTO `works_library_attach` VALUES ('561', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('562', '0', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '013.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('563', '0', 'fe9cc6367c/fe9cc6367cad1efaa69ba5f07211d3f7.jpg', '04.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('564', '0', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '095e9efc37ac918fb56a682553f6a1c3.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('565', '0', '1eeb75c035/1eeb75c0355782940fb9af2f733cefb4.jpg', '1eeb75c0355782940fb9af2f733cefb4.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('566', '0', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '015.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('567', '0', 'c4a5865198/c4a5865198ee4dc5d8cf5dd39600de5c.jpg', 'c4a5865198ee4dc5d8cf5dd39600de5c.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('568', '0', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', 'a6f67ed349d25f725b70deffc61241fe.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('569', '0', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '原创歌曲04.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('570', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('571', '0', 'd77994a074/d77994a0742695b7fb67bb562873d28b.jpg', 'd77994a0742695b7fb67bb562873d28b.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('572', '0', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '006.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('573', '0', '056230194f/056230194f0548996c8e22ac0f18e335.jpg', '06.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('574', '0', '4c6e932087/4c6e9320872fe485e3f24e382ebc1533.jpg', '4c6e9320872fe485e3f24e382ebc1533.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('575', '0', '594818616a/594818616ab25c03f53295497ab7a9f6.jpg', '594818616ab25c03f53295497ab7a9f6.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('576', '0', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '原创歌曲03.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('577', '0', 'd91317d0ac/d91317d0ac056c880538da7da3c1c095.gif', 'd91317d0ac056c880538da7da3c1c095.gif', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('578', '0', '2a1501ae26/2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '原创歌曲02.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('579', '0', 'd94b2669c9/d94b2669c952da913021b65750150ab5.jpg', '10.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('580', '0', '5a7e3b9b4b/5a7e3b9b4b73e48096d9d6711dc11f77.jpg', '5a7e3b9b4b73e48096d9d6711dc11f77.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('581', '0', 'ae93db6b8e/ae93db6b8e3e466c97f0e14be52afe6d.jpg', 'ae93db6b8e3e466c97f0e14be52afe6d.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('582', '0', 'b53ad461a6/b53ad461a6a3d32346946db31cbfba4c.jpg', 'b53ad461a6a3d32346946db31cbfba4c.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('583', '0', 'b901080c33/b901080c3374c85b1e6cedb3061bc453.jpg', 'b901080c3374c85b1e6cedb3061bc453.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('584', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', 'c610c5379604bbfd4e7efe836f4c3444.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('585', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', 'd4152511931173a375d6fef5c2509deb.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('586', '0', '4f65627dbd/4f65627dbd071fd5aacdf95fd4fb2ab3.jpg', '01.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('587', '0', 'e54702e231/e54702e23102d6ab5181c01093073ddf.jpg', '02.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('588', '0', '2d9ece02a8/2d9ece02a833d2c5278280513994431b.jpg', '03.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('589', '0', '377f6fdc8e/377f6fdc8e3a177e96b119e54594035e.jpg', '05.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('590', '0', '2d8f84744e/2d8f84744e0403a899e87137886d7cbd.jpg', '07.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('591', '0', 'edeed4a8ea/edeed4a8eae27a03fa9d13a465f8a97b.jpg', '08.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('592', '0', '9349410d57/9349410d57a6e1e834968c601b4ae966.jpg', '09.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('593', '0', 'd91317d0ac/d91317d0ac056c880538da7da3c1c095.gif', '460.gif', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('594', '0', 'c4a5865198/c4a5865198ee4dc5d8cf5dd39600de5c.jpg', 'aa.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('595', '0', 'e6a2f3039b/e6a2f3039b0d87401d7e672ecff8768a.png', 'aa.png', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('596', '0', 'a6f67ed349/a6f67ed349d25f725b70deffc61241fe.jpg', 'b31307871281507023645YK.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('597', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('598', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('599', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('600', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('601', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('602', '0', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '004.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('603', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('604', '0', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '原创歌曲06.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('605', '0', 'fd5e2c670c/fd5e2c670c08cf0efea1e381a0faa102.jpg', '原创歌曲07.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('606', '0', '606cab226e/606cab226e1f5c6b9fb14186137972a8.jpg', '原创歌曲08.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('607', '0', '655707c221/655707c221e5b71a1a852244448872f4.jpg', '原创歌曲09.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('608', '0', '4e7bb494ed/4e7bb494ede22983f0b3cf3c660f625a.jpg', '原创歌曲10.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('609', '0', 'db230f1915/db230f1915d8f6668f6caf4512c8e10e.jpg', '原创歌曲11.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('610', '0', '6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg', '原创歌曲12.jpg', '101', '1443605136', 'admin', '1443605136', 'admin');
INSERT INTO `works_library_attach` VALUES ('661', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('662', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('663', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('664', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('665', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('666', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('667', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('668', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('669', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('670', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('671', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('672', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('673', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('674', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('675', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('676', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('677', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('678', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('679', '0', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '004.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('680', '0', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '006.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('681', '0', '3e289a5625/3e289a56258d7783cf67837303c0e743.jpg', '007.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('682', '0', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '010.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('683', '0', '573f201591/573f2015911d0461e9713bf6e5249028.jpg', '011.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('684', '0', '0ae35271e9/0ae35271e923bb0a128f386a2fc4e459.jpg', '012.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('685', '0', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '013.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('686', '0', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '014.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('687', '0', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '015.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('688', '0', 'd4b8e1d914/d4b8e1d914e9263651e1baabe2389981.jpg', '016.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('689', '0', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '017.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('690', '0', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '018.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('691', '0', '7f5c481567/7f5c48156783bbce9eb086bb09fa46ab.jpg', '019.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('692', '0', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '020.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('693', '0', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '021.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('694', '0', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '022.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('695', '0', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '023.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('696', '0', 'ebb802bae3/ebb802bae337548f92242201e6434234.jpg', '024.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('697', '0', '8146fed2ed/8146fed2ed86818410d3db39bfa35b21.jpg', '025.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('698', '0', 'acaf5f5ad9/acaf5f5ad9163139307ddd720e2e1fca.JPEG', '026.JPEG', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('699', '0', '4931a5041c/4931a5041cf5dbf55bed2d3c5fe06065.jpg', '027.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('700', '0', '5063b31d0c/5063b31d0cbf0fb58bdc7910ab0a6e1b.jpg', '028.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('701', '0', 'c488527290/c488527290b53310c35ce681815fc2df.jpg', 'i1.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('702', '0', 'd4651f7049/d4651f7049521e68e7fe0a6558b82cd0.jpg', 'i2.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('703', '0', '321379e323/321379e323e7a78e27834fce46aa3e50.jpg', '原创歌曲.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('704', '0', 'dee51a36cb/dee51a36cbafe39e6d32736fb16b98d2.jpg', '原创歌曲01.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('705', '0', '2a1501ae26/2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '原创歌曲02.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('706', '0', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '原创歌曲03.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('707', '0', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '原创歌曲04.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('708', '0', '7fdf7c1a65/7fdf7c1a65b4fb3e43726463dda17f67.jpg', '原创歌曲05.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('709', '0', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '原创歌曲06.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('710', '0', 'fd5e2c670c/fd5e2c670c08cf0efea1e381a0faa102.jpg', '原创歌曲07.jpg', '94', '1443605776', 'admin', '1443605776', 'admin');
INSERT INTO `works_library_attach` VALUES ('711', '0', 'ad37f4b3f7/ad37f4b3f7674f446e8ff6eccce77a0f.jpg', 'bg3.jpg', '102', '1444028679', 'admin', '1444028679', 'admin');
INSERT INTO `works_library_attach` VALUES ('712', '0', '7b4371a701/7b4371a70168130725e1ea45619835fb.mp3', '光辉岁月[1].mp3', '103', '1444029317', 'admin', '1444029317', 'admin');
INSERT INTO `works_library_attach` VALUES ('713', '0', '1eeb75c035/1eeb75c0355782940fb9af2f733cefb4.jpg', '1eeb75c0355782940fb9af2f733cefb4.jpg', '104', '1444278585', 'rong', '1444278585', 'rong');
INSERT INTO `works_library_attach` VALUES ('714', '0', '3c1e6725ee/3c1e6725ee5ba6f4631ac32f337fa7dc.JPG', '3c1e6725ee5ba6f4631ac32f337fa7dc.JPG', '104', '1444278585', 'rong', '1444278585', 'rong');
INSERT INTO `works_library_attach` VALUES ('715', '0', '4c6e932087/4c6e9320872fe485e3f24e382ebc1533.jpg', '4c6e9320872fe485e3f24e382ebc1533.jpg', '104', '1444278585', 'rong', '1444278585', 'rong');
INSERT INTO `works_library_attach` VALUES ('767', '0', '16d07392bc/16d07392bcf99814f46d2de1c62b2d9f.mp4', '远方的孩子 - 韩红.mp4', '106', '1444357053', 'admin', '1444357053', 'admin');
INSERT INTO `works_library_attach` VALUES ('881', '0', 'dddfe4286d/dddfe4286de6b0d42e6c3faa79481734.mp4', '如果你 - 谭维维.mp4', '109', '1444442625', 'test_01', '1444442625', 'test_01');
INSERT INTO `works_library_attach` VALUES ('882', '0', '16d07392bc/16d07392bcf99814f46d2de1c62b2d9f.mp4', '远方的孩子 - 韩红.mp4', '109', '1444442625', 'test_01', '1444442625', 'test_01');
INSERT INTO `works_library_attach` VALUES ('885', '0', 'f8127f8916/f8127f891622de6558733cc88fe600db.jpg', '1iwi.jpg', '110', '1444564313', 'admin', '1444564313', 'admin');
INSERT INTO `works_library_attach` VALUES ('886', '0', '56b2a187af/56b2a187af98338c8326686054914eed.jpg', 'a2.jpg', '110', '1444564313', 'admin', '1444564313', 'admin');
INSERT INTO `works_library_attach` VALUES ('887', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images.png', '111', '1444658706', 'admin', '1444658706', 'admin');
INSERT INTO `works_library_attach` VALUES ('888', '0', '56b2a187af/56b2a187af98338c8326686054914eed.jpg', 'a2.jpg', '111', '1444658706', 'admin', '1444658706', 'admin');
INSERT INTO `works_library_attach` VALUES ('889', '0', '299de0cb0b/299de0cb0b94b74e364365f6e4faa19d.jpg', 'a1.jpg', '111', '1444658706', 'admin', '1444658706', 'admin');
INSERT INTO `works_library_attach` VALUES ('890', '0', '6a22728db9/6a22728db98ea5d9f939a45aaf5bbf7d.jpg', 'a3.jpg', '111', '1444658706', 'admin', '1444658706', 'admin');
INSERT INTO `works_library_attach` VALUES ('891', '0', '04e0d43317/04e0d4331755d965558ae2ce21cf1411.mp3', '陈百强 - 对酒当歌.mp3', '112', '1444748736', 'admin', '1444748736', 'admin');
INSERT INTO `works_library_attach` VALUES ('892', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images.png', '113', '1444749405', 'admin', '1444749405', 'admin');
INSERT INTO `works_library_attach` VALUES ('893', '0', '18860685ad/18860685ad20135972861b3161b23c54.png', 'a2.png', '114', '1444749845', 'test_06', '1444749845', 'test_06');
INSERT INTO `works_library_attach` VALUES ('894', '0', '4f8bbc3690/4f8bbc3690601a987e222bab70f30210.png', 'a7.png', '114', '1444749845', 'test_06', '1444749845', 'test_06');
INSERT INTO `works_library_attach` VALUES ('897', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images.png', '115', '1444751327', 'admin', '1444751327', 'admin');
INSERT INTO `works_library_attach` VALUES ('918', '0', 'f153a4c16f/f153a4c16f42565170b040a007fed779.png', '1.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('919', '0', '92a7b13381/92a7b1338123c6f901c0167f0c2689b1.png', '2.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('920', '0', 'e016c2d278/e016c2d2782e7344504e337a60758e58.png', '3.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('921', '0', '599c0a3d7e/599c0a3d7e76c64cbed807ec58401425.png', '4.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('922', '0', '822f291d9f/822f291d9fc86110b20f71980a192f07.png', '5.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('923', '0', '9d1e1d2ca0/9d1e1d2ca0464becf164ec71bce0a143.png', '6.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('924', '0', 'a0f53a1d62/a0f53a1d6205d5c79803f36a45ae64c8.png', '8.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('925', '0', '82a862e687/82a862e6875ac1a48b87f633ff64a9bd.png', '9.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('926', '0', 'dfcf01a887/dfcf01a887affd17c41c521c41bbc305.png', '10.png', '118', '1444982675', 'admin', '1444982675', 'admin');
INSERT INTO `works_library_attach` VALUES ('927', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('928', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('929', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('930', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('931', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('932', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('933', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('934', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('935', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('936', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('937', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('938', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('939', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('940', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('941', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('942', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('943', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('944', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('945', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('946', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('947', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('948', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('949', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('950', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('951', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('952', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('953', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('954', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('955', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('956', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('957', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('958', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('959', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('960', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('961', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('962', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('963', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('964', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('965', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('966', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('967', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('968', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('969', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('970', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('971', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('972', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('973', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('974', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('975', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('976', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '108', '1444982701', 'admin', '1444982701', 'admin');
INSERT INTO `works_library_attach` VALUES ('977', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('978', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('979', '0', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '004.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('980', '0', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '006.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('981', '0', '3e289a5625/3e289a56258d7783cf67837303c0e743.jpg', '007.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('982', '0', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '010.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('983', '0', '573f201591/573f2015911d0461e9713bf6e5249028.jpg', '011.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('984', '0', '0ae35271e9/0ae35271e923bb0a128f386a2fc4e459.jpg', '012.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('985', '0', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '013.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('986', '0', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '014.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('987', '0', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '015.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('988', '0', 'd4b8e1d914/d4b8e1d914e9263651e1baabe2389981.jpg', '016.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('989', '0', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '017.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('990', '0', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '018.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('991', '0', '7f5c481567/7f5c48156783bbce9eb086bb09fa46ab.jpg', '019.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('992', '0', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '020.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('993', '0', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '021.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('994', '0', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '022.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('995', '0', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '023.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('996', '0', 'ebb802bae3/ebb802bae337548f92242201e6434234.jpg', '024.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('997', '0', '8146fed2ed/8146fed2ed86818410d3db39bfa35b21.jpg', '025.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('998', '0', 'acaf5f5ad9/acaf5f5ad9163139307ddd720e2e1fca.JPEG', '026.JPEG', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('999', '0', '4931a5041c/4931a5041cf5dbf55bed2d3c5fe06065.jpg', '027.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1000', '0', '5063b31d0c/5063b31d0cbf0fb58bdc7910ab0a6e1b.jpg', '028.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1001', '0', 'c488527290/c488527290b53310c35ce681815fc2df.jpg', 'i1.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1002', '0', 'd4651f7049/d4651f7049521e68e7fe0a6558b82cd0.jpg', 'i2.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1003', '0', '321379e323/321379e323e7a78e27834fce46aa3e50.jpg', '原创歌曲.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1004', '0', 'dee51a36cb/dee51a36cbafe39e6d32736fb16b98d2.jpg', '原创歌曲01.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1005', '0', '2a1501ae26/2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '原创歌曲02.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1006', '0', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '原创歌曲03.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1007', '0', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '原创歌曲04.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1008', '0', '7fdf7c1a65/7fdf7c1a65b4fb3e43726463dda17f67.jpg', '原创歌曲05.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1009', '0', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '原创歌曲06.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1010', '0', 'fd5e2c670c/fd5e2c670c08cf0efea1e381a0faa102.jpg', '原创歌曲07.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1011', '0', '606cab226e/606cab226e1f5c6b9fb14186137972a8.jpg', '原创歌曲08.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1012', '0', '655707c221/655707c221e5b71a1a852244448872f4.jpg', '原创歌曲09.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1013', '0', '4e7bb494ed/4e7bb494ede22983f0b3cf3c660f625a.jpg', '原创歌曲10.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1014', '0', 'db230f1915/db230f1915d8f6668f6caf4512c8e10e.jpg', '原创歌曲11.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1015', '0', '6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg', '原创歌曲12.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1016', '0', '6e62d4086d/6e62d4086d793fd6b14c4d03d842b70c.jpg', '原创歌曲13.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1017', '0', '16cb976de0/16cb976de0bbe848a988b8b522d1fa68.jpg', '原创歌曲14.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1018', '0', 'a688d86748/a688d8674800f2caab4493413c57d9d1.jpg', '原创歌曲15.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1019', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1020', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1021', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1022', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1023', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1024', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1025', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1026', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '105', '1444982945', 'admin', '1444982945', 'admin');
INSERT INTO `works_library_attach` VALUES ('1027', '0', 'f978fafb06/f978fafb062eaecdf1734257db00473e.mp3', '许嵩 - 城府.mp3', '88', '1444982965', 'admin', '1444982965', 'admin');
INSERT INTO `works_library_attach` VALUES ('1028', '0', '8e3f7633b6/8e3f7633b6b2ecebcd1010975cfd3b37.mp3', '龙猫组合 - 爱情美酒分给谁.mp3', '85', '1444982980', 'admin', '1444982980', 'admin');
INSERT INTO `works_library_attach` VALUES ('1029', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '68', '1444983097', 'admin', '1444983097', 'admin');
INSERT INTO `works_library_attach` VALUES ('1030', '0', 'feecca53e4/feecca53e4c89987c5c5de8995c1b8df.mp3', '龙猫组合 - Hold不住的爱.mp3', '84', '1444983644', 'admin', '1444983644', 'admin');
INSERT INTO `works_library_attach` VALUES ('1031', '0', '1025251eec/1025251eecbc91bde4c6a9e4bc174442.mp3', '李玉刚 - 国色天香.mp3', '83', '1444983730', 'admin', '1444983730', 'admin');
INSERT INTO `works_library_attach` VALUES ('1032', '0', '19cd559b45/19cd559b45e817f342d25453ac5a6b90.mp3', '罗百吉 - I Miss You.mp3', '80', '1444983742', 'admin', '1444983742', 'admin');
INSERT INTO `works_library_attach` VALUES ('1033', '0', '362b6d4f53/362b6d4f53ab650db813d8cb8a31c749.mp3', 'Beyond - 真的爱你.mp3', '86', '1444983796', 'admin', '1444983796', 'admin');
INSERT INTO `works_library_attach` VALUES ('1034', '0', 'fe85ed3a83/fe85ed3a8370fe4e4854ba4678f4447c.jpeg', '1443277785255.jpeg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1035', '0', 'e143a563e5/e143a563e580c91035650ee886dfabd3.png', 'QQ图片20150929102110.png', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1036', '0', '63b7a55397/63b7a5539723dd5fc926e22bbac0942b.gif', '5734742_4.gif', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1037', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1038', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1039', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1040', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1041', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1042', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1043', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1044', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1045', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1046', '0', 'f1baf8a1b3/f1baf8a1b33b08d81af75480a78f019e.jpg', '10.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1047', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1048', '0', '3fa69a2630/3fa69a2630770285c3e4d6c3a4bb296d.jpg', '13.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1049', '0', 'bae5e69a4a/bae5e69a4a2dc9741dea4e9abe028683.jpg', '14.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1050', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1051', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1052', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1053', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1054', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1055', '0', 'ba1af89c05/ba1af89c05565cbe28d97af07dd1f415.jpg', '09.jpg', '100', '1444983846', 'admin', '1444983846', 'admin');
INSERT INTO `works_library_attach` VALUES ('1056', '0', '1602e2ed1e/1602e2ed1e85a375bdef27809d978983.mp3', '韩雪 - 想起.mp3', '96', '1444983860', 'admin', '1444983860', 'admin');
INSERT INTO `works_library_attach` VALUES ('1057', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1058', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1059', '0', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '004.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1060', '0', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '006.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1061', '0', '3e289a5625/3e289a56258d7783cf67837303c0e743.jpg', '007.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1062', '0', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '010.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1063', '0', '573f201591/573f2015911d0461e9713bf6e5249028.jpg', '011.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1064', '0', '0ae35271e9/0ae35271e923bb0a128f386a2fc4e459.jpg', '012.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1065', '0', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '013.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1066', '0', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '014.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1067', '0', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '015.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1068', '0', 'd4b8e1d914/d4b8e1d914e9263651e1baabe2389981.jpg', '016.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1069', '0', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '017.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1070', '0', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '018.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1071', '0', '7f5c481567/7f5c48156783bbce9eb086bb09fa46ab.jpg', '019.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1072', '0', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '020.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1073', '0', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '021.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1074', '0', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '022.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1075', '0', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '023.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1076', '0', 'ebb802bae3/ebb802bae337548f92242201e6434234.jpg', '024.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1077', '0', '8146fed2ed/8146fed2ed86818410d3db39bfa35b21.jpg', '025.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1078', '0', 'acaf5f5ad9/acaf5f5ad9163139307ddd720e2e1fca.JPEG', '026.JPEG', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1079', '0', '4931a5041c/4931a5041cf5dbf55bed2d3c5fe06065.jpg', '027.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1080', '0', '5063b31d0c/5063b31d0cbf0fb58bdc7910ab0a6e1b.jpg', '028.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1081', '0', 'c488527290/c488527290b53310c35ce681815fc2df.jpg', 'i1.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1082', '0', 'd4651f7049/d4651f7049521e68e7fe0a6558b82cd0.jpg', 'i2.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1083', '0', '321379e323/321379e323e7a78e27834fce46aa3e50.jpg', '原创歌曲.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1084', '0', 'dee51a36cb/dee51a36cbafe39e6d32736fb16b98d2.jpg', '原创歌曲01.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1085', '0', '2a1501ae26/2a1501ae26d5035bb6f7e8d8cbfbbcef.jpg', '原创歌曲02.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1086', '0', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '原创歌曲03.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1087', '0', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '原创歌曲04.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1088', '0', '7fdf7c1a65/7fdf7c1a65b4fb3e43726463dda17f67.jpg', '原创歌曲05.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1089', '0', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '原创歌曲06.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1090', '0', 'fd5e2c670c/fd5e2c670c08cf0efea1e381a0faa102.jpg', '原创歌曲07.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1091', '0', '606cab226e/606cab226e1f5c6b9fb14186137972a8.jpg', '原创歌曲08.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1092', '0', '655707c221/655707c221e5b71a1a852244448872f4.jpg', '原创歌曲09.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1093', '0', '4e7bb494ed/4e7bb494ede22983f0b3cf3c660f625a.jpg', '原创歌曲10.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1094', '0', 'db230f1915/db230f1915d8f6668f6caf4512c8e10e.jpg', '原创歌曲11.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1095', '0', '6ba71f54a3/6ba71f54a3366a0c585ce72fa2f85046.jpg', '原创歌曲12.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1096', '0', '6e62d4086d/6e62d4086d793fd6b14c4d03d842b70c.jpg', '原创歌曲13.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1097', '0', '16cb976de0/16cb976de0bbe848a988b8b522d1fa68.jpg', '原创歌曲14.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1098', '0', 'a688d86748/a688d8674800f2caab4493413c57d9d1.jpg', '原创歌曲15.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1099', '0', '6579db111e/6579db111e527f61b1a9d7432a25a8ce.jpg', '01.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1100', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1101', '0', 'acdce2cfce/acdce2cfceac20c83a8b1b4cf8f5fb6d.jpg', '03.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1102', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1103', '0', '7873040e1b/7873040e1bfffd66d7d01e5ed2be7f1b.jpg', '05.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1104', '0', '94d0686dbb/94d0686dbbbafb303b7457e51d8925fb.jpg', '06.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1105', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1106', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '95', '1444983910', 'admin', '1444983910', 'admin');
INSERT INTO `works_library_attach` VALUES ('1107', '0', 'b21e97c4d4/b21e97c4d4ffda8c05a09af436e5167e.mp3', '李玉刚 - 新贵妃醉酒.mp3', '82', '1444984051', 'admin', '1444984051', 'admin');
INSERT INTO `works_library_attach` VALUES ('1108', '0', 'faba08c65b/faba08c65b78f5f99b0981c837346c94.mp3', 'Lenka - Trouble Is A Friend.mp3', '81', '1444984137', 'admin', '1444984137', 'admin');
INSERT INTO `works_library_attach` VALUES ('1109', '0', 'dda273822a/dda273822a7deb6e5cea9dfd4dd9a295.mp3', '龙猫组合 - 爱情专属权.mp3', '79', '1444984158', 'admin', '1444984158', 'admin');
INSERT INTO `works_library_attach` VALUES ('1110', '0', '3f31b59549/3f31b59549bb133ccb5a1bb1ddabed9c.mp3', 'A Fine Frenzy - Almost Lover.mp3', '78', '1444984210', 'admin', '1444984210', 'admin');
INSERT INTO `works_library_attach` VALUES ('1111', '0', 'ad4785d0a4/ad4785d0a4e89d0e7254ddb0b8b69353.mp3', '许嵩 - 多余的解释.mp3', '77', '1444984234', 'admin', '1444984234', 'admin');
INSERT INTO `works_library_attach` VALUES ('1112', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '67', '1444984249', 'admin', '1444984249', 'admin');
INSERT INTO `works_library_attach` VALUES ('1113', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '66', '1444984290', 'admin', '1444984290', 'admin');
INSERT INTO `works_library_attach` VALUES ('1114', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '64', '1444984360', 'admin', '1444984360', 'admin');
INSERT INTO `works_library_attach` VALUES ('1115', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '60', '1444984443', 'admin', '1444984443', 'admin');
INSERT INTO `works_library_attach` VALUES ('1122', '0', 'dcd1949b24/dcd1949b242a05c57b43394c3af571db.jpg', '8.jpg', '120', '1445229263', 'test_01', '1445229263', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1123', '0', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '123108h3dqhpj0bphzs9hp.jpg', '120', '1445229263', 'test_01', '1445229263', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1124', '0', '8b69a75c4c/8b69a75c4c280a1b002eef592b339252.jpg', 'p2255185420.jpg', '121', '1445229604', 'test_01', '1445229604', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1125', '0', 'f382729526/f38272952631f7f0821a5592dde48608.jpg', 'p2256326708.jpg', '121', '1445229604', 'test_01', '1445229604', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1126', '0', 'dcd1949b24/dcd1949b242a05c57b43394c3af571db.jpg', '8.jpg', '122', '1445229760', 'test_01', '1445229760', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1127', '0', '8b69a75c4c/8b69a75c4c280a1b002eef592b339252.jpg', 'p2255185420.jpg', '123', '1445229886', 'test_01', '1445229886', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1128', '0', 'f382729526/f38272952631f7f0821a5592dde48608.jpg', 'p2256326708.jpg', '123', '1445229886', 'test_01', '1445229886', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1129', '0', '8b69a75c4c/8b69a75c4c280a1b002eef592b339252.jpg', 'p2255185420.jpg', '124', '1445235635', 'test-yaolei', '1445235635', 'test-yaolei');
INSERT INTO `works_library_attach` VALUES ('1130', '0', 'f382729526/f38272952631f7f0821a5592dde48608.jpg', 'p2256326708.jpg', '124', '1445235635', 'test-yaolei', '1445235635', 'test-yaolei');
INSERT INTO `works_library_attach` VALUES ('1131', '0', '3a103184ca/3a103184cace7dfaf2c578385e66b970.jpg', '123108h3dqhpj0bphzs9hp.jpg', '125', '1445235733', 'test-yaolei', '1445235733', 'test-yaolei');
INSERT INTO `works_library_attach` VALUES ('1133', '0', '707f5fc912/707f5fc9129618f99d484cd7149ba5fd.jpg', '12.jpg', '127', '1445239528', 'test-liurong', '1445239528', 'test-liurong');
INSERT INTO `works_library_attach` VALUES ('1134', '0', 'd10eab06f1/d10eab06f168f2852a6c10dd561e2875.jpg', '08.jpg', '128', '1445239860', 'test-liurong', '1445239860', 'test-liurong');
INSERT INTO `works_library_attach` VALUES ('1135', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '128', '1445239860', 'test-liurong', '1445239860', 'test-liurong');
INSERT INTO `works_library_attach` VALUES ('1146', '0', '011a17d695/011a17d6953602090c6512a1bc4368f1.mp4', 'mp4001.mp4', '133', '1445925450', 'admin', '1445925450', 'admin');
INSERT INTO `works_library_attach` VALUES ('1147', '0', '5bacbdba9a/5bacbdba9af42150c27b1a182ba169f8.mp3', 'Maid with the Flaxen Hair.mp3', '134', '1445926338', 'admin', '1445926338', 'admin');
INSERT INTO `works_library_attach` VALUES ('1162', '0', 'bf75b876e4/bf75b876e43e47d2c20b53f3c88f777f.bmp', '1bmp.bmp', '135', '1445928298', 'admin', '1445928298', 'admin');
INSERT INTO `works_library_attach` VALUES ('1167', '0', '011a17d695/011a17d6953602090c6512a1bc4368f1.mp4', 'mp4001.mp4', '136', '1445940468', 'admin', '1445940468', 'admin');
INSERT INTO `works_library_attach` VALUES ('1169', '0', '2c3ab905a1/2c3ab905a1d6ee14d70f1bfa98d239d9.mp4', 'mp4002.mp4', '137', '1445940658', 'admin', '1445940658', 'admin');
INSERT INTO `works_library_attach` VALUES ('1170', '0', '8969288f42/8969288f4245120e7c3870287cce0ff3.jpg', 'Lighthouse.jpg', '138', '1445940704', 'admin', '1445940704', 'admin');
INSERT INTO `works_library_attach` VALUES ('1171', '0', 'b8b5bd53e2/b8b5bd53e23dd40b5c4a650e272f2e19.mp3', 'Sleep Away.mp3', '139', '1445940752', 'admin', '1445940752', 'admin');
INSERT INTO `works_library_attach` VALUES ('1172', '0', 'b8b5bd53e2/b8b5bd53e23dd40b5c4a650e272f2e19.mp3', 'Sleep Away.mp3', '140', '1445940791', 'admin', '1445940791', 'admin');
INSERT INTO `works_library_attach` VALUES ('1175', '0', 'd6812f0dfe/d6812f0dfeb66bc293f87c070140754a.png', '1png.png', '141', '1445940993', 'admin', '1445940993', 'admin');
INSERT INTO `works_library_attach` VALUES ('1176', '0', '9d377b10ce/9d377b10ce778c4938b3c7e2c63a229a.jpg', 'Penguins.jpg', '116', '1445941995', 'admin', '1445941995', 'admin');
INSERT INTO `works_library_attach` VALUES ('1178', '0', '84f8b4ed8a/84f8b4ed8a9358aac955b8815128db8e.png', 'selenium-screenshot-19.png', '142', '1446102723', 'faa123', '1446102723', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1271', '0', 'a04ddf90ac/a04ddf90ac33c0f836b6d19c9b517f1d.png', 'selenium-screenshot-27.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1272', '0', '546dad102d/546dad102ddece79e60051e314b30d50.png', 'selenium-screenshot-3.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1273', '0', 'ed5fbf6d94/ed5fbf6d942862ae1b996355a37f2a3d.png', 'selenium-screenshot-2.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1274', '0', '16fd6db299/16fd6db299762d4dde81470c8cb76df1.png', 'selenium-screenshot-4.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1275', '0', '49d6702705/49d67027052ec73e9331625089724397.png', 'selenium-screenshot-1.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1276', '0', '6e5d47b346/6e5d47b346f49d1eb29ffda151a94d20.png', 'selenium-screenshot-6.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1277', '0', '8ce42e73d4/8ce42e73d47b1dbc87689ffdfd21bd5b.png', 'selenium-screenshot-5.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1278', '0', '706419450d/706419450d3bdd5e94393b0a99523b13.png', 'selenium-screenshot-9.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1279', '0', 'c2f09c150c/c2f09c150cf976dca4b7b1a0b6098d66.png', 'selenium-screenshot-8.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1280', '0', '52dac9904c/52dac9904c5705d71c64326d1bbaa9b2.png', 'selenium-screenshot-10.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1281', '0', '08edab91c9/08edab91c9fc44b9fed933d7147a998e.png', 'selenium-screenshot-7.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1282', '0', 'eb4176b5f2/eb4176b5f2656d07b5011f0d3cff1e7f.png', 'selenium-screenshot-12.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1283', '0', 'bfc2f7dc70/bfc2f7dc70b038ee38a63089541b1ab5.png', 'selenium-screenshot-13.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1284', '0', 'ed5f25c97a/ed5f25c97a0ee7febbf83a4479d283a8.png', 'selenium-screenshot-11.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1285', '0', 'db8fbe45e5/db8fbe45e56458719ff836706291b5f1.png', 'selenium-screenshot-14.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1286', '0', '49db8459f0/49db8459f04c2a459f433fdd7fbb35f7.png', 'selenium-screenshot-16.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1287', '0', '56fc7071dd/56fc7071ddecb4f63d9d0d0203ec001e.png', 'selenium-screenshot-15.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1288', '0', '84f8b4ed8a/84f8b4ed8a9358aac955b8815128db8e.png', 'selenium-screenshot-19.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1289', '0', '1d2d718f1f/1d2d718f1f8c4adca53e3d0d6936e6a1.png', 'selenium-screenshot-18.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1290', '0', 'bcbc06db5c/bcbc06db5c7edf4d7df3bbdfad667a32.png', 'selenium-screenshot-17.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1291', '0', '0d29920df1/0d29920df13983c76ab3dcd07777b327.png', 'selenium-screenshot-21.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1292', '0', '360aa3013f/360aa3013f6ce8f2f849737135d201c7.png', 'selenium-screenshot-20.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1293', '0', 'ecd5f57197/ecd5f57197f640937df62082169e9830.png', 'selenium-screenshot-22.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1294', '0', 'ecd5f57197/ecd5f57197f640937df62082169e9830.png', 'selenium-screenshot-23.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1295', '0', '7022a7caf2/7022a7caf24bbdc3877471c6d3bff4bf.png', 'selenium-screenshot-24.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1296', '0', 'a04ddf90ac/a04ddf90ac33c0f836b6d19c9b517f1d.png', 'selenium-screenshot-27.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1297', '0', '59a8309a15/59a8309a15365ec01503671a625ce18b.png', 'selenium-screenshot-26.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1298', '0', '7cd74b37dd/7cd74b37dd32db668511ef670e34d77b.png', 'selenium-screenshot-25.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1299', '0', 'f52f35180c/f52f35180c4b7ecd3aa8681649cc7f70.png', 'selenium-screenshot-28.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1300', '0', '1c89a6fae9/1c89a6fae9cb0b694c36fe822b884e79.png', 'selenium-screenshot-29.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1301', '0', 'fb769194db/fb769194dbac5c9dee0f3ef3a5e1ff7f.png', 'selenium-screenshot-30.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1302', '0', 'b07f8c3f95/b07f8c3f95995f72a6678e9ab6fe571d.png', 'selenium-screenshot-31.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1303', '0', '68d556c069/68d556c069eb27d8675ec9bb47b1c7f3.png', 'selenium-screenshot-32.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1304', '0', 'c51e97c179/c51e97c1793cb4803776e6c9a6c877be.png', 'selenium-screenshot-33.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1305', '0', '56fc7071dd/56fc7071ddecb4f63d9d0d0203ec001e.png', 'selenium-screenshot-15.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1306', '0', '49db8459f0/49db8459f04c2a459f433fdd7fbb35f7.png', 'selenium-screenshot-16.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1307', '0', 'bcbc06db5c/bcbc06db5c7edf4d7df3bbdfad667a32.png', 'selenium-screenshot-17.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1308', '0', '1d2d718f1f/1d2d718f1f8c4adca53e3d0d6936e6a1.png', 'selenium-screenshot-18.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1309', '0', '84f8b4ed8a/84f8b4ed8a9358aac955b8815128db8e.png', 'selenium-screenshot-19.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1310', '0', '360aa3013f/360aa3013f6ce8f2f849737135d201c7.png', 'selenium-screenshot-20.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1311', '0', 'ecd5f57197/ecd5f57197f640937df62082169e9830.png', 'selenium-screenshot-22.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1312', '0', 'ecd5f57197/ecd5f57197f640937df62082169e9830.png', 'selenium-screenshot-23.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1313', '0', '7022a7caf2/7022a7caf24bbdc3877471c6d3bff4bf.png', 'selenium-screenshot-24.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1314', '0', '7cd74b37dd/7cd74b37dd32db668511ef670e34d77b.png', 'selenium-screenshot-25.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1315', '0', '59a8309a15/59a8309a15365ec01503671a625ce18b.png', 'selenium-screenshot-26.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1316', '0', 'a04ddf90ac/a04ddf90ac33c0f836b6d19c9b517f1d.png', 'selenium-screenshot-27.png', '143', '1446103853', 'admin', '1446103853', 'admin');
INSERT INTO `works_library_attach` VALUES ('1338', '0', '9212a12a7c/9212a12a7ccdb244c431693c634f373e.jpg', '单次点播购买流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1339', '0', '22bc0b7db3/22bc0b7db32a0e14283d80ab6b7df6c4.jpg', '促销购买流程前台.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1340', '0', '4787f85d36/4787f85d362beacbcd058b789f91709e.jpg', '充值流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1341', '0', '18c0deb861/18c0deb8613733ab1987ade81ff991cd.jpg', '单一服务购买流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1342', '0', 'c5d78ab35e/c5d78ab35e652740056a87df64ce46cd.jpg', '道具购买流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1343', '0', '738bd48c07/738bd48c079a72206c0b2dd02d388202.jpg', '订单后台处理流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1344', '0', 'fbd8c65b3f/fbd8c65b3fa22be184024f2481555e3b.jpg', '上传作品审核流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1345', '0', '87172d69e5/87172d69e5458d30fc89d350b989ae6c.jpg', '转账对账流程.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1346', '0', '07d871349f/07d871349f93e1c4fcc3766048a92f13.jpg', '添加促销流程后台.jpg', '145', '1446373641', 'admin01', '1446373641', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1348', '0', '121e997dd8/121e997dd87ec29c2dd7c83354ad33a0.mp4', '黛米·洛瓦托 - Confident.mp4', '144', '1446433080', 'admin01', '1446433080', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1349', '0', '2c3ab905a1/2c3ab905a1d6ee14d70f1bfa98d239d9.mp4', 'mp4002.mp4', '130', '1446457307', 'admin', '1446457307', 'admin');
INSERT INTO `works_library_attach` VALUES ('1350', '0', 'bdf3bf1da3/bdf3bf1da3405725be763540d6601144.jpg', 'Hydrangeas.jpg', '131', '1446458358', 'admin', '1446458358', 'admin');
INSERT INTO `works_library_attach` VALUES ('1351', '0', '52eb9712d5/52eb9712d5828d7e58877510d1cb6c3a.png', '2png.png', '131', '1446458358', 'admin', '1446458358', 'admin');
INSERT INTO `works_library_attach` VALUES ('1352', '0', 'bf75b876e4/bf75b876e43e47d2c20b53f3c88f777f.bmp', '1bmp.bmp', '131', '1446458358', 'admin', '1446458358', 'admin');
INSERT INTO `works_library_attach` VALUES ('1353', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (2).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1354', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (3).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1355', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (3).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1356', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1357', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1358', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (2) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1359', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (2) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1360', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (4).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1361', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (4).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1362', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (2).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1363', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (2).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1364', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (3) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1365', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (3) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1366', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (5).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1367', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (5).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1368', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (3).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1369', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (3).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1370', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (4) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1371', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (4) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1372', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (6).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1373', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (6).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1374', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (4).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1375', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (4).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1376', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (5) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1377', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (5) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1378', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (7).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1379', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (7).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1380', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (5).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1381', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (5).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1382', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (6) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1383', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (8).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1384', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (8).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1385', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 - 副本 (6).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1386', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 - 副本 (6).png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1387', '0', '4798b2cec2/4798b2cec23591e4783518b550d7173a.png', 'images - 副本 (7) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1388', '0', '22f8a6d37b/22f8a6d37be26436009293a36385f6cf.png', 'fbq - 副本 (7) - 副本.png', '146', '1446522872', 'test_05', '1446522872', 'test_05');
INSERT INTO `works_library_attach` VALUES ('1391', '0', 'e4082cd6ee/e4082cd6eedab3f01452064efb090564.mp4', '输不起.mp4', '147', '1446533157', 'admin01', '1446533157', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1392', '0', 'e4082cd6ee/e4082cd6eedab3f01452064efb090564.mp4', '输不起.mp4', '148', '1446534248', 'test_03', '1446534248', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1393', '0', 'a53802feac/a53802feaccd72eac3c8ef9868f3bed4.jpg', '1.jpg', '149', '1446534352', 'test_03', '1446534352', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1394', '0', '68830e360c/68830e360c78a888de22618996827b33.jpg', '2.jpg', '150', '1446535599', 'test_03', '1446535599', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1395', '0', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '4.jpg', '151', '1446535649', 'test_03', '1446535649', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1396', '0', '33ebd82836/33ebd8283669cc5882bf572f4dd71a98.jpg', '3.jpg', '152', '1446535685', 'test_03', '1446535685', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1397', '0', '68830e360c/68830e360c78a888de22618996827b33.jpg', '2.jpg', '153', '1446535777', 'test_03', '1446535777', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1398', '0', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '4.jpg', '154', '1446535811', 'test_03', '1446535811', 'test_03');
INSERT INTO `works_library_attach` VALUES ('1399', '0', 'b8b5bd53e2/b8b5bd53e23dd40b5c4a650e272f2e19.mp3', 'Sleep Away.mp3', '155', '1446538404', 'admin01', '1446538404', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1400', '0', '5a9a91184e/5a9a91184e611dae3fed162b8787ce5f.mp3', 'Kalimba.mp3', '156', '1446539561', 'admin01', '1446539561', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1401', '0', '5bacbdba9a/5bacbdba9af42150c27b1a182ba169f8.mp3', 'Maid with the Flaxen Hair.mp3', '157', '1446539651', 'admin01', '1446539651', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1402', '0', '5a9a91184e/5a9a91184e611dae3fed162b8787ce5f.mp3', 'Kalimba.mp3', '158', '1446539707', 'admin01', '1446539707', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1404', '0', 'b8b5bd53e2/b8b5bd53e23dd40b5c4a650e272f2e19.mp3', 'Sleep Away.mp3', '160', '1446540191', 'admin01', '1446540191', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1419', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '161', '1446783468', 'admin', '1446783468', 'admin');
INSERT INTO `works_library_attach` VALUES ('1420', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '161', '1446783468', 'admin', '1446783468', 'admin');
INSERT INTO `works_library_attach` VALUES ('1421', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '161', '1446783468', 'admin', '1446783468', 'admin');
INSERT INTO `works_library_attach` VALUES ('1422', '0', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '07.jpg', '161', '1446783468', 'admin', '1446783468', 'admin');
INSERT INTO `works_library_attach` VALUES ('1423', '0', '8745c59738/8745c59738e06ccce4d129064a6fbed8.jpg', '001.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1424', '0', '7ea8ccddc1/7ea8ccddc1a6c36c37676e3c1ee38e74.jpg', '003.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1425', '0', '6cf6234992/6cf6234992ef7faef4da577c55ad2f77.jpg', '004.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1426', '0', 'e17cb4a809/e17cb4a80994c97d36894614ddabe9b1.jpg', '006.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1427', '0', '3e289a5625/3e289a56258d7783cf67837303c0e743.jpg', '007.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1428', '0', '16ede1c234/16ede1c23424a19c7e7208693dbcca86.jpg', '010.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1429', '0', '573f201591/573f2015911d0461e9713bf6e5249028.jpg', '011.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1430', '0', '0ae35271e9/0ae35271e923bb0a128f386a2fc4e459.jpg', '012.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1431', '0', 'db52c7adfb/db52c7adfbc9497e0df301ea7f13f4b2.jpg', '013.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1432', '0', '4c49e94a89/4c49e94a89213a3af23dadaf2c04bc16.jpg', '014.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1433', '0', '7b0a77cdac/7b0a77cdac32c47f772dc65346fd44d2.jpg', '015.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1434', '0', 'd4b8e1d914/d4b8e1d914e9263651e1baabe2389981.jpg', '016.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1435', '0', '1bebea5d8f/1bebea5d8fbd16f839b7c83b1837e858.jpg', '017.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1436', '0', '439ef8b8de/439ef8b8de8c87c0f6616219f4e3c56a.jpg', '018.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1437', '0', '7f5c481567/7f5c48156783bbce9eb086bb09fa46ab.jpg', '019.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1438', '0', '4b269c5a70/4b269c5a70498ade466431258e3e1230.jpg', '020.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1439', '0', '144fe980de/144fe980dec708e500ccc454107a0afb.jpg', '021.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1440', '0', 'f1698dc24f/f1698dc24ff0b585a7cb34620a61564e.jpg', '022.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1441', '0', '439f9945f6/439f9945f6720ef7bcf5fe2ccff605ad.jpg', '023.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1442', '0', 'ebb802bae3/ebb802bae337548f92242201e6434234.jpg', '024.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1443', '0', 'aea596415e/aea596415e71d0a54e8fb5b3f83702fa.jpg', '原创歌曲03.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1444', '0', '918d233811/918d233811e4ef1ed81ea6f6f9a5862f.jpg', '原创歌曲04.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1445', '0', '7fdf7c1a65/7fdf7c1a65b4fb3e43726463dda17f67.jpg', '原创歌曲05.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1446', '0', 'e10775b5b2/e10775b5b235174e6a1903cb7dfb488a.jpg', '原创歌曲06.jpg', '162', '1446784794', 'test_06', '1446784794', 'test_06');
INSERT INTO `works_library_attach` VALUES ('1447', '0', 'd9d15194e0/d9d15194e069d28b3c4f5354ecbf6dba.jpg', 'u=807421106,4206254952&fm=23&gp=.jpg', '163', '1446798983', 'test_01', '1446798983', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1450', '0', 'e4e57c092f/e4e57c092f3589d8789fe2cd73e27f01.jpg', '02.jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1451', '0', 'c137fffa6c/c137fffa6ca7b75a56e7b683ed98a3bd.jpg', '04.jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1452', '0', '3c76e082d1/3c76e082d1b1741023bfbf339047cf36.jpg', '07..jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1453', '0', 'fa4456a07c/fa4456a07c33c014f58039d10f09bfd1.jpg', '15.jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1454', '0', '5121e46f8b/5121e46f8b7d5d4653c392c664c9ee68.jpg', '16.jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1455', '0', 'e7a6c90198/e7a6c90198a91ff5b0e9ccaceca702df.jpg', '17.jpg', '119', '1446813283', 'admin', '1446813283', 'admin');
INSERT INTO `works_library_attach` VALUES ('1456', '0', '8969288f42/8969288f4245120e7c3870287cce0ff3.jpg', 'Lighthouse.jpg', '129', '1446813297', 'admin', '1446813297', 'admin');
INSERT INTO `works_library_attach` VALUES ('1457', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '129', '1446813297', 'admin', '1446813297', 'admin');
INSERT INTO `works_library_attach` VALUES ('1458', '0', 'a82d5d789a/a82d5d789a427f179a65417bf6fb1792.jpg', '13 刘荣（可爱老鼠）.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1459', '0', '3e318dc68f/3e318dc68f186410ebd98be0661fec52.jpg', '13 刘荣 （愤怒的表情）.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1460', '0', 'b32ab5ac1d/b32ab5ac1dc60df14df43b4cc053fc00.jpg', '13刘荣（矢量花朵）.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1461', '0', 'ba5a173163/ba5a173163c12e0b1ed1a967d7e4f703.gif', '鼠绘愤怒表情.gif', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1462', '0', 'acdc1eb9cd/acdc1eb9cde8c049a05d43779b43dd2e.jpg', '13刘荣.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1463', '0', 'd7c9651c3a/d7c9651c3a02089f89653f8e4ba80bee.jpg', '鼠绘小熊.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1464', '0', 'bfdd04b79d/bfdd04b79d2dedce05f13268d27546eb.jpg', '13刘荣 （愤怒的表情）.jpg', '164', '1446865565', 'test_01', '1446865565', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1465', '0', '4dff876ceb/4dff876ceb86a206becf6280ff78b320.jpg', '13.jpg', '165', '1446869253', 'admin', '1446869253', 'admin');
INSERT INTO `works_library_attach` VALUES ('1466', '0', '3073d1761f/3073d1761f801daeceacbfed38207b99.jpg', 'ceQZ7FIsCECaw.jpg', '165', '1446869253', 'admin', '1446869253', 'admin');
INSERT INTO `works_library_attach` VALUES ('1467', '0', 'e0794b0967/e0794b09678b237f641d853faa49d676.jpg', 'D~(UM8~$7FNRH7J~`5LTIBX.jpg', '165', '1446869253', 'admin', '1446869253', 'admin');
INSERT INTO `works_library_attach` VALUES ('1468', '0', '51e695bc6c/51e695bc6c003e1daba3ec34d4656272.BMP', '效果图.BMP', '165', '1446869253', 'admin', '1446869253', 'admin');
INSERT INTO `works_library_attach` VALUES ('1469', '0', '8e58208b34/8e58208b3470fc033d0abad7045fe7dc.jpg', '13刘荣1.jpg', '166', '1446878026', 'test_01', '1446878026', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1470', '0', '5c589429aa/5c589429aae3c30833fbf283599d26ff.jpg', '13 刘荣（人物）.jpg', '166', '1446878026', 'test_01', '1446878026', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1471', '0', '7a7a1427ae/7a7a1427ae219376de908549338d04c6.jpg', '外景绿色.jpg', '166', '1446878026', 'test_01', '1446878026', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1472', '0', '4dff876ceb/4dff876ceb86a206becf6280ff78b320.jpg', '13.jpg', '167', '1446878086', 'test_01', '1446878086', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1473', '0', '3073d1761f/3073d1761f801daeceacbfed38207b99.jpg', 'ceQZ7FIsCECaw.jpg', '167', '1446878086', 'test_01', '1446878086', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1474', '0', 'e0794b0967/e0794b09678b237f641d853faa49d676.jpg', 'D~(UM8~$7FNRH7J~`5LTIBX.jpg', '167', '1446878086', 'test_01', '1446878086', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1475', '0', '3e318dc68f/3e318dc68f186410ebd98be0661fec52.jpg', '13 刘荣 （愤怒的表情）.jpg', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1476', '0', 'a82d5d789a/a82d5d789a427f179a65417bf6fb1792.jpg', '13 刘荣（可爱老鼠）.jpg', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1477', '0', 'bfdd04b79d/bfdd04b79d2dedce05f13268d27546eb.jpg', '13刘荣 （愤怒的表情）.jpg', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1478', '0', 'acdc1eb9cd/acdc1eb9cde8c049a05d43779b43dd2e.jpg', '13刘荣.jpg', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1479', '0', 'ba5a173163/ba5a173163c12e0b1ed1a967d7e4f703.gif', '鼠绘愤怒表情.gif', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1480', '0', 'd7c9651c3a/d7c9651c3a02089f89653f8e4ba80bee.jpg', '鼠绘小熊.jpg', '168', '1446878173', 'test_01', '1446878173', 'test_01');
INSERT INTO `works_library_attach` VALUES ('1481', '0', '5a9a91184e/5a9a91184e611dae3fed162b8787ce5f.mp3', 'Kalimba.mp3', '159', '1446884826', 'admin01', '1446884826', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1482', '0', 'f153a4c16f/f153a4c16f42565170b040a007fed779.png', '1.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1483', '0', 'e016c2d278/e016c2d2782e7344504e337a60758e58.png', '3.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1484', '0', '92a7b13381/92a7b1338123c6f901c0167f0c2689b1.png', '2.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1485', '0', '822f291d9f/822f291d9fc86110b20f71980a192f07.png', '5.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1486', '0', 'b285795b3d/b285795b3d0df58c638183e92e05f4e3.png', '7.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1487', '0', '9d1e1d2ca0/9d1e1d2ca0464becf164ec71bce0a143.png', '6.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1488', '0', '599c0a3d7e/599c0a3d7e76c64cbed807ec58401425.png', '4.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1489', '0', '82a862e687/82a862e6875ac1a48b87f633ff64a9bd.png', '9.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1490', '0', 'dfcf01a887/dfcf01a887affd17c41c521c41bbc305.png', '10.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1491', '0', 'a0f53a1d62/a0f53a1d6205d5c79803f36a45ae64c8.png', '8.png', '117', '1447054173', 'admin', '1447054173', 'admin');
INSERT INTO `works_library_attach` VALUES ('1492', '0', '11dc106839/11dc1068392ae30f161e0d59e57ce6cb.mp4', '004.mp4', '65', '1447055184', 'admin', '1447055184', 'admin');
INSERT INTO `works_library_attach` VALUES ('1493', '0', '9fadd4d88c/9fadd4d88cc07c20c1917d8e3be7a1e9.png', '已包养.png', '169', '1447140151', 'faa123', '1447140151', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1494', '0', '2c3ab905a1/2c3ab905a1d6ee14d70f1bfa98d239d9.mp4', 'mp4002.mp4', '170', '1447577904', 'admin', '1447577904', 'admin');
INSERT INTO `works_library_attach` VALUES ('1499', '0', 'd3a939422b/d3a939422bf2f33ca8468242fcc85c5d.png', '产品价格.png', '172', '1447749721', 'p01', '1447749721', 'p01');
INSERT INTO `works_library_attach` VALUES ('1500', '0', '731e5bbeab/731e5bbeabdd62d76fb3e6cf98c51a60.png', '29.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1501', '0', '17e2cb16f4/17e2cb16f47d56035ce5e7c43aeef01b.png', '26.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1502', '0', '9a347ebbfc/9a347ebbfc72842674549db70cb57937.png', '27.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1503', '0', 'b832851a9d/b832851a9d94ae1be079ab5f8019ea15.png', '28.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1504', '0', 'e0119ad914/e0119ad9148259a225cc3d4b255c023d.png', '25.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1505', '0', '5e1bb462ac/5e1bb462ac981759aab2788446974da2.png', '22.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1506', '0', '18df09905f/18df09905fd62ce4d407d5786539f3bc.png', '21.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1507', '0', '5808a6c99b/5808a6c99b68e096763f7aedb064ac5a.png', '23.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1508', '0', 'b70018ff8a/b70018ff8acf46e89ce2c6ea67688165.png', '20.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1509', '0', 'd6eed2b399/d6eed2b399798ac5f97aa62390ec525a.png', '19.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1510', '0', '9b894b06eb/9b894b06eb604c204184700e0943fe0c.png', '24.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1511', '0', '0c3bac9c44/0c3bac9c4437675189b8b1f8e38bd808.png', '17.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1512', '0', '1bce8ed814/1bce8ed814ab60e1f50cfed83b870677.png', '146.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1513', '0', '3fd0bbd4e0/3fd0bbd4e026fff930c8cb4ee3ec691b.png', '18.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1514', '0', '685cbb6a25/685cbb6a25b2982f9ccbf6941beb067e.png', '15.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1515', '0', '36356d212e/36356d212eb5ea181197430e96776f1c.png', '13.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1516', '0', 'd50d3c7432/d50d3c743299910c43d8828aa8884bcd.png', '12.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1517', '0', '5c2510c345/5c2510c3453fe6f4166f38813aada40b.png', '14.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1518', '0', '201e9859b0/201e9859b0daabb0ad51edf7727c03a5.png', '16.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1519', '0', '9b894b06eb/9b894b06eb604c204184700e0943fe0c.png', '24.png', '173', '1447750593', 'p01', '1447750593', 'p01');
INSERT INTO `works_library_attach` VALUES ('1520', '0', 'e4082cd6ee/e4082cd6eedab3f01452064efb090564.mp4', '输不起.mp4', '174', '1447751585', 'faa123', '1447751585', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1521', '0', '98a44771ac/98a44771ac34541760f186e6dfd446ab.mp4', '过江龙 - 唐伯虎点秋香.mp4', '174', '1447751585', 'faa123', '1447751585', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1522', '0', 'a53802feac/a53802feaccd72eac3c8ef9868f3bed4.jpg', '1.jpg', '175', '1447755956', 'admin01', '1447755956', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1523', '0', '68830e360c/68830e360c78a888de22618996827b33.jpg', '2.jpg', '175', '1447755956', 'admin01', '1447755956', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1524', '0', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '4.jpg', '176', '1447756386', 'admin01', '1447756386', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1526', '0', '38c393e2b0/38c393e2b08714f2aa7cf9b7f92d1d7a.png', '精彩推荐问题.png', '177', '1447829734', 'admin01', '1447829734', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1530', '0', '610861a52a/610861a52a024ccad1fbf8ebe1d8c35d.jpg', 'ncs-red-renault.jpg', '178', '1447865421', 'admin', '1447865421', 'admin');
INSERT INTO `works_library_attach` VALUES ('1531', '0', 'bdf3bf1da3/bdf3bf1da3405725be763540d6601144.jpg', 'Hydrangeas.jpg', '179', '1447897877', 'faa123', '1447897877', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1532', '0', '5a44c7ba5b/5a44c7ba5bbe4ec867233d67e4806848.jpg', 'Jellyfish.jpg', '179', '1447897877', 'faa123', '1447897877', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1533', '0', '2b04df3ecc/2b04df3ecc1d94afddff082d139c6f15.jpg', 'Koala.jpg', '179', '1447897877', 'faa123', '1447897877', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1534', '0', '8969288f42/8969288f4245120e7c3870287cce0ff3.jpg', 'Lighthouse.jpg', '179', '1447897877', 'faa123', '1447897877', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1535', '0', 'e4082cd6ee/e4082cd6eedab3f01452064efb090564.mp4', '输不起.mp4', '180', '1447898052', 'faa123', '1447898052', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1542', '0', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '2.jpg', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1543', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1544', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1545', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1546', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1547', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '181', '1447916606', 'admin', '1447916606', 'admin');
INSERT INTO `works_library_attach` VALUES ('1553', '0', '4eba3833d8/4eba3833d8b7770a3a4e37a77797943a.jpg', '2.jpg', '182', '1447917032', 'admin', '1447917032', 'admin');
INSERT INTO `works_library_attach` VALUES ('1554', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '182', '1447917032', 'admin', '1447917032', 'admin');
INSERT INTO `works_library_attach` VALUES ('1555', '0', '095e9efc37/095e9efc37ac918fb56a682553f6a1c3.jpg', '07.jpg', '182', '1447917032', 'admin', '1447917032', 'admin');
INSERT INTO `works_library_attach` VALUES ('1556', '0', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '08.jpg', '182', '1447917032', 'admin', '1447917032', 'admin');
INSERT INTO `works_library_attach` VALUES ('1557', '0', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', 'QQ图片20150805172051.jpg', '182', '1447917032', 'admin', '1447917032', 'admin');
INSERT INTO `works_library_attach` VALUES ('1558', '0', '0eacd2e2e0/0eacd2e2e0a12edaf175de508b60b63e.jpg', '77094b36acaf2eddf2785ce28b1001e93901932b.jpg', '183', '1447921229', 'admin', '1447921229', 'admin');
INSERT INTO `works_library_attach` VALUES ('1559', '0', 'dd1634a3c2/dd1634a3c297b627140cb0f99cc8d869.jpg', '9922720e0cf3d7ca60432a7df41fbe096b63a907.jpg', '183', '1447921229', 'admin', '1447921229', 'admin');
INSERT INTO `works_library_attach` VALUES ('1560', '0', 'd9d15194e0/d9d15194e069d28b3c4f5354ecbf6dba.jpg', 'u=807421106,4206254952&fm=23&gp=.jpg', '184', '1447922552', 'admin', '1447922552', 'admin');
INSERT INTO `works_library_attach` VALUES ('1561', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '185', '1447924925', 'admin', '1447924925', 'admin');
INSERT INTO `works_library_attach` VALUES ('1562', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '185', '1447924925', 'admin', '1447924925', 'admin');
INSERT INTO `works_library_attach` VALUES ('1563', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '185', '1447924925', 'admin', '1447924925', 'admin');
INSERT INTO `works_library_attach` VALUES ('1564', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '185', '1447924925', 'admin', '1447924925', 'admin');
INSERT INTO `works_library_attach` VALUES ('1565', '0', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', 'QQ图片20150805172051.jpg', '185', '1447924925', 'admin', '1447924925', 'admin');
INSERT INTO `works_library_attach` VALUES ('1566', '0', '9f0c25b650/9f0c25b650da01d4b9a41559e9f09170.png', '003.png', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1567', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1568', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1569', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1570', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1571', '0', '70c0061dfc/70c0061dfc5e7ab09bf62e3f5d29513e.jpg', '08.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1572', '0', '1b695d4710/1b695d47103295f3df69bec23a04e85e.jpg', 'QQ图片20150805172051.jpg', '186', '1447925054', 'admin', '1447925054', 'admin');
INSERT INTO `works_library_attach` VALUES ('1577', '0', '7752f5b11a/7752f5b11a3156d18685b9ffc22bba1b.jpg', '03.jpg', '187', '1447925269', 'admin', '1447925269', 'admin');
INSERT INTO `works_library_attach` VALUES ('1578', '0', 'd415251193/d4152511931173a375d6fef5c2509deb.jpg', '04.jpg', '187', '1447925269', 'admin', '1447925269', 'admin');
INSERT INTO `works_library_attach` VALUES ('1579', '0', 'c610c53796/c610c5379604bbfd4e7efe836f4c3444.jpg', '05.jpg', '187', '1447925269', 'admin', '1447925269', 'admin');
INSERT INTO `works_library_attach` VALUES ('1580', '0', '1c1a241a9f/1c1a241a9ff989a61573a4be6fd9e22b.jpg', '06.jpg', '187', '1447925269', 'admin', '1447925269', 'admin');
INSERT INTO `works_library_attach` VALUES ('1585', '0', '07a0bdbcdd/07a0bdbcdd77467ca5a24e8dfdb67e0c.gif', 'gif3.gif', '171', '1448025408', 'admin', '1448025408', 'admin');
INSERT INTO `works_library_attach` VALUES ('1586', '0', '767cf597cb/767cf597cb640a368c702a8bb10f0c00.png', 'png104.png', '171', '1448025408', 'admin', '1448025408', 'admin');
INSERT INTO `works_library_attach` VALUES ('1587', '0', '15f20f7bbc/15f20f7bbca207261051527c30ef20ba.png', 'png103.png', '171', '1448025408', 'admin', '1448025408', 'admin');
INSERT INTO `works_library_attach` VALUES ('1588', '0', '469e80a5db/469e80a5dbbc6e770dd0e7fa246299c5.png', 'png102.png', '171', '1448025408', 'admin', '1448025408', 'admin');
INSERT INTO `works_library_attach` VALUES ('1589', '0', '33ebd82836/33ebd8283669cc5882bf572f4dd71a98.jpg', '3.jpg', '188', '1448337179', 'admin01', '1448337179', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1590', '0', '8969288f42/8969288f4245120e7c3870287cce0ff3.jpg', 'Lighthouse.jpg', '189', '1448337494', 'admin01', '1448337494', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1591', '0', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '4.jpg', '190', '1448337713', 'admin01', '1448337713', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1592', '0', '495c49f68c/495c49f68cf2df7f1820e99cf8b8f9ce.jpg', '4.jpg', '191', '1448337713', 'admin01', '1448337713', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1593', '0', '68830e360c/68830e360c78a888de22618996827b33.jpg', '2.jpg', '192', '1448355861', 'faa12', '1448355861', 'faa12');
INSERT INTO `works_library_attach` VALUES ('1594', '0', '11504dd206/11504dd206fa631ee76d4cec394b29b8.jpg', 'u=3204560093,2571702593&fm=21&gp=0.jpg', '193', '1448480577', 'admin', '1448480577', 'admin');
INSERT INTO `works_library_attach` VALUES ('1595', '0', 'ccf659a17d/ccf659a17d6d548f9685431fefff10f5.jpg', '201409191616438112779.jpg', '194', '1448504005', 'admin', '1448504005', 'admin');
INSERT INTO `works_library_attach` VALUES ('1596', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '195', '1448611476', 'admin', '1448611476', 'admin');
INSERT INTO `works_library_attach` VALUES ('1597', '0', 'undefined', '视频空白.png', '196', '1448699798', 'admin01', '1448699798', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1598', '0', 'undefined', '视频推荐配置异常.png', '197', '1448699883', 'admin01', '1448699883', 'admin01');
INSERT INTO `works_library_attach` VALUES ('1599', '0', 'undefined', '购物车优惠价购物异常.png', '198', '1448702372', 'faa123', '1448702372', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1600', '0', 'undefined', '自拍前台无作品展示.png', '199', '1448866286', 'faa123', '1448866286', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1601', '0', 'undefined', '视频推荐配置异常.png', '199', '1448866286', 'faa123', '1448866286', 'faa123');
INSERT INTO `works_library_attach` VALUES ('1602', '0', 'undefined', '3.jpg', '200', '1448866862', 'p03', '1448866862', 'p03');
INSERT INTO `works_library_attach` VALUES ('1603', '0', 'b8b5bd53e2/b8b5bd53e23dd40b5c4a650e272f2e19.mp3', 'Sleep Away.mp3', '132', '1448955770', 'admin', '1448955770', 'admin');
INSERT INTO `works_library_attach` VALUES ('1604', '0', '2687d024b9/2687d024b9c8e254c9a8df996fd8713d.mp4', '不要就这样离开我 - 樊凡.mp4', '201', '1449025319', 'admin', '1449025319', 'admin');
INSERT INTO `works_library_attach` VALUES ('1608', '0', 'f38d749406/f38d749406ce2d696d529ff8e9e2cf73.mp4', '铁风筝 - 北京的天气.mp4', '202', '1449028346', 'admin', '1449028346', 'admin');
INSERT INTO `works_library_attach` VALUES ('1609', '0', 'f38d749406/f38d749406ce2d696d529ff8e9e2cf73.mp4', '铁风筝 - 北京的天气.mp4', '203', '1449028503', 'admin', '1449028503', 'admin');
INSERT INTO `works_library_attach` VALUES ('1613', '0', 'fd548a9867/fd548a986773588d2622f6cb1f670102.mp4', '罗凯楠 - 咱们屯里人.mp4', '204', '1449029847', 'admin', '1449029847', 'admin');

-- ----------------------------
-- Table structure for works_library_log
-- ----------------------------
DROP TABLE IF EXISTS `works_library_log`;
CREATE TABLE `works_library_log` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_type` tinyint(4) DEFAULT '0' COMMENT '操作类型 默认 0 单个操作 1按分类批量操作 2 全站',
  `works_id` bigint(20) DEFAULT NULL COMMENT '作品ID',
  `first_id` bigint(20) DEFAULT NULL COMMENT '一级分类ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '二级分类ID',
  `desc` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `change_way` tinyint(4) DEFAULT '0' COMMENT '添加方式默认0数量 1 百分比',
  `change_num` varchar(10) DEFAULT NULL COMMENT '改变数量 或者百分比',
  `change_type` tinyint(4) DEFAULT '0' COMMENT '修改字段 默认0 收藏数量 1浏览数量',
  `loguser` varchar(60) DEFAULT NULL COMMENT '添加人',
  `logtime` bigint(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='操作日志  运营管理修改收藏和浏览量';

-- ----------------------------
-- Records of works_library_log
-- ----------------------------
INSERT INTO `works_library_log` VALUES ('9', '0', '1', null, null, null, '0', '100', '0', 'admin', '1438674867');
INSERT INTO `works_library_log` VALUES ('10', '0', '2', null, null, null, '0', '100', '0', 'admin', '1438674892');
INSERT INTO `works_library_log` VALUES ('11', '0', '2', null, null, null, '1', '20', '0', 'admin', '1438674923');
INSERT INTO `works_library_log` VALUES ('12', '0', '1', null, null, null, '0', '100', '1', 'admin', '1438674967');
INSERT INTO `works_library_log` VALUES ('13', '0', '2', null, null, null, '0', '100', '1', 'admin', '1438674974');
INSERT INTO `works_library_log` VALUES ('14', '0', '2', null, null, null, '1', '20', '1', 'admin', '1438674982');
INSERT INTO `works_library_log` VALUES ('15', '1', null, '1', '0', null, '0', '100', '0', 'admin', '1438675017');
INSERT INTO `works_library_log` VALUES ('16', '1', null, '1', '0', null, '1', '20', '0', 'admin', '1438675026');
INSERT INTO `works_library_log` VALUES ('17', '1', null, '1', '1', null, '0', '100', '0', 'admin', '1438675035');
INSERT INTO `works_library_log` VALUES ('18', '1', null, '1', '1', null, '1', '20', '0', 'admin', '1438675047');
INSERT INTO `works_library_log` VALUES ('19', '2', null, '0', '0', null, '0', '100', '0', 'admin', '1438675053');
INSERT INTO `works_library_log` VALUES ('20', '2', null, '0', '0', null, '1', '50', '0', 'admin', '1438675064');
INSERT INTO `works_library_log` VALUES ('21', '2', null, '0', '0', null, '1', '20', '0', 'admin', '1438675118');
INSERT INTO `works_library_log` VALUES ('22', '1', null, '1', '0', null, '0', '100', '1', 'admin', '1438675161');
INSERT INTO `works_library_log` VALUES ('23', '1', null, '1', '1', null, '1', '20', '1', 'admin', '1438675175');
INSERT INTO `works_library_log` VALUES ('24', '2', null, '0', '0', null, '0', '151', '1', 'admin', '1438675184');
INSERT INTO `works_library_log` VALUES ('25', '2', null, '0', '0', null, '1', '30', '1', 'admin', '1438675195');
INSERT INTO `works_library_log` VALUES ('26', '0', '48', null, null, null, '0', '50', '0', 'admin', '1439260001');
INSERT INTO `works_library_log` VALUES ('27', '0', '48', null, null, null, '0', '500', '1', 'admin', '1439260193');
INSERT INTO `works_library_log` VALUES ('28', '0', '48', null, null, null, '1', '20', '0', 'admin', '1439260329');
INSERT INTO `works_library_log` VALUES ('29', '0', '48', null, null, null, '1', '20', '0', 'admin', '1439260363');
INSERT INTO `works_library_log` VALUES ('30', '0', '48', null, null, null, '1', '20', '0', 'admin', '1439260598');
INSERT INTO `works_library_log` VALUES ('31', '0', '48', null, null, null, '1', '20', '0', 'admin', '1439260957');
INSERT INTO `works_library_log` VALUES ('32', '2', null, '1', '1', null, '0', '10', '0', 'admin', '1439261060');
INSERT INTO `works_library_log` VALUES ('33', '1', null, '1', '1', null, '0', '5', '0', 'admin', '1439261091');
INSERT INTO `works_library_log` VALUES ('34', '1', null, '3', '5', null, '0', '5', '0', 'admin', '1439261391');
INSERT INTO `works_library_log` VALUES ('35', '2', null, '1', '0', null, '0', '10', '1', 'admin', '1439261441');
INSERT INTO `works_library_log` VALUES ('36', '1', null, '1', '1', null, '0', '21', '0', 'admin', '1439373486');
INSERT INTO `works_library_log` VALUES ('37', '1', null, '1', '0', null, '0', '2', '1', 'admin', '1440562901');
INSERT INTO `works_library_log` VALUES ('38', '0', '12', null, null, null, '0', '2', '1', 'admin', '1440562915');
INSERT INTO `works_library_log` VALUES ('39', '0', '12', null, null, null, '0', '2', '0', 'admin', '1440562928');
INSERT INTO `works_library_log` VALUES ('40', '0', '121', null, null, null, '0', '5', '0', 'admin', '1442288918');
INSERT INTO `works_library_log` VALUES ('41', '0', '121', null, null, null, '0', '5', '0', 'admin', '1442288918');
INSERT INTO `works_library_log` VALUES ('42', '0', '1213132', null, null, null, '0', '5', '0', 'admin', '1442288927');
INSERT INTO `works_library_log` VALUES ('43', '1', null, '1', '3', null, '0', '1', '0', 'admin', '1442288986');
INSERT INTO `works_library_log` VALUES ('44', '0', '90', null, null, null, '0', '2', '0', 'rong', '1444363755');
INSERT INTO `works_library_log` VALUES ('45', '1', null, '1', '1', null, '0', '2324323423', '0', 'admin', '1444969193');
INSERT INTO `works_library_log` VALUES ('46', '1', null, '2', '6', null, '1', '11', '0', 'admin', '1444969245');
INSERT INTO `works_library_log` VALUES ('47', '1', null, '2', '6', null, '1', '11', '0', 'admin', '1444969245');
INSERT INTO `works_library_log` VALUES ('48', '0', '11', null, null, null, '0', '42', '0', 'admin', '1444969268');
INSERT INTO `works_library_log` VALUES ('49', '0', '23', null, null, null, '0', '33', '0', 'admin', '1445483382');
INSERT INTO `works_library_log` VALUES ('50', '0', '130', null, null, null, '0', '2', '0', 'test_99', '1446196884');
INSERT INTO `works_library_log` VALUES ('51', '0', '131', null, null, null, '1', '3', '1', 'test_99', '1446196888');
INSERT INTO `works_library_log` VALUES ('52', '1', null, '1', '1', null, '1', '4', '0', 'test_99', '1446196954');
INSERT INTO `works_library_log` VALUES ('53', '1', null, '3', '17', null, '0', '5', '1', 'test_99', '1446196960');
INSERT INTO `works_library_log` VALUES ('54', '0', '134', null, null, null, '0', '13', '1', 'admin', '1446458626');
INSERT INTO `works_library_log` VALUES ('55', '0', '134', null, null, null, '0', '12', '0', 'admin', '1446458628');
INSERT INTO `works_library_log` VALUES ('56', '0', '134', null, null, null, '1', '40', '1', 'test_99', '1446458792');
INSERT INTO `works_library_log` VALUES ('57', '0', '134', null, null, null, '1', '30', '0', 'test_99', '1446458795');
INSERT INTO `works_library_log` VALUES ('58', '1', null, '1', '15', null, '0', '10', '1', 'test_99', '1446459184');
INSERT INTO `works_library_log` VALUES ('59', '0', '134', null, null, null, '1', '10', '1', 'test_99', '1446459593');
INSERT INTO `works_library_log` VALUES ('60', '1', null, '2', '12', null, '0', '10', '1', 'test_99', '1446459723');
INSERT INTO `works_library_log` VALUES ('61', '2', null, '2', '12', null, '0', '10', '0', 'test_99', '1446459727');
INSERT INTO `works_library_log` VALUES ('62', '1', null, '2', '12', null, '1', '80', '1', 'test_99', '1446462102');
INSERT INTO `works_library_log` VALUES ('63', '1', null, '2', '12', null, '1', '90', '0', 'test_99', '1446462106');
INSERT INTO `works_library_log` VALUES ('64', '0', '177', null, null, null, '0', '20', '0', 'admin01', '1447837072');
INSERT INTO `works_library_log` VALUES ('65', '0', '177', null, null, null, '0', '20', '1', 'admin01', '1447837145');
INSERT INTO `works_library_log` VALUES ('66', '0', '177', null, null, null, '0', '20', '0', 'admin01', '1447837150');
INSERT INTO `works_library_log` VALUES ('67', '0', '177', null, null, null, '0', '100', '1', 'admin01', '1447837182');

-- ----------------------------
-- Table structure for works_library_review_log
-- ----------------------------
DROP TABLE IF EXISTS `works_library_review_log`;
CREATE TABLE `works_library_review_log` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `works_libray` bigint(20) DEFAULT NULL COMMENT '作品',
  `logtime` bigint(20) DEFAULT '0' COMMENT '操作时间',
  `desc` varchar(1000) DEFAULT NULL COMMENT '说明',
  `status_change` varchar(1000) DEFAULT NULL COMMENT '状态变更',
  `action_user` varchar(100) DEFAULT NULL COMMENT '操作人',
  `createdtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(100) DEFAULT NULL COMMENT '创建人',
  `updatedtime` bigint(20) DEFAULT NULL COMMENT '更改时间',
  `updatedby` varchar(100) DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8 COMMENT='作品审核、操作记录';

-- ----------------------------
-- Records of works_library_review_log
-- ----------------------------
INSERT INTO `works_library_review_log` VALUES ('3', '1', '1435902490', '就是不让你过', '由1 改为  4', 'admin', '1435902490', 'admin', '1435902490', 'admin');
INSERT INTO `works_library_review_log` VALUES ('4', '1', '1435904222', '12312', '由1 改为  3', 'admin', '1435904222', 'admin', '1435904222', 'admin');
INSERT INTO `works_library_review_log` VALUES ('5', '2', '1435913373', '0', '由3 改为  1', 'admin', '1435913373', 'admin', '1435913373', 'admin');
INSERT INTO `works_library_review_log` VALUES ('6', '2', '1435913547', '0', '由0 改为  1', 'admin', '1435913547', 'admin', '1435913547', 'admin');
INSERT INTO `works_library_review_log` VALUES ('7', '1', '1435913582', '作品没有添加', '由0 改为  2', 'admin', '1435913582', 'admin', '1435913582', 'admin');
INSERT INTO `works_library_review_log` VALUES ('8', '2', '1435913674', '0', '由1 改为  3', 'admin', '1435913674', 'admin', '1435913674', 'admin');
INSERT INTO `works_library_review_log` VALUES ('9', '4', '1436759298', '0', '由0 改为  1', 'admin', '1436759298', 'admin', '1436759298', 'admin');
INSERT INTO `works_library_review_log` VALUES ('10', '3', '1436769820', '就是不让你通过', '由0 改为  2', 'admin', '1436769820', 'admin', '1436769820', 'admin');
INSERT INTO `works_library_review_log` VALUES ('11', '19', '1437741818', '0', '由0 改为  1', 'admin', '1437741818', 'admin', '1437741818', 'admin');
INSERT INTO `works_library_review_log` VALUES ('12', '19', '1437741825', '0', '由1 改为  1', 'admin', '1437741825', 'admin', '1437741825', 'admin');
INSERT INTO `works_library_review_log` VALUES ('13', '18', '1437741840', '0', '由0 改为  1', 'admin', '1437741840', 'admin', '1437741840', 'admin');
INSERT INTO `works_library_review_log` VALUES ('14', '17', '1437741889', '0', '由0 改为  1', 'admin', '1437741889', 'admin', '1437741889', 'admin');
INSERT INTO `works_library_review_log` VALUES ('15', '16', '1437741895', '0', '由0 改为  1', 'admin', '1437741895', 'admin', '1437741895', 'admin');
INSERT INTO `works_library_review_log` VALUES ('16', '15', '1437741923', '0', '由0 改为  1', 'admin', '1437741923', 'admin', '1437741923', 'admin');
INSERT INTO `works_library_review_log` VALUES ('17', '14', '1437741950', '0', '由0 改为  1', 'admin', '1437741950', 'admin', '1437741950', 'admin');
INSERT INTO `works_library_review_log` VALUES ('18', '13', '1437742181', '0', '由0 改为  1', 'admin', '1437742181', 'admin', '1437742181', 'admin');
INSERT INTO `works_library_review_log` VALUES ('19', '12', '1437742284', '0', '由0 改为  1', 'admin', '1437742284', 'admin', '1437742284', 'admin');
INSERT INTO `works_library_review_log` VALUES ('20', '11', '1437742710', '0', '由0 改为  1', 'admin', '1437742710', 'admin', '1437742710', 'admin');
INSERT INTO `works_library_review_log` VALUES ('21', '5', '1437742715', '0', '由0 改为  1', 'admin', '1437742715', 'admin', '1437742715', 'admin');
INSERT INTO `works_library_review_log` VALUES ('22', '10', '1437742721', 'qwqw', '由0 改为  0', 'admin', '1437742721', 'admin', '1437742721', 'admin');
INSERT INTO `works_library_review_log` VALUES ('23', '19', '1438765307', '0', '由0 改为  1', 'admin', '1438765307', 'admin', '1438765307', 'admin');
INSERT INTO `works_library_review_log` VALUES ('24', '17', '1438826732', '0', '由0 改为  1', 'admin', '1438826732', 'admin', '1438826732', 'admin');
INSERT INTO `works_library_review_log` VALUES ('25', '16', '1438826741', '0', '由0 改为  1', 'admin', '1438826741', 'admin', '1438826741', 'admin');
INSERT INTO `works_library_review_log` VALUES ('26', '31', '1439176788', '0', '由0 改为  1', 'admin', '1439176788', 'admin', '1439176788', 'admin');
INSERT INTO `works_library_review_log` VALUES ('27', '31', '1439176813', '0', '由1 改为  3', 'admin', '1439176813', 'admin', '1439176813', 'admin');
INSERT INTO `works_library_review_log` VALUES ('28', '44', '1439188040', '0', '由0 改为  1', 'admin', '1439188040', 'admin', '1439188040', 'admin');
INSERT INTO `works_library_review_log` VALUES ('29', '44', '1439188092', '0', '由1 改为  3', 'admin', '1439188092', 'admin', '1439188092', 'admin');
INSERT INTO `works_library_review_log` VALUES ('30', '44', '1439188094', '0', '由3 改为  3', 'admin', '1439188094', 'admin', '1439188094', 'admin');
INSERT INTO `works_library_review_log` VALUES ('31', '44', '1439188094', '0', '由3 改为  3', 'admin', '1439188094', 'admin', '1439188094', 'admin');
INSERT INTO `works_library_review_log` VALUES ('32', '19', '1439188111', '0', '由1 改为  3', 'admin', '1439188111', 'admin', '1439188111', 'admin');
INSERT INTO `works_library_review_log` VALUES ('33', '43', '1439188351', '0', '由0 改为  1', 'admin', '1439188351', 'admin', '1439188351', 'admin');
INSERT INTO `works_library_review_log` VALUES ('34', '39', '1439188522', '0', '由0 改为  1', 'admin', '1439188522', 'admin', '1439188522', 'admin');
INSERT INTO `works_library_review_log` VALUES ('35', '48', '1439191155', '0', '由0 改为  1', 'admin', '1439191155', 'admin', '1439191155', 'admin');
INSERT INTO `works_library_review_log` VALUES ('36', '47', '1439191165', '0', '由0 改为  1', 'admin', '1439191165', 'admin', '1439191165', 'admin');
INSERT INTO `works_library_review_log` VALUES ('37', '46', '1439191170', '0', '由0 改为  1', 'admin', '1439191170', 'admin', '1439191170', 'admin');
INSERT INTO `works_library_review_log` VALUES ('38', '45', '1439191175', '0', '由0 改为  1', 'admin', '1439191175', 'admin', '1439191175', 'admin');
INSERT INTO `works_library_review_log` VALUES ('39', '42', '1439191180', '0', '由0 改为  1', 'admin', '1439191180', 'admin', '1439191180', 'admin');
INSERT INTO `works_library_review_log` VALUES ('40', '48', '1439191199', '0', '由1 改为  3', 'admin', '1439191199', 'admin', '1439191199', 'admin');
INSERT INTO `works_library_review_log` VALUES ('41', '47', '1439191595', '0', '由1 改为  3', 'admin', '1439191595', 'admin', '1439191595', 'admin');
INSERT INTO `works_library_review_log` VALUES ('42', '46', '1439191606', '测试', '由1 改为  0', 'admin', '1439191606', 'admin', '1439191606', 'admin');
INSERT INTO `works_library_review_log` VALUES ('43', '46', '1439191671', '0', '由0 改为  1', 'admin', '1439191671', 'admin', '1439191671', 'admin');
INSERT INTO `works_library_review_log` VALUES ('44', '46', '1439191681', '测试', '由1 改为  3', 'admin', '1439191681', 'admin', '1439191681', 'admin');
INSERT INTO `works_library_review_log` VALUES ('45', '45', '1439191866', '测试', '由1 改为  0', 'admin', '1439191866', 'admin', '1439191866', 'admin');
INSERT INTO `works_library_review_log` VALUES ('46', '43', '1439191885', '测试', '由1 改为  0', 'admin', '1439191885', 'admin', '1439191885', 'admin');
INSERT INTO `works_library_review_log` VALUES ('47', '45', '1439191948', '测试', '由0 改为  0', 'admin', '1439191948', 'admin', '1439191948', 'admin');
INSERT INTO `works_library_review_log` VALUES ('48', '42', '1439192097', '0', '由1 改为  3', 'admin', '1439192097', 'admin', '1439192097', 'admin');
INSERT INTO `works_library_review_log` VALUES ('49', '45', '1439192111', '0', '由0 改为  1', 'admin', '1439192111', 'admin', '1439192111', 'admin');
INSERT INTO `works_library_review_log` VALUES ('50', '45', '1439192140', '0', '由1 改为  3', 'admin', '1439192140', 'admin', '1439192140', 'admin');
INSERT INTO `works_library_review_log` VALUES ('51', '43', '1439192173', '0', '由0 改为  1', 'admin', '1439192173', 'admin', '1439192173', 'admin');
INSERT INTO `works_library_review_log` VALUES ('52', '43', '1439192188', '0', '由1 改为  3', 'admin', '1439192188', 'admin', '1439192188', 'admin');
INSERT INTO `works_library_review_log` VALUES ('53', '50', '1439351647', '￥%……', '由0 改为  0', 'admin', '1439351647', 'admin', '1439351647', 'admin');
INSERT INTO `works_library_review_log` VALUES ('54', '17', '1439352303', '0', '由1 改为  3', 'admin', '1439352303', 'admin', '1439352303', 'admin');
INSERT INTO `works_library_review_log` VALUES ('55', '50', '1439460158', '0', '由0 改为  1', 'admin', '1439460158', 'admin', '1439460158', 'admin');
INSERT INTO `works_library_review_log` VALUES ('56', '49', '1440560744', '0', '由0 改为  1', 'admin', '1440560744', 'admin', '1440560744', 'admin');
INSERT INTO `works_library_review_log` VALUES ('57', '29', '1440560790', 'ds1f545dsa4f564as65df4a65s4f56das4f56asd4f5as', '由0 改为  0', 'admin', '1440560790', 'admin', '1440560790', 'admin');
INSERT INTO `works_library_review_log` VALUES ('58', '21', '1440987295', '0', '由0 改为  1', 'admin', '1440987295', 'admin', '1440987295', 'admin');
INSERT INTO `works_library_review_log` VALUES ('59', '21', '1440987346', '0', '由1 改为  3', 'admin', '1440987346', 'admin', '1440987346', 'admin');
INSERT INTO `works_library_review_log` VALUES ('60', '29', '1441008551', '12', '由0 改为  2', 'admin', '1441008551', 'admin', '1441008551', 'admin');
INSERT INTO `works_library_review_log` VALUES ('61', '57', '1441094206', '0', '由0 改为  1', 'admin', '1441094206', 'admin', '1441094206', 'admin');
INSERT INTO `works_library_review_log` VALUES ('62', '56', '1441094210', '0', '由0 改为  1', 'admin', '1441094210', 'admin', '1441094210', 'admin');
INSERT INTO `works_library_review_log` VALUES ('63', '55', '1441094215', '0', '由0 改为  1', 'admin', '1441094215', 'admin', '1441094215', 'admin');
INSERT INTO `works_library_review_log` VALUES ('64', '54', '1441094218', '0', '由0 改为  1', 'admin', '1441094218', 'admin', '1441094218', 'admin');
INSERT INTO `works_library_review_log` VALUES ('65', '57', '1441094226', '0', '由1 改为  3', 'admin', '1441094226', 'admin', '1441094226', 'admin');
INSERT INTO `works_library_review_log` VALUES ('66', '56', '1441094229', '0', '由1 改为  3', 'admin', '1441094229', 'admin', '1441094229', 'admin');
INSERT INTO `works_library_review_log` VALUES ('67', '55', '1441094231', '0', '由1 改为  3', 'admin', '1441094231', 'admin', '1441094231', 'admin');
INSERT INTO `works_library_review_log` VALUES ('68', '54', '1441094234', '0', '由1 改为  3', 'admin', '1441094234', 'admin', '1441094234', 'admin');
INSERT INTO `works_library_review_log` VALUES ('69', '59', '1441506340', '0', '由0 改为  1', 'admin', '1441506340', 'admin', '1441506340', 'admin');
INSERT INTO `works_library_review_log` VALUES ('70', '59', '1441506353', '0', '由1 改为  3', 'admin', '1441506353', 'admin', '1441506353', 'admin');
INSERT INTO `works_library_review_log` VALUES ('71', '60', '1441532741', '0', '由0 改为  1', 'admin', '1441532741', 'admin', '1441532741', 'admin');
INSERT INTO `works_library_review_log` VALUES ('72', '61', '1441532745', '0', '由0 改为  1', 'admin', '1441532745', 'admin', '1441532745', 'admin');
INSERT INTO `works_library_review_log` VALUES ('73', '63', '1441532748', '0', '由0 改为  1', 'admin', '1441532748', 'admin', '1441532748', 'admin');
INSERT INTO `works_library_review_log` VALUES ('74', '62', '1441532752', '0', '由0 改为  1', 'admin', '1441532752', 'admin', '1441532752', 'admin');
INSERT INTO `works_library_review_log` VALUES ('75', '63', '1441532760', '0', '由1 改为  3', 'admin', '1441532760', 'admin', '1441532760', 'admin');
INSERT INTO `works_library_review_log` VALUES ('76', '61', '1441532762', '0', '由1 改为  3', 'admin', '1441532762', 'admin', '1441532762', 'admin');
INSERT INTO `works_library_review_log` VALUES ('77', '62', '1441532770', '0', '由1 改为  3', 'admin', '1441532770', 'admin', '1441532770', 'admin');
INSERT INTO `works_library_review_log` VALUES ('78', '53', '1441532842', '0', '由0 改为  1', 'admin', '1441532842', 'admin', '1441532842', 'admin');
INSERT INTO `works_library_review_log` VALUES ('79', '60', '1441532854', '0', '由1 改为  3', 'admin', '1441532854', 'admin', '1441532854', 'admin');
INSERT INTO `works_library_review_log` VALUES ('80', '53', '1441532859', '0', '由1 改为  3', 'admin', '1441532859', 'admin', '1441532859', 'admin');
INSERT INTO `works_library_review_log` VALUES ('81', '64', '1442287568', '0', '由0 改为  1', 'admin', '1442287568', 'admin', '1442287568', 'admin');
INSERT INTO `works_library_review_log` VALUES ('82', '64', '1442287689', '0', '由1 改为  3', 'admin', '1442287689', 'admin', '1442287689', 'admin');
INSERT INTO `works_library_review_log` VALUES ('83', '58', '1442287966', '0', '由0 改为  1', 'admin', '1442287966', 'admin', '1442287966', 'admin');
INSERT INTO `works_library_review_log` VALUES ('84', '52', '1442287969', '0', '由0 改为  1', 'admin', '1442287969', 'admin', '1442287969', 'admin');
INSERT INTO `works_library_review_log` VALUES ('85', '52', '1442305244', '不通过', '由1 改为  4', 'lr', '1442305244', 'lr', '1442305244', 'lr');
INSERT INTO `works_library_review_log` VALUES ('86', '66', '1442557012', '0', '由0 改为  1', 'admin', '1442557012', 'admin', '1442557012', 'admin');
INSERT INTO `works_library_review_log` VALUES ('87', '67', '1442557016', '0', '由0 改为  1', 'admin', '1442557016', 'admin', '1442557016', 'admin');
INSERT INTO `works_library_review_log` VALUES ('88', '68', '1442557020', '0', '由0 改为  1', 'admin', '1442557020', 'admin', '1442557020', 'admin');
INSERT INTO `works_library_review_log` VALUES ('89', '68', '1442557028', '0', '由1 改为  3', 'admin', '1442557028', 'admin', '1442557028', 'admin');
INSERT INTO `works_library_review_log` VALUES ('90', '67', '1442557032', '0', '由1 改为  3', 'admin', '1442557032', 'admin', '1442557032', 'admin');
INSERT INTO `works_library_review_log` VALUES ('91', '66', '1442557036', '0', '由1 改为  3', 'admin', '1442557036', 'admin', '1442557036', 'admin');
INSERT INTO `works_library_review_log` VALUES ('92', '69', '1442808624', '0', '由0 改为  1', 'admin', '1442808624', 'admin', '1442808624', 'admin');
INSERT INTO `works_library_review_log` VALUES ('93', '65', '1442808628', '0', '由0 改为  1', 'admin', '1442808628', 'admin', '1442808628', 'admin');
INSERT INTO `works_library_review_log` VALUES ('94', '52', '1442808631', '0', '由0 改为  1', 'admin', '1442808631', 'admin', '1442808631', 'admin');
INSERT INTO `works_library_review_log` VALUES ('95', '69', '1442808637', '0', '由1 改为  3 赠送杏币0', 'admin', '1442808637', 'admin', '1442808637', 'admin');
INSERT INTO `works_library_review_log` VALUES ('96', '65', '1442808640', '0', '由1 改为  3 赠送杏币0', 'admin', '1442808640', 'admin', '1442808640', 'admin');
INSERT INTO `works_library_review_log` VALUES ('97', '52', '1442808645', '0', '由1 改为  3 赠送杏币0', 'admin', '1442808645', 'admin', '1442808645', 'admin');
INSERT INTO `works_library_review_log` VALUES ('98', '72', '1442821382', '0', '由0 改为  1', 'admin', '1442821382', 'admin', '1442821382', 'admin');
INSERT INTO `works_library_review_log` VALUES ('99', '71', '1442821385', '0', '由0 改为  1', 'admin', '1442821385', 'admin', '1442821385', 'admin');
INSERT INTO `works_library_review_log` VALUES ('100', '70', '1442821388', '0', '由0 改为  1', 'admin', '1442821388', 'admin', '1442821388', 'admin');
INSERT INTO `works_library_review_log` VALUES ('101', '72', '1442821394', '0', '由1 改为  3 赠送杏币0', 'admin', '1442821394', 'admin', '1442821394', 'admin');
INSERT INTO `works_library_review_log` VALUES ('102', '71', '1442821398', '0', '由1 改为  3 赠送杏币0', 'admin', '1442821398', 'admin', '1442821398', 'admin');
INSERT INTO `works_library_review_log` VALUES ('103', '70', '1442821401', '0', '由1 改为  3 赠送杏币0', 'admin', '1442821401', 'admin', '1442821401', 'admin');
INSERT INTO `works_library_review_log` VALUES ('104', '74', '1442826115', '0', '由0 改为  1', 'admin', '1442826115', 'admin', '1442826115', 'admin');
INSERT INTO `works_library_review_log` VALUES ('105', '73', '1442826119', '0', '由0 改为  1', 'admin', '1442826119', 'admin', '1442826119', 'admin');
INSERT INTO `works_library_review_log` VALUES ('106', '74', '1442826124', '0', '由1 改为  3 赠送杏币0', 'admin', '1442826124', 'admin', '1442826124', 'admin');
INSERT INTO `works_library_review_log` VALUES ('107', '73', '1442826128', '0', '由1 改为  3 赠送杏币0', 'admin', '1442826128', 'admin', '1442826128', 'admin');
INSERT INTO `works_library_review_log` VALUES ('108', '74', '1442826156', '0', '由3 改为  1', 'admin', '1442826156', 'admin', '1442826156', 'admin');
INSERT INTO `works_library_review_log` VALUES ('109', '74', '1442826184', '0', '由1 改为  3 赠送杏币2', 'admin', '1442826184', 'admin', '1442826184', 'admin');
INSERT INTO `works_library_review_log` VALUES ('110', '75', '1442826375', '0', '由0 改为  1', 'admin', '1442826375', 'admin', '1442826375', 'admin');
INSERT INTO `works_library_review_log` VALUES ('111', '75', '1442826380', '0', '由1 改为  3 赠送杏币0', 'admin', '1442826380', 'admin', '1442826380', 'admin');
INSERT INTO `works_library_review_log` VALUES ('112', '77', '1442826818', '0', '由0 改为  1', 'admin', '1442826818', 'admin', '1442826818', 'admin');
INSERT INTO `works_library_review_log` VALUES ('113', '76', '1442826827', '0', '由0 改为  1', 'admin', '1442826827', 'admin', '1442826827', 'admin');
INSERT INTO `works_library_review_log` VALUES ('114', '77', '1442826887', '0', '由1 改为  3 赠送杏币0', 'admin', '1442826887', 'admin', '1442826887', 'admin');
INSERT INTO `works_library_review_log` VALUES ('115', '76', '1442826890', '0', '由1 改为  3 赠送杏币0', 'admin', '1442826890', 'admin', '1442826890', 'admin');
INSERT INTO `works_library_review_log` VALUES ('116', '77', '1442827584', '0', '由1 改为  3 赠送杏币0', 'admin', '1442827584', 'admin', '1442827584', 'admin');
INSERT INTO `works_library_review_log` VALUES ('117', '74', '1442827707', '0', '由1 改为  3 赠送杏币0', 'admin', '1442827707', 'admin', '1442827707', 'admin');
INSERT INTO `works_library_review_log` VALUES ('118', '21', '1442828800', '0', '由1 改为  3 赠送杏币0', 'admin', '1442828800', 'admin', '1442828800', 'admin');
INSERT INTO `works_library_review_log` VALUES ('119', '20', '1442828880', '0', '由1 改为  3 赠送杏币0', 'admin', '1442828880', 'admin', '1442828880', 'admin');
INSERT INTO `works_library_review_log` VALUES ('120', '14', '1442828974', '0', '由1 改为  3 赠送杏币0', 'admin', '1442828974', 'admin', '1442828974', 'admin');
INSERT INTO `works_library_review_log` VALUES ('121', '3', '1442829956', '0', '由1 改为  3 赠送杏币0', 'admin', '1442829956', 'admin', '1442829956', 'admin');
INSERT INTO `works_library_review_log` VALUES ('122', '1', '1442829967', '0', '由1 改为  3 赠送杏币0', 'admin', '1442829967', 'admin', '1442829967', 'admin');
INSERT INTO `works_library_review_log` VALUES ('123', '73', '1442888339', '0', '由1 改为  3 赠送杏币0', 'admin', '1442888339', 'admin', '1442888339', 'admin');
INSERT INTO `works_library_review_log` VALUES ('124', '75', '1442888342', '0', '由1 改为  3 赠送杏币0', 'admin', '1442888342', 'admin', '1442888342', 'admin');
INSERT INTO `works_library_review_log` VALUES ('125', '76', '1442888345', '0', '由1 改为  3 赠送杏币0', 'admin', '1442888345', 'admin', '1442888345', 'admin');
INSERT INTO `works_library_review_log` VALUES ('126', '78', '1442894463', '0', '由0 改为  1', 'admin', '1442894463', 'admin', '1442894463', 'admin');
INSERT INTO `works_library_review_log` VALUES ('127', '78', '1442894468', '0', '由1 改为  3 赠送杏币0', 'admin', '1442894468', 'admin', '1442894468', 'admin');
INSERT INTO `works_library_review_log` VALUES ('128', '81', '1442977598', '0', '由0 改为  1', 'admin', '1442977598', 'admin', '1442977598', 'admin');
INSERT INTO `works_library_review_log` VALUES ('129', '80', '1442977601', '0', '由0 改为  1', 'admin', '1442977601', 'admin', '1442977601', 'admin');
INSERT INTO `works_library_review_log` VALUES ('130', '79', '1442977604', '0', '由0 改为  1', 'admin', '1442977604', 'admin', '1442977604', 'admin');
INSERT INTO `works_library_review_log` VALUES ('131', '81', '1442977716', '0', '由1 改为  3 赠送杏币0', 'admin', '1442977716', 'admin', '1442977716', 'admin');
INSERT INTO `works_library_review_log` VALUES ('132', '80', '1442977719', '0', '由1 改为  3 赠送杏币0', 'admin', '1442977719', 'admin', '1442977719', 'admin');
INSERT INTO `works_library_review_log` VALUES ('133', '79', '1442977722', '0', '由1 改为  3 赠送杏币0', 'admin', '1442977722', 'admin', '1442977722', 'admin');
INSERT INTO `works_library_review_log` VALUES ('134', '83', '1442978861', '0', '由0 改为  1', 'admin', '1442978861', 'admin', '1442978861', 'admin');
INSERT INTO `works_library_review_log` VALUES ('135', '82', '1442978864', '0', '由0 改为  1', 'admin', '1442978864', 'admin', '1442978864', 'admin');
INSERT INTO `works_library_review_log` VALUES ('136', '83', '1442978869', '0', '由1 改为  3 赠送杏币0', 'admin', '1442978869', 'admin', '1442978869', 'admin');
INSERT INTO `works_library_review_log` VALUES ('137', '82', '1442978873', '0', '由1 改为  3 赠送杏币0', 'admin', '1442978873', 'admin', '1442978873', 'admin');
INSERT INTO `works_library_review_log` VALUES ('138', '85', '1442979450', '0', '由0 改为  1', 'admin', '1442979450', 'admin', '1442979450', 'admin');
INSERT INTO `works_library_review_log` VALUES ('139', '84', '1442979454', '0', '由0 改为  1', 'admin', '1442979454', 'admin', '1442979454', 'admin');
INSERT INTO `works_library_review_log` VALUES ('140', '85', '1442979459', '0', '由1 改为  3 赠送杏币0', 'admin', '1442979459', 'admin', '1442979459', 'admin');
INSERT INTO `works_library_review_log` VALUES ('141', '84', '1442979462', '0', '由1 改为  3 赠送杏币0', 'admin', '1442979462', 'admin', '1442979462', 'admin');
INSERT INTO `works_library_review_log` VALUES ('142', '88', '1442980357', '0', '由0 改为  1', 'admin', '1442980357', 'admin', '1442980357', 'admin');
INSERT INTO `works_library_review_log` VALUES ('143', '87', '1442981034', '0', '由0 改为  1', 'admin', '1442981034', 'admin', '1442981034', 'admin');
INSERT INTO `works_library_review_log` VALUES ('144', '86', '1442981037', '0', '由0 改为  1', 'admin', '1442981037', 'admin', '1442981037', 'admin');
INSERT INTO `works_library_review_log` VALUES ('145', '88', '1442981092', '0', '由1 改为  3 赠送杏币0', 'admin', '1442981092', 'admin', '1442981092', 'admin');
INSERT INTO `works_library_review_log` VALUES ('146', '87', '1442981095', '0', '由1 改为  3 赠送杏币0', 'admin', '1442981095', 'admin', '1442981095', 'admin');
INSERT INTO `works_library_review_log` VALUES ('147', '86', '1442981098', '0', '由1 改为  3 赠送杏币0', 'admin', '1442981098', 'admin', '1442981098', 'admin');
INSERT INTO `works_library_review_log` VALUES ('148', '68', '1442988588', '0', '由1 改为  3 赠送杏币0', 'admin', '1442988588', 'admin', '1442988588', 'admin');
INSERT INTO `works_library_review_log` VALUES ('149', '89', '1442990554', '0', '由0 改为  1', 'admin', '1442990554', 'admin', '1442990554', 'admin');
INSERT INTO `works_library_review_log` VALUES ('150', '89', '1442990567', '0', '由1 改为  3 赠送杏币0', 'admin', '1442990567', 'admin', '1442990567', 'admin');
INSERT INTO `works_library_review_log` VALUES ('151', '90', '1442990906', '0', '由0 改为  1', 'admin', '1442990906', 'admin', '1442990906', 'admin');
INSERT INTO `works_library_review_log` VALUES ('152', '91', '1442990914', '0', '由0 改为  1', 'admin', '1442990914', 'admin', '1442990914', 'admin');
INSERT INTO `works_library_review_log` VALUES ('153', '92', '1442990917', '0', '由0 改为  1', 'admin', '1442990917', 'admin', '1442990917', 'admin');
INSERT INTO `works_library_review_log` VALUES ('154', '92', '1442990928', '0', '由1 改为  3 赠送杏币0', 'admin', '1442990928', 'admin', '1442990928', 'admin');
INSERT INTO `works_library_review_log` VALUES ('155', '91', '1442990940', '0', '由1 改为  3 赠送杏币0', 'admin', '1442990940', 'admin', '1442990940', 'admin');
INSERT INTO `works_library_review_log` VALUES ('156', '90', '1442990948', '0', '由1 改为  3 赠送杏币0', 'admin', '1442990948', 'admin', '1442990948', 'admin');
INSERT INTO `works_library_review_log` VALUES ('157', '92', '1442992203', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992203', 'admin', '1442992203', 'admin');
INSERT INTO `works_library_review_log` VALUES ('158', '91', '1442992208', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992208', 'admin', '1442992208', 'admin');
INSERT INTO `works_library_review_log` VALUES ('159', '90', '1442992213', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992213', 'admin', '1442992213', 'admin');
INSERT INTO `works_library_review_log` VALUES ('160', '89', '1442992218', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992218', 'admin', '1442992218', 'admin');
INSERT INTO `works_library_review_log` VALUES ('161', '74', '1442992226', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992226', 'admin', '1442992226', 'admin');
INSERT INTO `works_library_review_log` VALUES ('162', '69', '1442992230', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992230', 'admin', '1442992230', 'admin');
INSERT INTO `works_library_review_log` VALUES ('163', '68', '1442992236', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992236', 'admin', '1442992236', 'admin');
INSERT INTO `works_library_review_log` VALUES ('164', '67', '1442992242', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992242', 'admin', '1442992242', 'admin');
INSERT INTO `works_library_review_log` VALUES ('165', '66', '1442992249', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992249', 'admin', '1442992249', 'admin');
INSERT INTO `works_library_review_log` VALUES ('166', '65', '1442992254', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992254', 'admin', '1442992254', 'admin');
INSERT INTO `works_library_review_log` VALUES ('167', '43', '1442992262', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992262', 'admin', '1442992262', 'admin');
INSERT INTO `works_library_review_log` VALUES ('168', '29', '1442992268', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992268', 'admin', '1442992268', 'admin');
INSERT INTO `works_library_review_log` VALUES ('169', '25', '1442992272', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992272', 'admin', '1442992272', 'admin');
INSERT INTO `works_library_review_log` VALUES ('170', '22', '1442992276', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992276', 'admin', '1442992276', 'admin');
INSERT INTO `works_library_review_log` VALUES ('171', '21', '1442992281', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992281', 'admin', '1442992281', 'admin');
INSERT INTO `works_library_review_log` VALUES ('172', '20', '1442992285', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992285', 'admin', '1442992285', 'admin');
INSERT INTO `works_library_review_log` VALUES ('173', '14', '1442992291', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992291', 'admin', '1442992291', 'admin');
INSERT INTO `works_library_review_log` VALUES ('174', '13', '1442992294', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992294', 'admin', '1442992294', 'admin');
INSERT INTO `works_library_review_log` VALUES ('175', '3', '1442992305', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992305', 'admin', '1442992305', 'admin');
INSERT INTO `works_library_review_log` VALUES ('176', '1', '1442992313', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992313', 'admin', '1442992313', 'admin');
INSERT INTO `works_library_review_log` VALUES ('177', '64', '1442992326', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992326', 'admin', '1442992326', 'admin');
INSERT INTO `works_library_review_log` VALUES ('178', '62', '1442992331', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992331', 'admin', '1442992331', 'admin');
INSERT INTO `works_library_review_log` VALUES ('179', '61', '1442992335', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992335', 'admin', '1442992335', 'admin');
INSERT INTO `works_library_review_log` VALUES ('180', '60', '1442992339', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992339', 'admin', '1442992339', 'admin');
INSERT INTO `works_library_review_log` VALUES ('181', '57', '1442992343', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992343', 'admin', '1442992343', 'admin');
INSERT INTO `works_library_review_log` VALUES ('182', '55', '1442992346', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992346', 'admin', '1442992346', 'admin');
INSERT INTO `works_library_review_log` VALUES ('183', '53', '1442992349', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992349', 'admin', '1442992349', 'admin');
INSERT INTO `works_library_review_log` VALUES ('184', '52', '1442992354', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992354', 'admin', '1442992354', 'admin');
INSERT INTO `works_library_review_log` VALUES ('185', '45', '1442992358', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992358', 'admin', '1442992358', 'admin');
INSERT INTO `works_library_review_log` VALUES ('186', '44', '1442992362', '0', '由1 改为  3 赠送杏币0', 'admin', '1442992362', 'admin', '1442992362', 'admin');
INSERT INTO `works_library_review_log` VALUES ('187', '95', '1442995315', '0', '由0 改为  1', 'admin', '1442995315', 'admin', '1442995315', 'admin');
INSERT INTO `works_library_review_log` VALUES ('188', '94', '1442995318', '0', '由0 改为  1', 'admin', '1442995318', 'admin', '1442995318', 'admin');
INSERT INTO `works_library_review_log` VALUES ('189', '93', '1442995321', '0', '由0 改为  1', 'admin', '1442995321', 'admin', '1442995321', 'admin');
INSERT INTO `works_library_review_log` VALUES ('190', '95', '1442995971', '0', '由1 改为  3 赠送杏币3', 'admin', '1442995971', 'admin', '1442995971', 'admin');
INSERT INTO `works_library_review_log` VALUES ('191', '94', '1442995974', '0', '由1 改为  3 赠送杏币3', 'admin', '1442995974', 'admin', '1442995974', 'admin');
INSERT INTO `works_library_review_log` VALUES ('192', '93', '1442995977', '0', '由1 改为  3 赠送杏币3', 'admin', '1442995977', 'admin', '1442995977', 'admin');
INSERT INTO `works_library_review_log` VALUES ('193', '97', '1442998293', '0', '由0 改为  1', 'admin', '1442998293', 'admin', '1442998293', 'admin');
INSERT INTO `works_library_review_log` VALUES ('194', '96', '1442998296', '0', '由0 改为  1', 'admin', '1442998296', 'admin', '1442998296', 'admin');
INSERT INTO `works_library_review_log` VALUES ('195', '97', '1442998301', '0', '由1 改为  3 赠送杏币0', 'admin', '1442998301', 'admin', '1442998301', 'admin');
INSERT INTO `works_library_review_log` VALUES ('196', '96', '1442998303', '0', '由1 改为  3 赠送杏币0', 'admin', '1442998303', 'admin', '1442998303', 'admin');
INSERT INTO `works_library_review_log` VALUES ('197', '101', '1443603087', '0', '由0 改为  1', 'admin', '1443603087', 'admin', '1443603087', 'admin');
INSERT INTO `works_library_review_log` VALUES ('198', '101', '1443603099', '0', '由1 改为  3 赠送杏币0', 'admin', '1443603099', 'admin', '1443603099', 'admin');
INSERT INTO `works_library_review_log` VALUES ('199', '100', '1444021770', '0', '由0 改为  1', 'admin', '1444021770', 'admin', '1444021770', 'admin');
INSERT INTO `works_library_review_log` VALUES ('200', '100', '1444021795', '0', '由1 改为  3 赠送杏币2', 'admin', '1444021795', 'admin', '1444021795', 'admin');
INSERT INTO `works_library_review_log` VALUES ('201', '102', '1444028745', '0', '由0 改为  1', 'admin', '1444028745', 'admin', '1444028745', 'admin');
INSERT INTO `works_library_review_log` VALUES ('202', '99', '1444028753', '0', '由0 改为  1', 'admin', '1444028753', 'admin', '1444028753', 'admin');
INSERT INTO `works_library_review_log` VALUES ('203', '98', '1444028760', '0', '由0 改为  1', 'admin', '1444028760', 'admin', '1444028760', 'admin');
INSERT INTO `works_library_review_log` VALUES ('204', '103', '1444029341', '0', '由0 改为  1', 'admin', '1444029341', 'admin', '1444029341', 'admin');
INSERT INTO `works_library_review_log` VALUES ('205', '102', '1444029354', '0', '由1 改为  3 赠送杏币2', 'admin', '1444029354', 'admin', '1444029354', 'admin');
INSERT INTO `works_library_review_log` VALUES ('206', '103', '1444029361', '0', '由1 改为  3 赠送杏币1', 'admin', '1444029361', 'admin', '1444029361', 'admin');
INSERT INTO `works_library_review_log` VALUES ('207', '99', '1444029368', '0', '由1 改为  3 赠送杏币1', 'admin', '1444029368', 'admin', '1444029368', 'admin');
INSERT INTO `works_library_review_log` VALUES ('208', '98', '1444029375', '0', '由1 改为  3 赠送杏币3', 'admin', '1444029375', 'admin', '1444029375', 'admin');
INSERT INTO `works_library_review_log` VALUES ('209', '104', '1444278730', '0', '由0 改为  1', 'admin', '1444278730', 'admin', '1444278730', 'admin');
INSERT INTO `works_library_review_log` VALUES ('210', '104', '1444278741', '0', '由1 改为  3 赠送杏币3', 'admin', '1444278741', 'admin', '1444278741', 'admin');
INSERT INTO `works_library_review_log` VALUES ('211', '105', '1444356173', '0', '由0 改为  1', 'admin', '1444356173', 'admin', '1444356173', 'admin');
INSERT INTO `works_library_review_log` VALUES ('212', '105', '1444356181', '0', '由1 改为  3 赠送杏币3', 'admin', '1444356181', 'admin', '1444356181', 'admin');
INSERT INTO `works_library_review_log` VALUES ('213', '106', '1444361513', '0', '由0 改为  1', 'admin', '1444361513', 'admin', '1444361513', 'admin');
INSERT INTO `works_library_review_log` VALUES ('214', '108', '1444377714', '0', '由0 改为  1', 'admin', '1444377714', 'admin', '1444377714', 'admin');
INSERT INTO `works_library_review_log` VALUES ('215', '108', '1444377720', '0', '由1 改为  3 赠送杏币3', 'admin', '1444377720', 'admin', '1444377720', 'admin');
INSERT INTO `works_library_review_log` VALUES ('216', '110', '1444564183', '0', '由0 改为  1', 'admin', '1444564183', 'admin', '1444564183', 'admin');
INSERT INTO `works_library_review_log` VALUES ('217', '110', '1444564347', '0', '由1 改为  3 赠送杏币3', 'admin', '1444564347', 'admin', '1444564347', 'admin');
INSERT INTO `works_library_review_log` VALUES ('218', '111', '1444658747', '0', '由0 改为  1', 'admin', '1444658747', 'admin', '1444658747', 'admin');
INSERT INTO `works_library_review_log` VALUES ('219', '111', '1444658768', '0', '由1 改为  3 赠送杏币0', 'admin', '1444658768', 'admin', '1444658768', 'admin');
INSERT INTO `works_library_review_log` VALUES ('220', '112', '1444748753', '0', '由0 改为  1', 'admin', '1444748753', 'admin', '1444748753', 'admin');
INSERT INTO `works_library_review_log` VALUES ('221', '112', '1444748768', '0', '由1 改为  3 赠送杏币2', 'admin', '1444748768', 'admin', '1444748768', 'admin');
INSERT INTO `works_library_review_log` VALUES ('222', '113', '1444749421', '0', '由0 改为  1', 'admin', '1444749421', 'admin', '1444749421', 'admin');
INSERT INTO `works_library_review_log` VALUES ('223', '113', '1444749430', '0', '由1 改为  3 赠送杏币3', 'admin', '1444749430', 'admin', '1444749430', 'admin');
INSERT INTO `works_library_review_log` VALUES ('224', '115', '1444751039', '0', '由0 改为  1', 'admin', '1444751039', 'admin', '1444751039', 'admin');
INSERT INTO `works_library_review_log` VALUES ('225', '115', '1444751062', '\' or \'1\'=\'1', '由1 改为  3 赠送杏币3', 'admin', '1444751062', 'admin', '1444751062', 'admin');
INSERT INTO `works_library_review_log` VALUES ('226', '117', '1444812216', '太贵。', '由0 改为  2', 'admin', '1444812216', 'admin', '1444812216', 'admin');
INSERT INTO `works_library_review_log` VALUES ('227', '118', '1444901455', '0', '由0 改为  1', 'admin', '1444901455', 'admin', '1444901455', 'admin');
INSERT INTO `works_library_review_log` VALUES ('228', '116', '1444901471', '不通过', '由0 改为  2', 'admin', '1444901471', 'admin', '1444901471', 'admin');
INSERT INTO `works_library_review_log` VALUES ('229', '114', '1444901630', '0', '由0 改为  1', 'admin', '1444901630', 'admin', '1444901630', 'admin');
INSERT INTO `works_library_review_log` VALUES ('230', '118', '1444901701', '0', '由1 改为  3 赠送杏币3', 'admin', '1444901701', 'admin', '1444901701', 'admin');
INSERT INTO `works_library_review_log` VALUES ('231', '109', '1444984090', '0', '由0 改为  1', 'admin', '1444984091', 'admin', '1444984091', 'admin');
INSERT INTO `works_library_review_log` VALUES ('232', '107', '1444984093', '0', '由0 改为  1', 'admin', '1444984093', 'admin', '1444984093', 'admin');
INSERT INTO `works_library_review_log` VALUES ('233', '114', '1444984098', '0', '由1 改为  3 赠送杏币3', 'admin', '1444984098', 'admin', '1444984098', 'admin');
INSERT INTO `works_library_review_log` VALUES ('234', '107', '1444984101', '0', '由1 改为  3 赠送杏币2', 'admin', '1444984101', 'admin', '1444984101', 'admin');
INSERT INTO `works_library_review_log` VALUES ('235', '106', '1444984106', '0', '由1 改为  3 赠送杏币2', 'admin', '1444984106', 'admin', '1444984106', 'admin');
INSERT INTO `works_library_review_log` VALUES ('236', '109', '1444984110', '0', '由1 改为  3 赠送杏币2', 'admin', '1444984110', 'admin', '1444984110', 'admin');
INSERT INTO `works_library_review_log` VALUES ('237', '119', '1444986454', '无需理由', '由0 改为  2', 'admin', '1444986454', 'admin', '1444986454', 'admin');
INSERT INTO `works_library_review_log` VALUES ('238', '120', '1445229416', '0', '由0 改为  1', 'admin', '1445229416', 'admin', '1445229416', 'admin');
INSERT INTO `works_library_review_log` VALUES ('239', '120', '1445229431', '0', '由1 改为  3 赠送杏币5', 'admin', '1445229431', 'admin', '1445229431', 'admin');
INSERT INTO `works_library_review_log` VALUES ('240', '121', '1445229619', '0', '由0 改为  1', 'admin', '1445229619', 'admin', '1445229619', 'admin');
INSERT INTO `works_library_review_log` VALUES ('241', '121', '1445229641', '0', '由1 改为  3 赠送杏币3', 'admin', '1445229641', 'admin', '1445229641', 'admin');
INSERT INTO `works_library_review_log` VALUES ('242', '122', '1445229776', '0', '由0 改为  1', 'admin', '1445229776', 'admin', '1445229776', 'admin');
INSERT INTO `works_library_review_log` VALUES ('243', '122', '1445229788', '0', '由1 改为  3 赠送杏币3', 'admin', '1445229788', 'admin', '1445229788', 'admin');
INSERT INTO `works_library_review_log` VALUES ('244', '123', '1445229897', '0', '由0 改为  1', 'admin', '1445229897', 'admin', '1445229897', 'admin');
INSERT INTO `works_library_review_log` VALUES ('245', '123', '1445229909', '0', '由1 改为  3 赠送杏币3', 'admin', '1445229909', 'admin', '1445229909', 'admin');
INSERT INTO `works_library_review_log` VALUES ('246', '124', '1445235654', '0', '由0 改为  1', 'admin', '1445235654', 'admin', '1445235654', 'admin');
INSERT INTO `works_library_review_log` VALUES ('247', '124', '1445235664', '0', '由1 改为  3 赠送杏币3', 'admin', '1445235664', 'admin', '1445235664', 'admin');
INSERT INTO `works_library_review_log` VALUES ('248', '125', '1445235821', '0', '由0 改为  1', 'admin', '1445235821', 'admin', '1445235821', 'admin');
INSERT INTO `works_library_review_log` VALUES ('249', '125', '1445235829', '0', '由1 改为  3 赠送杏币3', 'admin', '1445235829', 'admin', '1445235829', 'admin');
INSERT INTO `works_library_review_log` VALUES ('250', '127', '1445239545', '0', '由0 改为  1', 'admin', '1445239545', 'admin', '1445239545', 'admin');
INSERT INTO `works_library_review_log` VALUES ('251', '127', '1445239552', '0', '由1 改为  3 赠送杏币3', 'admin', '1445239552', 'admin', '1445239552', 'admin');
INSERT INTO `works_library_review_log` VALUES ('252', '128', '1445239874', '0', '由0 改为  1', 'admin', '1445239874', 'admin', '1445239874', 'admin');
INSERT INTO `works_library_review_log` VALUES ('253', '128', '1445239879', '0', '由1 改为  3 赠送杏币3', 'admin', '1445239879', 'admin', '1445239879', 'admin');
INSERT INTO `works_library_review_log` VALUES ('254', '130', '1445849566', '审核通过Aa!@#123', '由0 改为  1', 'admin', '1445849566', 'admin', '1445849566', 'admin');
INSERT INTO `works_library_review_log` VALUES ('255', '130', '1445849663', '上线审核通过Aa123!@#', '由1 改为  3 赠送杏币2', 'admin', '1445849663', 'admin', '1445849663', 'admin');
INSERT INTO `works_library_review_log` VALUES ('256', '131', '1445914001', '0', '由0 改为  1', 'admin', '1445914001', 'admin', '1445914001', 'admin');
INSERT INTO `works_library_review_log` VALUES ('257', '131', '1445914067', '0', '由1 改为  3 赠送杏币3', 'admin', '1445914067', 'admin', '1445914067', 'admin');
INSERT INTO `works_library_review_log` VALUES ('258', '132', '1445915255', '0', '由0 改为  1', 'admin', '1445915255', 'admin', '1445915255', 'admin');
INSERT INTO `works_library_review_log` VALUES ('259', '132', '1445915305', '0', '由1 改为  3 赠送杏币4', 'admin', '1445915305', 'admin', '1445915305', 'admin');
INSERT INTO `works_library_review_log` VALUES ('260', '135', '1445927667', 'asdf', '由0 改为  2', 'admin', '1445927667', 'admin', '1445927667', 'admin');
INSERT INTO `works_library_review_log` VALUES ('261', '135', '1445928182', 'OK', '由0 改为  1', 'admin', '1445928182', 'admin', '1445928182', 'admin');
INSERT INTO `works_library_review_log` VALUES ('262', '134', '1445928197', 'OK2', '由0 改为  1', 'admin', '1445928197', 'admin', '1445928197', 'admin');
INSERT INTO `works_library_review_log` VALUES ('263', '116', '1445932554', 'fasdf', '由0 改为  1', 'admin', '1445932554', 'admin', '1445932554', 'admin');
INSERT INTO `works_library_review_log` VALUES ('264', '116', '1445932574', '33', '由1 改为  4 赠送杏币3', 'admin', '1445932574', 'admin', '1445932574', 'admin');
INSERT INTO `works_library_review_log` VALUES ('265', '126', '1445932711', '0', '由0 改为  1', 'admin', '1445932711', 'admin', '1445932711', 'admin');
INSERT INTO `works_library_review_log` VALUES ('266', '126', '1445932728', '3', '由1 改为  4 赠送杏币3', 'admin', '1445932728', 'admin', '1445932728', 'admin');
INSERT INTO `works_library_review_log` VALUES ('267', '126', '1445932912', '0', '由0 改为  1', 'admin', '1445932912', 'admin', '1445932912', 'admin');
INSERT INTO `works_library_review_log` VALUES ('268', '126', '1445932923', '0', '由1 改为  3 赠送杏币3', 'admin', '1445932923', 'admin', '1445932923', 'admin');
INSERT INTO `works_library_review_log` VALUES ('269', '140', '1445940809', '0', '由0 改为  1', 'admin', '1445940809', 'admin', '1445940809', 'admin');
INSERT INTO `works_library_review_log` VALUES ('270', '138', '1445940815', '0', '由0 改为  1', 'admin', '1445940815', 'admin', '1445940815', 'admin');
INSERT INTO `works_library_review_log` VALUES ('271', '134', '1445940876', '0', '由1 改为  3 赠送杏币4', 'admin', '1445940876', 'admin', '1445940876', 'admin');
INSERT INTO `works_library_review_log` VALUES ('272', '141', '1445940929', '0', '由0 改为  1', 'admin', '1445940929', 'admin', '1445940929', 'admin');
INSERT INTO `works_library_review_log` VALUES ('273', '141', '1445940943', '33', '由1 改为  4 赠送杏币3', 'admin', '1445940943', 'admin', '1445940943', 'admin');
INSERT INTO `works_library_review_log` VALUES ('274', '141', '1445940965', '0', '由0 改为  1', 'admin', '1445940965', 'admin', '1445940965', 'admin');
INSERT INTO `works_library_review_log` VALUES ('275', '141', '1445940982', '33', '由1 改为  4 赠送杏币3', 'admin', '1445940982', 'admin', '1445940982', 'admin');
INSERT INTO `works_library_review_log` VALUES ('276', '116', '1445941966', '0', '由0 改为  1', 'admin', '1445941966', 'admin', '1445941966', 'admin');
INSERT INTO `works_library_review_log` VALUES ('277', '116', '1445942025', 'fasd', '由1 改为  4 赠送杏币3', 'admin', '1445942025', 'admin', '1445942025', 'admin');
INSERT INTO `works_library_review_log` VALUES ('278', '129', '1445942202', '0', '由0 改为  1', 'admin', '1445942202', 'admin', '1445942202', 'admin');
INSERT INTO `works_library_review_log` VALUES ('279', '143', '1446103905', '0', '由0 改为  1', 'admin', '1446103905', 'admin', '1446103905', 'admin');
INSERT INTO `works_library_review_log` VALUES ('280', '142', '1446103912', '0', '由0 改为  1', 'admin', '1446103912', 'admin', '1446103912', 'admin');
INSERT INTO `works_library_review_log` VALUES ('281', '143', '1446103944', '0', '由1 改为  3 赠送杏币3', 'admin', '1446103944', 'admin', '1446103944', 'admin');
INSERT INTO `works_library_review_log` VALUES ('282', '142', '1446103963', '0', '由1 改为  3 赠送杏币3', 'admin', '1446103963', 'admin', '1446103963', 'admin');
INSERT INTO `works_library_review_log` VALUES ('283', '145', '1446373671', '0', '由0 改为  1', 'admin01', '1446373671', 'admin01', '1446373671', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('284', '144', '1446373726', '0', '由0 改为  1', 'admin01', '1446373726', 'admin01', '1446373726', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('285', '145', '1446433146', '0', '由1 改为  3 赠送杏币0.01', 'admin01', '1446433146', 'admin01', '1446433146', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('286', '144', '1446433169', '0', '由1 改为  3 赠送杏币4.5', 'admin01', '1446433169', 'admin01', '1446433169', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('287', '148', '1446534277', '0', '由0 改为  1', 'admin01', '1446534277', 'admin01', '1446534277', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('288', '148', '1446534298', '0', '由1 改为  3 赠送杏币2', 'admin01', '1446534298', 'admin01', '1446534298', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('289', '147', '1446534371', '0', '由0 改为  1', 'admin01', '1446534371', 'admin01', '1446534371', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('290', '149', '1446534376', '0', '由0 改为  1', 'admin01', '1446534376', 'admin01', '1446534376', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('291', '154', '1446535834', '0', '由0 改为  1', 'admin01', '1446535834', 'admin01', '1446535834', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('292', '153', '1446535860', '0', '由0 改为  1', 'admin01', '1446535860', 'admin01', '1446535860', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('293', '152', '1446535874', '0', '由0 改为  1', 'admin01', '1446535874', 'admin01', '1446535874', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('294', '151', '1446535878', '0', '由0 改为  1', 'admin01', '1446535878', 'admin01', '1446535878', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('295', '150', '1446535899', '0', '由0 改为  1', 'admin01', '1446535899', 'admin01', '1446535899', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('296', '154', '1446535937', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535937', 'admin01', '1446535937', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('297', '153', '1446535942', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535942', 'admin01', '1446535942', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('298', '152', '1446535945', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535945', 'admin01', '1446535945', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('299', '151', '1446535948', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535948', 'admin01', '1446535948', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('300', '150', '1446535952', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535952', 'admin01', '1446535952', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('301', '149', '1446535956', '0', '由1 改为  3 赠送杏币3', 'admin01', '1446535956', 'admin01', '1446535956', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('302', '147', '1446535962', '0', '由1 改为  3 赠送杏币2', 'admin01', '1446535962', 'admin01', '1446535962', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('303', '155', '1446538434', '0', '由0 改为  1', 'admin01', '1446538434', 'admin01', '1446538434', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('304', '155', '1446538444', '0', '由1 改为  3 赠送杏币4', 'admin01', '1446538444', 'admin01', '1446538444', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('305', '156', '1446539573', '0', '由0 改为  1', 'admin01', '1446539573', 'admin01', '1446539573', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('306', '158', '1446539717', '0', '由0 改为  1', 'admin01', '1446539717', 'admin01', '1446539717', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('307', '157', '1446539721', '0', '由0 改为  1', 'admin01', '1446539721', 'admin01', '1446539721', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('308', '158', '1446539755', '0', '由1 改为  3 赠送杏币4', 'admin01', '1446539755', 'admin01', '1446539755', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('309', '157', '1446539759', '0', '由1 改为  3 赠送杏币4', 'admin01', '1446539759', 'admin01', '1446539759', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('310', '156', '1446539763', '0', '由1 改为  3 赠送杏币4', 'admin01', '1446539763', 'admin01', '1446539763', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('311', '159', '1446539853', '0', '由0 改为  1', 'admin01', '1446539853', 'admin01', '1446539853', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('312', '159', '1446539861', '0', '由1 改为  3 赠送杏币4', 'admin01', '1446539861', 'admin01', '1446539861', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('313', '160', '1446540231', '内容不好', '由0 改为  2', 'admin01', '1446540231', 'admin01', '1446540231', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('314', '161', '1446782679', '0', '由0 改为  1', 'admin', '1446782679', 'admin', '1446782679', 'admin');
INSERT INTO `works_library_review_log` VALUES ('315', '161', '1446782694', '0', '由1 改为  3 赠送杏币3', 'admin', '1446782694', 'admin', '1446782694', 'admin');
INSERT INTO `works_library_review_log` VALUES ('316', '162', '1446792854', '0', '由0 改为  1', 'admin', '1446792854', 'admin', '1446792854', 'admin');
INSERT INTO `works_library_review_log` VALUES ('317', '162', '1446792860', '0', '由1 改为  3 赠送杏币3', 'admin', '1446792860', 'admin', '1446792860', 'admin');
INSERT INTO `works_library_review_log` VALUES ('318', '163', '1446812762', '0', '由0 改为  1', 'admin', '1446812762', 'admin', '1446812762', 'admin');
INSERT INTO `works_library_review_log` VALUES ('319', '163', '1446812773', '0', '由1 改为  3 赠送杏币3', 'admin', '1446812773', 'admin', '1446812773', 'admin');
INSERT INTO `works_library_review_log` VALUES ('320', '129', '1446813547', '0', '由1 改为  3 赠送杏币3', 'admin', '1446813547', 'admin', '1446813547', 'admin');
INSERT INTO `works_library_review_log` VALUES ('321', '119', '1446813561', '0', '由0 改为  1', 'admin', '1446813561', 'admin', '1446813561', 'admin');
INSERT INTO `works_library_review_log` VALUES ('322', '119', '1446813569', '0', '由1 改为  3 赠送杏币3', 'admin', '1446813569', 'admin', '1446813569', 'admin');
INSERT INTO `works_library_review_log` VALUES ('323', '164', '1446866298', '0', '由0 改为  1', 'admin', '1446866298', 'admin', '1446866298', 'admin');
INSERT INTO `works_library_review_log` VALUES ('324', '164', '1446866311', '0', '由1 改为  3 赠送杏币3', 'admin', '1446866311', 'admin', '1446866311', 'admin');
INSERT INTO `works_library_review_log` VALUES ('325', '165', '1446869283', '0', '由0 改为  1', 'admin', '1446869283', 'admin', '1446869283', 'admin');
INSERT INTO `works_library_review_log` VALUES ('326', '168', '1446878191', '0', '由0 改为  1', 'admin', '1446878191', 'admin', '1446878191', 'admin');
INSERT INTO `works_library_review_log` VALUES ('327', '167', '1446878201', '0', '由0 改为  1', 'admin', '1446878201', 'admin', '1446878201', 'admin');
INSERT INTO `works_library_review_log` VALUES ('328', '166', '1446878208', '0', '由0 改为  1', 'admin', '1446878208', 'admin', '1446878208', 'admin');
INSERT INTO `works_library_review_log` VALUES ('329', '168', '1446878236', '0', '由1 改为  3 赠送杏币3', 'admin', '1446878236', 'admin', '1446878236', 'admin');
INSERT INTO `works_library_review_log` VALUES ('330', '167', '1446878246', '0', '由1 改为  3 赠送杏币3', 'admin', '1446878246', 'admin', '1446878246', 'admin');
INSERT INTO `works_library_review_log` VALUES ('331', '166', '1446878276', '0', '由1 改为  3 赠送杏币3', 'admin', '1446878276', 'admin', '1446878276', 'admin');
INSERT INTO `works_library_review_log` VALUES ('332', '117', '1447054241', '0', '由0 改为  1', 'admin', '1447054241', 'admin', '1447054241', 'admin');
INSERT INTO `works_library_review_log` VALUES ('333', '117', '1447140731', '0', '由1 改为  3 赠送杏币10000', 'admin01', '1447140731', 'admin01', '1447140731', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('334', '169', '1447140902', '0', '由0 改为  1', 'admin01', '1447140902', 'admin01', '1447140902', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('335', '169', '1447141172', '0', '由1 改为  3 赠送杏币100000', 'admin01', '1447141172', 'admin01', '1447141172', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('336', '170', '1447577923', 'ss', '由0 改为  1', 'admin', '1447577923', 'admin', '1447577923', 'admin');
INSERT INTO `works_library_review_log` VALUES ('337', '171', '1447578079', '0', '由0 改为  1', 'admin', '1447578079', 'admin', '1447578079', 'admin');
INSERT INTO `works_library_review_log` VALUES ('338', '171', '1447578166', 'fsd', '由1 改为  3 赠送杏币8', 'admin', '1447578166', 'admin', '1447578166', 'admin');
INSERT INTO `works_library_review_log` VALUES ('339', '172', '1447749761', '0', '由0 改为  1', 'admin01', '1447749761', 'admin01', '1447749761', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('340', '172', '1447749776', '0', '由1 改为  3 赠送杏币3', 'admin01', '1447749776', 'admin01', '1447749776', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('341', '174', '1447751604', '0', '由0 改为  1', 'admin01', '1447751604', 'admin01', '1447751604', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('342', '173', '1447751612', '0', '由0 改为  1', 'admin01', '1447751612', 'admin01', '1447751612', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('343', '174', '1447751628', '0', '由1 改为  3 赠送杏币10000', 'admin01', '1447751628', 'admin01', '1447751628', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('344', '173', '1447751642', '0', '由1 改为  3 赠送杏币30000', 'admin01', '1447751642', 'admin01', '1447751642', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('345', '175', '1447755977', '0', '由0 改为  1', 'admin01', '1447755977', 'admin01', '1447755977', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('346', '175', '1447755985', '0', '由1 改为  3 赠送杏币3', 'admin01', '1447755985', 'admin01', '1447755985', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('347', '176', '1447756393', '0', '由0 改为  1', 'admin01', '1447756393', 'admin01', '1447756393', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('348', '176', '1447756400', '0', '由1 改为  3 赠送杏币3', 'admin01', '1447756400', 'admin01', '1447756400', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('349', '177', '1447829558', '0', '由0 改为  1', 'admin01', '1447829558', 'admin01', '1447829558', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('350', '177', '1447829584', '0', '由1 改为  3 赠送杏币1100', 'admin01', '1447829584', 'admin01', '1447829584', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('351', '178', '1447864929', '0', '由0 改为  1', 'admin', '1447864929', 'admin', '1447864929', 'admin');
INSERT INTO `works_library_review_log` VALUES ('352', '178', '1447864946', '0', '由1 改为  3 赠送杏币3', 'admin', '1447864946', 'admin', '1447864946', 'admin');
INSERT INTO `works_library_review_log` VALUES ('353', '179', '1447897891', '0', '由0 改为  1', 'admin01', '1447897891', 'admin01', '1447897891', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('354', '179', '1447897899', '0', '由1 改为  3 赠送杏币3', 'admin01', '1447897899', 'admin01', '1447897899', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('355', '180', '1447898063', '0', '由0 改为  1', 'admin01', '1447898063', 'admin01', '1447898063', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('356', '180', '1447898075', '0', '由1 改为  3 赠送杏币2', 'admin01', '1447898075', 'admin01', '1447898075', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('357', '181', '1447915523', '0', '由0 改为  1', 'admin', '1447915523', 'admin', '1447915523', 'admin');
INSERT INTO `works_library_review_log` VALUES ('358', '181', '1447915539', '0', '由1 改为  3 赠送杏币3', 'admin', '1447915539', 'admin', '1447915539', 'admin');
INSERT INTO `works_library_review_log` VALUES ('359', '182', '1447916853', '0', '由0 改为  1', 'admin', '1447916853', 'admin', '1447916853', 'admin');
INSERT INTO `works_library_review_log` VALUES ('360', '182', '1447917046', '0', '由1 改为  3 赠送杏币3', 'admin', '1447917046', 'admin', '1447917046', 'admin');
INSERT INTO `works_library_review_log` VALUES ('361', '183', '1447921271', '0', '由0 改为  1', 'admin', '1447921271', 'admin', '1447921271', 'admin');
INSERT INTO `works_library_review_log` VALUES ('362', '183', '1447921285', '0', '由1 改为  3 赠送杏币10', 'admin', '1447921285', 'admin', '1447921285', 'admin');
INSERT INTO `works_library_review_log` VALUES ('363', '184', '1447922623', '0', '由0 改为  1', 'admin', '1447922623', 'admin', '1447922623', 'admin');
INSERT INTO `works_library_review_log` VALUES ('364', '184', '1447922632', '0', '由1 改为  3 赠送杏币5', 'admin', '1447922632', 'admin', '1447922632', 'admin');
INSERT INTO `works_library_review_log` VALUES ('365', '187', '1447925139', '0', '由0 改为  1', 'admin', '1447925139', 'admin', '1447925139', 'admin');
INSERT INTO `works_library_review_log` VALUES ('366', '187', '1447925152', '0', '由1 改为  3 赠送杏币3.33', 'admin', '1447925152', 'admin', '1447925152', 'admin');
INSERT INTO `works_library_review_log` VALUES ('367', '188', '1448337197', '0', '由0 改为  1', 'admin01', '1448337197', 'admin01', '1448337197', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('368', '188', '1448337205', '0', '由1 改为  3 赠送杏币3', 'admin01', '1448337205', 'admin01', '1448337205', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('369', '189', '1448337515', '0', '由0 改为  1', 'admin01', '1448337515', 'admin01', '1448337515', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('370', '189', '1448337524', '0', '由1 改为  3 赠送杏币3', 'admin01', '1448337524', 'admin01', '1448337524', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('371', '192', '1448355879', '0', '由0 改为  1', 'admin01', '1448355879', 'admin01', '1448355879', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('372', '192', '1448355960', '0', '由1 改为  3 赠送杏币100000', 'admin01', '1448355960', 'admin01', '1448355960', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('373', '195', '1448611507', '0', '由0 改为  1', 'admin', '1448611507', 'admin', '1448611507', 'admin');
INSERT INTO `works_library_review_log` VALUES ('374', '195', '1448611517', '0', '由1 改为  3 赠送杏币2', 'admin', '1448611517', 'admin', '1448611517', 'admin');
INSERT INTO `works_library_review_log` VALUES ('375', '199', '1448866425', '0', '由0 改为  1', 'admin01', '1448866425', 'admin01', '1448866425', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('376', '199', '1448866433', '0', '由1 改为  3 赠送杏币3', 'admin01', '1448866433', 'admin01', '1448866433', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('377', '200', '1448866918', '0', '由0 改为  1', 'admin01', '1448866918', 'admin01', '1448866918', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('378', '200', '1448866939', '0', '由1 改为  3 赠送杏币1400000000', 'admin01', '1448866939', 'admin01', '1448866939', 'admin01');
INSERT INTO `works_library_review_log` VALUES ('379', '201', '1449025330', '0', '由0 改为  1', 'admin', '1449025330', 'admin', '1449025330', 'admin');
INSERT INTO `works_library_review_log` VALUES ('380', '201', '1449025339', '0', '由1 改为  3 赠送杏币2', 'admin', '1449025339', 'admin', '1449025339', 'admin');
INSERT INTO `works_library_review_log` VALUES ('381', '202', '1449025733', '0', '由0 改为  1', 'admin', '1449025733', 'admin', '1449025733', 'admin');
INSERT INTO `works_library_review_log` VALUES ('382', '202', '1449025741', '0', '由1 改为  3 赠送杏币2', 'admin', '1449025741', 'admin', '1449025741', 'admin');
INSERT INTO `works_library_review_log` VALUES ('383', '203', '1449028510', '0', '由0 改为  1', 'admin', '1449028510', 'admin', '1449028510', 'admin');
INSERT INTO `works_library_review_log` VALUES ('384', '203', '1449028517', '0', '由1 改为  3 赠送杏币2', 'admin', '1449028517', 'admin', '1449028517', 'admin');

-- ----------------------------
-- Procedure structure for vodproce
-- ----------------------------
DROP PROCEDURE IF EXISTS `vodproce`;
DELIMITER ;;
CREATE DEFINER=`dlzy`@`%` PROCEDURE `vodproce`(IN libray bigint(20),IN uuid bigint(20),IN socode varchar(100),OUT pcode int)
    COMMENT '单词点播'
begin

DECLARE w_first_id BIGINT(20) DEFAULT 0;-- 一级分类
	DECLARE w_discount INT DEFAULT 0;-- 收益比例
	DECLARE w_publish_userid BIGINT(20) DEFAULT 0;-- 作品发布人
	DECLARE w_profit DECIMAL(16,2);
	DECLARE lprice DECIMAL(16,2);
	DECLARE ucount INTEGER;
	DECLARE t_title VARCHAR(200);
	DECLARE t_error INTEGER DEFAULT 0;
	DECLARE customer_id BIGINT(20) DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

	SET t_title=CONCAT('单次点播(',libray,')');

	SELECT price,first_id,uid INTO lprice,w_first_id,w_publish_userid FROM works_library WHERE oid = libray AND isdelete=0;
	SELECT COUNT(oid) AS count INTO ucount FROM users_info_amount WHERE userid = uuid AND amount >= lprice;
	SELECT discount INTO w_discount FROM sys_profit_setting WHERE first_id=w_first_id; -- 收益比例
	SET w_profit=lprice*w_discount/100;

	IF ucount>0 THEN 
		
		START TRANSACTION;
			INSERT INTO order_customer (socode,user_id,pay_type,amount,amount_payable,`status`,`desc`,ordertime,promotion_amount,createdtime) 
			VALUES (socode,uuid,0,lprice,lprice,1,t_title,UNIX_TIMESTAMP(),0,UNIX_TIMESTAMP());SELECT LAST_INSERT_ID() INTO customer_id;
			INSERT INTO order_customer_item (title,spec,promotion_amount,quantity,unit_price,total,order_customer_id,is_give,anchor_id,createdtime) 
			VALUES (t_title,t_title,0,1,lprice,lprice,customer_id,0,NULL,UNIX_TIMESTAMP());
			UPDATE users_info_amount SET amount=amount-lprice WHERE userid=uuid;
			INSERT INTO users_account_record (user_id,amount,io_type,actiontime,action_type,record_id,useramount,lockamount,`status`,`desc`,createdtime) 
			SELECT uuid,lprice,1,UNIX_TIMESTAMP(),2,libray,amount,lock_amount,1,t_title,UNIX_TIMESTAMP() FROM users_info_amount WHERE userid=uuid;
			INSERT INTO users_vod_record (user_id,works_library_id,createdtime) VALUES (uuid,libray,UNIX_TIMESTAMP());
			UPDATE works_library SET buy_num=buy_num+1 WHERE oid=libray;

			UPDATE users_info_amount SET amount=amount+w_profit,total_income=total_income+w_profit WHERE userid=w_publish_userid;
			INSERT INTO users_account_record (user_id,amount,io_type,actiontime,action_type,record_id,useramount,lockamount,`status`,`desc`,createdtime) 
			SELECT w_publish_userid,w_profit,0,UNIX_TIMESTAMP(),2,libray,amount,lock_amount,1,t_title,UNIX_TIMESTAMP() FROM users_info_amount WHERE userid=w_publish_userid;
			INSERT INTO users_profit (user_id,works_library_id,profit,actiontime,profit_type,`desc`,createdtime) 
			VALUES (w_publish_userid,libray,w_profit,UNIX_TIMESTAMP(),0,t_title,UNIX_TIMESTAMP());

		SET pcode=1;
		IF t_error=1 THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
	ELSE 
		SET pcode=0;
	END IF;


end
;;
DELIMITER ;
