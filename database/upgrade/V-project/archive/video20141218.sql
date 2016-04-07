-- MySQL dump 10.15  Distrib 10.0.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: video
-- ------------------------------------------------------
-- Server version	10.0.12-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `scfg_auto_column`
--

DROP TABLE IF EXISTS `scfg_auto_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_auto_column` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_prefix` char(32) NOT NULL COMMENT '表名前缀（分表默认为table_prefix_01格式）',
  `pub_column` char(32) NOT NULL COMMENT '公共字段名',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '起始值（默认为1）',
  `current_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '当前已分配值（默认为1）',
  `interval` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '增量间隔（默认为1）',
  `threshold` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '可用最大值（默认为4294967295）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_prefix`,`pub_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共用自增字段配置存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scfg_shards_table`
--

DROP TABLE IF EXISTS `scfg_shards_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_shards_table` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_name` char(32) NOT NULL COMMENT '分表名称',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_result` tinyint(4) NOT NULL COMMENT '取模结果',
  `min_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分表字段的最小值（用于sub sharding）',
  `max_value` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '分表字段的最大值（用于sub sharding）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分表状态信息存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scfg_table_rules`
--

DROP TABLE IF EXISTS `scfg_table_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_table_rules` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_prefix` char(32) NOT NULL COMMENT '表名前缀（分表默认为table_prefix_0...table_prefix_11格式）',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_value` tinyint(4) NOT NULL DEFAULT '0' COMMENT '取模值(默认0为不分表)',
  `achieve_vals` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归档周期（默认0为不归档）',
  `table_detail` varchar(256) DEFAULT NULL COMMENT '描述信息',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库表管理配置存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_anchor`
--

DROP TABLE IF EXISTS `video_anchor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_anchor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `aid` int(10) DEFAULT NULL COMMENT '相册ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `file` char(32) DEFAULT NULL COMMENT '文件名',
  `size` int(10) DEFAULT NULL COMMENT '文件大小',
  `summary` varchar(255) DEFAULT NULL COMMENT '文件描述',
  `jointime` int(10) DEFAULT NULL COMMENT '上传时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '文件状态(保留)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='主播中心表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_anchor_tag`
--

DROP TABLE IF EXISTS `video_anchor_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_anchor_tag` (
  `uid` int(10) NOT NULL COMMENT '主播用户id',
  `tag_id` smallint(4) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`uid`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播分类标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_area`
--

DROP TABLE IF EXISTS `video_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_area` (
  `code` char(6) NOT NULL,
  `root` char(6) DEFAULT NULL,
  `area` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`,`area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_attention`
--

DROP TABLE IF EXISTS `video_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_attention` (
  `fid` int(10) NOT NULL COMMENT '关注的发起用户uid',
  `tid` int(10) NOT NULL COMMENT '被关注的用户uid',
  `adddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_birth_star`
--

DROP TABLE IF EXISTS `video_birth_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_birth_star` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `monthday` smallint(4) NOT NULL,
  `starname` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_chat`
--

DROP TABLE IF EXISTS `video_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_chat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `send_uid` int(10) NOT NULL,
  `rec_uid` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `category` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_complaints`
--

DROP TABLE IF EXISTS `video_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `uid` int(11) NOT NULL COMMENT '投诉用户ID',
  `cid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '被投诉客服ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '投诉类型',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '投诉内容',
  `results` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null' COMMENT '处理结果',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态  0：待处理   1： 处理完毕',
  `editors_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `created` datetime NOT NULL COMMENT '创建时间',
  `edit_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户投诉建议表                        **创建者：morgan';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_conf`
--

DROP TABLE IF EXISTS `video_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_conf` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_exit_room`
--

DROP TABLE IF EXISTS `video_exit_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_exit_room` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `video_uid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `in_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2690 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_goods`
--

DROP TABLE IF EXISTS `video_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_goods` (
  `gid` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `price` int(10) NOT NULL,
  `category` int(10) NOT NULL,
  `unit_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '购买单位方式,1=计件；2=计时',
  `category_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_host_audit`
--

DROP TABLE IF EXISTS `video_host_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_host_audit` (
  `auid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `host_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主播ID，和主播表的主键关联',
  `serial` varchar(32) NOT NULL DEFAULT '0' COMMENT '签约流水号',
  `status` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态：0:等待审批;1:接受;2:拒绝;',
  `audit_time` datetime DEFAULT NULL COMMENT '审核日期，如果是接受，则表示签约日期',
  `ctime` datetime NOT NULL COMMENT '统计的时间',
  `is_del` tinyint(1) NOT NULL COMMENT '是否删除   0 为删除   1 为正常',
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='主播申请记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_level_exp`
--

DROP TABLE IF EXISTS `video_level_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_level_exp` (
  `level_id` int(10) NOT NULL,
  `level_name` varchar(20) DEFAULT NULL,
  `level_title` varchar(20) DEFAULT NULL COMMENT '头衔',
  `level_value` int(10) DEFAULT NULL,
  `open_guest` tinyint(1) DEFAULT '0' COMMENT '允许发起竞彩，1=允许',
  `open_user_level` tinyint(1) DEFAULT '0' COMMENT '允许设置进入用户等级',
  `open_pay_room` tinyint(1) DEFAULT '0' COMMENT '允许设定付费房间',
  `open_song_price` tinyint(1) DEFAULT '0' COMMENT '允许设定点歌价格',
  `ratio` tinyint(2) DEFAULT NULL COMMENT '分成比率',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播等级配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_level_rich`
--

DROP TABLE IF EXISTS `video_level_rich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_level_rich` (
  `level_id` int(10) NOT NULL,
  `level_name` varchar(20) DEFAULT NULL,
  `level_value` int(10) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户财富等级配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_live_list`
--

DROP TABLE IF EXISTS `video_live_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_live_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `created` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '开始直播时间',
  `rid` int(10) NOT NULL COMMENT '房间id',
  `category` smallint(2) NOT NULL COMMENT '0普通直播；1=一对一直播；2=一对多直播',
  `duration` int(10) NOT NULL DEFAULT '0',
  `points` int(10) DEFAULT '0' COMMENT '本场直播收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_mail`
--

DROP TABLE IF EXISTS `video_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_mail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `send_uid` int(10) NOT NULL COMMENT '发送者用户id',
  `rec_uid` int(10) NOT NULL COMMENT '接收者uid',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `category` smallint(2) NOT NULL COMMENT '1=系统消息，2=用户消息',
  `status` smallint(2) NOT NULL COMMENT '1=已读；0=未读',
  `created` datetime NOT NULL COMMENT '消息发送时间',
  `mail_type` smallint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=875 DEFAULT CHARSET=utf8 COMMENT='私信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_mall_list`
--

DROP TABLE IF EXISTS `video_mall_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_mall_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `send_uid` int(10) DEFAULT NULL,
  `rec_uid` int(10) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `gnum` int(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `rid` int(10) DEFAULT NULL,
  `points` int(10) DEFAULT '0',
  `rate` smallint(3) DEFAULT '0' COMMENT '分成比例',
  PRIMARY KEY (`id`),
  KEY `index_rec_uid` (`rec_uid`) USING BTREE,
  KEY `index_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7320 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_online`
--

DROP TABLE IF EXISTS `video_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_online` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users` int(10) NOT NULL,
  `created` datetime NOT NULL,
  `channel_id` int(10) DEFAULT '0',
  `guest_users` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_pack`
--

DROP TABLE IF EXISTS `video_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pack` (
  `uid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `num` int(10) NOT NULL,
  `expires` int(10) DEFAULT NULL COMMENT '过期时间，null永久有效',
  PRIMARY KEY (`uid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户背包数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_recharge`
--

DROP TABLE IF EXISTS `video_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `points` int(10) NOT NULL,
  `created` datetime NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_type` int(10) DEFAULT NULL,
  `pay_status` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_room_online`
--

DROP TABLE IF EXISTS `video_room_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_room_online` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_server`
--

DROP TABLE IF EXISTS `video_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_server` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(80) CHARACTER SET latin1 NOT NULL,
  `port` int(10) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_song_info`
--

DROP TABLE IF EXISTS `video_song_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_song_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(80) NOT NULL,
  `song_name` varchar(80) NOT NULL,
  `video_id` int(10) NOT NULL,
  `visit_num` int(10) DEFAULT '0' COMMENT '点歌次数',
  `agree_num` int(10) DEFAULT '0' COMMENT '同意次数',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='主播歌单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_song_list`
--

DROP TABLE IF EXISTS `video_song_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_song_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `video_uid` int(10) NOT NULL COMMENT '主播id',
  `send_uid` int(10) NOT NULL COMMENT '点歌用户id',
  `sid` int(10) NOT NULL COMMENT '主播歌曲id',
  `singer_name` varchar(80) DEFAULT NULL COMMENT '自定义点歌歌曲原唱',
  `song_name` varchar(80) DEFAULT NULL COMMENT '自定义点歌歌名',
  `created` datetime NOT NULL,
  `status` smallint(2) NOT NULL COMMENT '0=未处理；1=已同意',
  `cost` int(6) NOT NULL COMMENT '花费价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户点歌流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_tag`
--

DROP TABLE IF EXISTS `video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_tag` (
  `tag_id` smallint(6) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_user`
--

DROP TABLE IF EXISTS `video_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL COMMENT '登录名',
  `password` varchar(128) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `sex` smallint(2) DEFAULT '0' COMMENT '性别',
  `exp` int(10) DEFAULT '0' COMMENT '经验值',
  `roled` smallint(2) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL COMMENT '个人说明',
  `points` int(10) unsigned DEFAULT '0' COMMENT '点卷',
  `created` datetime DEFAULT NULL,
  `logined` datetime DEFAULT NULL,
  `rid` int(10) DEFAULT NULL COMMENT '房间id',
  `rich` int(10) DEFAULT '0' COMMENT '财富',
  `pop` int(10) DEFAULT '0' COMMENT '人气',
  `status` smallint(2) DEFAULT '1' COMMENT '0=禁用',
  `vip` int(10) DEFAULT '0',
  `vip_end` datetime DEFAULT NULL,
  `province` int(10) DEFAULT '0' COMMENT '省份',
  `city` int(10) DEFAULT '0' COMMENT '城市',
  `county` int(10) DEFAULT '0',
  `video_status` smallint(2) DEFAULT '0' COMMENT '主播状态',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `headimg` varchar(128) DEFAULT NULL COMMENT '头像',
  `lv_exp` smallint(3) DEFAULT '1',
  `lv_rich` smallint(3) DEFAULT '1',
  `pic_total_size` int(10) DEFAULT '524288000' COMMENT '总空间大小(500M)',
  `pic_used_size` int(10) DEFAULT '0' COMMENT '已使用空间大小',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=101111298 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_user_extends`
--

DROP TABLE IF EXISTS `video_user_extends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_user_extends` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `realname` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '真实姓名',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `qq` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'qq号码',
  PRIMARY KEY (`uid`,`realname`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='主播扩展信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_user_invitation`
--

DROP TABLE IF EXISTS `video_user_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_user_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广者ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `reward` int(10) unsigned DEFAULT '0' COMMENT '奖励',
  `fromlink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源URL',
  `fromtime` datetime DEFAULT NULL COMMENT '注册时间',
  `fromip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册IP地址',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户邀请注册记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_user_login_logs`
--

DROP TABLE IF EXISTS `video_user_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_user_login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-18 19:07:56
-- MySQL dump 10.15  Distrib 10.0.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: video
-- ------------------------------------------------------
-- Server version	10.0.12-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `scfg_auto_column`
--

DROP TABLE IF EXISTS `scfg_auto_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_auto_column` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_prefix` char(32) NOT NULL COMMENT '表名前缀（分表默认为table_prefix_01格式）',
  `pub_column` char(32) NOT NULL COMMENT '公共字段名',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '起始值（默认为1）',
  `current_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '当前已分配值（默认为1）',
  `interval` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '增量间隔（默认为1）',
  `threshold` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '可用最大值（默认为4294967295）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_prefix`,`pub_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共用自增字段配置存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_auto_column`
--

LOCK TABLES `scfg_auto_column` WRITE;
/*!40000 ALTER TABLE `scfg_auto_column` DISABLE KEYS */;
INSERT INTO `scfg_auto_column` VALUES ('video','video_user','uid',1,1,1,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1);
/*!40000 ALTER TABLE `scfg_auto_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_shards_table`
--

DROP TABLE IF EXISTS `scfg_shards_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_shards_table` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_name` char(32) NOT NULL COMMENT '分表名称',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_result` tinyint(4) NOT NULL COMMENT '取模结果',
  `min_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分表字段的最小值（用于sub sharding）',
  `max_value` bigint(20) unsigned NOT NULL DEFAULT '4294967295' COMMENT '分表字段的最大值（用于sub sharding）',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分表状态信息存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_shards_table`
--

LOCK TABLES `scfg_shards_table` WRITE;
/*!40000 ALTER TABLE `scfg_shards_table` DISABLE KEYS */;
INSERT INTO `scfg_shards_table` VALUES ('video','shard_column_0','uid',0,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_1','uid',1,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_10','uid',10,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_11','uid',11,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_12','uid',12,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_13','uid',13,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_14','uid',14,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_15','uid',15,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_16','uid',16,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_17','uid',17,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_18','uid',18,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_19','uid',19,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_2','uid',2,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_3','uid',3,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_4','uid',4,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_5','uid',5,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_6','uid',6,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_7','uid',7,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_8','uid',8,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','shard_column_9','uid',9,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_mall_list_0','uid',0,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_1','uid',1,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_10','uid',10,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_11','uid',11,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_12','uid',12,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_13','uid',13,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_14','uid',14,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_15','uid',15,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_16','uid',16,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_17','uid',17,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_18','uid',18,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_19','uid',19,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_2','uid',2,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_20','uid',20,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_21','uid',21,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_22','uid',22,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_23','uid',23,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_24','uid',24,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_25','uid',25,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_26','uid',26,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_27','uid',27,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_28','uid',28,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_29','uid',29,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_3','uid',3,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_30','uid',30,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_31','uid',31,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_32','uid',32,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_33','uid',33,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_34','uid',34,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_35','uid',35,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_36','uid',36,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_37','uid',37,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_38','uid',38,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_39','uid',39,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_4','uid',4,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_40','uid',40,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_41','uid',41,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_42','uid',42,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_43','uid',43,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_44','uid',44,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_45','uid',45,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_46','uid',46,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_47','uid',47,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_48','uid',48,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_49','uid',49,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_mall_list_5','uid',5,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_6','uid',6,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_7','uid',7,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_8','uid',8,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_mall_list_9','uid',9,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_recharge_0','uid',0,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_recharge_1','uid',1,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_recharge_2','uid',2,0,4294967295,'2014-10-23 10:56:11','2014-10-23 10:56:11',1),('video','video_recharge_3','uid',3,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_4','uid',4,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_5','uid',5,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_6','uid',6,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_7','uid',7,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_8','uid',8,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_recharge_9','uid',9,0,4294967295,'2014-10-23 10:56:12','2014-10-23 10:56:12',1),('video','video_user_0','uid',0,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_1','uid',1,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_10','uid',10,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_11','uid',11,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_12','uid',12,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_13','uid',13,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_14','uid',14,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_15','uid',15,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_16','uid',16,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_17','uid',17,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_18','uid',18,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_19','uid',19,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_2','uid',2,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_3','uid',3,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_4','uid',4,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_5','uid',5,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_6','uid',6,0,4294967295,'2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user_7','uid',7,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_8','uid',8,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1),('video','video_user_9','uid',9,0,4294967295,'2014-10-23 10:56:10','2014-10-23 10:56:10',1);
/*!40000 ALTER TABLE `scfg_shards_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_table_rules`
--

DROP TABLE IF EXISTS `scfg_table_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_table_rules` (
  `db_name` char(16) NOT NULL COMMENT '库名称',
  `table_prefix` char(32) NOT NULL COMMENT '表名前缀（分表默认为table_prefix_0...table_prefix_11格式）',
  `shard_column` char(32) NOT NULL COMMENT '分表依赖字段名',
  `mod_value` tinyint(4) NOT NULL DEFAULT '0' COMMENT '取模值(默认0为不分表)',
  `achieve_vals` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归档周期（默认0为不归档）',
  `table_detail` varchar(256) DEFAULT NULL COMMENT '描述信息',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`db_name`,`table_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库表管理配置存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_table_rules`
--

LOCK TABLES `scfg_table_rules` WRITE;
/*!40000 ALTER TABLE `scfg_table_rules` DISABLE KEYS */;
INSERT INTO `scfg_table_rules` VALUES ('video','video_live_list','',0,365,'2000 row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_mail','',0,365,'not clear','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_mall_list','uid',50,365,'5W row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_online','',0,365,'288 row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_pack','uid',20,0,'rely on user data','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_recharge','uid',10,365,'1W row/day','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_song_list','',0,365,'not clear','2014-10-23 10:56:09','2014-10-23 10:56:09',1),('video','video_user','uid',20,0,'200W row/year','2014-10-23 10:56:09','2014-10-23 10:56:09',1);
/*!40000 ALTER TABLE `scfg_table_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_area`
--

DROP TABLE IF EXISTS `video_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_area` (
  `code` char(6) NOT NULL,
  `root` char(6) DEFAULT NULL,
  `area` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`,`area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_area`
--

LOCK TABLES `video_area` WRITE;
/*!40000 ALTER TABLE `video_area` DISABLE KEYS */;
INSERT INTO `video_area` VALUES ('110000',NULL,'北京市'),('110101',NULL,'东城区'),('110102',NULL,'西城区'),('110103',NULL,'崇文区'),('110104',NULL,'宣武区'),('110105',NULL,'朝阳区'),('110106',NULL,'丰台区'),('110107',NULL,'石景山区'),('110108',NULL,'海淀区'),('110109',NULL,'门头沟区'),('110111',NULL,'房山区'),('110112',NULL,'通州区'),('110113',NULL,'顺义区'),('110114',NULL,'昌平区'),('110115',NULL,'大兴区'),('110116',NULL,'怀柔区'),('110117',NULL,'平谷区'),('110228',NULL,'密云县'),('110229',NULL,'延庆县'),('120000',NULL,'天津市'),('120101',NULL,'和平区'),('120102',NULL,'河东区'),('120103',NULL,'河西区'),('120104',NULL,'南开区'),('120105',NULL,'河北区'),('120106',NULL,'红桥区'),('120107',NULL,'塘沽区'),('120108',NULL,'汉沽区'),('120109',NULL,'大港区'),('120110',NULL,'东丽区'),('120111',NULL,'西青区'),('120112',NULL,'津南区'),('120113',NULL,'北辰区'),('120114',NULL,'武清区'),('120115',NULL,'宝坻区'),('120221',NULL,'宁河县'),('120223',NULL,'静海县'),('120225',NULL,'蓟县'),('130000',NULL,'河北省'),('130100',NULL,'石家庄市'),('130101',NULL,'市辖区'),('130102',NULL,'长安区'),('130103',NULL,'桥东区'),('130104',NULL,'桥西区'),('130105',NULL,'新华区'),('130107',NULL,'井陉矿区'),('130108',NULL,'裕华区'),('130121',NULL,'井陉县'),('130123',NULL,'正定县'),('130124',NULL,'栾城县'),('130125',NULL,'行唐县'),('130126',NULL,'灵寿县'),('130127',NULL,'高邑县'),('130128',NULL,'深泽县'),('130129',NULL,'赞皇县'),('130130',NULL,'无极县'),('130131',NULL,'平山县'),('130132',NULL,'元氏县'),('130133',NULL,'赵县'),('130181',NULL,'辛集市'),('130182',NULL,'藁城市'),('130183',NULL,'晋州市'),('130184',NULL,'新乐市'),('130185',NULL,'鹿泉市'),('130200',NULL,'唐山市'),('130201',NULL,'市辖区'),('130202',NULL,'路南区'),('130203',NULL,'路北区'),('130204',NULL,'古冶区'),('130205',NULL,'开平区'),('130207',NULL,'丰南区'),('130208',NULL,'丰润区'),('130223',NULL,'滦县'),('130224',NULL,'滦南县'),('130225',NULL,'乐亭县'),('130227',NULL,'迁西县'),('130229',NULL,'玉田县'),('130230',NULL,'唐海县'),('130281',NULL,'遵化市'),('130283',NULL,'迁安市'),('130300',NULL,'秦皇岛市'),('130301',NULL,'市辖区'),('130302',NULL,'海港区'),('130303',NULL,'山海关区'),('130304',NULL,'北戴河区'),('130321',NULL,'青龙满族自治县'),('130322',NULL,'昌黎县'),('130323',NULL,'抚宁县'),('130324',NULL,'卢龙县'),('130400',NULL,'邯郸市'),('130401',NULL,'市辖区'),('130402',NULL,'邯山区'),('130403',NULL,'丛台区'),('130404',NULL,'复兴区'),('130406',NULL,'峰峰矿区'),('130421',NULL,'邯郸县'),('130423',NULL,'临漳县'),('130424',NULL,'成安县'),('130425',NULL,'大名县'),('130426',NULL,'涉县'),('130427',NULL,'磁县'),('130428',NULL,'肥乡县'),('130429',NULL,'永年县'),('130430',NULL,'邱县'),('130431',NULL,'鸡泽县'),('130432',NULL,'广平县'),('130433',NULL,'馆陶县'),('130434',NULL,'魏县'),('130435',NULL,'曲周县'),('130481',NULL,'武安市'),('130500',NULL,'邢台市'),('130501',NULL,'市辖区'),('130502',NULL,'桥东区'),('130503',NULL,'桥西区'),('130521',NULL,'邢台县'),('130522',NULL,'临城县'),('130523',NULL,'内丘县'),('130524',NULL,'柏乡县'),('130525',NULL,'隆尧县'),('130526',NULL,'任县'),('130527',NULL,'南和县'),('130528',NULL,'宁晋县'),('130529',NULL,'巨鹿县'),('130530',NULL,'新河县'),('130531',NULL,'广宗县'),('130532',NULL,'平乡县'),('130533',NULL,'威县'),('130534',NULL,'清河县'),('130535',NULL,'临西县'),('130581',NULL,'南宫市'),('130582',NULL,'沙河市'),('130600',NULL,'保定市'),('130601',NULL,'市辖区'),('130602',NULL,'新市区'),('130603',NULL,'北市区'),('130604',NULL,'南市区'),('130621',NULL,'满城县'),('130622',NULL,'清苑县'),('130623',NULL,'涞水县'),('130624',NULL,'阜平县'),('130625',NULL,'徐水县'),('130626',NULL,'定兴县'),('130627',NULL,'唐县'),('130628',NULL,'高阳县'),('130629',NULL,'容城县'),('130630',NULL,'涞源县'),('130631',NULL,'望都县'),('130632',NULL,'安新县'),('130633',NULL,'易县'),('130634',NULL,'曲阳县'),('130635',NULL,'蠡县'),('130636',NULL,'顺平县'),('130637',NULL,'博野县'),('130638',NULL,'雄县'),('130681',NULL,'涿州市'),('130682',NULL,'定州市'),('130683',NULL,'安国市'),('130684',NULL,'高碑店市'),('130700',NULL,'张家口市'),('130701',NULL,'市辖区'),('130702',NULL,'桥东区'),('130703',NULL,'桥西区'),('130705',NULL,'宣化区'),('130706',NULL,'下花园区'),('130721',NULL,'宣化县'),('130722',NULL,'张北县'),('130723',NULL,'康保县'),('130724',NULL,'沽源县'),('130725',NULL,'尚义县'),('130726',NULL,'蔚县'),('130727',NULL,'阳原县'),('130728',NULL,'怀安县'),('130729',NULL,'万全县'),('130730',NULL,'怀来县'),('130731',NULL,'涿鹿县'),('130732',NULL,'赤城县'),('130733',NULL,'崇礼县'),('130800',NULL,'承德市'),('130801',NULL,'市辖区'),('130802',NULL,'双桥区'),('130803',NULL,'双滦区'),('130804',NULL,'鹰手营子矿区'),('130821',NULL,'承德县'),('130822',NULL,'兴隆县'),('130823',NULL,'平泉县'),('130824',NULL,'滦平县'),('130825',NULL,'隆化县'),('130826',NULL,'丰宁满族自治县'),('130827',NULL,'宽城满族自治县'),('130828',NULL,'围场满族蒙古族自治县'),('130900',NULL,'沧州市'),('130901',NULL,'市辖区'),('130902',NULL,'新华区'),('130903',NULL,'运河区'),('130921',NULL,'沧县'),('130922',NULL,'青县'),('130923',NULL,'东光县'),('130924',NULL,'海兴县'),('130925',NULL,'盐山县'),('130926',NULL,'肃宁县'),('130927',NULL,'南皮县'),('130928',NULL,'吴桥县'),('130929',NULL,'献县'),('130930',NULL,'孟村回族自治县'),('130981',NULL,'泊头市'),('130982',NULL,'任丘市'),('130983',NULL,'黄骅市'),('130984',NULL,'河间市'),('131000',NULL,'廊坊市'),('131001',NULL,'市辖区'),('131002',NULL,'安次区'),('131003',NULL,'广阳区'),('131022',NULL,'固安县'),('131023',NULL,'永清县'),('131024',NULL,'香河县'),('131025',NULL,'大城县'),('131026',NULL,'文安县'),('131028',NULL,'大厂回族自治县'),('131081',NULL,'霸州市'),('131082',NULL,'三河市'),('131100',NULL,'衡水市'),('131101',NULL,'市辖区'),('131102',NULL,'桃城区'),('131121',NULL,'枣强县'),('131122',NULL,'武邑县'),('131123',NULL,'武强县'),('131124',NULL,'饶阳县'),('131125',NULL,'安平县'),('131126',NULL,'故城县'),('131127',NULL,'景县'),('131128',NULL,'阜城县'),('131181',NULL,'冀州市'),('131182',NULL,'深州市'),('140000',NULL,'山西省'),('140100',NULL,'太原市'),('140101',NULL,'市辖区'),('140105',NULL,'小店区'),('140106',NULL,'迎泽区'),('140107',NULL,'杏花岭区'),('140108',NULL,'尖草坪区'),('140109',NULL,'万柏林区'),('140110',NULL,'晋源区'),('140121',NULL,'清徐县'),('140122',NULL,'阳曲县'),('140123',NULL,'娄烦县'),('140181',NULL,'古交市'),('140200',NULL,'大同市'),('140201',NULL,'市辖区'),('140202',NULL,'城区'),('140203',NULL,'矿区'),('140211',NULL,'南郊区'),('140212',NULL,'新荣区'),('140221',NULL,'阳高县'),('140222',NULL,'天镇县'),('140223',NULL,'广灵县'),('140224',NULL,'灵丘县'),('140225',NULL,'浑源县'),('140226',NULL,'左云县'),('140227',NULL,'大同县'),('140300',NULL,'阳泉市'),('140301',NULL,'市辖区'),('140302',NULL,'城区'),('140303',NULL,'矿区'),('140311',NULL,'郊区'),('140321',NULL,'平定县'),('140322',NULL,'盂县'),('140400',NULL,'长治市'),('140401',NULL,'市辖区'),('140402',NULL,'城区'),('140411',NULL,'郊区'),('140421',NULL,'长治县'),('140423',NULL,'襄垣县'),('140424',NULL,'屯留县'),('140425',NULL,'平顺县'),('140426',NULL,'黎城县'),('140427',NULL,'壶关县'),('140428',NULL,'长子县'),('140429',NULL,'武乡县'),('140430',NULL,'沁县'),('140431',NULL,'沁源县'),('140481',NULL,'潞城市'),('140500',NULL,'晋城市'),('140501',NULL,'市辖区'),('140502',NULL,'城区'),('140521',NULL,'沁水县'),('140522',NULL,'阳城县'),('140524',NULL,'陵川县'),('140525',NULL,'泽州县'),('140581',NULL,'高平市'),('140600',NULL,'朔州市'),('140601',NULL,'市辖区'),('140602',NULL,'朔城区'),('140603',NULL,'平鲁区'),('140621',NULL,'山阴县'),('140622',NULL,'应县'),('140623',NULL,'右玉县'),('140624',NULL,'怀仁县'),('140700',NULL,'晋中市'),('140701',NULL,'市辖区'),('140702',NULL,'榆次区'),('140721',NULL,'榆社县'),('140722',NULL,'左权县'),('140723',NULL,'和顺县'),('140724',NULL,'昔阳县'),('140725',NULL,'寿阳县'),('140726',NULL,'太谷县'),('140727',NULL,'祁县'),('140728',NULL,'平遥县'),('140729',NULL,'灵石县'),('140781',NULL,'介休市'),('140800',NULL,'运城市'),('140801',NULL,'市辖区'),('140802',NULL,'盐湖区'),('140821',NULL,'临猗县'),('140822',NULL,'万荣县'),('140823',NULL,'闻喜县'),('140824',NULL,'稷山县'),('140825',NULL,'新绛县'),('140826',NULL,'绛县'),('140827',NULL,'垣曲县'),('140828',NULL,'夏县'),('140829',NULL,'平陆县'),('140830',NULL,'芮城县'),('140881',NULL,'永济市'),('140882',NULL,'河津市'),('140900',NULL,'忻州市'),('140901',NULL,'市辖区'),('140902',NULL,'忻府区'),('140921',NULL,'定襄县'),('140922',NULL,'五台县'),('140923',NULL,'代县'),('140924',NULL,'繁峙县'),('140925',NULL,'宁武县'),('140926',NULL,'静乐县'),('140927',NULL,'神池县'),('140928',NULL,'五寨县'),('140929',NULL,'岢岚县'),('140930',NULL,'河曲县'),('140931',NULL,'保德县'),('140932',NULL,'偏关县'),('140981',NULL,'原平市'),('141000',NULL,'临汾市'),('141001',NULL,'市辖区'),('141002',NULL,'尧都区'),('141021',NULL,'曲沃县'),('141022',NULL,'翼城县'),('141023',NULL,'襄汾县'),('141024',NULL,'洪洞县'),('141025',NULL,'古县'),('141026',NULL,'安泽县'),('141027',NULL,'浮山县'),('141028',NULL,'吉县'),('141029',NULL,'乡宁县'),('141030',NULL,'大宁县'),('141031',NULL,'隰县'),('141032',NULL,'永和县'),('141033',NULL,'蒲县'),('141034',NULL,'汾西县'),('141081',NULL,'侯马市'),('141082',NULL,'霍州市'),('141100',NULL,'吕梁市'),('141101',NULL,'市辖区'),('141102',NULL,'离石区'),('141121',NULL,'文水县'),('141122',NULL,'交城县'),('141123',NULL,'兴县'),('141124',NULL,'临县'),('141125',NULL,'柳林县'),('141126',NULL,'石楼县'),('141127',NULL,'岚县'),('141128',NULL,'方山县'),('141129',NULL,'中阳县'),('141130',NULL,'交口县'),('141181',NULL,'孝义市'),('141182',NULL,'汾阳市'),('150000',NULL,'内蒙古自治区'),('150100',NULL,'呼和浩特市'),('150101',NULL,'市辖区'),('150102',NULL,'新城区'),('150103',NULL,'回民区'),('150104',NULL,'玉泉区'),('150105',NULL,'赛罕区'),('150121',NULL,'土默特左旗'),('150122',NULL,'托克托县'),('150123',NULL,'和林格尔县'),('150124',NULL,'清水河县'),('150125',NULL,'武川县'),('150200',NULL,'包头市'),('150201',NULL,'市辖区'),('150202',NULL,'东河区'),('150203',NULL,'昆都仑区'),('150204',NULL,'青山区'),('150205',NULL,'石拐区'),('150206',NULL,'白云矿区'),('150207',NULL,'九原区'),('150221',NULL,'土默特右旗'),('150222',NULL,'固阳县'),('150223',NULL,'达尔罕茂明安联合旗'),('150300',NULL,'乌海市'),('150301',NULL,'市辖区'),('150302',NULL,'海勃湾区'),('150303',NULL,'海南区'),('150304',NULL,'乌达区'),('150400',NULL,'赤峰市'),('150401',NULL,'市辖区'),('150402',NULL,'红山区'),('150403',NULL,'元宝山区'),('150404',NULL,'松山区'),('150421',NULL,'阿鲁科尔沁旗'),('150422',NULL,'巴林左旗'),('150423',NULL,'巴林右旗'),('150424',NULL,'林西县'),('150425',NULL,'克什克腾旗'),('150426',NULL,'翁牛特旗'),('150428',NULL,'喀喇沁旗'),('150429',NULL,'宁城县'),('150430',NULL,'敖汉旗'),('150500',NULL,'通辽市'),('150501',NULL,'市辖区'),('150502',NULL,'科尔沁区'),('150521',NULL,'科尔沁左翼中旗'),('150522',NULL,'科尔沁左翼后旗'),('150523',NULL,'开鲁县'),('150524',NULL,'库伦旗'),('150525',NULL,'奈曼旗'),('150526',NULL,'扎鲁特旗'),('150581',NULL,'霍林郭勒市'),('150600',NULL,'鄂尔多斯市'),('150602',NULL,'东胜区'),('150621',NULL,'达拉特旗'),('150622',NULL,'准格尔旗'),('150623',NULL,'鄂托克前旗'),('150624',NULL,'鄂托克旗'),('150625',NULL,'杭锦旗'),('150626',NULL,'乌审旗'),('150627',NULL,'伊金霍洛旗'),('150700',NULL,'呼伦贝尔市'),('150701',NULL,'市辖区'),('150702',NULL,'海拉尔区'),('150721',NULL,'阿荣旗'),('150722',NULL,'莫力达瓦达斡尔族自治旗'),('150723',NULL,'鄂伦春自治旗'),('150724',NULL,'鄂温克族自治旗'),('150725',NULL,'陈巴尔虎旗'),('150726',NULL,'新巴尔虎左旗'),('150727',NULL,'新巴尔虎右旗'),('150781',NULL,'满洲里市'),('150782',NULL,'牙克石市'),('150783',NULL,'扎兰屯市'),('150784',NULL,'额尔古纳市'),('150785',NULL,'根河市'),('150800',NULL,'巴彦淖尔市'),('150801',NULL,'市辖区'),('150802',NULL,'临河区'),('150821',NULL,'五原县'),('150822',NULL,'磴口县'),('150823',NULL,'乌拉特前旗'),('150824',NULL,'乌拉特中旗'),('150825',NULL,'乌拉特后旗'),('150826',NULL,'杭锦后旗'),('150900',NULL,'乌兰察布市'),('150901',NULL,'市辖区'),('150902',NULL,'集宁区'),('150921',NULL,'卓资县'),('150922',NULL,'化德县'),('150923',NULL,'商都县'),('150924',NULL,'兴和县'),('150925',NULL,'凉城县'),('150926',NULL,'察哈尔右翼前旗'),('150927',NULL,'察哈尔右翼中旗'),('150928',NULL,'察哈尔右翼后旗'),('150929',NULL,'四子王旗'),('150981',NULL,'丰镇市'),('152200',NULL,'兴安盟'),('152201',NULL,'乌兰浩特市'),('152202',NULL,'阿尔山市'),('152221',NULL,'科尔沁右翼前旗'),('152222',NULL,'科尔沁右翼中旗'),('152223',NULL,'扎赉特旗'),('152224',NULL,'突泉县'),('152500',NULL,'锡林郭勒盟'),('152501',NULL,'二连浩特市'),('152502',NULL,'锡林浩特市'),('152522',NULL,'阿巴嘎旗'),('152523',NULL,'苏尼特左旗'),('152524',NULL,'苏尼特右旗'),('152525',NULL,'东乌珠穆沁旗'),('152526',NULL,'西乌珠穆沁旗'),('152527',NULL,'太仆寺旗'),('152528',NULL,'镶黄旗'),('152529',NULL,'正镶白旗'),('152530',NULL,'正蓝旗'),('152531',NULL,'多伦县'),('152900',NULL,'阿拉善盟'),('152921',NULL,'阿拉善左旗'),('152922',NULL,'阿拉善右旗'),('152923',NULL,'额济纳旗'),('210000',NULL,'辽宁省'),('210100',NULL,'沈阳市'),('210101',NULL,'市辖区'),('210102',NULL,'和平区'),('210103',NULL,'沈河区'),('210104',NULL,'大东区'),('210105',NULL,'皇姑区'),('210106',NULL,'铁西区'),('210111',NULL,'苏家屯区'),('210112',NULL,'东陵区'),('210113',NULL,'沈北新区*'),('210114',NULL,'于洪区'),('210122',NULL,'辽中县'),('210123',NULL,'康平县'),('210124',NULL,'法库县'),('210181',NULL,'新民市'),('210200',NULL,'大连市'),('210201',NULL,'市辖区'),('210202',NULL,'中山区'),('210203',NULL,'西岗区'),('210204',NULL,'沙河口区'),('210211',NULL,'甘井子区'),('210212',NULL,'旅顺口区'),('210213',NULL,'金州区'),('210224',NULL,'长海县'),('210281',NULL,'瓦房店市'),('210282',NULL,'普兰店市'),('210283',NULL,'庄河市'),('210300',NULL,'鞍山市'),('210301',NULL,'市辖区'),('210302',NULL,'铁东区'),('210303',NULL,'铁西区'),('210304',NULL,'立山区'),('210311',NULL,'千山区'),('210321',NULL,'台安县'),('210323',NULL,'岫岩满族自治县'),('210381',NULL,'海城市'),('210400',NULL,'抚顺市'),('210401',NULL,'市辖区'),('210402',NULL,'新抚区'),('210403',NULL,'东洲区'),('210404',NULL,'望花区'),('210411',NULL,'顺城区'),('210421',NULL,'抚顺县'),('210422',NULL,'新宾满族自治县'),('210423',NULL,'清原满族自治县'),('210500',NULL,'本溪市'),('210501',NULL,'市辖区'),('210502',NULL,'平山区'),('210503',NULL,'溪湖区'),('210504',NULL,'明山区'),('210505',NULL,'南芬区'),('210521',NULL,'本溪满族自治县'),('210522',NULL,'桓仁满族自治县'),('210600',NULL,'丹东市'),('210601',NULL,'市辖区'),('210602',NULL,'元宝区'),('210603',NULL,'振兴区'),('210604',NULL,'振安区'),('210624',NULL,'宽甸满族自治县'),('210681',NULL,'东港市'),('210682',NULL,'凤城市'),('210700',NULL,'锦州市'),('210701',NULL,'市辖区'),('210702',NULL,'古塔区'),('210703',NULL,'凌河区'),('210711',NULL,'太和区'),('210726',NULL,'黑山县'),('210727',NULL,'义县'),('210781',NULL,'凌海市'),('210782',NULL,'北镇市*'),('210800',NULL,'营口市'),('210801',NULL,'市辖区'),('210802',NULL,'站前区'),('210803',NULL,'西市区'),('210804',NULL,'鲅鱼圈区'),('210811',NULL,'老边区'),('210881',NULL,'盖州市'),('210882',NULL,'大石桥市'),('210900',NULL,'阜新市'),('210901',NULL,'市辖区'),('210902',NULL,'海州区'),('210903',NULL,'新邱区'),('210904',NULL,'太平区'),('210905',NULL,'清河门区'),('210911',NULL,'细河区'),('210921',NULL,'阜新蒙古族自治县'),('210922',NULL,'彰武县'),('211000',NULL,'辽阳市'),('211001',NULL,'市辖区'),('211002',NULL,'白塔区'),('211003',NULL,'文圣区'),('211004',NULL,'宏伟区'),('211005',NULL,'弓长岭区'),('211011',NULL,'太子河区'),('211021',NULL,'辽阳县'),('211081',NULL,'灯塔市'),('211100',NULL,'盘锦市'),('211101',NULL,'市辖区'),('211102',NULL,'双台子区'),('211103',NULL,'兴隆台区'),('211121',NULL,'大洼县'),('211122',NULL,'盘山县'),('211200',NULL,'铁岭市'),('211201',NULL,'市辖区'),('211202',NULL,'银州区'),('211204',NULL,'清河区'),('211221',NULL,'铁岭县'),('211223',NULL,'西丰县'),('211224',NULL,'昌图县'),('211281',NULL,'调兵山市'),('211282',NULL,'开原市'),('211300',NULL,'朝阳市'),('211301',NULL,'市辖区'),('211302',NULL,'双塔区'),('211303',NULL,'龙城区'),('211321',NULL,'朝阳县'),('211322',NULL,'建平县'),('211324',NULL,'喀喇沁左翼蒙古族自治县'),('211381',NULL,'北票市'),('211382',NULL,'凌源市'),('211400',NULL,'葫芦岛市'),('211401',NULL,'市辖区'),('211402',NULL,'连山区'),('211403',NULL,'龙港区'),('211404',NULL,'南票区'),('211421',NULL,'绥中县'),('211422',NULL,'建昌县'),('211481',NULL,'兴城市'),('220000',NULL,'吉林省'),('220100',NULL,'长春市'),('220101',NULL,'市辖区'),('220102',NULL,'南关区'),('220103',NULL,'宽城区'),('220104',NULL,'朝阳区'),('220105',NULL,'二道区'),('220106',NULL,'绿园区'),('220112',NULL,'双阳区'),('220122',NULL,'农安县'),('220181',NULL,'九台市'),('220182',NULL,'榆树市'),('220183',NULL,'德惠市'),('220200',NULL,'吉林市'),('220201',NULL,'市辖区'),('220202',NULL,'昌邑区'),('220203',NULL,'龙潭区'),('220204',NULL,'船营区'),('220211',NULL,'丰满区'),('220221',NULL,'永吉县'),('220281',NULL,'蛟河市'),('220282',NULL,'桦甸市'),('220283',NULL,'舒兰市'),('220284',NULL,'磐石市'),('220300',NULL,'四平市'),('220301',NULL,'市辖区'),('220302',NULL,'铁西区'),('220303',NULL,'铁东区'),('220322',NULL,'梨树县'),('220323',NULL,'伊通满族自治县'),('220381',NULL,'公主岭市'),('220382',NULL,'双辽市'),('220400',NULL,'辽源市'),('220401',NULL,'市辖区'),('220402',NULL,'龙山区'),('220403',NULL,'西安区'),('220421',NULL,'东丰县'),('220422',NULL,'东辽县'),('220500',NULL,'通化市'),('220501',NULL,'市辖区'),('220502',NULL,'东昌区'),('220503',NULL,'二道江区'),('220521',NULL,'通化县'),('220523',NULL,'辉南县'),('220524',NULL,'柳河县'),('220581',NULL,'梅河口市'),('220582',NULL,'集安市'),('220600',NULL,'白山市'),('220601',NULL,'市辖区'),('220602',NULL,'八道江区'),('220604',NULL,'江源区'),('220621',NULL,'抚松县'),('220622',NULL,'靖宇县'),('220623',NULL,'长白朝鲜族自治县'),('220681',NULL,'临江市'),('220700',NULL,'松原市'),('220701',NULL,'市辖区'),('220702',NULL,'宁江区'),('220721',NULL,'前郭尔罗斯蒙古族自治县'),('220722',NULL,'长岭县'),('220723',NULL,'乾安县'),('220724',NULL,'扶余县'),('220800',NULL,'白城市'),('220801',NULL,'市辖区'),('220802',NULL,'洮北区'),('220821',NULL,'镇赉县'),('220822',NULL,'通榆县'),('220881',NULL,'洮南市'),('220882',NULL,'大安市'),('222400',NULL,'延边朝鲜族自治州'),('222401',NULL,'延吉市'),('222402',NULL,'图们市'),('222403',NULL,'敦化市'),('222404',NULL,'珲春市'),('222405',NULL,'龙井市'),('222406',NULL,'和龙市'),('222424',NULL,'汪清县'),('222426',NULL,'安图县'),('230000',NULL,'黑龙江省'),('230100',NULL,'哈尔滨市'),('230101',NULL,'市辖区'),('230102',NULL,'道里区'),('230103',NULL,'南岗区'),('230104',NULL,'道外区'),('230108',NULL,'平房区'),('230109',NULL,'松北区'),('230110',NULL,'香坊区'),('230111',NULL,'呼兰区'),('230112',NULL,'阿城区'),('230123',NULL,'依兰县'),('230124',NULL,'方正县'),('230125',NULL,'宾县'),('230126',NULL,'巴彦县'),('230127',NULL,'木兰县'),('230128',NULL,'通河县'),('230129',NULL,'延寿县'),('230182',NULL,'双城市'),('230183',NULL,'尚志市'),('230184',NULL,'五常市'),('230200',NULL,'齐齐哈尔市'),('230201',NULL,'市辖区'),('230202',NULL,'龙沙区'),('230203',NULL,'建华区'),('230204',NULL,'铁锋区'),('230205',NULL,'昂昂溪区'),('230206',NULL,'富拉尔基区'),('230207',NULL,'碾子山区'),('230208',NULL,'梅里斯达斡尔族区'),('230221',NULL,'龙江县'),('230223',NULL,'依安县'),('230224',NULL,'泰来县'),('230225',NULL,'甘南县'),('230227',NULL,'富裕县'),('230229',NULL,'克山县'),('230230',NULL,'克东县'),('230231',NULL,'拜泉县'),('230281',NULL,'讷河市'),('230300',NULL,'鸡西市'),('230301',NULL,'市辖区'),('230302',NULL,'鸡冠区'),('230303',NULL,'恒山区'),('230304',NULL,'滴道区'),('230305',NULL,'梨树区'),('230306',NULL,'城子河区'),('230307',NULL,'麻山区'),('230321',NULL,'鸡东县'),('230381',NULL,'虎林市'),('230382',NULL,'密山市'),('230400',NULL,'鹤岗市'),('230401',NULL,'市辖区'),('230402',NULL,'向阳区'),('230403',NULL,'工农区'),('230404',NULL,'南山区'),('230405',NULL,'兴安区'),('230406',NULL,'东山区'),('230407',NULL,'兴山区'),('230421',NULL,'萝北县'),('230422',NULL,'绥滨县'),('230500',NULL,'双鸭山市'),('230501',NULL,'市辖区'),('230502',NULL,'尖山区'),('230503',NULL,'岭东区'),('230505',NULL,'四方台区'),('230506',NULL,'宝山区'),('230521',NULL,'集贤县'),('230522',NULL,'友谊县'),('230523',NULL,'宝清县'),('230524',NULL,'饶河县'),('230600',NULL,'大庆市'),('230601',NULL,'市辖区'),('230602',NULL,'萨尔图区'),('230603',NULL,'龙凤区'),('230604',NULL,'让胡路区'),('230605',NULL,'红岗区'),('230606',NULL,'大同区'),('230621',NULL,'肇州县'),('230622',NULL,'肇源县'),('230623',NULL,'林甸县'),('230624',NULL,'杜尔伯特蒙古族自治县'),('230700',NULL,'伊春市'),('230701',NULL,'市辖区'),('230702',NULL,'伊春区'),('230703',NULL,'南岔区'),('230704',NULL,'友好区'),('230705',NULL,'西林区'),('230706',NULL,'翠峦区'),('230707',NULL,'新青区'),('230708',NULL,'美溪区'),('230709',NULL,'金山屯区'),('230710',NULL,'五营区'),('230711',NULL,'乌马河区'),('230712',NULL,'汤旺河区'),('230713',NULL,'带岭区'),('230714',NULL,'乌伊岭区'),('230715',NULL,'红星区'),('230716',NULL,'上甘岭区'),('230722',NULL,'嘉荫县'),('230781',NULL,'铁力市'),('230800',NULL,'佳木斯市'),('230801',NULL,'市辖区'),('230803',NULL,'向阳区'),('230804',NULL,'前进区'),('230805',NULL,'东风区'),('230811',NULL,'郊区'),('230822',NULL,'桦南县'),('230826',NULL,'桦川县'),('230828',NULL,'汤原县'),('230833',NULL,'抚远县'),('230881',NULL,'同江市'),('230882',NULL,'富锦市'),('230900',NULL,'七台河市'),('230901',NULL,'市辖区'),('230902',NULL,'新兴区'),('230903',NULL,'桃山区'),('230904',NULL,'茄子河区'),('230921',NULL,'勃利县'),('231000',NULL,'牡丹江市'),('231001',NULL,'市辖区'),('231002',NULL,'东安区'),('231003',NULL,'阳明区'),('231004',NULL,'爱民区'),('231005',NULL,'西安区'),('231024',NULL,'东宁县'),('231025',NULL,'林口县'),('231081',NULL,'绥芬河市'),('231083',NULL,'海林市'),('231084',NULL,'宁安市'),('231085',NULL,'穆棱市'),('231100',NULL,'黑河市'),('231101',NULL,'市辖区'),('231102',NULL,'爱辉区'),('231121',NULL,'嫩江县'),('231123',NULL,'逊克县'),('231124',NULL,'孙吴县'),('231181',NULL,'北安市'),('231182',NULL,'五大连池市'),('231200',NULL,'绥化市'),('231201',NULL,'市辖区'),('231202',NULL,'北林区'),('231221',NULL,'望奎县'),('231222',NULL,'兰西县'),('231223',NULL,'青冈县'),('231224',NULL,'庆安县'),('231225',NULL,'明水县'),('231226',NULL,'绥棱县'),('231281',NULL,'安达市'),('231282',NULL,'肇东市'),('231283',NULL,'海伦市'),('232700',NULL,'大兴安岭地区'),('232701',NULL,'加格达奇区'),('232702',NULL,'松岭区'),('232703',NULL,'新林区'),('232704',NULL,'呼中区'),('232721',NULL,'呼玛县'),('232722',NULL,'塔河县'),('232723',NULL,'漠河县'),('310000',NULL,'上海市'),('310101',NULL,'黄浦区'),('310103',NULL,'卢湾区'),('310104',NULL,'徐汇区'),('310105',NULL,'长宁区'),('310106',NULL,'静安区'),('310107',NULL,'普陀区'),('310108',NULL,'闸北区'),('310109',NULL,'虹口区'),('310110',NULL,'杨浦区'),('310112',NULL,'闵行区'),('310113',NULL,'宝山区'),('310114',NULL,'嘉定区'),('310115',NULL,'浦东新区'),('310116',NULL,'金山区'),('310117',NULL,'松江区'),('310118',NULL,'青浦区'),('310119',NULL,'南汇区'),('310120',NULL,'奉贤区'),('310230',NULL,'崇明县'),('320000',NULL,'江苏省'),('320100',NULL,'南京市'),('320101',NULL,'市辖区'),('320102',NULL,'玄武区'),('320103',NULL,'白下区'),('320104',NULL,'秦淮区'),('320105',NULL,'建邺区'),('320106',NULL,'鼓楼区'),('320107',NULL,'下关区'),('320111',NULL,'浦口区'),('320113',NULL,'栖霞区'),('320114',NULL,'雨花台区'),('320115',NULL,'江宁区'),('320116',NULL,'六合区'),('320124',NULL,'溧水县'),('320125',NULL,'高淳县'),('320200',NULL,'无锡市'),('320201',NULL,'市辖区'),('320202',NULL,'崇安区'),('320203',NULL,'南长区'),('320204',NULL,'北塘区'),('320205',NULL,'锡山区'),('320206',NULL,'惠山区'),('320211',NULL,'滨湖区'),('320281',NULL,'江阴市'),('320282',NULL,'宜兴市'),('320300',NULL,'徐州市'),('320301',NULL,'市辖区'),('320302',NULL,'鼓楼区'),('320303',NULL,'云龙区'),('320304',NULL,'九里区'),('320305',NULL,'贾汪区'),('320311',NULL,'泉山区'),('320321',NULL,'丰县'),('320322',NULL,'沛县'),('320323',NULL,'铜山县'),('320324',NULL,'睢宁县'),('320381',NULL,'新沂市'),('320382',NULL,'邳州市'),('320400',NULL,'常州市'),('320401',NULL,'市辖区'),('320402',NULL,'天宁区'),('320404',NULL,'钟楼区'),('320405',NULL,'戚墅堰区'),('320411',NULL,'新北区'),('320412',NULL,'武进区'),('320481',NULL,'溧阳市'),('320482',NULL,'金坛市'),('320500',NULL,'苏州市'),('320501',NULL,'市辖区'),('320502',NULL,'沧浪区'),('320503',NULL,'平江区'),('320504',NULL,'金阊区'),('320505',NULL,'虎丘区'),('320506',NULL,'吴中区'),('320507',NULL,'相城区'),('320581',NULL,'常熟市'),('320582',NULL,'张家港市'),('320583',NULL,'昆山市'),('320584',NULL,'吴江市'),('320585',NULL,'太仓市'),('320600',NULL,'南通市'),('320601',NULL,'市辖区'),('320602',NULL,'崇川区'),('320611',NULL,'港闸区'),('320621',NULL,'海安县'),('320623',NULL,'如东县'),('320681',NULL,'启东市'),('320682',NULL,'如皋市'),('320683',NULL,'通州市'),('320684',NULL,'海门市'),('320700',NULL,'连云港市'),('320701',NULL,'市辖区'),('320703',NULL,'连云区'),('320705',NULL,'新浦区'),('320706',NULL,'海州区'),('320721',NULL,'赣榆县'),('320722',NULL,'东海县'),('320723',NULL,'灌云县'),('320724',NULL,'灌南县'),('320800',NULL,'淮安市'),('320801',NULL,'市辖区'),('320802',NULL,'清河区'),('320803',NULL,'楚州区'),('320804',NULL,'淮阴区'),('320811',NULL,'清浦区'),('320826',NULL,'涟水县'),('320829',NULL,'洪泽县'),('320830',NULL,'盱眙县'),('320831',NULL,'金湖县'),('320900',NULL,'盐城市'),('320901',NULL,'市辖区'),('320902',NULL,'亭湖区'),('320903',NULL,'盐都区'),('320921',NULL,'响水县'),('320922',NULL,'滨海县'),('320923',NULL,'阜宁县'),('320924',NULL,'射阳县'),('320925',NULL,'建湖县'),('320981',NULL,'东台市'),('320982',NULL,'大丰市'),('321000',NULL,'扬州市'),('321001',NULL,'市辖区'),('321002',NULL,'广陵区'),('321003',NULL,'邗江区'),('321011',NULL,'维扬区'),('321023',NULL,'宝应县'),('321081',NULL,'仪征市'),('321084',NULL,'高邮市'),('321088',NULL,'江都市'),('321100',NULL,'镇江市'),('321101',NULL,'市辖区'),('321102',NULL,'京口区'),('321111',NULL,'润州区'),('321112',NULL,'丹徒区'),('321181',NULL,'丹阳市'),('321182',NULL,'扬中市'),('321183',NULL,'句容市'),('321200',NULL,'泰州市'),('321201',NULL,'市辖区'),('321202',NULL,'海陵区'),('321203',NULL,'高港区'),('321281',NULL,'兴化市'),('321282',NULL,'靖江市'),('321283',NULL,'泰兴市'),('321284',NULL,'姜堰市'),('321300',NULL,'宿迁市'),('321301',NULL,'市辖区'),('321302',NULL,'宿城区'),('321311',NULL,'宿豫区'),('321322',NULL,'沭阳县'),('321323',NULL,'泗阳县'),('321324',NULL,'泗洪县'),('330000',NULL,'浙江省'),('330100',NULL,'杭州市'),('330101',NULL,'市辖区'),('330102',NULL,'上城区'),('330103',NULL,'下城区'),('330104',NULL,'江干区'),('330105',NULL,'拱墅区'),('330106',NULL,'西湖区'),('330108',NULL,'滨江区'),('330109',NULL,'萧山区'),('330110',NULL,'余杭区'),('330122',NULL,'桐庐县'),('330127',NULL,'淳安县'),('330182',NULL,'建德市'),('330183',NULL,'富阳市'),('330185',NULL,'临安市'),('330200',NULL,'宁波市'),('330201',NULL,'市辖区'),('330203',NULL,'海曙区'),('330204',NULL,'江东区'),('330205',NULL,'江北区'),('330206',NULL,'北仑区'),('330211',NULL,'镇海区'),('330212',NULL,'鄞州区'),('330225',NULL,'象山县'),('330226',NULL,'宁海县'),('330281',NULL,'余姚市'),('330282',NULL,'慈溪市'),('330283',NULL,'奉化市'),('330300',NULL,'温州市'),('330301',NULL,'市辖区'),('330302',NULL,'鹿城区'),('330303',NULL,'龙湾区'),('330304',NULL,'瓯海区'),('330322',NULL,'洞头县'),('330324',NULL,'永嘉县'),('330326',NULL,'平阳县'),('330327',NULL,'苍南县'),('330328',NULL,'文成县'),('330329',NULL,'泰顺县'),('330381',NULL,'瑞安市'),('330382',NULL,'乐清市'),('330400',NULL,'嘉兴市'),('330401',NULL,'市辖区'),('330402',NULL,'秀城区'),('330411',NULL,'秀洲区'),('330421',NULL,'嘉善县'),('330424',NULL,'海盐县'),('330481',NULL,'海宁市'),('330482',NULL,'平湖市'),('330483',NULL,'桐乡市'),('330500',NULL,'湖州市'),('330501',NULL,'市辖区'),('330502',NULL,'吴兴区'),('330503',NULL,'南浔区'),('330521',NULL,'德清县'),('330522',NULL,'长兴县'),('330523',NULL,'安吉县'),('330600',NULL,'绍兴市'),('330601',NULL,'市辖区'),('330602',NULL,'越城区'),('330621',NULL,'绍兴县'),('330624',NULL,'新昌县'),('330681',NULL,'诸暨市'),('330682',NULL,'上虞市'),('330683',NULL,'嵊州市'),('330700',NULL,'金华市'),('330701',NULL,'市辖区'),('330702',NULL,'婺城区'),('330703',NULL,'金东区'),('330723',NULL,'武义县'),('330726',NULL,'浦江县'),('330727',NULL,'磐安县'),('330781',NULL,'兰溪市'),('330782',NULL,'义乌市'),('330783',NULL,'东阳市'),('330784',NULL,'永康市'),('330800',NULL,'衢州市'),('330801',NULL,'市辖区'),('330802',NULL,'柯城区'),('330803',NULL,'衢江区'),('330822',NULL,'常山县'),('330824',NULL,'开化县'),('330825',NULL,'龙游县'),('330881',NULL,'江山市'),('330900',NULL,'舟山市'),('330901',NULL,'市辖区'),('330902',NULL,'定海区'),('330903',NULL,'普陀区'),('330921',NULL,'岱山县'),('330922',NULL,'嵊泗县'),('331000',NULL,'台州市'),('331001',NULL,'市辖区'),('331002',NULL,'椒江区'),('331003',NULL,'黄岩区'),('331004',NULL,'路桥区'),('331021',NULL,'玉环县'),('331022',NULL,'三门县'),('331023',NULL,'天台县'),('331024',NULL,'仙居县'),('331081',NULL,'温岭市'),('331082',NULL,'临海市'),('331100',NULL,'丽水市'),('331101',NULL,'市辖区'),('331102',NULL,'莲都区'),('331121',NULL,'青田县'),('331122',NULL,'缙云县'),('331123',NULL,'遂昌县'),('331124',NULL,'松阳县'),('331125',NULL,'云和县'),('331126',NULL,'庆元县'),('331127',NULL,'景宁畲族自治县'),('331181',NULL,'龙泉市'),('340000',NULL,'安徽省'),('340100',NULL,'合肥市'),('340101',NULL,'市辖区'),('340102',NULL,'瑶海区'),('340103',NULL,'庐阳区'),('340104',NULL,'蜀山区'),('340111',NULL,'包河区'),('340121',NULL,'长丰县'),('340122',NULL,'肥东县'),('340123',NULL,'肥西县'),('340200',NULL,'芜湖市'),('340201',NULL,'市辖区'),('340202',NULL,'镜湖区'),('340203',NULL,'弋江区'),('340207',NULL,'鸠江区'),('340208',NULL,'三山区'),('340221',NULL,'芜湖县'),('340222',NULL,'繁昌县'),('340223',NULL,'南陵县'),('340300',NULL,'蚌埠市'),('340301',NULL,'市辖区'),('340302',NULL,'龙子湖区'),('340303',NULL,'蚌山区'),('340304',NULL,'禹会区'),('340311',NULL,'淮上区'),('340321',NULL,'怀远县'),('340322',NULL,'五河县'),('340323',NULL,'固镇县'),('340400',NULL,'淮南市'),('340401',NULL,'市辖区'),('340402',NULL,'大通区'),('340403',NULL,'田家庵区'),('340404',NULL,'谢家集区'),('340405',NULL,'八公山区'),('340406',NULL,'潘集区'),('340421',NULL,'凤台县'),('340500',NULL,'马鞍山市'),('340501',NULL,'市辖区'),('340502',NULL,'金家庄区'),('340503',NULL,'花山区'),('340504',NULL,'雨山区'),('340521',NULL,'当涂县'),('340600',NULL,'淮北市'),('340601',NULL,'市辖区'),('340602',NULL,'杜集区'),('340603',NULL,'相山区'),('340604',NULL,'烈山区'),('340621',NULL,'濉溪县'),('340700',NULL,'铜陵市'),('340701',NULL,'市辖区'),('340702',NULL,'铜官山区'),('340703',NULL,'狮子山区'),('340711',NULL,'郊区'),('340721',NULL,'铜陵县'),('340800',NULL,'安庆市'),('340801',NULL,'市辖区'),('340802',NULL,'迎江区'),('340803',NULL,'大观区'),('340811',NULL,'宜秀区'),('340822',NULL,'怀宁县'),('340823',NULL,'枞阳县'),('340824',NULL,'潜山县'),('340825',NULL,'太湖县'),('340826',NULL,'宿松县'),('340827',NULL,'望江县'),('340828',NULL,'岳西县'),('340881',NULL,'桐城市'),('341000',NULL,'黄山市'),('341001',NULL,'市辖区'),('341002',NULL,'屯溪区'),('341003',NULL,'黄山区'),('341004',NULL,'徽州区'),('341021',NULL,'歙县'),('341022',NULL,'休宁县'),('341023',NULL,'黟县'),('341024',NULL,'祁门县'),('341100',NULL,'滁州市'),('341101',NULL,'市辖区'),('341102',NULL,'琅琊区'),('341103',NULL,'南谯区'),('341122',NULL,'来安县'),('341124',NULL,'全椒县'),('341125',NULL,'定远县'),('341126',NULL,'凤阳县'),('341181',NULL,'天长市'),('341182',NULL,'明光市'),('341200',NULL,'阜阳市'),('341201',NULL,'市辖区'),('341202',NULL,'颍州区'),('341203',NULL,'颍东区'),('341204',NULL,'颍泉区'),('341221',NULL,'临泉县'),('341222',NULL,'太和县'),('341225',NULL,'阜南县'),('341226',NULL,'颍上县'),('341282',NULL,'界首市'),('341300',NULL,'宿州市'),('341301',NULL,'市辖区'),('341302',NULL,'埇桥区'),('341321',NULL,'砀山县'),('341322',NULL,'萧县'),('341323',NULL,'灵璧县'),('341324',NULL,'泗县'),('341400',NULL,'巢湖市'),('341401',NULL,'市辖区'),('341402',NULL,'居巢区'),('341421',NULL,'庐江县'),('341422',NULL,'无为县'),('341423',NULL,'含山县'),('341424',NULL,'和县'),('341500',NULL,'六安市'),('341501',NULL,'市辖区'),('341502',NULL,'金安区'),('341503',NULL,'裕安区'),('341521',NULL,'寿县'),('341522',NULL,'霍邱县'),('341523',NULL,'舒城县'),('341524',NULL,'金寨县'),('341525',NULL,'霍山县'),('341600',NULL,'亳州市'),('341601',NULL,'市辖区'),('341602',NULL,'谯城区'),('341621',NULL,'涡阳县'),('341622',NULL,'蒙城县'),('341623',NULL,'利辛县'),('341700',NULL,'池州市'),('341701',NULL,'市辖区'),('341702',NULL,'贵池区'),('341721',NULL,'东至县'),('341722',NULL,'石台县'),('341723',NULL,'青阳县'),('341800',NULL,'宣城市'),('341801',NULL,'市辖区'),('341802',NULL,'宣州区'),('341821',NULL,'郎溪县'),('341822',NULL,'广德县'),('341823',NULL,'泾县'),('341824',NULL,'绩溪县'),('341825',NULL,'旌德县'),('341881',NULL,'宁国市'),('350000',NULL,'福建省'),('350100',NULL,'福州市'),('350101',NULL,'市辖区'),('350102',NULL,'鼓楼区'),('350103',NULL,'台江区'),('350104',NULL,'仓山区'),('350105',NULL,'马尾区'),('350111',NULL,'晋安区'),('350121',NULL,'闽侯县'),('350122',NULL,'连江县'),('350123',NULL,'罗源县'),('350124',NULL,'闽清县'),('350125',NULL,'永泰县'),('350128',NULL,'平潭县'),('350181',NULL,'福清市'),('350182',NULL,'长乐市'),('350200',NULL,'厦门市'),('350201',NULL,'市辖区'),('350203',NULL,'思明区'),('350205',NULL,'海沧区'),('350206',NULL,'湖里区'),('350211',NULL,'集美区'),('350212',NULL,'同安区'),('350213',NULL,'翔安区'),('350300',NULL,'莆田市'),('350301',NULL,'市辖区'),('350302',NULL,'城厢区'),('350303',NULL,'涵江区'),('350304',NULL,'荔城区'),('350305',NULL,'秀屿区'),('350322',NULL,'仙游县'),('350400',NULL,'三明市'),('350401',NULL,'市辖区'),('350402',NULL,'梅列区'),('350403',NULL,'三元区'),('350421',NULL,'明溪县'),('350423',NULL,'清流县'),('350424',NULL,'宁化县'),('350425',NULL,'大田县'),('350426',NULL,'尤溪县'),('350427',NULL,'沙县'),('350428',NULL,'将乐县'),('350429',NULL,'泰宁县'),('350430',NULL,'建宁县'),('350481',NULL,'永安市'),('350500',NULL,'泉州市'),('350501',NULL,'市辖区'),('350502',NULL,'鲤城区'),('350503',NULL,'丰泽区'),('350504',NULL,'洛江区'),('350505',NULL,'泉港区'),('350521',NULL,'惠安县'),('350524',NULL,'安溪县'),('350525',NULL,'永春县'),('350526',NULL,'德化县'),('350527',NULL,'金门县'),('350581',NULL,'石狮市'),('350582',NULL,'晋江市'),('350583',NULL,'南安市'),('350600',NULL,'漳州市'),('350601',NULL,'市辖区'),('350602',NULL,'芗城区'),('350603',NULL,'龙文区'),('350622',NULL,'云霄县'),('350623',NULL,'漳浦县'),('350624',NULL,'诏安县'),('350625',NULL,'长泰县'),('350626',NULL,'东山县'),('350627',NULL,'南靖县'),('350628',NULL,'平和县'),('350629',NULL,'华安县'),('350681',NULL,'龙海市'),('350700',NULL,'南平市'),('350701',NULL,'市辖区'),('350702',NULL,'延平区'),('350721',NULL,'顺昌县'),('350722',NULL,'浦城县'),('350723',NULL,'光泽县'),('350724',NULL,'松溪县'),('350725',NULL,'政和县'),('350781',NULL,'邵武市'),('350782',NULL,'武夷山市'),('350783',NULL,'建瓯市'),('350784',NULL,'建阳市'),('350800',NULL,'龙岩市'),('350801',NULL,'市辖区'),('350802',NULL,'新罗区'),('350821',NULL,'长汀县'),('350822',NULL,'永定县'),('350823',NULL,'上杭县'),('350824',NULL,'武平县'),('350825',NULL,'连城县'),('350881',NULL,'漳平市'),('350900',NULL,'宁德市'),('350901',NULL,'市辖区'),('350902',NULL,'蕉城区'),('350921',NULL,'霞浦县'),('350922',NULL,'古田县'),('350923',NULL,'屏南县'),('350924',NULL,'寿宁县'),('350925',NULL,'周宁县'),('350926',NULL,'柘荣县'),('350981',NULL,'福安市'),('350982',NULL,'福鼎市'),('360000',NULL,'江西省'),('360100',NULL,'南昌市'),('360101',NULL,'市辖区'),('360102',NULL,'东湖区'),('360103',NULL,'西湖区'),('360104',NULL,'青云谱区'),('360105',NULL,'湾里区'),('360111',NULL,'青山湖区'),('360121',NULL,'南昌县'),('360122',NULL,'新建县'),('360123',NULL,'安义县'),('360124',NULL,'进贤县'),('360200',NULL,'景德镇市'),('360201',NULL,'市辖区'),('360202',NULL,'昌江区'),('360203',NULL,'珠山区'),('360222',NULL,'浮梁县'),('360281',NULL,'乐平市'),('360300',NULL,'萍乡市'),('360301',NULL,'市辖区'),('360302',NULL,'安源区'),('360313',NULL,'湘东区'),('360321',NULL,'莲花县'),('360322',NULL,'上栗县'),('360323',NULL,'芦溪县'),('360400',NULL,'九江市'),('360401',NULL,'市辖区'),('360402',NULL,'庐山区'),('360403',NULL,'浔阳区'),('360421',NULL,'九江县'),('360423',NULL,'武宁县'),('360424',NULL,'修水县'),('360425',NULL,'永修县'),('360426',NULL,'德安县'),('360427',NULL,'星子县'),('360428',NULL,'都昌县'),('360429',NULL,'湖口县'),('360430',NULL,'彭泽县'),('360481',NULL,'瑞昌市'),('360500',NULL,'新余市'),('360501',NULL,'市辖区'),('360502',NULL,'渝水区'),('360521',NULL,'分宜县'),('360600',NULL,'鹰潭市'),('360601',NULL,'市辖区'),('360602',NULL,'月湖区'),('360622',NULL,'余江县'),('360681',NULL,'贵溪市'),('360700',NULL,'赣州市'),('360701',NULL,'市辖区'),('360702',NULL,'章贡区'),('360721',NULL,'赣县'),('360722',NULL,'信丰县'),('360723',NULL,'大余县'),('360724',NULL,'上犹县'),('360725',NULL,'崇义县'),('360726',NULL,'安远县'),('360727',NULL,'龙南县'),('360728',NULL,'定南县'),('360729',NULL,'全南县'),('360730',NULL,'宁都县'),('360731',NULL,'于都县'),('360732',NULL,'兴国县'),('360733',NULL,'会昌县'),('360734',NULL,'寻乌县'),('360735',NULL,'石城县'),('360781',NULL,'瑞金市'),('360782',NULL,'南康市'),('360800',NULL,'吉安市'),('360801',NULL,'市辖区'),('360802',NULL,'吉州区'),('360803',NULL,'青原区'),('360821',NULL,'吉安县'),('360822',NULL,'吉水县'),('360823',NULL,'峡江县'),('360824',NULL,'新干县'),('360825',NULL,'永丰县'),('360826',NULL,'泰和县'),('360827',NULL,'遂川县'),('360828',NULL,'万安县'),('360829',NULL,'安福县'),('360830',NULL,'永新县'),('360881',NULL,'井冈山市'),('360900',NULL,'宜春市'),('360901',NULL,'市辖区'),('360902',NULL,'袁州区'),('360921',NULL,'奉新县'),('360922',NULL,'万载县'),('360923',NULL,'上高县'),('360924',NULL,'宜丰县'),('360925',NULL,'靖安县'),('360926',NULL,'铜鼓县'),('360981',NULL,'丰城市'),('360982',NULL,'樟树市'),('360983',NULL,'高安市'),('361000',NULL,'抚州市'),('361001',NULL,'市辖区'),('361002',NULL,'临川区'),('361021',NULL,'南城县'),('361022',NULL,'黎川县'),('361023',NULL,'南丰县'),('361024',NULL,'崇仁县'),('361025',NULL,'乐安县'),('361026',NULL,'宜黄县'),('361027',NULL,'金溪县'),('361028',NULL,'资溪县'),('361029',NULL,'东乡县'),('361030',NULL,'广昌县'),('361100',NULL,'上饶市'),('361101',NULL,'市辖区'),('361102',NULL,'信州区'),('361121',NULL,'上饶县'),('361122',NULL,'广丰县'),('361123',NULL,'玉山县'),('361124',NULL,'铅山县'),('361125',NULL,'横峰县'),('361126',NULL,'弋阳县'),('361127',NULL,'余干县'),('361128',NULL,'鄱阳县'),('361129',NULL,'万年县'),('361130',NULL,'婺源县'),('361181',NULL,'德兴市'),('370000',NULL,'山东省'),('370100',NULL,'济南市'),('370101',NULL,'市辖区'),('370102',NULL,'历下区'),('370103',NULL,'市中区'),('370104',NULL,'槐荫区'),('370105',NULL,'天桥区'),('370112',NULL,'历城区'),('370113',NULL,'长清区'),('370124',NULL,'平阴县'),('370125',NULL,'济阳县'),('370126',NULL,'商河县'),('370181',NULL,'章丘市'),('370200',NULL,'青岛市'),('370201',NULL,'市辖区'),('370202',NULL,'市南区'),('370203',NULL,'市北区'),('370205',NULL,'四方区'),('370211',NULL,'黄岛区'),('370212',NULL,'崂山区'),('370213',NULL,'李沧区'),('370214',NULL,'城阳区'),('370281',NULL,'胶州市'),('370282',NULL,'即墨市'),('370283',NULL,'平度市'),('370284',NULL,'胶南市'),('370285',NULL,'莱西市'),('370300',NULL,'淄博市'),('370301',NULL,'市辖区'),('370302',NULL,'淄川区'),('370303',NULL,'张店区'),('370304',NULL,'博山区'),('370305',NULL,'临淄区'),('370306',NULL,'周村区'),('370321',NULL,'桓台县'),('370322',NULL,'高青县'),('370323',NULL,'沂源县'),('370400',NULL,'枣庄市'),('370401',NULL,'市辖区'),('370402',NULL,'市中区'),('370403',NULL,'薛城区'),('370404',NULL,'峄城区'),('370405',NULL,'台儿庄区'),('370406',NULL,'山亭区'),('370481',NULL,'滕州市'),('370500',NULL,'东营市'),('370501',NULL,'市辖区'),('370502',NULL,'东营区'),('370503',NULL,'河口区'),('370521',NULL,'垦利县'),('370522',NULL,'利津县'),('370523',NULL,'广饶县'),('370600',NULL,'烟台市'),('370601',NULL,'市辖区'),('370602',NULL,'芝罘区'),('370611',NULL,'福山区'),('370612',NULL,'牟平区'),('370613',NULL,'莱山区'),('370634',NULL,'长岛县'),('370681',NULL,'龙口市'),('370682',NULL,'莱阳市'),('370683',NULL,'莱州市'),('370684',NULL,'蓬莱市'),('370685',NULL,'招远市'),('370686',NULL,'栖霞市'),('370687',NULL,'海阳市'),('370700',NULL,'潍坊市'),('370701',NULL,'市辖区'),('370702',NULL,'潍城区'),('370703',NULL,'寒亭区'),('370704',NULL,'坊子区'),('370705',NULL,'奎文区'),('370724',NULL,'临朐县'),('370725',NULL,'昌乐县'),('370781',NULL,'青州市'),('370782',NULL,'诸城市'),('370783',NULL,'寿光市'),('370784',NULL,'安丘市'),('370785',NULL,'高密市'),('370786',NULL,'昌邑市'),('370800',NULL,'济宁市'),('370801',NULL,'市辖区'),('370802',NULL,'市中区'),('370811',NULL,'任城区'),('370826',NULL,'微山县'),('370827',NULL,'鱼台县'),('370828',NULL,'金乡县'),('370829',NULL,'嘉祥县'),('370830',NULL,'汶上县'),('370831',NULL,'泗水县'),('370832',NULL,'梁山县'),('370881',NULL,'曲阜市'),('370882',NULL,'兖州市'),('370883',NULL,'邹城市'),('370900',NULL,'泰安市'),('370901',NULL,'市辖区'),('370902',NULL,'泰山区'),('370903',NULL,'岱岳区'),('370921',NULL,'宁阳县'),('370923',NULL,'东平县'),('370982',NULL,'新泰市'),('370983',NULL,'肥城市'),('371000',NULL,'威海市'),('371001',NULL,'市辖区'),('371002',NULL,'环翠区'),('371081',NULL,'文登市'),('371082',NULL,'荣成市'),('371083',NULL,'乳山市'),('371100',NULL,'日照市'),('371101',NULL,'市辖区'),('371102',NULL,'东港区'),('371103',NULL,'岚山区'),('371121',NULL,'五莲县'),('371122',NULL,'莒县'),('371200',NULL,'莱芜市'),('371201',NULL,'市辖区'),('371202',NULL,'莱城区'),('371203',NULL,'钢城区'),('371300',NULL,'临沂市'),('371301',NULL,'市辖区'),('371302',NULL,'兰山区'),('371311',NULL,'罗庄区'),('371312',NULL,'河东区'),('371321',NULL,'沂南县'),('371322',NULL,'郯城县'),('371323',NULL,'沂水县'),('371324',NULL,'苍山县'),('371325',NULL,'费县'),('371326',NULL,'平邑县'),('371327',NULL,'莒南县'),('371328',NULL,'蒙阴县'),('371329',NULL,'临沭县'),('371400',NULL,'德州市'),('371401',NULL,'市辖区'),('371402',NULL,'德城区'),('371421',NULL,'陵县'),('371422',NULL,'宁津县'),('371423',NULL,'庆云县'),('371424',NULL,'临邑县'),('371425',NULL,'齐河县'),('371426',NULL,'平原县'),('371427',NULL,'夏津县'),('371428',NULL,'武城县'),('371481',NULL,'乐陵市'),('371482',NULL,'禹城市'),('371500',NULL,'聊城市'),('371501',NULL,'市辖区'),('371502',NULL,'东昌府区'),('371521',NULL,'阳谷县'),('371522',NULL,'莘县'),('371523',NULL,'茌平县'),('371524',NULL,'东阿县'),('371525',NULL,'冠县'),('371526',NULL,'高唐县'),('371581',NULL,'临清市'),('371600',NULL,'滨州市'),('371601',NULL,'市辖区'),('371602',NULL,'滨城区'),('371621',NULL,'惠民县'),('371622',NULL,'阳信县'),('371623',NULL,'无棣县'),('371624',NULL,'沾化县'),('371625',NULL,'博兴县'),('371626',NULL,'邹平县'),('371700',NULL,'菏泽市'),('371701',NULL,'市辖区'),('371702',NULL,'牡丹区'),('371721',NULL,'曹县'),('371722',NULL,'单县'),('371723',NULL,'成武县'),('371724',NULL,'巨野县'),('371725',NULL,'郓城县'),('371726',NULL,'鄄城县'),('371727',NULL,'定陶县'),('371728',NULL,'东明县'),('410000',NULL,'河南省'),('410100',NULL,'郑州市'),('410101',NULL,'市辖区'),('410102',NULL,'中原区'),('410103',NULL,'二七区'),('410104',NULL,'管城回族区'),('410105',NULL,'金水区'),('410106',NULL,'上街区'),('410108',NULL,'惠济区'),('410122',NULL,'中牟县'),('410181',NULL,'巩义市'),('410182',NULL,'荥阳市'),('410183',NULL,'新密市'),('410184',NULL,'新郑市'),('410185',NULL,'登封市'),('410200',NULL,'开封市'),('410201',NULL,'市辖区'),('410202',NULL,'龙亭区'),('410203',NULL,'顺河回族区'),('410204',NULL,'鼓楼区'),('410205',NULL,'禹王台区'),('410211',NULL,'金明区'),('410221',NULL,'杞县'),('410222',NULL,'通许县'),('410223',NULL,'尉氏县'),('410224',NULL,'开封县'),('410225',NULL,'兰考县'),('410300',NULL,'洛阳市'),('410301',NULL,'市辖区'),('410302',NULL,'老城区'),('410303',NULL,'西工区'),('410304',NULL,'廛河回族区'),('410305',NULL,'涧西区'),('410306',NULL,'吉利区'),('410307',NULL,'洛龙区'),('410322',NULL,'孟津县'),('410323',NULL,'新安县'),('410324',NULL,'栾川县'),('410325',NULL,'嵩县'),('410326',NULL,'汝阳县'),('410327',NULL,'宜阳县'),('410328',NULL,'洛宁县'),('410329',NULL,'伊川县'),('410381',NULL,'偃师市'),('410400',NULL,'平顶山市'),('410401',NULL,'市辖区'),('410402',NULL,'新华区'),('410403',NULL,'卫东区'),('410404',NULL,'石龙区'),('410411',NULL,'湛河区'),('410421',NULL,'宝丰县'),('410422',NULL,'叶县'),('410423',NULL,'鲁山县'),('410425',NULL,'郏县'),('410481',NULL,'舞钢市'),('410482',NULL,'汝州市'),('410500',NULL,'安阳市'),('410501',NULL,'市辖区'),('410502',NULL,'文峰区'),('410503',NULL,'北关区'),('410505',NULL,'殷都区'),('410506',NULL,'龙安区'),('410522',NULL,'安阳县'),('410523',NULL,'汤阴县'),('410526',NULL,'滑县'),('410527',NULL,'内黄县'),('410581',NULL,'林州市'),('410600',NULL,'鹤壁市'),('410601',NULL,'市辖区'),('410602',NULL,'鹤山区'),('410603',NULL,'山城区'),('410611',NULL,'淇滨区'),('410621',NULL,'浚县'),('410622',NULL,'淇县'),('410700',NULL,'新乡市'),('410701',NULL,'市辖区'),('410702',NULL,'红旗区'),('410703',NULL,'卫滨区'),('410704',NULL,'凤泉区'),('410711',NULL,'牧野区'),('410721',NULL,'新乡县'),('410724',NULL,'获嘉县'),('410725',NULL,'原阳县'),('410726',NULL,'延津县'),('410727',NULL,'封丘县'),('410728',NULL,'长垣县'),('410781',NULL,'卫辉市'),('410782',NULL,'辉县市'),('410800',NULL,'焦作市'),('410801',NULL,'市辖区'),('410802',NULL,'解放区'),('410803',NULL,'中站区'),('410804',NULL,'马村区'),('410811',NULL,'山阳区'),('410821',NULL,'修武县'),('410822',NULL,'博爱县'),('410823',NULL,'武陟县'),('410825',NULL,'温县'),('410881',NULL,'济源市'),('410882',NULL,'沁阳市'),('410883',NULL,'孟州市'),('410900',NULL,'濮阳市'),('410901',NULL,'市辖区'),('410902',NULL,'华龙区'),('410922',NULL,'清丰县'),('410923',NULL,'南乐县'),('410926',NULL,'范县'),('410927',NULL,'台前县'),('410928',NULL,'濮阳县'),('411000',NULL,'许昌市'),('411001',NULL,'市辖区'),('411002',NULL,'魏都区'),('411023',NULL,'许昌县'),('411024',NULL,'鄢陵县'),('411025',NULL,'襄城县'),('411081',NULL,'禹州市'),('411082',NULL,'长葛市'),('411100',NULL,'漯河市'),('411101',NULL,'市辖区'),('411102',NULL,'源汇区'),('411103',NULL,'郾城区'),('411104',NULL,'召陵区'),('411121',NULL,'舞阳县'),('411122',NULL,'临颍县'),('411200',NULL,'三门峡市'),('411201',NULL,'市辖区'),('411202',NULL,'湖滨区'),('411221',NULL,'渑池县'),('411222',NULL,'陕县'),('411224',NULL,'卢氏县'),('411281',NULL,'义马市'),('411282',NULL,'灵宝市'),('411300',NULL,'南阳市'),('411301',NULL,'市辖区'),('411302',NULL,'宛城区'),('411303',NULL,'卧龙区'),('411321',NULL,'南召县'),('411322',NULL,'方城县'),('411323',NULL,'西峡县'),('411324',NULL,'镇平县'),('411325',NULL,'内乡县'),('411326',NULL,'淅川县'),('411327',NULL,'社旗县'),('411328',NULL,'唐河县'),('411329',NULL,'新野县'),('411330',NULL,'桐柏县'),('411381',NULL,'邓州市'),('411400',NULL,'商丘市'),('411401',NULL,'市辖区'),('411402',NULL,'梁园区'),('411403',NULL,'睢阳区'),('411421',NULL,'民权县'),('411422',NULL,'睢县'),('411423',NULL,'宁陵县'),('411424',NULL,'柘城县'),('411425',NULL,'虞城县'),('411426',NULL,'夏邑县'),('411481',NULL,'永城市'),('411500',NULL,'信阳市'),('411501',NULL,'市辖区'),('411502',NULL,'浉河区'),('411503',NULL,'平桥区'),('411521',NULL,'罗山县'),('411522',NULL,'光山县'),('411523',NULL,'新县'),('411524',NULL,'商城县'),('411525',NULL,'固始县'),('411526',NULL,'潢川县'),('411527',NULL,'淮滨县'),('411528',NULL,'息县'),('411600',NULL,'周口市'),('411601',NULL,'市辖区'),('411602',NULL,'川汇区'),('411621',NULL,'扶沟县'),('411622',NULL,'西华县'),('411623',NULL,'商水县'),('411624',NULL,'沈丘县'),('411625',NULL,'郸城县'),('411626',NULL,'淮阳县'),('411627',NULL,'太康县'),('411628',NULL,'鹿邑县'),('411681',NULL,'项城市'),('411700',NULL,'驻马店市'),('411701',NULL,'市辖区'),('411702',NULL,'驿城区'),('411721',NULL,'西平县'),('411722',NULL,'上蔡县'),('411723',NULL,'平舆县'),('411724',NULL,'正阳县'),('411725',NULL,'确山县'),('411726',NULL,'泌阳县'),('411727',NULL,'汝南县'),('411728',NULL,'遂平县'),('411729',NULL,'新蔡县'),('420000',NULL,'湖北省'),('420100',NULL,'武汉市'),('420101',NULL,'市辖区'),('420102',NULL,'江岸区'),('420103',NULL,'江汉区'),('420104',NULL,'硚口区'),('420105',NULL,'汉阳区'),('420106',NULL,'武昌区'),('420107',NULL,'青山区'),('420111',NULL,'洪山区'),('420112',NULL,'东西湖区'),('420113',NULL,'汉南区'),('420114',NULL,'蔡甸区'),('420115',NULL,'江夏区'),('420116',NULL,'黄陂区'),('420117',NULL,'新洲区'),('420200',NULL,'黄石市'),('420201',NULL,'市辖区'),('420202',NULL,'黄石港区'),('420203',NULL,'西塞山区'),('420204',NULL,'下陆区'),('420205',NULL,'铁山区'),('420222',NULL,'阳新县'),('420281',NULL,'大冶市'),('420300',NULL,'十堰市'),('420301',NULL,'市辖区'),('420302',NULL,'茅箭区'),('420303',NULL,'张湾区'),('420321',NULL,'郧县'),('420322',NULL,'郧西县'),('420323',NULL,'竹山县'),('420324',NULL,'竹溪县'),('420325',NULL,'房县'),('420381',NULL,'丹江口市'),('420500',NULL,'宜昌市'),('420501',NULL,'市辖区'),('420502',NULL,'西陵区'),('420503',NULL,'伍家岗区'),('420504',NULL,'点军区'),('420505',NULL,'猇亭区'),('420506',NULL,'夷陵区'),('420525',NULL,'远安县'),('420526',NULL,'兴山县'),('420527',NULL,'秭归县'),('420528',NULL,'长阳土家族自治县'),('420529',NULL,'五峰土家族自治县'),('420581',NULL,'宜都市'),('420582',NULL,'当阳市'),('420583',NULL,'枝江市'),('420600',NULL,'襄樊市'),('420601',NULL,'市辖区'),('420602',NULL,'襄城区'),('420606',NULL,'樊城区'),('420607',NULL,'襄阳区'),('420624',NULL,'南漳县'),('420625',NULL,'谷城县'),('420626',NULL,'保康县'),('420682',NULL,'老河口市'),('420683',NULL,'枣阳市'),('420684',NULL,'宜城市'),('420700',NULL,'鄂州市'),('420701',NULL,'市辖区'),('420702',NULL,'梁子湖区'),('420703',NULL,'华容区'),('420704',NULL,'鄂城区'),('420800',NULL,'荆门市'),('420801',NULL,'市辖区'),('420802',NULL,'东宝区'),('420804',NULL,'掇刀区'),('420821',NULL,'京山县'),('420822',NULL,'沙洋县'),('420881',NULL,'钟祥市'),('420900',NULL,'孝感市'),('420901',NULL,'市辖区'),('420902',NULL,'孝南区'),('420921',NULL,'孝昌县'),('420922',NULL,'大悟县'),('420923',NULL,'云梦县'),('420981',NULL,'应城市'),('420982',NULL,'安陆市'),('420984',NULL,'汉川市'),('421000',NULL,'荆州市'),('421001',NULL,'市辖区'),('421002',NULL,'沙市区'),('421003',NULL,'荆州区'),('421022',NULL,'公安县'),('421023',NULL,'监利县'),('421024',NULL,'江陵县'),('421081',NULL,'石首市'),('421083',NULL,'洪湖市'),('421087',NULL,'松滋市'),('421100',NULL,'黄冈市'),('421101',NULL,'市辖区'),('421102',NULL,'黄州区'),('421121',NULL,'团风县'),('421122',NULL,'红安县'),('421123',NULL,'罗田县'),('421124',NULL,'英山县'),('421125',NULL,'浠水县'),('421126',NULL,'蕲春县'),('421127',NULL,'黄梅县'),('421181',NULL,'麻城市'),('421182',NULL,'武穴市'),('421200',NULL,'咸宁市'),('421201',NULL,'市辖区'),('421202',NULL,'咸安区'),('421221',NULL,'嘉鱼县'),('421222',NULL,'通城县'),('421223',NULL,'崇阳县'),('421224',NULL,'通山县'),('421281',NULL,'赤壁市'),('421300',NULL,'随州市'),('421301',NULL,'市辖区'),('421302',NULL,'曾都区'),('421381',NULL,'广水市'),('422800',NULL,'恩施土家族苗族自治州'),('422801',NULL,'恩施市'),('422802',NULL,'利川市'),('422822',NULL,'建始县'),('422823',NULL,'巴东县'),('422825',NULL,'宣恩县'),('422826',NULL,'咸丰县'),('422827',NULL,'来凤县'),('422828',NULL,'鹤峰县'),('429000',NULL,'省直辖行政单位'),('429004',NULL,'仙桃市'),('429005',NULL,'潜江市'),('429006',NULL,'天门市'),('429021',NULL,'神农架林区'),('430000',NULL,'湖南省'),('430100',NULL,'长沙市'),('430101',NULL,'市辖区'),('430102',NULL,'芙蓉区'),('430103',NULL,'天心区'),('430104',NULL,'岳麓区'),('430105',NULL,'开福区'),('430111',NULL,'雨花区'),('430121',NULL,'长沙县'),('430122',NULL,'望城县'),('430124',NULL,'宁乡县'),('430181',NULL,'浏阳市'),('430200',NULL,'株洲市'),('430201',NULL,'市辖区'),('430202',NULL,'荷塘区'),('430203',NULL,'芦淞区'),('430204',NULL,'石峰区'),('430211',NULL,'天元区'),('430221',NULL,'株洲县'),('430223',NULL,'攸县'),('430224',NULL,'茶陵县'),('430225',NULL,'炎陵县'),('430281',NULL,'醴陵市'),('430300',NULL,'湘潭市'),('430301',NULL,'市辖区'),('430302',NULL,'雨湖区'),('430304',NULL,'岳塘区'),('430321',NULL,'湘潭县'),('430381',NULL,'湘乡市'),('430382',NULL,'韶山市'),('430400',NULL,'衡阳市'),('430401',NULL,'市辖区'),('430405',NULL,'珠晖区'),('430406',NULL,'雁峰区'),('430407',NULL,'石鼓区'),('430408',NULL,'蒸湘区'),('430412',NULL,'南岳区'),('430421',NULL,'衡阳县'),('430422',NULL,'衡南县'),('430423',NULL,'衡山县'),('430424',NULL,'衡东县'),('430426',NULL,'祁东县'),('430481',NULL,'耒阳市'),('430482',NULL,'常宁市'),('430500',NULL,'邵阳市'),('430501',NULL,'市辖区'),('430502',NULL,'双清区'),('430503',NULL,'大祥区'),('430511',NULL,'北塔区'),('430521',NULL,'邵东县'),('430522',NULL,'新邵县'),('430523',NULL,'邵阳县'),('430524',NULL,'隆回县'),('430525',NULL,'洞口县'),('430527',NULL,'绥宁县'),('430528',NULL,'新宁县'),('430529',NULL,'城步苗族自治县'),('430581',NULL,'武冈市'),('430600',NULL,'岳阳市'),('430601',NULL,'市辖区'),('430602',NULL,'岳阳楼区'),('430603',NULL,'云溪区'),('430611',NULL,'君山区'),('430621',NULL,'岳阳县'),('430623',NULL,'华容县'),('430624',NULL,'湘阴县'),('430626',NULL,'平江县'),('430681',NULL,'汨罗市'),('430682',NULL,'临湘市'),('430700',NULL,'常德市'),('430701',NULL,'市辖区'),('430702',NULL,'武陵区'),('430703',NULL,'鼎城区'),('430721',NULL,'安乡县'),('430722',NULL,'汉寿县'),('430723',NULL,'澧县'),('430724',NULL,'临澧县'),('430725',NULL,'桃源县'),('430726',NULL,'石门县'),('430781',NULL,'津市市'),('430800',NULL,'张家界市'),('430801',NULL,'市辖区'),('430802',NULL,'永定区'),('430811',NULL,'武陵源区'),('430821',NULL,'慈利县'),('430822',NULL,'桑植县'),('430900',NULL,'益阳市'),('430901',NULL,'市辖区'),('430902',NULL,'资阳区'),('430903',NULL,'赫山区'),('430921',NULL,'南县'),('430922',NULL,'桃江县'),('430923',NULL,'安化县'),('430981',NULL,'沅江市'),('431000',NULL,'郴州市'),('431001',NULL,'市辖区'),('431002',NULL,'北湖区'),('431003',NULL,'苏仙区'),('431021',NULL,'桂阳县'),('431022',NULL,'宜章县'),('431023',NULL,'永兴县'),('431024',NULL,'嘉禾县'),('431025',NULL,'临武县'),('431026',NULL,'汝城县'),('431027',NULL,'桂东县'),('431028',NULL,'安仁县'),('431081',NULL,'资兴市'),('431100',NULL,'永州市'),('431101',NULL,'市辖区'),('431102',NULL,'零陵区'),('431103',NULL,'冷水滩区'),('431121',NULL,'祁阳县'),('431122',NULL,'东安县'),('431123',NULL,'双牌县'),('431124',NULL,'道县'),('431125',NULL,'江永县'),('431126',NULL,'宁远县'),('431127',NULL,'蓝山县'),('431128',NULL,'新田县'),('431129',NULL,'江华瑶族自治县'),('431200',NULL,'怀化市'),('431201',NULL,'市辖区'),('431202',NULL,'鹤城区'),('431221',NULL,'中方县'),('431222',NULL,'沅陵县'),('431223',NULL,'辰溪县'),('431224',NULL,'溆浦县'),('431225',NULL,'会同县'),('431226',NULL,'麻阳苗族自治县'),('431227',NULL,'新晃侗族自治县'),('431228',NULL,'芷江侗族自治县'),('431229',NULL,'靖州苗族侗族自治县'),('431230',NULL,'通道侗族自治县'),('431281',NULL,'洪江市'),('431300',NULL,'娄底市'),('431301',NULL,'市辖区'),('431302',NULL,'娄星区'),('431321',NULL,'双峰县'),('431322',NULL,'新化县'),('431381',NULL,'冷水江市'),('431382',NULL,'涟源市'),('433100',NULL,'湘西土家族苗族自治州'),('433101',NULL,'吉首市'),('433122',NULL,'泸溪县'),('433123',NULL,'凤凰县'),('433124',NULL,'花垣县'),('433125',NULL,'保靖县'),('433126',NULL,'古丈县'),('433127',NULL,'永顺县'),('433130',NULL,'龙山县'),('440000',NULL,'广东省'),('440100',NULL,'广州市'),('440101',NULL,'市辖区'),('440103',NULL,'荔湾区'),('440104',NULL,'越秀区'),('440105',NULL,'海珠区'),('440106',NULL,'天河区'),('440111',NULL,'白云区'),('440112',NULL,'黄埔区'),('440113',NULL,'番禺区'),('440114',NULL,'花都区'),('440115',NULL,'南沙区'),('440116',NULL,'萝岗区'),('440183',NULL,'增城市'),('440184',NULL,'从化市'),('440200',NULL,'韶关市'),('440201',NULL,'市辖区'),('440203',NULL,'武江区'),('440204',NULL,'浈江区'),('440205',NULL,'曲江区'),('440222',NULL,'始兴县'),('440224',NULL,'仁化县'),('440229',NULL,'翁源县'),('440232',NULL,'乳源瑶族自治县'),('440233',NULL,'新丰县'),('440281',NULL,'乐昌市'),('440282',NULL,'南雄市'),('440300',NULL,'深圳市'),('440301',NULL,'市辖区'),('440303',NULL,'罗湖区'),('440304',NULL,'福田区'),('440305',NULL,'南山区'),('440306',NULL,'宝安区'),('440307',NULL,'龙岗区'),('440308',NULL,'盐田区'),('440400',NULL,'珠海市'),('440401',NULL,'市辖区'),('440402',NULL,'香洲区'),('440403',NULL,'斗门区'),('440404',NULL,'金湾区'),('440500',NULL,'汕头市'),('440501',NULL,'市辖区'),('440507',NULL,'龙湖区'),('440511',NULL,'金平区'),('440512',NULL,'濠江区'),('440513',NULL,'潮阳区'),('440514',NULL,'潮南区'),('440515',NULL,'澄海区'),('440523',NULL,'南澳县'),('440600',NULL,'佛山市'),('440601',NULL,'市辖区'),('440604',NULL,'禅城区'),('440605',NULL,'南海区'),('440606',NULL,'顺德区'),('440607',NULL,'三水区'),('440608',NULL,'高明区'),('440700',NULL,'江门市'),('440701',NULL,'市辖区'),('440703',NULL,'蓬江区'),('440704',NULL,'江海区'),('440705',NULL,'新会区'),('440781',NULL,'台山市'),('440783',NULL,'开平市'),('440784',NULL,'鹤山市'),('440785',NULL,'恩平市'),('440800',NULL,'湛江市'),('440801',NULL,'市辖区'),('440802',NULL,'赤坎区'),('440803',NULL,'霞山区'),('440804',NULL,'坡头区'),('440811',NULL,'麻章区'),('440823',NULL,'遂溪县'),('440825',NULL,'徐闻县'),('440881',NULL,'廉江市'),('440882',NULL,'雷州市'),('440883',NULL,'吴川市'),('440900',NULL,'茂名市'),('440901',NULL,'市辖区'),('440902',NULL,'茂南区'),('440903',NULL,'茂港区'),('440923',NULL,'电白县'),('440981',NULL,'高州市'),('440982',NULL,'化州市'),('440983',NULL,'信宜市'),('441200',NULL,'肇庆市'),('441201',NULL,'市辖区'),('441202',NULL,'端州区'),('441203',NULL,'鼎湖区'),('441223',NULL,'广宁县'),('441224',NULL,'怀集县'),('441225',NULL,'封开县'),('441226',NULL,'德庆县'),('441283',NULL,'高要市'),('441284',NULL,'四会市'),('441300',NULL,'惠州市'),('441301',NULL,'市辖区'),('441302',NULL,'惠城区'),('441303',NULL,'惠阳区'),('441322',NULL,'博罗县'),('441323',NULL,'惠东县'),('441324',NULL,'龙门县'),('441400',NULL,'梅州市'),('441401',NULL,'市辖区'),('441402',NULL,'梅江区'),('441421',NULL,'梅县'),('441422',NULL,'大埔县'),('441423',NULL,'丰顺县'),('441424',NULL,'五华县'),('441426',NULL,'平远县'),('441427',NULL,'蕉岭县'),('441481',NULL,'兴宁市'),('441500',NULL,'汕尾市'),('441501',NULL,'市辖区'),('441502',NULL,'城区'),('441521',NULL,'海丰县'),('441523',NULL,'陆河县'),('441581',NULL,'陆丰市'),('441600',NULL,'河源市'),('441601',NULL,'市辖区'),('441602',NULL,'源城区'),('441621',NULL,'紫金县'),('441622',NULL,'龙川县'),('441623',NULL,'连平县'),('441624',NULL,'和平县'),('441625',NULL,'东源县'),('441700',NULL,'阳江市'),('441701',NULL,'市辖区'),('441702',NULL,'江城区'),('441721',NULL,'阳西县'),('441723',NULL,'阳东县'),('441781',NULL,'阳春市'),('441800',NULL,'清远市'),('441801',NULL,'市辖区'),('441802',NULL,'清城区'),('441821',NULL,'佛冈县'),('441823',NULL,'阳山县'),('441825',NULL,'连山壮族瑶族自治县'),('441826',NULL,'连南瑶族自治县'),('441827',NULL,'清新县'),('441881',NULL,'英德市'),('441882',NULL,'连州市'),('441900',NULL,'东莞市'),('442000',NULL,'中山市'),('445100',NULL,'潮州市'),('445101',NULL,'市辖区'),('445102',NULL,'湘桥区'),('445121',NULL,'潮安县'),('445122',NULL,'饶平县'),('445200',NULL,'揭阳市'),('445201',NULL,'市辖区'),('445202',NULL,'榕城区'),('445221',NULL,'揭东县'),('445222',NULL,'揭西县'),('445224',NULL,'惠来县'),('445281',NULL,'普宁市'),('445300',NULL,'云浮市'),('445301',NULL,'市辖区'),('445302',NULL,'云城区'),('445321',NULL,'新兴县'),('445322',NULL,'郁南县'),('445323',NULL,'云安县'),('445381',NULL,'罗定市'),('450000',NULL,'广西壮族自治区'),('450100',NULL,'南宁市'),('450101',NULL,'市辖区'),('450102',NULL,'兴宁区'),('450103',NULL,'青秀区'),('450105',NULL,'江南区'),('450107',NULL,'西乡塘区'),('450108',NULL,'良庆区'),('450109',NULL,'邕宁区'),('450122',NULL,'武鸣县'),('450123',NULL,'隆安县'),('450124',NULL,'马山县'),('450125',NULL,'上林县'),('450126',NULL,'宾阳县'),('450127',NULL,'横县'),('450200',NULL,'柳州市'),('450201',NULL,'市辖区'),('450202',NULL,'城中区'),('450203',NULL,'鱼峰区'),('450204',NULL,'柳南区'),('450205',NULL,'柳北区'),('450221',NULL,'柳江县'),('450222',NULL,'柳城县'),('450223',NULL,'鹿寨县'),('450224',NULL,'融安县'),('450225',NULL,'融水苗族自治县'),('450226',NULL,'三江侗族自治县'),('450300',NULL,'桂林市'),('450301',NULL,'市辖区'),('450302',NULL,'秀峰区'),('450303',NULL,'叠彩区'),('450304',NULL,'象山区'),('450305',NULL,'七星区'),('450311',NULL,'雁山区'),('450321',NULL,'阳朔县'),('450322',NULL,'临桂县'),('450323',NULL,'灵川县'),('450324',NULL,'全州县'),('450325',NULL,'兴安县'),('450326',NULL,'永福县'),('450327',NULL,'灌阳县'),('450328',NULL,'龙胜各族自治县'),('450329',NULL,'资源县'),('450330',NULL,'平乐县'),('450331',NULL,'荔蒲县'),('450332',NULL,'恭城瑶族自治县'),('450400',NULL,'梧州市'),('450401',NULL,'市辖区'),('450403',NULL,'万秀区'),('450404',NULL,'蝶山区'),('450405',NULL,'长洲区'),('450421',NULL,'苍梧县'),('450422',NULL,'藤县'),('450423',NULL,'蒙山县'),('450481',NULL,'岑溪市'),('450500',NULL,'北海市'),('450501',NULL,'市辖区'),('450502',NULL,'海城区'),('450503',NULL,'银海区'),('450512',NULL,'铁山港区'),('450521',NULL,'合浦县'),('450600',NULL,'防城港市'),('450601',NULL,'市辖区'),('450602',NULL,'港口区'),('450603',NULL,'防城区'),('450621',NULL,'上思县'),('450681',NULL,'东兴市'),('450700',NULL,'钦州市'),('450701',NULL,'市辖区'),('450702',NULL,'钦南区'),('450703',NULL,'钦北区'),('450721',NULL,'灵山县'),('450722',NULL,'浦北县'),('450800',NULL,'贵港市'),('450801',NULL,'市辖区'),('450802',NULL,'港北区'),('450803',NULL,'港南区'),('450804',NULL,'覃塘区'),('450821',NULL,'平南县'),('450881',NULL,'桂平市'),('450900',NULL,'玉林市'),('450901',NULL,'市辖区'),('450902',NULL,'玉州区'),('450921',NULL,'容县'),('450922',NULL,'陆川县'),('450923',NULL,'博白县'),('450924',NULL,'兴业县'),('450981',NULL,'北流市'),('451000',NULL,'百色市'),('451001',NULL,'市辖区'),('451002',NULL,'右江区'),('451021',NULL,'田阳县'),('451022',NULL,'田东县'),('451023',NULL,'平果县'),('451024',NULL,'德保县'),('451025',NULL,'靖西县'),('451026',NULL,'那坡县'),('451027',NULL,'凌云县'),('451028',NULL,'乐业县'),('451029',NULL,'田林县'),('451030',NULL,'西林县'),('451031',NULL,'隆林各族自治县'),('451100',NULL,'贺州市'),('451101',NULL,'市辖区'),('451102',NULL,'八步区'),('451121',NULL,'昭平县'),('451122',NULL,'钟山县'),('451123',NULL,'富川瑶族自治县'),('451200',NULL,'河池市'),('451201',NULL,'市辖区'),('451202',NULL,'金城江区'),('451221',NULL,'南丹县'),('451222',NULL,'天峨县'),('451223',NULL,'凤山县'),('451224',NULL,'东兰县'),('451225',NULL,'罗城仫佬族自治县'),('451226',NULL,'环江毛南族自治县'),('451227',NULL,'巴马瑶族自治县'),('451228',NULL,'都安瑶族自治县'),('451229',NULL,'大化瑶族自治县'),('451281',NULL,'宜州市'),('451300',NULL,'来宾市'),('451301',NULL,'市辖区'),('451302',NULL,'兴宾区'),('451321',NULL,'忻城县'),('451322',NULL,'象州县'),('451323',NULL,'武宣县'),('451324',NULL,'金秀瑶族自治县'),('451381',NULL,'合山市'),('451400',NULL,'崇左市'),('451401',NULL,'市辖区'),('451402',NULL,'江洲区'),('451421',NULL,'扶绥县'),('451422',NULL,'宁明县'),('451423',NULL,'龙州县'),('451424',NULL,'大新县'),('451425',NULL,'天等县'),('451481',NULL,'凭祥市'),('460000',NULL,'海南省'),('460100',NULL,'海口市'),('460101',NULL,'市辖区'),('460105',NULL,'秀英区'),('460106',NULL,'龙华区'),('460107',NULL,'琼山区'),('460108',NULL,'美兰区'),('460200',NULL,'三亚市'),('460201',NULL,'市辖区'),('469000',NULL,'省直辖县级行政单位'),('469001',NULL,'五指山市'),('469002',NULL,'琼海市'),('469003',NULL,'儋州市'),('469005',NULL,'文昌市'),('469006',NULL,'万宁市'),('469007',NULL,'东方市'),('469025',NULL,'定安县'),('469026',NULL,'屯昌县'),('469027',NULL,'澄迈县'),('469028',NULL,'临高县'),('469030',NULL,'白沙黎族自治县'),('469031',NULL,'昌江黎族自治县'),('469033',NULL,'乐东黎族自治县'),('469034',NULL,'陵水黎族自治县'),('469035',NULL,'保亭黎族苗族自治县'),('469036',NULL,'琼中黎族苗族自治县'),('469037',NULL,'西沙群岛'),('469038',NULL,'南沙群岛'),('469039',NULL,'中沙群岛的岛礁及其海域'),('500000',NULL,'重庆市'),('500100',NULL,'市辖区'),('500101',NULL,'万州区'),('500102',NULL,'涪陵区'),('500103',NULL,'渝中区'),('500104',NULL,'大渡口区'),('500105',NULL,'江北区'),('500106',NULL,'沙坪坝区'),('500107',NULL,'九龙坡区'),('500108',NULL,'南岸区'),('500109',NULL,'北碚区'),('500110',NULL,'万盛区'),('500111',NULL,'双桥区'),('500112',NULL,'渝北区'),('500113',NULL,'巴南区'),('500114',NULL,'黔江区'),('500115',NULL,'长寿区'),('500116',NULL,'江津区'),('500117',NULL,'合川区'),('500118',NULL,'永川区'),('500119',NULL,'南川区'),('500200',NULL,'县'),('500222',NULL,'綦江县'),('500223',NULL,'潼南县'),('500224',NULL,'铜梁县'),('500225',NULL,'大足县'),('500226',NULL,'荣昌县'),('500227',NULL,'璧山县'),('500228',NULL,'梁平县'),('500229',NULL,'城口县'),('500230',NULL,'丰都县'),('500231',NULL,'垫江县'),('500232',NULL,'武隆县'),('500233',NULL,'忠县'),('500234',NULL,'开县'),('500235',NULL,'云阳县'),('500236',NULL,'奉节县'),('500237',NULL,'巫山县'),('500238',NULL,'巫溪县'),('500240',NULL,'石柱土家族自治县'),('500241',NULL,'秀山土家族苗族自治县'),('500242',NULL,'酉阳土家族苗族自治县'),('500243',NULL,'彭水苗族土家族自治县'),('510000',NULL,'四川省'),('510100',NULL,'成都市'),('510101',NULL,'市辖区'),('510104',NULL,'锦江区'),('510105',NULL,'青羊区'),('510106',NULL,'金牛区'),('510107',NULL,'武侯区'),('510108',NULL,'成华区'),('510112',NULL,'龙泉驿区'),('510113',NULL,'青白江区'),('510114',NULL,'新都区'),('510115',NULL,'温江区'),('510121',NULL,'金堂县'),('510122',NULL,'双流县'),('510124',NULL,'郫县'),('510129',NULL,'大邑县'),('510131',NULL,'蒲江县'),('510132',NULL,'新津县'),('510181',NULL,'都江堰市'),('510182',NULL,'彭州市'),('510183',NULL,'邛崃市'),('510184',NULL,'崇州市'),('510300',NULL,'自贡市'),('510301',NULL,'市辖区'),('510302',NULL,'自流井区'),('510303',NULL,'贡井区'),('510304',NULL,'大安区'),('510311',NULL,'沿滩区'),('510321',NULL,'荣县'),('510322',NULL,'富顺县'),('510400',NULL,'攀枝花市'),('510401',NULL,'市辖区'),('510402',NULL,'东区'),('510403',NULL,'西区'),('510411',NULL,'仁和区'),('510421',NULL,'米易县'),('510422',NULL,'盐边县'),('510500',NULL,'泸州市'),('510501',NULL,'市辖区'),('510502',NULL,'江阳区'),('510503',NULL,'纳溪区'),('510504',NULL,'龙马潭区'),('510521',NULL,'泸县'),('510522',NULL,'合江县'),('510524',NULL,'叙永县'),('510525',NULL,'古蔺县'),('510600',NULL,'德阳市'),('510601',NULL,'市辖区'),('510603',NULL,'旌阳区'),('510623',NULL,'中江县'),('510626',NULL,'罗江县'),('510681',NULL,'广汉市'),('510682',NULL,'什邡市'),('510683',NULL,'绵竹市'),('510700',NULL,'绵阳市'),('510701',NULL,'市辖区'),('510703',NULL,'涪城区'),('510704',NULL,'游仙区'),('510722',NULL,'三台县'),('510723',NULL,'盐亭县'),('510724',NULL,'安县'),('510725',NULL,'梓潼县'),('510726',NULL,'北川羌族自治县'),('510727',NULL,'平武县'),('510781',NULL,'江油市'),('510800',NULL,'广元市'),('510801',NULL,'市辖区'),('510802',NULL,'市中区'),('510811',NULL,'元坝区'),('510812',NULL,'朝天区'),('510821',NULL,'旺苍县'),('510822',NULL,'青川县'),('510823',NULL,'剑阁县'),('510824',NULL,'苍溪县'),('510900',NULL,'遂宁市'),('510901',NULL,'市辖区'),('510903',NULL,'船山区'),('510904',NULL,'安居区'),('510921',NULL,'蓬溪县'),('510922',NULL,'射洪县'),('510923',NULL,'大英县'),('511000',NULL,'内江市'),('511001',NULL,'市辖区'),('511002',NULL,'市中区'),('511011',NULL,'东兴区'),('511024',NULL,'威远县'),('511025',NULL,'资中县'),('511028',NULL,'隆昌县'),('511100',NULL,'乐山市'),('511101',NULL,'市辖区'),('511102',NULL,'市中区'),('511111',NULL,'沙湾区'),('511112',NULL,'五通桥区'),('511113',NULL,'金口河区'),('511123',NULL,'犍为县'),('511124',NULL,'井研县'),('511126',NULL,'夹江县'),('511129',NULL,'沐川县'),('511132',NULL,'峨边彝族自治县'),('511133',NULL,'马边彝族自治县'),('511181',NULL,'峨眉山市'),('511300',NULL,'南充市'),('511301',NULL,'市辖区'),('511302',NULL,'顺庆区'),('511303',NULL,'高坪区'),('511304',NULL,'嘉陵区'),('511321',NULL,'南部县'),('511322',NULL,'营山县'),('511323',NULL,'蓬安县'),('511324',NULL,'仪陇县'),('511325',NULL,'西充县'),('511381',NULL,'阆中市'),('511400',NULL,'眉山市'),('511401',NULL,'市辖区'),('511402',NULL,'东坡区'),('511421',NULL,'仁寿县'),('511422',NULL,'彭山县'),('511423',NULL,'洪雅县'),('511424',NULL,'丹棱县'),('511425',NULL,'青神县'),('511500',NULL,'宜宾市'),('511501',NULL,'市辖区'),('511502',NULL,'翠屏区'),('511521',NULL,'宜宾县'),('511522',NULL,'南溪县'),('511523',NULL,'江安县'),('511524',NULL,'长宁县'),('511525',NULL,'高县'),('511526',NULL,'珙县'),('511527',NULL,'筠连县'),('511528',NULL,'兴文县'),('511529',NULL,'屏山县'),('511600',NULL,'广安市'),('511601',NULL,'市辖区'),('511602',NULL,'广安区'),('511621',NULL,'岳池县'),('511622',NULL,'武胜县'),('511623',NULL,'邻水县'),('511681',NULL,'华蓥市'),('511700',NULL,'达州市'),('511701',NULL,'市辖区'),('511702',NULL,'通川区'),('511721',NULL,'达县'),('511722',NULL,'宣汉县'),('511723',NULL,'开江县'),('511724',NULL,'大竹县'),('511725',NULL,'渠县'),('511781',NULL,'万源市'),('511800',NULL,'雅安市'),('511801',NULL,'市辖区'),('511802',NULL,'雨城区'),('511821',NULL,'名山县'),('511822',NULL,'荥经县'),('511823',NULL,'汉源县'),('511824',NULL,'石棉县'),('511825',NULL,'天全县'),('511826',NULL,'芦山县'),('511827',NULL,'宝兴县'),('511900',NULL,'巴中市'),('511901',NULL,'市辖区'),('511902',NULL,'巴州区'),('511921',NULL,'通江县'),('511922',NULL,'南江县'),('511923',NULL,'平昌县'),('512000',NULL,'资阳市'),('512001',NULL,'市辖区'),('512002',NULL,'雁江区'),('512021',NULL,'安岳县'),('512022',NULL,'乐至县'),('512081',NULL,'简阳市'),('513200',NULL,'阿坝藏族羌族自治州'),('513221',NULL,'汶川县'),('513222',NULL,'理县'),('513223',NULL,'茂县'),('513224',NULL,'松潘县'),('513225',NULL,'九寨沟县'),('513226',NULL,'金川县'),('513227',NULL,'小金县'),('513228',NULL,'黑水县'),('513229',NULL,'马尔康县'),('513230',NULL,'壤塘县'),('513231',NULL,'阿坝县'),('513232',NULL,'若尔盖县'),('513233',NULL,'红原县'),('513300',NULL,'甘孜藏族自治州'),('513321',NULL,'康定县'),('513322',NULL,'泸定县'),('513323',NULL,'丹巴县'),('513324',NULL,'九龙县'),('513325',NULL,'雅江县'),('513326',NULL,'道孚县'),('513327',NULL,'炉霍县'),('513328',NULL,'甘孜县'),('513329',NULL,'新龙县'),('513330',NULL,'德格县'),('513331',NULL,'白玉县'),('513332',NULL,'石渠县'),('513333',NULL,'色达县'),('513334',NULL,'理塘县'),('513335',NULL,'巴塘县'),('513336',NULL,'乡城县'),('513337',NULL,'稻城县'),('513338',NULL,'得荣县'),('513400',NULL,'凉山彝族自治州'),('513401',NULL,'西昌市'),('513422',NULL,'木里藏族自治县'),('513423',NULL,'盐源县'),('513424',NULL,'德昌县'),('513425',NULL,'会理县'),('513426',NULL,'会东县'),('513427',NULL,'宁南县'),('513428',NULL,'普格县'),('513429',NULL,'布拖县'),('513430',NULL,'金阳县'),('513431',NULL,'昭觉县'),('513432',NULL,'喜德县'),('513433',NULL,'冕宁县'),('513434',NULL,'越西县'),('513435',NULL,'甘洛县'),('513436',NULL,'美姑县'),('513437',NULL,'雷波县'),('520000',NULL,'贵州省'),('520100',NULL,'贵阳市'),('520101',NULL,'市辖区'),('520102',NULL,'南明区'),('520103',NULL,'云岩区'),('520111',NULL,'花溪区'),('520112',NULL,'乌当区'),('520113',NULL,'白云区'),('520114',NULL,'小河区'),('520121',NULL,'开阳县'),('520122',NULL,'息烽县'),('520123',NULL,'修文县'),('520181',NULL,'清镇市'),('520200',NULL,'六盘水市'),('520201',NULL,'钟山区'),('520203',NULL,'六枝特区'),('520221',NULL,'水城县'),('520222',NULL,'盘县'),('520300',NULL,'遵义市'),('520301',NULL,'市辖区'),('520302',NULL,'红花岗区'),('520303',NULL,'汇川区'),('520321',NULL,'遵义县'),('520322',NULL,'桐梓县'),('520323',NULL,'绥阳县'),('520324',NULL,'正安县'),('520325',NULL,'道真仡佬族苗族自治县'),('520326',NULL,'务川仡佬族苗族自治县'),('520327',NULL,'凤冈县'),('520328',NULL,'湄潭县'),('520329',NULL,'余庆县'),('520330',NULL,'习水县'),('520381',NULL,'赤水市'),('520382',NULL,'仁怀市'),('520400',NULL,'安顺市'),('520401',NULL,'市辖区'),('520402',NULL,'西秀区'),('520421',NULL,'平坝县'),('520422',NULL,'普定县'),('520423',NULL,'镇宁布依族苗族自治县'),('520424',NULL,'关岭布依族苗族自治县'),('520425',NULL,'紫云苗族布依族自治县'),('522200',NULL,'铜仁地区'),('522201',NULL,'铜仁市'),('522222',NULL,'江口县'),('522223',NULL,'玉屏侗族自治县'),('522224',NULL,'石阡县'),('522225',NULL,'思南县'),('522226',NULL,'印江土家族苗族自治县'),('522227',NULL,'德江县'),('522228',NULL,'沿河土家族自治县'),('522229',NULL,'松桃苗族自治县'),('522230',NULL,'万山特区'),('522300',NULL,'黔西南布依族苗族自治州'),('522301',NULL,'兴义市'),('522322',NULL,'兴仁县'),('522323',NULL,'普安县'),('522324',NULL,'晴隆县'),('522325',NULL,'贞丰县'),('522326',NULL,'望谟县'),('522327',NULL,'册亨县'),('522328',NULL,'安龙县'),('522400',NULL,'毕节地区'),('522401',NULL,'毕节市'),('522422',NULL,'大方县'),('522423',NULL,'黔西县'),('522424',NULL,'金沙县'),('522425',NULL,'织金县'),('522426',NULL,'纳雍县'),('522427',NULL,'威宁彝族回族苗族自治县'),('522428',NULL,'赫章县'),('522600',NULL,'黔东南苗族侗族自治州'),('522601',NULL,'凯里市'),('522622',NULL,'黄平县'),('522623',NULL,'施秉县'),('522624',NULL,'三穗县'),('522625',NULL,'镇远县'),('522626',NULL,'岑巩县'),('522627',NULL,'天柱县'),('522628',NULL,'锦屏县'),('522629',NULL,'剑河县'),('522630',NULL,'台江县'),('522631',NULL,'黎平县'),('522632',NULL,'榕江县'),('522633',NULL,'从江县'),('522634',NULL,'雷山县'),('522635',NULL,'麻江县'),('522636',NULL,'丹寨县'),('522700',NULL,'黔南布依族苗族自治州'),('522701',NULL,'都匀市'),('522702',NULL,'福泉市'),('522722',NULL,'荔波县'),('522723',NULL,'贵定县'),('522725',NULL,'瓮安县'),('522726',NULL,'独山县'),('522727',NULL,'平塘县'),('522728',NULL,'罗甸县'),('522729',NULL,'长顺县'),('522730',NULL,'龙里县'),('522731',NULL,'惠水县'),('522732',NULL,'三都水族自治县'),('530000',NULL,'云南省'),('530100',NULL,'昆明市'),('530101',NULL,'市辖区'),('530102',NULL,'五华区'),('530103',NULL,'盘龙区'),('530111',NULL,'官渡区'),('530112',NULL,'西山区'),('530113',NULL,'东川区'),('530121',NULL,'呈贡县'),('530122',NULL,'晋宁县'),('530124',NULL,'富民县'),('530125',NULL,'宜良县'),('530126',NULL,'石林彝族自治县'),('530127',NULL,'嵩明县'),('530128',NULL,'禄劝彝族苗族自治县'),('530129',NULL,'寻甸回族彝族自治县'),('530181',NULL,'安宁市'),('530300',NULL,'曲靖市'),('530301',NULL,'市辖区'),('530302',NULL,'麒麟区'),('530321',NULL,'马龙县'),('530322',NULL,'陆良县'),('530323',NULL,'师宗县'),('530324',NULL,'罗平县'),('530325',NULL,'富源县'),('530326',NULL,'会泽县'),('530328',NULL,'沾益县'),('530381',NULL,'宣威市'),('530400',NULL,'玉溪市'),('530401',NULL,'市辖区'),('530402',NULL,'红塔区'),('530421',NULL,'江川县'),('530422',NULL,'澄江县'),('530423',NULL,'通海县'),('530424',NULL,'华宁县'),('530425',NULL,'易门县'),('530426',NULL,'峨山彝族自治县'),('530427',NULL,'新平彝族傣族自治县'),('530428',NULL,'元江哈尼族彝族傣族自治县'),('530500',NULL,'保山市'),('530501',NULL,'市辖区'),('530502',NULL,'隆阳区'),('530521',NULL,'施甸县'),('530522',NULL,'腾冲县'),('530523',NULL,'龙陵县'),('530524',NULL,'昌宁县'),('530600',NULL,'昭通市'),('530601',NULL,'市辖区'),('530602',NULL,'昭阳区'),('530621',NULL,'鲁甸县'),('530622',NULL,'巧家县'),('530623',NULL,'盐津县'),('530624',NULL,'大关县'),('530625',NULL,'永善县'),('530626',NULL,'绥江县'),('530627',NULL,'镇雄县'),('530628',NULL,'彝良县'),('530629',NULL,'威信县'),('530630',NULL,'水富县'),('530700',NULL,'丽江市'),('530701',NULL,'市辖区'),('530702',NULL,'古城区'),('530721',NULL,'玉龙纳西族自治县'),('530722',NULL,'永胜县'),('530723',NULL,'华坪县'),('530724',NULL,'宁蒗彝族自治县'),('530800',NULL,'思茅市'),('530801',NULL,'市辖区'),('530802',NULL,'翠云区'),('530821',NULL,'普洱哈尼族彝族自治县'),('530822',NULL,'墨江哈尼族自治县'),('530823',NULL,'景东彝族自治县'),('530824',NULL,'景谷傣族彝族自治县'),('530825',NULL,'镇沅彝族哈尼族拉祜族自治县'),('530826',NULL,'江城哈尼族彝族自治县'),('530827',NULL,'孟连傣族拉祜族佤族自治县'),('530828',NULL,'澜沧拉祜族自治县'),('530829',NULL,'西盟佤族自治县'),('530900',NULL,'临沧市'),('530901',NULL,'市辖区'),('530902',NULL,'临翔区'),('530921',NULL,'凤庆县'),('530922',NULL,'云县'),('530923',NULL,'永德县'),('530924',NULL,'镇康县'),('530925',NULL,'双江拉祜族佤族布朗族傣族自治县'),('530926',NULL,'耿马傣族佤族自治县'),('530927',NULL,'沧源佤族自治县'),('532300',NULL,'楚雄彝族自治州'),('532301',NULL,'楚雄市'),('532322',NULL,'双柏县'),('532323',NULL,'牟定县'),('532324',NULL,'南华县'),('532325',NULL,'姚安县'),('532326',NULL,'大姚县'),('532327',NULL,'永仁县'),('532328',NULL,'元谋县'),('532329',NULL,'武定县'),('532331',NULL,'禄丰县'),('532500',NULL,'红河哈尼族彝族自治州'),('532501',NULL,'个旧市'),('532502',NULL,'开远市'),('532522',NULL,'蒙自县'),('532523',NULL,'屏边苗族自治县'),('532524',NULL,'建水县'),('532525',NULL,'石屏县'),('532526',NULL,'弥勒县'),('532527',NULL,'泸西县'),('532528',NULL,'元阳县'),('532529',NULL,'红河县'),('532530',NULL,'金平苗族瑶族傣族自治县'),('532531',NULL,'绿春县'),('532532',NULL,'河口瑶族自治县'),('532600',NULL,'文山壮族苗族自治州'),('532621',NULL,'文山县'),('532622',NULL,'砚山县'),('532623',NULL,'西畴县'),('532624',NULL,'麻栗坡县'),('532625',NULL,'马关县'),('532626',NULL,'丘北县'),('532627',NULL,'广南县'),('532628',NULL,'富宁县'),('532800',NULL,'西双版纳傣族自治州'),('532801',NULL,'景洪市'),('532822',NULL,'勐海县'),('532823',NULL,'勐腊县'),('532900',NULL,'大理白族自治州'),('532901',NULL,'大理市'),('532922',NULL,'漾濞彝族自治县'),('532923',NULL,'祥云县'),('532924',NULL,'宾川县'),('532925',NULL,'弥渡县'),('532926',NULL,'南涧彝族自治县'),('532927',NULL,'巍山彝族回族自治县'),('532928',NULL,'永平县'),('532929',NULL,'云龙县'),('532930',NULL,'洱源县'),('532931',NULL,'剑川县'),('532932',NULL,'鹤庆县'),('533100',NULL,'德宏傣族景颇族自治州'),('533102',NULL,'瑞丽市'),('533103',NULL,'潞西市'),('533122',NULL,'梁河县'),('533123',NULL,'盈江县'),('533124',NULL,'陇川县'),('533300',NULL,'怒江傈僳族自治州'),('533321',NULL,'泸水县'),('533323',NULL,'福贡县'),('533324',NULL,'贡山独龙族怒族自治县'),('533325',NULL,'兰坪白族普米族自治县'),('533400',NULL,'迪庆藏族自治州'),('533421',NULL,'香格里拉县'),('533422',NULL,'德钦县'),('533423',NULL,'维西傈僳族自治县'),('540000',NULL,'西藏自治区'),('540100',NULL,'拉萨市'),('540101',NULL,'市辖区'),('540102',NULL,'城关区'),('540121',NULL,'林周县'),('540122',NULL,'当雄县'),('540123',NULL,'尼木县'),('540124',NULL,'曲水县'),('540125',NULL,'堆龙德庆县'),('540126',NULL,'达孜县'),('540127',NULL,'墨竹工卡县'),('542100',NULL,'昌都地区'),('542121',NULL,'昌都县'),('542122',NULL,'江达县'),('542123',NULL,'贡觉县'),('542124',NULL,'类乌齐县'),('542125',NULL,'丁青县'),('542126',NULL,'察雅县'),('542127',NULL,'八宿县'),('542128',NULL,'左贡县'),('542129',NULL,'芒康县'),('542132',NULL,'洛隆县'),('542133',NULL,'边坝县'),('542200',NULL,'山南地区'),('542221',NULL,'乃东县'),('542222',NULL,'扎囊县'),('542223',NULL,'贡嘎县'),('542224',NULL,'桑日县'),('542225',NULL,'琼结县'),('542226',NULL,'曲松县'),('542227',NULL,'措美县'),('542228',NULL,'洛扎县'),('542229',NULL,'加查县'),('542231',NULL,'隆子县'),('542232',NULL,'错那县'),('542233',NULL,'浪卡子县'),('542300',NULL,'日喀则地区'),('542301',NULL,'日喀则市'),('542322',NULL,'南木林县'),('542323',NULL,'江孜县'),('542324',NULL,'定日县'),('542325',NULL,'萨迦县'),('542326',NULL,'拉孜县'),('542327',NULL,'昂仁县'),('542328',NULL,'谢通门县'),('542329',NULL,'白朗县'),('542330',NULL,'仁布县'),('542331',NULL,'康马县'),('542332',NULL,'定结县'),('542333',NULL,'仲巴县'),('542334',NULL,'亚东县'),('542335',NULL,'吉隆县'),('542336',NULL,'聂拉木县'),('542337',NULL,'萨嘎县'),('542338',NULL,'岗巴县'),('542400',NULL,'那曲地区'),('542421',NULL,'那曲县'),('542422',NULL,'嘉黎县'),('542423',NULL,'比如县'),('542424',NULL,'聂荣县'),('542425',NULL,'安多县'),('542426',NULL,'申扎县'),('542427',NULL,'索县'),('542428',NULL,'班戈县'),('542429',NULL,'巴青县'),('542430',NULL,'尼玛县'),('542500',NULL,'阿里地区'),('542521',NULL,'普兰县'),('542522',NULL,'札达县'),('542523',NULL,'噶尔县'),('542524',NULL,'日土县'),('542525',NULL,'革吉县'),('542526',NULL,'改则县'),('542527',NULL,'措勤县'),('542600',NULL,'林芝地区'),('542621',NULL,'林芝县'),('542622',NULL,'工布江达县'),('542623',NULL,'米林县'),('542624',NULL,'墨脱县'),('542625',NULL,'波密县'),('542626',NULL,'察隅县'),('542627',NULL,'朗县'),('610000',NULL,'陕西省'),('610100',NULL,'西安市'),('610101',NULL,'市辖区'),('610102',NULL,'新城区'),('610103',NULL,'碑林区'),('610104',NULL,'莲湖区'),('610111',NULL,'灞桥区'),('610112',NULL,'未央区'),('610113',NULL,'雁塔区'),('610114',NULL,'阎良区'),('610115',NULL,'临潼区'),('610116',NULL,'长安区'),('610122',NULL,'蓝田县'),('610124',NULL,'周至县'),('610125',NULL,'户县'),('610126',NULL,'高陵县'),('610200',NULL,'铜川市'),('610201',NULL,'市辖区'),('610202',NULL,'王益区'),('610203',NULL,'印台区'),('610204',NULL,'耀州区'),('610222',NULL,'宜君县'),('610300',NULL,'宝鸡市'),('610301',NULL,'市辖区'),('610302',NULL,'渭滨区'),('610303',NULL,'金台区'),('610304',NULL,'陈仓区'),('610322',NULL,'凤翔县'),('610323',NULL,'岐山县'),('610324',NULL,'扶风县'),('610326',NULL,'眉县'),('610327',NULL,'陇县'),('610328',NULL,'千阳县'),('610329',NULL,'麟游县'),('610330',NULL,'凤县'),('610331',NULL,'太白县'),('610400',NULL,'咸阳市'),('610401',NULL,'市辖区'),('610402',NULL,'秦都区'),('610403',NULL,'杨凌区'),('610404',NULL,'渭城区'),('610422',NULL,'三原县'),('610423',NULL,'泾阳县'),('610424',NULL,'乾县'),('610425',NULL,'礼泉县'),('610426',NULL,'永寿县'),('610427',NULL,'彬县'),('610428',NULL,'长武县'),('610429',NULL,'旬邑县'),('610430',NULL,'淳化县'),('610431',NULL,'武功县'),('610481',NULL,'兴平市'),('610500',NULL,'渭南市'),('610501',NULL,'市辖区'),('610502',NULL,'临渭区'),('610521',NULL,'华县'),('610522',NULL,'潼关县'),('610523',NULL,'大荔县'),('610524',NULL,'合阳县'),('610525',NULL,'澄城县'),('610526',NULL,'蒲城县'),('610527',NULL,'白水县'),('610528',NULL,'富平县'),('610581',NULL,'韩城市'),('610582',NULL,'华阴市'),('610600',NULL,'延安市'),('610601',NULL,'市辖区'),('610602',NULL,'宝塔区'),('610621',NULL,'延长县'),('610622',NULL,'延川县'),('610623',NULL,'子长县'),('610624',NULL,'安塞县'),('610625',NULL,'志丹县'),('610626',NULL,'吴起县'),('610627',NULL,'甘泉县'),('610628',NULL,'富县'),('610629',NULL,'洛川县'),('610630',NULL,'宜川县'),('610631',NULL,'黄龙县'),('610632',NULL,'黄陵县'),('610700',NULL,'汉中市'),('610701',NULL,'市辖区'),('610702',NULL,'汉台区'),('610721',NULL,'南郑县'),('610722',NULL,'城固县'),('610723',NULL,'洋县'),('610724',NULL,'西乡县'),('610725',NULL,'勉县'),('610726',NULL,'宁强县'),('610727',NULL,'略阳县'),('610728',NULL,'镇巴县'),('610729',NULL,'留坝县'),('610730',NULL,'佛坪县'),('610800',NULL,'榆林市'),('610801',NULL,'市辖区'),('610802',NULL,'榆阳区'),('610821',NULL,'神木县'),('610822',NULL,'府谷县'),('610823',NULL,'横山县'),('610824',NULL,'靖边县'),('610825',NULL,'定边县'),('610826',NULL,'绥德县'),('610827',NULL,'米脂县'),('610828',NULL,'佳县'),('610829',NULL,'吴堡县'),('610830',NULL,'清涧县'),('610831',NULL,'子洲县'),('610900',NULL,'安康市'),('610901',NULL,'市辖区'),('610902',NULL,'汉滨区'),('610921',NULL,'汉阴县'),('610922',NULL,'石泉县'),('610923',NULL,'宁陕县'),('610924',NULL,'紫阳县'),('610925',NULL,'岚皋县'),('610926',NULL,'平利县'),('610927',NULL,'镇坪县'),('610928',NULL,'旬阳县'),('610929',NULL,'白河县'),('611000',NULL,'商洛市'),('611001',NULL,'市辖区'),('611002',NULL,'商州区'),('611021',NULL,'洛南县'),('611022',NULL,'丹凤县'),('611023',NULL,'商南县'),('611024',NULL,'山阳县'),('611025',NULL,'镇安县'),('611026',NULL,'柞水县'),('620000',NULL,'甘肃省'),('620100',NULL,'兰州市'),('620101',NULL,'市辖区'),('620102',NULL,'城关区'),('620103',NULL,'七里河区'),('620104',NULL,'西固区'),('620105',NULL,'安宁区'),('620111',NULL,'红古区'),('620121',NULL,'永登县'),('620122',NULL,'皋兰县'),('620123',NULL,'榆中县'),('620200',NULL,'嘉峪关市'),('620201',NULL,'市辖区'),('620300',NULL,'金昌市'),('620301',NULL,'市辖区'),('620302',NULL,'金川区'),('620321',NULL,'永昌县'),('620400',NULL,'白银市'),('620401',NULL,'市辖区'),('620402',NULL,'白银区'),('620403',NULL,'平川区'),('620421',NULL,'靖远县'),('620422',NULL,'会宁县'),('620423',NULL,'景泰县'),('620500',NULL,'天水市'),('620501',NULL,'市辖区'),('620502',NULL,'秦城区'),('620503',NULL,'北道区'),('620521',NULL,'清水县'),('620522',NULL,'秦安县'),('620523',NULL,'甘谷县'),('620524',NULL,'武山县'),('620525',NULL,'张家川回族自治县'),('620600',NULL,'武威市'),('620601',NULL,'市辖区'),('620602',NULL,'凉州区'),('620621',NULL,'民勤县'),('620622',NULL,'古浪县'),('620623',NULL,'天祝藏族自治县'),('620700',NULL,'张掖市'),('620701',NULL,'市辖区'),('620702',NULL,'甘州区'),('620721',NULL,'肃南裕固族自治县'),('620722',NULL,'民乐县'),('620723',NULL,'临泽县'),('620724',NULL,'高台县'),('620725',NULL,'山丹县'),('620800',NULL,'平凉市'),('620801',NULL,'市辖区'),('620802',NULL,'崆峒区'),('620821',NULL,'泾川县'),('620822',NULL,'灵台县'),('620823',NULL,'崇信县'),('620824',NULL,'华亭县'),('620825',NULL,'庄浪县'),('620826',NULL,'静宁县'),('620900',NULL,'酒泉市'),('620901',NULL,'市辖区'),('620902',NULL,'肃州区'),('620921',NULL,'金塔县'),('620922',NULL,'瓜州县*'),('620923',NULL,'肃北蒙古族自治县'),('620924',NULL,'阿克塞哈萨克族自治县'),('620981',NULL,'玉门市'),('620982',NULL,'敦煌市'),('621000',NULL,'庆阳市'),('621001',NULL,'市辖区'),('621002',NULL,'西峰区'),('621021',NULL,'庆城县'),('621022',NULL,'环县'),('621023',NULL,'华池县'),('621024',NULL,'合水县'),('621025',NULL,'正宁县'),('621026',NULL,'宁县'),('621027',NULL,'镇原县'),('621100',NULL,'定西市'),('621101',NULL,'市辖区'),('621102',NULL,'安定区'),('621121',NULL,'通渭县'),('621122',NULL,'陇西县'),('621123',NULL,'渭源县'),('621124',NULL,'临洮县'),('621125',NULL,'漳县'),('621126',NULL,'岷县'),('621200',NULL,'陇南市'),('621201',NULL,'市辖区'),('621202',NULL,'武都区'),('621221',NULL,'成县'),('621222',NULL,'文县'),('621223',NULL,'宕昌县'),('621224',NULL,'康县'),('621225',NULL,'西和县'),('621226',NULL,'礼县'),('621227',NULL,'徽县'),('621228',NULL,'两当县'),('622900',NULL,'临夏回族自治州'),('622901',NULL,'临夏市'),('622921',NULL,'临夏县'),('622922',NULL,'康乐县'),('622923',NULL,'永靖县'),('622924',NULL,'广河县'),('622925',NULL,'和政县'),('622926',NULL,'东乡族自治县'),('622927',NULL,'积石山保安族东乡族撒拉族自治县'),('623000',NULL,'甘南藏族自治州'),('623001',NULL,'合作市'),('623021',NULL,'临潭县'),('623022',NULL,'卓尼县'),('623023',NULL,'舟曲县'),('623024',NULL,'迭部县'),('623025',NULL,'玛曲县'),('623026',NULL,'碌曲县'),('623027',NULL,'夏河县'),('630000',NULL,'青海省'),('630100',NULL,'西宁市'),('630101',NULL,'市辖区'),('630102',NULL,'城东区'),('630103',NULL,'城中区'),('630104',NULL,'城西区'),('630105',NULL,'城北区'),('630121',NULL,'大通回族土族自治县'),('630122',NULL,'湟中县'),('630123',NULL,'湟源县'),('632100',NULL,'海东地区'),('632121',NULL,'平安县'),('632122',NULL,'民和回族土族自治县'),('632123',NULL,'乐都县'),('632126',NULL,'互助土族自治县'),('632127',NULL,'化隆回族自治县'),('632128',NULL,'循化撒拉族自治县'),('632200',NULL,'海北藏族自治州'),('632221',NULL,'门源回族自治县'),('632222',NULL,'祁连县'),('632223',NULL,'海晏县'),('632224',NULL,'刚察县'),('632300',NULL,'黄南藏族自治州'),('632321',NULL,'同仁县'),('632322',NULL,'尖扎县'),('632323',NULL,'泽库县'),('632324',NULL,'河南蒙古族自治县'),('632500',NULL,'海南藏族自治州'),('632521',NULL,'共和县'),('632522',NULL,'同德县'),('632523',NULL,'贵德县'),('632524',NULL,'兴海县'),('632525',NULL,'贵南县'),('632600',NULL,'果洛藏族自治州'),('632621',NULL,'玛沁县'),('632622',NULL,'班玛县'),('632623',NULL,'甘德县'),('632624',NULL,'达日县'),('632625',NULL,'久治县'),('632626',NULL,'玛多县'),('632700',NULL,'玉树藏族自治州'),('632721',NULL,'玉树县'),('632722',NULL,'杂多县'),('632723',NULL,'称多县'),('632724',NULL,'治多县'),('632725',NULL,'囊谦县'),('632726',NULL,'曲麻莱县'),('632800',NULL,'海西蒙古族藏族自治州'),('632801',NULL,'格尔木市'),('632802',NULL,'德令哈市'),('632821',NULL,'乌兰县'),('632822',NULL,'都兰县'),('632823',NULL,'天峻县'),('640000',NULL,'宁夏回族自治区'),('640100',NULL,'银川市'),('640101',NULL,'市辖区'),('640104',NULL,'兴庆区'),('640105',NULL,'西夏区'),('640106',NULL,'金凤区'),('640121',NULL,'永宁县'),('640122',NULL,'贺兰县'),('640181',NULL,'灵武市'),('640200',NULL,'石嘴山市'),('640201',NULL,'市辖区'),('640202',NULL,'大武口区'),('640205',NULL,'惠农区'),('640221',NULL,'平罗县'),('640300',NULL,'吴忠市'),('640301',NULL,'市辖区'),('640302',NULL,'利通区'),('640323',NULL,'盐池县'),('640324',NULL,'同心县'),('640381',NULL,'青铜峡市'),('640400',NULL,'固原市'),('640401',NULL,'市辖区'),('640402',NULL,'原州区'),('640422',NULL,'西吉县'),('640423',NULL,'隆德县'),('640424',NULL,'泾源县'),('640425',NULL,'彭阳县'),('640500',NULL,'中卫市'),('640501',NULL,'市辖区'),('640502',NULL,'沙坡头区'),('640521',NULL,'中宁县'),('640522',NULL,'海原县'),('650000',NULL,'新疆自治区'),('650100',NULL,'乌鲁木齐市'),('650101',NULL,'市辖区'),('650102',NULL,'天山区'),('650103',NULL,'沙依巴克区'),('650104',NULL,'新市区'),('650105',NULL,'水磨沟区'),('650106',NULL,'头屯河区'),('650107',NULL,'达坂城区'),('650108',NULL,'东山区'),('650121',NULL,'乌鲁木齐县'),('650200',NULL,'克拉玛依市'),('650201',NULL,'市辖区'),('650202',NULL,'独山子区'),('650203',NULL,'克拉玛依区'),('650204',NULL,'白碱滩区'),('650205',NULL,'乌尔禾区'),('652100',NULL,'吐鲁番地区'),('652101',NULL,'吐鲁番市'),('652122',NULL,'鄯善县'),('652123',NULL,'托克逊县'),('652200',NULL,'哈密地区'),('652201',NULL,'哈密市'),('652222',NULL,'巴里坤哈萨克自治县'),('652223',NULL,'伊吾县'),('652300',NULL,'昌吉回族自治州'),('652301',NULL,'昌吉市'),('652302',NULL,'阜康市'),('652303',NULL,'米泉市'),('652323',NULL,'呼图壁县'),('652324',NULL,'玛纳斯县'),('652325',NULL,'奇台县'),('652327',NULL,'吉木萨尔县'),('652328',NULL,'木垒哈萨克自治县'),('652700',NULL,'博尔塔拉蒙古自治州'),('652701',NULL,'博乐市'),('652722',NULL,'精河县'),('652723',NULL,'温泉县'),('652800',NULL,'巴音郭楞蒙古自治州'),('652801',NULL,'库尔勒市'),('652822',NULL,'轮台县'),('652823',NULL,'尉犁县'),('652824',NULL,'若羌县'),('652825',NULL,'且末县'),('652826',NULL,'焉耆回族自治县'),('652827',NULL,'和静县'),('652828',NULL,'和硕县'),('652829',NULL,'博湖县'),('652900',NULL,'阿克苏地区'),('652901',NULL,'阿克苏市'),('652922',NULL,'温宿县'),('652923',NULL,'库车县'),('652924',NULL,'沙雅县'),('652925',NULL,'新和县'),('652926',NULL,'拜城县'),('652927',NULL,'乌什县'),('652928',NULL,'阿瓦提县'),('652929',NULL,'柯坪县'),('653000',NULL,'克孜勒苏柯尔克孜自治州'),('653001',NULL,'阿图什市'),('653022',NULL,'阿克陶县'),('653023',NULL,'阿合奇县'),('653024',NULL,'乌恰县'),('653100',NULL,'喀什地区'),('653101',NULL,'喀什市'),('653121',NULL,'疏附县'),('653122',NULL,'疏勒县'),('653123',NULL,'英吉沙县'),('653124',NULL,'泽普县'),('653125',NULL,'莎车县'),('653126',NULL,'叶城县'),('653127',NULL,'麦盖提县'),('653128',NULL,'岳普湖县'),('653129',NULL,'伽师县'),('653130',NULL,'巴楚县'),('653131',NULL,'塔什库尔干塔吉克自治县'),('653200',NULL,'和田地区'),('653201',NULL,'和田市'),('653221',NULL,'和田县'),('653222',NULL,'墨玉县'),('653223',NULL,'皮山县'),('653224',NULL,'洛浦县'),('653225',NULL,'策勒县'),('653226',NULL,'于田县'),('653227',NULL,'民丰县'),('654000',NULL,'伊犁哈萨克自治州'),('654002',NULL,'伊宁市'),('654003',NULL,'奎屯市'),('654021',NULL,'伊宁县'),('654022',NULL,'察布查尔锡伯自治县'),('654023',NULL,'霍城县'),('654024',NULL,'巩留县'),('654025',NULL,'新源县'),('654026',NULL,'昭苏县'),('654027',NULL,'特克斯县'),('654028',NULL,'尼勒克县'),('654200',NULL,'塔城地区'),('654201',NULL,'塔城市'),('654202',NULL,'乌苏市'),('654221',NULL,'额敏县'),('654223',NULL,'沙湾县'),('654224',NULL,'托里县'),('654225',NULL,'裕民县'),('654226',NULL,'和布克赛尔蒙古自治县'),('654300',NULL,'阿勒泰地区'),('654301',NULL,'阿勒泰市'),('654321',NULL,'布尔津县'),('654322',NULL,'富蕴县'),('654323',NULL,'福海县'),('654324',NULL,'哈巴河县'),('654325',NULL,'青河县'),('654326',NULL,'吉木乃县'),('659000',NULL,'省直辖行政单位'),('659001',NULL,'石河子市'),('659002',NULL,'阿拉尔市'),('659003',NULL,'图木舒克市'),('659004',NULL,'五家渠市'),('710000',NULL,'台湾省'),('710100',NULL,'台湾'),('810000',NULL,'香港特别行政区'),('810100',NULL,'香港'),('820000',NULL,'澳门特别行政区'),('820100',NULL,'澳门');
/*!40000 ALTER TABLE `video_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_birth_star`
--

DROP TABLE IF EXISTS `video_birth_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_birth_star` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `monthday` smallint(4) NOT NULL,
  `starname` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_birth_star`
--

LOCK TABLES `video_birth_star` WRITE;
/*!40000 ALTER TABLE `video_birth_star` DISABLE KEYS */;
INSERT INTO `video_birth_star` VALUES (1,119,'摩羯座'),(2,120,'水瓶座'),(3,218,'水瓶座'),(4,219,'双鱼座'),(5,320,'双鱼座'),(6,321,'白羊座'),(7,420,'白羊座'),(8,421,'金牛座'),(9,520,'金牛座'),(10,521,'双子座'),(11,621,'双子座'),(12,622,'巨蟹座'),(13,722,'巨蟹座'),(14,723,'狮子座'),(15,822,'狮子座'),(16,823,'处女座'),(17,922,'处女座'),(18,923,'天枰座'),(19,1023,'天枰座'),(20,1024,'天蝎座'),(21,1122,'天蝎座'),(22,1123,'射手座'),(23,1221,'射手座'),(24,1222,'摩羯座');
/*!40000 ALTER TABLE `video_birth_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_level_exp`
--

DROP TABLE IF EXISTS `video_level_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_level_exp` (
  `level_id` int(10) NOT NULL,
  `level_name` varchar(20) DEFAULT NULL,
  `level_title` varchar(20) DEFAULT NULL COMMENT '头衔',
  `level_value` int(10) DEFAULT NULL,
  `open_guest` tinyint(1) DEFAULT '0' COMMENT '允许发起竞彩，1=允许',
  `open_user_level` tinyint(1) DEFAULT '0' COMMENT '允许设置进入用户等级',
  `open_pay_room` tinyint(1) DEFAULT '0' COMMENT '允许设定付费房间',
  `open_song_price` tinyint(1) DEFAULT '0' COMMENT '允许设定点歌价格',
  `ratio` tinyint(2) DEFAULT NULL COMMENT '分成比率',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播等级配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_level_exp`
--

LOCK TABLES `video_level_exp` WRITE;
/*!40000 ALTER TABLE `video_level_exp` DISABLE KEYS */;
INSERT INTO `video_level_exp` VALUES (1,'实习','实习生',0,0,0,0,0,30),(2,'1星','美女',10000,0,0,0,0,40),(3,'2星','美女',30000,0,0,0,0,40),(4,'3星','美女',60000,1,0,0,0,40),(5,'4星','美女',100000,1,0,0,0,40),(6,'5星','美女',150000,1,0,0,0,40),(7,'1钻','明星',250000,1,1,1,0,45),(8,'2钻','明星',400000,1,1,1,0,45),(9,'3钻','明星',600000,1,1,1,1,45),(10,'4钻','明星',850000,1,1,1,1,45),(11,'5钻','明星',1150000,1,1,1,1,45),(12,'1皇冠','传奇',1550000,1,1,1,1,50),(13,'2皇冠','传奇',2050000,1,1,1,1,50),(14,'3皇冠','传奇',2650000,1,1,1,1,50),(15,'4皇冠','传奇',3350000,1,1,1,1,NULL);
/*!40000 ALTER TABLE `video_level_exp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_level_rich`
--

DROP TABLE IF EXISTS `video_level_rich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_level_rich` (
  `level_id` int(10) NOT NULL,
  `level_name` varchar(20) DEFAULT NULL,
  `level_value` int(10) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户财富等级配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_level_rich`
--

LOCK TABLES `video_level_rich` WRITE;
/*!40000 ALTER TABLE `video_level_rich` DISABLE KEYS */;
INSERT INTO `video_level_rich` VALUES (1,'新手上路',0),(2,'Lv1青铜',1000),(3,'Lv2青铜',3000),(4,'Lv3青铜',6000),(5,'Lv4青铜',10000),(6,'Lv5青铜',15000),(7,'Lv6青铜',21000),(8,'Lv7青铜',28000),(9,'Lv8青铜',36000),(10,'Lv9青铜',45000),(11,'Lv1白银',58000),(12,'Lv2白银',75000),(13,'Lv3白银',96000),(14,'Lv4白银',121000),(15,'Lv5白银',150000),(16,'Lv6白银',183000),(17,'Lv7白银',220000),(18,'Lv8白银',261000),(19,'Lv9白银',306000),(20,'Lv1黄金',359000),(21,'Lv2黄金',420000),(22,'Lv3黄金',489000),(23,'Lv4黄金',566000),(24,'Lv5黄金',651000),(25,'Lv6黄金',744000),(26,'Lv7黄金',845000),(27,'Lv8黄金',954000),(28,'Lv9黄金',1071000);
/*!40000 ALTER TABLE `video_level_rich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_tag`
--

DROP TABLE IF EXISTS `video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_tag` (
  `tag_id` smallint(6) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_tag`
--

LOCK TABLES `video_tag` WRITE;
/*!40000 ALTER TABLE `video_tag` DISABLE KEYS */;
INSERT INTO `video_tag` VALUES (1,'普通专区'),(2,'会员专区'),(3,'小编推荐');
/*!40000 ALTER TABLE `video_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_goods`
--

DROP TABLE IF EXISTS `video_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_goods` (
  `gid` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `price` int(10) NOT NULL,
  `category` int(10) NOT NULL,
  `unit_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '购买单位方式,1=计件；2=计时',
  `category_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_goods`
--

LOCK TABLES `video_goods` WRITE;
/*!40000 ALTER TABLE `video_goods` DISABLE KEYS */;
INSERT INTO `video_goods` VALUES (120001,'私人直升机（月）','坐骑',80000,1002,2,'坐骑'),(120003,'八抬大轿（月）','坐骑',40000,1002,2,'坐骑'),(120004,'兰博基尼（月）','坐骑',20000,1002,2,'坐骑'),(120007,'哈雷摩托（月）','坐骑',10000,1002,2,'坐骑'),(210003,'坐席','1',20,1004,1,'坐席'),(310001,'钻戒','钻石很久远，一颗就…',450,1,1,'热门'),(310002,'项链','戴着它，我好像一下变得高贵了',320,1,1,'热门'),(310003,'香奈儿包包','有钱就是任性，来一打',300,1,1,'热门'),(310004,'皇冠','只有尊贵的人才配得上我',200,1,1,'热门'),(310005,'DIRO香水','我是迪奥，不是奥迪哦',150,1,1,'热门'),(310006,'人头马','壕们都是把我当啤酒喝',100,1,1,'热门'),(310007,'抱抱熊','需要抱抱吗',70,1,1,'热门'),(310008,'便便','阿拉蕾最喜欢的玩具',60,1,1,'热门'),(310009,'抱枕','睡觉抱着我最舒服了',50,1,1,'热门'),(310010,'情书','男女朋友都通用的情书哦',40,1,1,'热门'),(310011,'冰激凌','快点吃掉我，我快化掉了',35,1,1,'热门'),(310012,'粉钻','南非产正板粉钻',35,1,1,'热门'),(310013,'蛋糕','吃多了会长胖的哦',20,1,1,'热门'),(310014,'香吻','只献给最喜欢的人',15,1,1,'热门'),(310015,'喉宝','喉宝助你好声音',15,1,1,'热门'),(310016,'鲜花','请不要把我插在牛粪上',10,1,1,'热门'),(310017,'板砖','任你再叼，一砖拍倒',5,1,1,'热门'),(310018,'棒棒糖','棒棒，好棒哦',5,1,1,'热门'),(310019,'iphone6','土豪金才符合我的气质呢',100,1,1,'热门'),(310020,'挖掘机','挖掘机技术哪家强呢',5,1,1,'热门'),(320001,'浪漫樱花之恋','绝世浪漫',70000,2,1,'高级'),(320002,'带字粉丝灯牌','可不是一般的灯牌哦',40000,2,1,'高级'),(320003,'烛光晚餐','只把最好的留给你',21000,2,1,'高级'),(320004,'梦幻城堡','爱TA就送TA一座城堡',15000,2,1,'高级'),(320005,'私人游艇','属于你的豪华游艇',14000,2,1,'高级'),(320006,'兰博基尼','限量版兰博基尼',9000,2,1,'高级'),(320007,'烟花','去年烟花特别多',6000,2,1,'高级'),(320008,'丘比特之箭','用它让主播爱上你吧',5000,2,1,'高级'),(320009,'幸福摩天轮','幸福转转转',1200,2,1,'高级'),(320010,'放飞气球','飞屋环球必备',600,2,1,'高级'),(700001,'飞屏','房间内的飞屏',100,1005,1,'飞屏'),(700002,'广播','广播',200,1006,1,'广播');
/*!40000 ALTER TABLE `video_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-18 19:07:56
