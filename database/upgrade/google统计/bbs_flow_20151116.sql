CREATE TABLE `wisdom_bbs_timer_task` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `time_sent` varchar(24) DEFAULT NULL COMMENT '时间',
  `status` tinyint(3) DEFAULT NULL COMMENT '执行状态',
  `data_num` int(5) DEFAULT NULL COMMENT '本次执行数据条数',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务扫描表';



CREATE TABLE `wisdom_bbs_data_stor` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `machine_code` varchar(128) DEFAULT NULL COMMENT '机器码-唯一',
  `date_time` int(11) DEFAULT NULL COMMENT '数据生成时间',
  `contents` mediumtext COMMENT '数据内容详情',
  `type` varchar(24) DEFAULT NULL COMMENT '数据类型：pv、uv、pvSum、uvSum',
  PRIMARY KEY (`auid`),
  UNIQUE KEY `mac_date_type` (`machine_code`,`date_time`,`type`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=utf8 COMMENT='google数据详情存储表';