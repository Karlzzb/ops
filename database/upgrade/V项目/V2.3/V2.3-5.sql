CREATE TABLE video_bos.`vbos_bill_stat_month` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `new_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月新增充值用户数',
  `total_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月充值总人数',
  `total_money` decimal(14,0) NOT NULL COMMENT '上月充值总金额',
  `total_bill` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月充值总订单数',
  `avg_recharge` decimal(14,0) NOT NULL DEFAULT '0' COMMENT '上月人均充值：总充值金额/总充值人数',
  `avg_bill` decimal(14,0) NOT NULL DEFAULT '0' COMMENT '上月订单平均充值：总充值金额/总订单数',
  `total_customer` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月消费总人数',
  `total_amount` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '上月消费总金额数',
  `arpu_bill` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月ARPU值',
  `arpu_recharge` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上月充值ARPU值',
  `arpu_customer` double NOT NULL COMMENT '上月平均消费金额',
  `new_totalPoints` int(11) DEFAULT '0' COMMENT '新增用户充值总额',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  PRIMARY KEY (`auid`),
  KEY `ctime_key` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每月对充值、金额的统计存储表';

ALTER TABLE video.`video_user` ADD COLUMN `first_charge_time` datetime DEFAULT NULL COMMENT '首次充值时间';