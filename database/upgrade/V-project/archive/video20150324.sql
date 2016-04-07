select * from video.video_recharge WHERE order_id in (SELECT order_id from video.video_recharge GROUP BY order_id having count(order_id) > 1);

DELETE FROM video.video_recharge WHERE id in (250,338,355,367);


ALTER table video.video_recharge add pay_id  varchar(128);
ALTER TABLE video.video_recharge ADD UNIQUE (order_id);




alter table video.video_mail add column logicflag smallint(2) DEFAULT '1' after status;

create table video_bos.vbos_usr_aciton_log (  id int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',  action varchar(128)  NOT NULL DEFAULT 'default' COMMENT '方法',  controller varchar(128)  NOT NULL DEFAULT 'default' COMMENT '类',  type varchar(32)  NOT NULL DEFAULT 'default' COMMENT '操作类型',  created datetime NOT NULL COMMENT '创建时间',  admin_id int(11) NOT NULL DEFAULT '0' COMMENT '操作者id',  PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志表';