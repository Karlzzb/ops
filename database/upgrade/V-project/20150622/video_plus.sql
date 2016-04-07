CREATE TABLE `video_charm_rank` ( 
	`crank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主播排行主键',
	`active_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
	`uid` int(10) NOT NULL COMMENT '用户ID',
	`gnum` int(10) NOT NULL DEFAULT 0 COMMENT '收礼数量',
	`num` int(10) NOT NULL DEFAULT 0 COMMENT '收钻石数',
	`dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除', 
	`init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间', 
	`dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间', 
	 PRIMARY KEY (`crank_id`),
	 KEY active_id_key(active_id),
	 KEY uid_key(uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播排行表';



CREATE TABLE `video_extreme_rank` ( 
	`erank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户排行主键',
	`active_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
	`uid` int(10) NOT NULL COMMENT '用户ID',
	`gnum` int(10) NOT NULL DEFAULT 0 COMMENT '送礼数量',
	`num` int(10) NOT NULL DEFAULT 0 COMMENT '送钻石数',
	`dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除', 
	`init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间', 
	`dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间', 
	PRIMARY KEY (`erank_id`),
	KEY active_id_key(active_id),
	KEY uid_key(uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户排行表';