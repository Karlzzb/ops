CREATE TABLE `video_active` (
  `active_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '礼物ID',
  `stime` date NOT NULL DEFAULT '1970-01-01' COMMENT '活动开始时间',
  `etime` date NOT NULL DEFAULT '1970-01-01' COMMENT '活动结束时间',
  `dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  PRIMARY KEY (`active_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


ALTER TABLE video_user ADD `icon_id` int DEFAULT '0' COMMENT '图标ID';



