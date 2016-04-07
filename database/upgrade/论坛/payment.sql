create database  if not exists payment;--新的充提记录使用的数据库
use payment;
create table  if not exists order_model(
	`orderid` char(255) not null default '' comment '业务平台的订单id,格式为: 平台代号_唯一订单号 , 如bbs_1231243',
	`messageNo` char(255) not null default '' comment '充提的消息流水号',
	`dataNo` char(255) not null default '' comment '充提的数据流水号',
	`uid` int(11) not null comment '用户id',
	`amount` decimal(10,2) not null default 0 comment '充值金额',
	`channel` char(255) not null default '' comment '充值的渠道',
	`channelAcc` char(255) not null default '' comment '充提平台的支付商户号',
	`payOrderId` char(255) not null default '' comment '充提的订单ID,在回调时填入' ,
	`status` int(11) not null default -1 comment '支付状态 -1 为没有回调成功 , 0为已接受 , 1为处理中 , 2为处理成功 , 3 为处理失败',
	`insertTime` timestamp not null default current_timestamp comment '插入的时间',
	`updateTime` timestamp not null default  '0000-00-00 00:00:00' comment '更新的时间',
	primary key (`orderid`),
	unique key `messageDataNo`(`messageNo` , `dataNo`),
	key `dataNo`(`dataNo`),
	key `uid` (`uid`)
) engine = innodb charset=utf8 comment='订单记录表';
-- create table  if not exists order_model(
-- 	`orderid` char(255) not null default '' comment '业务平台的订单id,格式为: 平台代号_唯一订单号 , 如bbs_1231243',
-- 	`messageNo` char(255) not null default '' comment '充提的消息流水号',
-- 	`dataNo` char(255) not null default '' comment '充提的数据流水号',
-- 	`uid` int(11) not null comment '用户id',
-- 	`amount` decimal(10,2) not null default 0 comment '充值金额',
-- 	`channel` char(255) not null default '' comment '充值的渠道',
-- 	`channelAcc` char(255) not null default '' comment '充提平台的支付商户号',
-- 	`payOrderId` char(255) not null default '' comment '充提的订单ID,在回调时填入' ,
-- 	`status` int(11) not null default -1 comment '支付状态 -1 为没有回调成功 , 0为已接受 , 1为处理中 , 2为处理成功 , 3 为处理失败',
-- 	`insertTime` timestamp not null default current_timestamp comment '插入的时间',
-- 	`updateTime` timestamp not null default current_timestamp on update current_timestamp comment '更新的时间',
-- 	primary key (`orderid`),
-- 	unique key `messageDataNo`(`messageNo` , `dataNo`),
-- 	key `dataNo`(`dataNo`),
-- 	key `uid` (`uid`)
-- ) engine = innodb charset=utf8 comment='订单记录表';

#phpwind table 

create table newpayment (
	`orderid` int(11) unsigned auto_increment not null comment '自增订单号',
	`uid` int(11) unsigned not null default 0 comment '用户id',
	`amount` decimal(10 , 2) not null default 0 comment '充值金额',
	`status` int(11) not null default -1 comment '订单状态 -1 为没有回调成功 , 0为已接受 , 1为处理中 , 2为处理成功 ',
	`insertTime` timestamp not null default current_timestamp comment '插入的时间',
	`updateTime` timestamp not null default  '0000-00-00 00:00:00' comment '订单更新时间',
	primary key(`orderid`) 
)engine = innodb charset=utf8 comment="bbs订单记录表";










