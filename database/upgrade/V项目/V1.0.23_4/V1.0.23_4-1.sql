/*
/script/svn/trunk/video-admin/V1.0.23_4/sql
1.video-front_v1.0.23_4_20150806_A.sql
*/
use video;
DROP TABLE IF EXISTS `video_activity_click`;
CREATE TABLE `video_activity_click` (
  `auto_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '非业务自增主键ID',
  `date_day` date NOT NULL COMMENT '历史日期',
  `clicks` int(10) NOT NULL COMMENT '点击量',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='活动点击表';

