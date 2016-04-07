/*
/home/script/svn/trunk/video-admin/V2.3/sql
1.video-admin_v2.3_20151125_A.sql
*/
use video_bos;
/*raby*/
CREATE TABLE `vbos_transfer_white_audit` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `checker` int(11) DEFAULT '0' COMMENT '审核人',
  `applyer` int(11) DEFAULT '0' COMMENT '申请人',
  `checked` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `status` int(11) DEFAULT '1' COMMENT '操作状态：1待审核 2通过',
  `aremark` varchar(255) DEFAULT '' COMMENT '申请备注',
  `cremark` varchar(255) DEFAULT '' COMMENT '审核备注',
  `dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转帐白名单审核记录';

/*
/home/script/svn/trunk/video-front/V2.3/sql
1.video-front_v2.3_20151125_A.sql
*/
use video;
﻿/*raby*/
ALTER TABLE `video_keywords` ADD COLUMN `btype` TINYINT(1) NOT NULL  DEFAULT '1' COMMENT '屏蔽关建字类型：1房间内聊天   2昵称' AFTER `editor`;
alter table video_keywords alter column `status` set default 0;
alter table video_keywords alter column `type` set default 2;

ALTER TABLE `video_user` ADD COLUMN `hidden` TINYINT(1) UNSIGNED NULL DEFAULT '0' COMMENT '是否隐身 1=隐身 0=在线' AFTER `isedit`;

ALTER TABLE `video_user` ADD COLUMN `transfer` TINYINT(1) UNSIGNED NULL DEFAULT '0' COMMENT '转帐权限：0否  1是' AFTER `hidden`;
	

CREATE TABLE `video_transfer` (
	`auto_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自动编号',
	`by_uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '转出人uid',
	`by_nickname` VARCHAR(128) NOT NULL COMMENT '转出人昵称',
	`to_uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收款者uid',
	`to_nickname` VARCHAR(128) NOT NULL COMMENT '收款人昵称',
	`points` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '转帐额',
	`content` VARCHAR(256) NOT NULL DEFAULT '0' COMMENT '备注',
	`datetime` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
	`status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '转帐状态 1=成功, 否则失败',
	PRIMARY KEY (`auto_id`),
	INDEX `by_uid` (`by_uid`),
	INDEX `to_uid` (`to_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE='utf8_general_ci' COMMENT='用户转帐记录';





CREATE TABLE `video_manage` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '房间ID',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '添加来源：1房间 2前台 3后台',
  `dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间管理员表';


alter table video_group_permission alter column `allowstealth` set default 0;


ALTER TABLE `video_recharge` MODIFY COLUMN `pay_type` int(10) DEFAULT NULL COMMENT '充值方式：1 银行转账、2 抽奖  3 （未使用）   4后台充值 5充值赠送 6任务和签到奖励 7转帐记录';




