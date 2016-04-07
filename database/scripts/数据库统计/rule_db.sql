CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rule_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `rule_db`;

--
-- Table structure for table `rule_shards_table`
--
DROP TABLE IF EXISTS `rule_shards_table`;
CREATE TABLE `run_shards_table` (
  `auid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'非业务自增主键',
  `dbname` char(16) NOT NULL COMMENT '库名称',
  `original_tbname` char(32) NOT NULL COMMENT '原表名称',
  `tbname` char(32) NOT NULL COMMENT '分表名称',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_result` tinyint(4) NOT NULL COMMENT '取模结果',
  `min_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分表字段的最小值（用于sub sharding）',
  `max_value` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '分表字段的最大值（用于sub sharding）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  UNIQUE KEY (`dbname`,`tbname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分表状态信息存储';

--
-- Table structure for table `rule_auto_column`
--
DROP TABLE IF EXISTS `rule_auto_column`;
CREATE TABLE `rule_auto_column` (
  `auid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'非业务自增主键',
  `dbname` char(16) NOT NULL COMMENT '库名称',
  `original_tbname` char(32) NOT NULL COMMENT '原表名称（分表默认为table_prefix_1格式）',
  `pub_column` char(32) NOT NULL COMMENT '公共字段名',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '起始值（默认为1）',
  `current_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '当前已分配值（默认为1）',
  `interval` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '增量间隔（默认为1）',
  `threshold` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '可用最大值（默认为4294967295）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  UNIQUE KEY (`dbname`,`original_tbname`,`pub_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共用自增字段配置存储';

INSERT INTO `rule_auto_column` VALUES (NULL, 'video','video_user','uid',1,1,1,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1);

--
-- Table structure for table `rule_auto_column`
--
DROP TABLE IF EXISTS `rule_table`;
CREATE TABLE `rule_table` (
  `auid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'非业务自增主键',
  `dbname` char(16) NOT NULL COMMENT '库名称',
  `original_tbname` char(32) NOT NULL COMMENT '原表名称（分表默认为table_prefix_1格式）',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_value` tinyint(4) NOT NULL DEFAULT '0' COMMENT '取模值(默认0为不分表)',
  `achieve_vals` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归档周期（默认0为不归档）',
  `table_detail` varchar(256) DEFAULT NULL COMMENT '描述信息',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  UNIQUE KEY (`dbname`,`original_tbname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库表管理规则存储';
INSERT INTO `rule_table`(`dbname`, `original_tbname`, `shard_column`, `mod_value`, `achieve_vals`, `table_detail`, `init_time`, `dml_time`, `dml_flag`) VALUES ('video','video_live_list','',0,365,'2000 row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_mail','',0,365,'not clear','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_mall_list','uid',50,365,'5W row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_online','',0,365,'288 row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_pack','uid',20,0,'rely on user data','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_recharge','uid',10,365,'1W row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_song_list','',0,365,'not clear','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user','uid',20,0,'200W row/year','2014-10-23 10:56:09','2014-10-23 10:56:09',1);


--
-- Table structure for table `rule_archive_table`
--
DROP TABLE IF EXISTS `rule_archive_table`;
CREATE TABLE `rule_archive_table` (
  `auid` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'非业务自增主键',
  `dbname` char(16) NOT NULL COMMENT '库名称',
  `original_tbname` char(32) NOT NULL COMMENT '原表名称',
  `tbname` char(32) NOT NULL COMMENT '归档表名称',
  `min_time` datetime NOT NULL COMMENT '此表内的最小init_time',
  `max_time` datetime NOT NULL COMMENT '此表内的最大init_time',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  UNIQUE KEY (`dbname`,`tbname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='归档表状态信息存储';