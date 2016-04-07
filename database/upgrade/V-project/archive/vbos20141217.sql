/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 10.0.12-MariaDB-log : Database - video_bos
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`video_bos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `video_bos`;

/*Table structure for table `vbos_admin` */

DROP TABLE IF EXISTS `vbos_admin`;

CREATE TABLE `vbos_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID（自增主键）',
  `name` char(32) NOT NULL COMMENT '管理员登陆名称',
  `passwd` char(32) NOT NULL COMMENT '管理员登陆密码,md5加密',
  `times` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '帐号状态：0-正常;1-禁用',
  `ctime` datetime NOT NULL COMMENT '帐号创建时间',
  `ltime` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='后台管理员帐号信息表';

insert  into `vbos_admin`(`admin_id`,`name`,`passwd`,`times`,`status`,`ctime`,`ltime`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `vbos_bill_stat` */

DROP TABLE IF EXISTS `vbos_bill_stat`;

CREATE TABLE `vbos_bill_stat` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `new_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日新增充值用户数',
  `total_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日充值总人数',
  `total_money` decimal(14,0) NOT NULL COMMENT '当日充值总金额',
  `total_bill` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日充值总订单数',
  `avg_recharge` decimal(14,0) NOT NULL DEFAULT '0' COMMENT '当日人均充值：总充值金额/总充值人数',
  `avg_bill` decimal(14,0) NOT NULL DEFAULT '0' COMMENT '当日订单平均充值：总充值金额/总订单数',
  `total_customer` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日消费总人数',
  `total_amount` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '当日消费总金额数',
  `arpu_bill` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日ARPU值',
  `arpu_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日充值ARPU值',
  `arpu_customer` int(11) NOT NULL,
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  PRIMARY KEY (`auid`),
  KEY `ctime_key` (`ctime`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='每日对充值、金额的统计存储表';

/*Table structure for table `vbos_bonus_rule` */

DROP TABLE IF EXISTS `vbos_bonus_rule`;

CREATE TABLE `vbos_bonus_rule` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `host_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '主播等级',
  `host_shares` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分成比率',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='分成规则表';

/*Table structure for table `vbos_channel` */

DROP TABLE IF EXISTS `vbos_channel`;

CREATE TABLE `vbos_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '渠道名称\r\n',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '投放金额',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '渠道分类',
  `url` varchar(255) NOT NULL COMMENT '推广链接',
  `content` text CHARACTER SET utf8 COMMENT '渠道描述',
  `author` int(11) NOT NULL COMMENT '创建者ID',
  `created` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `editor` int(11) NOT NULL COMMENT '修改者ID',
  `edittime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除   0 为删除   1 为正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='推广渠道表';

/*Table structure for table `vbos_channel_stat` */

DROP TABLE IF EXISTS `vbos_channel_stat`;

CREATE TABLE `vbos_channel_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `name` varchar(255) NOT NULL COMMENT '渠道名称',
  `cid` int(11) NOT NULL COMMENT '渠道ID',
  `type` tinyint(2) NOT NULL COMMENT '渠道类型',
  `amount` decimal(11,2) NOT NULL COMMENT '投放金额',
  `arrive` int(11) NOT NULL COMMENT '到达',
  `trigger` int(11) NOT NULL COMMENT '触发',
  `reg_num` int(11) NOT NULL COMMENT '注册数',
  `reg_shares` decimal(5,2) NOT NULL COMMENT '注册率',
  `reg_cost` int(11) NOT NULL COMMENT '注册成本',
  `total_recharge` int(11) NOT NULL COMMENT '当日充值总人数',
  `total_money` int(11) NOT NULL COMMENT '当日充值总金额',
  `total_bill` int(11) NOT NULL COMMENT '当日ROI',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='推广统计表';

/*Table structure for table `vbos_extract_audit` */

DROP TABLE IF EXISTS `vbos_extract_audit`;

CREATE TABLE `vbos_extract_audit` (
  `id` int(11) NOT NULL COMMENT '非业务主键ID',
  `host_id` int(11) NOT NULL COMMENT '主播ID',
  `ext_money` decimal(11,2) NOT NULL COMMENT '提款金额',
  `operate_status` tinyint(2) NOT NULL COMMENT '运营审批  0：   等待 1：批准   2 ：驳回',
  `operate_content` text CHARACTER SET utf8 NOT NULL COMMENT '运营审批原因',
  `financial_status` tinyint(2) NOT NULL COMMENT '财务审批  0：   等待 1：批准   2 ：驳回',
  `financial_content` text CHARACTER SET utf8 NOT NULL COMMENT '财务审批原因',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `edit_time` datetime NOT NULL COMMENT '审批时间',
  `editor` int(11) NOT NULL COMMENT '操作人员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='提款申请表';

/*Table structure for table `vbos_host_info` */

DROP TABLE IF EXISTS `vbos_host_info`;

CREATE TABLE `vbos_host_info` (
  `uid` int(11) NOT NULL COMMENT '主播ID，和用户表主键关联',
  `nick` char(32) NOT NULL COMMENT '主播昵称，和此主播注册时的昵称一致',
  `host_type` varchar(32) NOT NULL DEFAULT '0' COMMENT '主播类型',
  `host_level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '主播等级',
  `region` tinyint(4) unsigned DEFAULT '0' COMMENT '主播属地',
  `minutes` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累计直播分钟数',
  `amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累计业绩',
  `arts` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '才艺类型',
  `birtyday` int(11) unsigned DEFAULT NULL COMMENT '生日',
  `hometown` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '家乡',
  `constellation` varchar(32) NOT NULL DEFAULT '0' COMMENT '星座',
  `occupation` char(32) DEFAULT NULL COMMENT '职业',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`uid`),
  KEY `ctime_key` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播信息表';

/*Table structure for table `vbos_host_stat` */

DROP TABLE IF EXISTS `vbos_host_stat`;

CREATE TABLE `vbos_host_stat` (
  `host_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主播ID，和主播表的主键关联',
  `host_shares` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日的主播提成比例',
  `total_income` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日的总收入',
  `host_income` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日主播的收入',
  `host_company_income` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日主播对应的公司总收入',
  `host_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '当日主播的等级',
  `host_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '当日主播的类型',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`host_id`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日对主播业绩的统计表';

/*Table structure for table `vbos_mrecharge_stat` */

DROP TABLE IF EXISTS `vbos_mrecharge_stat`;

CREATE TABLE `vbos_mrecharge_stat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID，和用户表关联',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作人员ID，和admin表关联',
  `charge_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `content` text NOT NULL COMMENT '充值原因',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `status` int(8) NOT NULL COMMENT '1=增加成功，-1=接口连接失败 -102=增加失败，-103=来源ip没有权限，-104=用户不存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='手工充值流程统计表';

/*Table structure for table `vbos_personal_channel_stat` */

DROP TABLE IF EXISTS `vbos_personal_channel_stat`;

CREATE TABLE `vbos_personal_channel_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `account` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '用户账户',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `nikiname` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `regtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `url` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `invit_num` int(8) NOT NULL COMMENT '邀请账号数',
  `reward` int(11) NOT NULL COMMENT '获得奖励',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `vbos_program_stat` */

DROP TABLE IF EXISTS `vbos_program_stat`;

CREATE TABLE `vbos_program_stat` (
  `program_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '节目ID，和节目表的主键关联',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '节目当日的单价',
  `sold_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日的点播次数',
  `sold_amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日此节目销售的总金额',
  `props_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '当日此节目的等级',
  `props_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '当日此节目的类型',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`program_id`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日对道具的统计表';

/*Table structure for table `vbos_props_stat` */

DROP TABLE IF EXISTS `vbos_props_stat`;

CREATE TABLE `vbos_props_stat` (
  `props_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '道具ID，和道具表的主键关联',
  `props_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '道具当日的单价',
  `sold_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日的销售数量',
  `sold_amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日此道具销售的总金额',
  `props_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '当日此道具的等级',
  `props_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '当日此道具的类型',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`props_id`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日对道具的统计表';

/*Table structure for table `vbos_recharge_stat` */

DROP TABLE IF EXISTS `vbos_recharge_stat`;

CREATE TABLE `vbos_recharge_stat` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `serial` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '流水号',
  `order_no` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当单号',
  `charge_amount` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `recharge_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值方式',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值用户ID',
  `nick` char(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值流程统计表';

/*Table structure for table `vbos_timing_task` */

DROP TABLE IF EXISTS `vbos_timing_task`;

CREATE TABLE `vbos_timing_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `conditions` text NOT NULL COMMENT '插入查询条件',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已执行   0：未执行   1：已执行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统消息发送TASK 任务记录表                      **创建者：morgan';

/*Table structure for table `vbos_users_recharge_list` */

DROP TABLE IF EXISTS `vbos_users_recharge_list`;

CREATE TABLE `vbos_users_recharge_list` (
  `uid` int(11) unsigned NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vbos_usr_stat` */

DROP TABLE IF EXISTS `vbos_usr_stat`;

CREATE TABLE `vbos_usr_stat` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `registed_users` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日用户注册数',
  `uv` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日UV数',
  `login_users` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日登陆用户数',
  `login_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当日登陆次数',
  `users_in_room` int(11) NOT NULL,
  `num_in_room` int(11) NOT NULL,
  `apex_num` int(11) NOT NULL COMMENT '当日峰值最高人数',
  `apex_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '当日峰值出现的时刻，精确到分钟',
  `avg_time` int(11) NOT NULL,
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  PRIMARY KEY (`auid`),
  KEY `ctime_key` (`ctime`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户访问统计表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;