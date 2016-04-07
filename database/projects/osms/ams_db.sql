-- MySQL dump 10.13  Distrib 5.6.21, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: ams_db
-- ------------------------------------------------------
-- Server version	5.6.20-log

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
-- Current Database: `ams_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ams_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `ams_db`;

--
-- Table structure for table `ams_disk`
--

DROP TABLE IF EXISTS `ams_disk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ams_disk` (
  `disk_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '磁盘ID，自增主键',
  `server_id` int(10) unsigned NOT NULL COMMENT '服务器ID,ams_server表主键',
  `disk_size` varchar(32) NOT NULL COMMENT '磁盘大小',
  `disk_iops` varchar(64) DEFAULT NULL COMMENT '磁盘IOPS性能',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `crttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dmltime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据变更时间',
  PRIMARY KEY (`disk_id`),
  KEY `server_id_key` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='磁盘信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ams_disk`
--

LOCK TABLES `ams_disk` WRITE;
/*!40000 ALTER TABLE `ams_disk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ams_disk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ams_server`
--

DROP TABLE IF EXISTS `ams_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ams_server` (
  `server_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务器ID，自增主键',
  `server_code` varchar(64) NOT NULL COMMENT '服务(设备)编号，唯一',
  `domain` varchar(64) DEFAULT NULL COMMENT '域名',
  `ip_ex` int(11) NOT NULL DEFAULT '0' COMMENT '外网IP',
  `ip_in` int(11) NOT NULL DEFAULT '0' COMMENT '内网IP',
  `project_id` int(11) NOT NULL COMMENT '对应项目ID（scfg_dict表的pre_id=1）',
  `os` int(11) NOT NULL COMMENT '操作系统ID（scfg_dict表的pre_id=2）',
  `cpu` varchar(32) DEFAULT NULL COMMENT 'CPU信息',
  `cpu_num` int(11) NOT NULL COMMENT 'CPU数量',
  `cpu_cores` int(11) NOT NULL COMMENT 'CPU核数',
  `memory` int(11) NOT NULL COMMENT '内存大小(G)',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `crttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dmltime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据变更时间',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `server_code` (`server_code`),
  KEY `ip_ex_key` (`ip_ex`),
  KEY `ip_in_key` (`ip_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ams_server`
--

LOCK TABLES `ams_server` WRITE;
/*!40000 ALTER TABLE `ams_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `ams_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ams_server_comments`
--

DROP TABLE IF EXISTS `ams_server_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ams_server_comments` (
  `auid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务自增主键',
  `server_id` int(10) unsigned NOT NULL COMMENT '服务器ID,ams_server表主键',
  `comments` blob COMMENT '服务补充描述',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `crttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dmltime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据变更时间',
  PRIMARY KEY (`auid`),
  KEY `server_id_key` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器描述信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ams_server_comments`
--

LOCK TABLES `ams_server_comments` WRITE;
/*!40000 ALTER TABLE `ams_server_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ams_server_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-17 18:33:17
