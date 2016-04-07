/*
Navicat MySQL Data Transfer

Source Server         : VMlocal
Source Server Version : 50622
Source Host           : 10.72.5.53:3366
Source Database       : u_leajoy

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-03-28 13:53:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for u_admin
-- ----------------------------
DROP TABLE IF EXISTS `u_admin`;
CREATE TABLE `u_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `userpwd` char(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `pools` varchar(20) DEFAULT NULL,
  `groups` varchar(100) NOT NULL,
  `regtime` int(11) NOT NULL,
  `regip` varchar(15) NOT NULL,
  `sta` smallint(6) NOT NULL,
  `logintime` int(10) unsigned NOT NULL,
  `loginip` varchar(15) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid` (`user_name`),
  KEY `sta` (`sta`),
  KEY `pools` (`pools`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `u_admin_config`;
CREATE TABLE `u_admin_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(500) NOT NULL DEFAULT '',
  `remark` varchar(20) NOT NULL DEFAULT '',
  `up_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `u_admin_log`;
CREATE TABLE `u_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `operate_msg` varchar(100) NOT NULL COMMENT '操作说明',
  `operate_time` int(11) unsigned NOT NULL COMMENT '操作时间',
  `isalert` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统警告',
  `msg_hash` varchar(32) NOT NULL COMMENT '消息hash',
  `isread` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已阅',
  PRIMARY KEY (`id`),
  KEY `isread` (`isread`),
  KEY `isalert` (`isalert`),
  KEY `msg_hash` (`msg_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_admin_login_history
-- ----------------------------
DROP TABLE IF EXISTS `u_admin_login_history`;
CREATE TABLE `u_admin_login_history` (
  `autoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `accounts` varchar(60) NOT NULL COMMENT '用户名',
  `loginip` varchar(15) NOT NULL COMMENT '登录ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `pools` varchar(20) NOT NULL COMMENT '应用池',
  `loginsta` tinyint(2) unsigned NOT NULL COMMENT '登录时状态',
  `cli_hash` varchar(32) NOT NULL COMMENT '用户登录名和ip的hash',
  PRIMARY KEY (`autoid`),
  KEY `logintime` (`logintime`),
  KEY `cli_hash` (`cli_hash`,`loginsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_admin_purview
-- ----------------------------
DROP TABLE IF EXISTS `u_admin_purview`;
CREATE TABLE `u_admin_purview` (
  `uid` int(11) NOT NULL,
  `purviews` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_config
-- ----------------------------
DROP TABLE IF EXISTS `u_config`;
CREATE TABLE `u_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(30) NOT NULL DEFAULT '' COMMENT '键',
  `value` varchar(500) NOT NULL DEFAULT '0' COMMENT '值',
  `limit` varchar(20) NOT NULL DEFAULT '' COMMENT '上限',
  `comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `config_type` tinyint(1) DEFAULT NULL COMMENT '类型 1=积分规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Table structure for u_information
-- ----------------------------
DROP TABLE IF EXISTS `u_information`;
CREATE TABLE `u_information` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '推送内容标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片链接地址',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `spare_url` varchar(255) DEFAULT '' COMMENT '备用url',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否为热门推荐   0  否  1 是',
  `app` varchar(20) DEFAULT NULL COMMENT '来源',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_login_err_log
-- ----------------------------
DROP TABLE IF EXISTS `u_login_err_log`;
CREATE TABLE `u_login_err_log` (
  `account` varchar(60) NOT NULL COMMENT '用户帐号',
  `login_time` int(11) NOT NULL COMMENT '登录时间',
  `ip` char(15) NOT NULL COMMENT '用户ip',
  KEY `user_id` (`account`),
  KEY `login_time` (`login_time`),
  KEY `ip` (`ip`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='登录错误日志';

-- ----------------------------
-- Table structure for u_login_history
-- ----------------------------
DROP TABLE IF EXISTS `u_login_history`;
CREATE TABLE `u_login_history` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户昵称(注意长度 唯一,不可更改)',
  `msg` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT 'ip',
  `atime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `login_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `login_agent` varchar(150) NOT NULL DEFAULT '' COMMENT '设备',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID 唯一(auto_increment从100000开始)',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '用户email (注意长度 唯一,可更改,需验证)',
  `passwd` varchar(40) NOT NULL COMMENT '用户密码  sha1加密',
  `user_name` varchar(128) NOT NULL COMMENT '用户昵称(注意长度 唯一,不可更改)',
  `is_login` enum('0','1') NOT NULL DEFAULT '1' COMMENT '是否允许用户登陆 默认值1 允许',
  `new_face` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新头像0没有, 1有',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `pay_passwd` varchar(40) DEFAULT '' COMMENT '支付密码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `is_login` (`is_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户认证表';

-- ----------------------------
-- Table structure for u_user_api
-- ----------------------------
DROP TABLE IF EXISTS `u_user_api`;
CREATE TABLE `u_user_api` (
  `user_api_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 唯一',
  `user_api_name` varchar(60) NOT NULL COMMENT '用户名，email (注意长度 唯一)',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `flag` varchar(10) NOT NULL COMMENT '混服[yyarea]，qq',
  PRIMARY KEY (`user_api_id`),
  KEY `user_id` (`user_id`),
  KEY `user_api_name` (`user_api_name`,`flag`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='第三方用户认证表';

-- ----------------------------
-- Table structure for u_user_api_log
-- ----------------------------
DROP TABLE IF EXISTS `u_user_api_log`;
CREATE TABLE `u_user_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `app` varchar(10) NOT NULL COMMENT '应用',
  `method` varchar(30) NOT NULL COMMENT '方法',
  `etime` float NOT NULL COMMENT '执行时间',
  `dtime` int(10) NOT NULL COMMENT '运行时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='api 日志';

-- ----------------------------
-- Table structure for u_user_details
-- ----------------------------
DROP TABLE IF EXISTS `u_user_details`;
CREATE TABLE `u_user_details` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `reg_ip` char(15) NOT NULL COMMENT '注册IP',
  `reg_app` varchar(50) NOT NULL DEFAULT '' COMMENT '注册来源',
  `reg_app_channel` varchar(32) NOT NULL DEFAULT '' COMMENT '注册来源渠道',
  `reg_app_rid` varchar(32) NOT NULL DEFAULT '' COMMENT '注册来源推广员',
  `reg_app_info` varchar(50) NOT NULL DEFAULT '' COMMENT '注册来源信息',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `pwd_question` varchar(20) NOT NULL DEFAULT '' COMMENT '密码回答问题',
  `pwd_answer` varchar(20) NOT NULL DEFAULT '' COMMENT '密码回答答案',
  `super_passwd` varchar(40) DEFAULT '' COMMENT 'super_passwd,超级密码',
  `real_certify` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证',
  `email_verify` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱验证时间',
  `idcard_verify` enum('0','1') NOT NULL DEFAULT '0' COMMENT '证件是否已经验证,默认0,没有验证',
  `mobile_verify` enum('0','1') NOT NULL DEFAULT '0' COMMENT '手机是否已经验证,默认0,没有验证',
  `paypwd_safe_level` tinyint(4) DEFAULT '0' COMMENT '支付密码安全等级，默认为0-未设置',
  `face` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '头像 0=无 1=有 2=tts头像',
  `is_new` varchar(35) NOT NULL DEFAULT '' COMMENT '新用户标识old或完成的任务id',
  `gender` enum('0','null','1') DEFAULT 'null' COMMENT '性别 NULL 未知, 0=女, 1=男',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '真实名字',
  `pet_name` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `birthday` date NOT NULL DEFAULT '1980-01-01' COMMENT '生日',
  `idcard` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `star` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '星座',
  `animal` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '生肖',
  `sign` varchar(120) NOT NULL DEFAULT '' COMMENT '个性签名',
  `introduce` varchar(250) NOT NULL DEFAULT '' COMMENT '个人简介',
  `province` varchar(30) DEFAULT '' COMMENT '省份',
  `city` varchar(30) DEFAULT '' COMMENT '市区',
  `location` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所在地(通过算法去识别省市区)',
  `location_birth` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出生省市',
  `interest` varchar(60) NOT NULL DEFAULT '' COMMENT '兴趣',
  `book` varchar(60) NOT NULL DEFAULT '' COMMENT '兴趣的书本',
  `move` varchar(60) NOT NULL DEFAULT '' COMMENT '兴趣的电影',
  `idol` varchar(60) NOT NULL DEFAULT '' COMMENT '偶像',
  `maxim` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `wish` varchar(100) NOT NULL DEFAULT '' COMMENT '愿望',
  `resource` varchar(100) NOT NULL DEFAULT '' COMMENT '感兴趣的资源',
  `intent` varchar(30) NOT NULL DEFAULT '' COMMENT '交友目的',
  `welling` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '居住1有房2与父母同住3租房4公共宿舍',
  `character` varchar(60) NOT NULL DEFAULT '' COMMENT '性格描述',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '体重公斤',
  `height` tinyint(3) unsigned NOT NULL DEFAULT '170' COMMENT '身高',
  `is_marry` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚姻状态0保密1单身2已婚3离异',
  `blood_type` char(1) NOT NULL DEFAULT 'A' COMMENT '血型A/B/O/C(AB)/D(其它)',
  `pet` varchar(30) NOT NULL DEFAULT '' COMMENT '宠物',
  `religion` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '宗教信仰0无信仰1佛教2道教3伊斯兰教4天主教5基督教6其它',
  `is_smoke` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否抽烟0无2吸1少',
  `is_drink` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否喝酒0无2喝1少',
  `location_link` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通讯地址地区',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `pub_email` varchar(50) NOT NULL DEFAULT '' COMMENT '常用email',
  `homepage` varchar(50) NOT NULL DEFAULT '' COMMENT '个人主页',
  `ims` varchar(200) NOT NULL DEFAULT '' COMMENT 'json',
  `jobs` text COMMENT '工作经历',
  `school` text COMMENT '教育经历',
  `privacy` text COMMENT '个人资料隐私设置',
  `feed_privacy` text NOT NULL COMMENT '动态设置',
  `img` varchar(255) DEFAULT '' COMMENT '头像路径',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表';

-- ----------------------------
-- Table structure for u_user_score
-- ----------------------------
DROP TABLE IF EXISTS `u_user_score`;
CREATE TABLE `u_user_score` (
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '累计充值金额',
  `silver_total` int(11) NOT NULL DEFAULT '0' COMMENT '累计杏娱币总数',
  `silver_balance` int(11) NOT NULL DEFAULT '0' COMMENT '当前杏娱币余额',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Table structure for u_user_score_history
-- ----------------------------
DROP TABLE IF EXISTS `u_user_score_history`;
CREATE TABLE `u_user_score_history` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名称',
  `trade_id` varchar(50) NOT NULL DEFAULT '' COMMENT '购买记录ID,积分类型',
  `source_code` varchar(64) NOT NULL DEFAULT '' COMMENT '来源平台编号：游戏-GAME；视频-VIDEO;',
  `in_silver` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收入',
  `out_silver` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支出',
  `notes` varchar(250) NOT NULL DEFAULT '' COMMENT '备注',
  `pay_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '充值x消费状态:  1 成功  0 失败',
  `action_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:充值 2:消费,3:积分',
  `ip` char(15) NOT NULL DEFAULT '',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`),
  KEY `multikey1` (`user_id`,`action_type`,`trade_id`,`init_time`),
  KEY `uid_key` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分流水表';
