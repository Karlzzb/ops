-- MySQL dump 10.13  Distrib 5.6.21, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: scfg_db
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
-- Current Database: `scfg_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `scfg_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `scfg_db`;

--
-- Table structure for table `scfg_admin`
--

DROP TABLE IF EXISTS `scfg_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_admin` (
  `amid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `admin` varchar(45) NOT NULL COMMENT '管理员帐号',
  `passwd` varchar(32) NOT NULL COMMENT '管理员密码',
  `name` varchar(45) NOT NULL COMMENT '管理员名称',
  `mobile` char(16) NOT NULL COMMENT '管理员手机号',
  `mail` varchar(64) NOT NULL COMMENT '管理员邮箱',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态：0-不启用（默认）；1-启用',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  `py` char(32) NOT NULL DEFAULT '',
  `pinyin` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`amid`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='系统 管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_admin`
--

LOCK TABLES `scfg_admin` WRITE;
/*!40000 ALTER TABLE `scfg_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_city`
--

DROP TABLE IF EXISTS `scfg_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_city` (
  `city_code` int(10) unsigned NOT NULL COMMENT '市县编码',
  `ocity_code` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '市编码(大众点评)',
  `city_name` varchar(32) NOT NULL COMMENT '市县名称',
  `prov_code` int(10) unsigned NOT NULL COMMENT '所属省编码',
  `prov_name` varchar(32) NOT NULL COMMENT '省份名称',
  `py` char(8) NOT NULL,
  `pinyin` char(128) NOT NULL COMMENT '全拼',
  PRIMARY KEY (`city_code`),
  KEY `prov_key` (`prov_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全国市县代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_city`
--

LOCK TABLES `scfg_city` WRITE;
/*!40000 ALTER TABLE `scfg_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_dept`
--

DROP TABLE IF EXISTS `scfg_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_dept` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `preid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级节点ID，默认0-TOP',
  `full_did` varchar(128) NOT NULL DEFAULT '' COMMENT '全ID（父全ID_自ID）',
  `dept_name` varchar(32) NOT NULL COMMENT '部门名称',
  `lel` tinyint(4) NOT NULL DEFAULT '1' COMMENT '部门层级层级',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `pre_key` (`preid`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COMMENT='部门信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_dept`
--

LOCK TABLES `scfg_dept` WRITE;
/*!40000 ALTER TABLE `scfg_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_dict`
--

DROP TABLE IF EXISTS `scfg_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_dict` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pre_id` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `rfc` varchar(64) NOT NULL DEFAULT '' COMMENT '相关说明',
  `dmlflag` tinyint(4) NOT NULL,
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`did`),
  KEY `pre_key` (`pre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131615 DEFAULT CHARSET=utf8 COMMENT='系统字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_dict`
--

LOCK TABLES `scfg_dict` WRITE;
/*!40000 ALTER TABLE `scfg_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_district`
--

DROP TABLE IF EXISTS `scfg_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_district` (
  `dist_code` int(10) unsigned NOT NULL COMMENT '区县编码',
  `dist_name` varchar(32) NOT NULL COMMENT '区县名称',
  `full_name` varchar(64) NOT NULL,
  `prov_code` int(10) unsigned NOT NULL COMMENT '所属省编码',
  `prov_name` varchar(32) NOT NULL COMMENT '省份名称',
  `city_code` int(10) unsigned NOT NULL COMMENT '所属市编码',
  `city_name` varchar(32) NOT NULL,
  `py` char(16) NOT NULL,
  `pinyin` char(128) NOT NULL COMMENT '全拼',
  PRIMARY KEY (`dist_code`),
  KEY `prov_key` (`prov_code`),
  KEY `city_key` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区县代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_district`
--

LOCK TABLES `scfg_district` WRITE;
/*!40000 ALTER TABLE `scfg_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_func`
--

DROP TABLE IF EXISTS `scfg_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_func` (
  `fcid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `name` varchar(64) NOT NULL COMMENT '功能名称',
  `mid` int(11) NOT NULL COMMENT '模块ID',
  `url` varchar(64) NOT NULL COMMENT '功能链接',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`fcid`),
  KEY `mid_key` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_func`
--

LOCK TABLES `scfg_func` WRITE;
/*!40000 ALTER TABLE `scfg_func` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_menu`
--

DROP TABLE IF EXISTS `scfg_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_menu` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `preid` int(11) NOT NULL DEFAULT '0' COMMENT '上级节点ID，默认0-TOP',
  `full_mid` varchar(128) NOT NULL DEFAULT '' COMMENT '全ID（父全ID_自ID）',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `url` varchar(128) NOT NULL COMMENT '菜单名称',
  `is_func` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否功能页面（0-否；1-是）',
  `lel` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单层级',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态：0-不启用（默认）；1-启用',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `pre_key` (`preid`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_menu`
--

LOCK TABLES `scfg_menu` WRITE;
/*!40000 ALTER TABLE `scfg_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_priv_data`
--

DROP TABLE IF EXISTS `scfg_priv_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_priv_data` (
  `amid` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `priv_code` bigint(20) unsigned NOT NULL COMMENT '权限维度（hid,hgid,rg_code,prov_code,city_code）',
  `priv_name` varchar(64) NOT NULL COMMENT '维度名称',
  `priv_type` tinyint(4) NOT NULL COMMENT '维度类型: 1-hid;2-hgid;3-rg_code;4-prov_code;5-city_code',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`amid`,`priv_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_priv_data`
--

LOCK TABLES `scfg_priv_data` WRITE;
/*!40000 ALTER TABLE `scfg_priv_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_priv_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_priv_func`
--

DROP TABLE IF EXISTS `scfg_priv_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_priv_func` (
  `rid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `fcid` int(10) unsigned NOT NULL COMMENT '功能ID',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`rid`,`fcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能权限信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_priv_func`
--

LOCK TABLES `scfg_priv_func` WRITE;
/*!40000 ALTER TABLE `scfg_priv_func` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_priv_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_priv_menu`
--

DROP TABLE IF EXISTS `scfg_priv_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_priv_menu` (
  `rid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `mid` int(10) unsigned NOT NULL COMMENT '模块ID',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`rid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_priv_menu`
--

LOCK TABLES `scfg_priv_menu` WRITE;
/*!40000 ALTER TABLE `scfg_priv_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_priv_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_province`
--

DROP TABLE IF EXISTS `scfg_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_province` (
  `prov_code` int(10) unsigned NOT NULL COMMENT '省级编码',
  `prov_name` varchar(32) NOT NULL COMMENT '省份名称',
  `py` char(8) NOT NULL,
  `pinyin` char(128) NOT NULL COMMENT '全拼',
  PRIMARY KEY (`prov_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全国省级代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_province`
--

LOCK TABLES `scfg_province` WRITE;
/*!40000 ALTER TABLE `scfg_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_region`
--

DROP TABLE IF EXISTS `scfg_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_region` (
  `rg_code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '大区编码',
  `prov_code` int(10) unsigned NOT NULL COMMENT '所包含的省份编码',
  `rg_name` varchar(32) NOT NULL COMMENT '大区名称',
  `prov_name` varchar(32) NOT NULL,
  `py` char(8) NOT NULL COMMENT '简拼',
  `pinyin` varchar(32) NOT NULL COMMENT '全拼',
  PRIMARY KEY (`rg_code`,`prov_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='全国区域代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_region`
--

LOCK TABLES `scfg_region` WRITE;
/*!40000 ALTER TABLE `scfg_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_role`
--

DROP TABLE IF EXISTS `scfg_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rname` varchar(45) NOT NULL COMMENT '角色名称',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态：0-不启用（默认）；1-启用',
  `role_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '角色类型：1-普通角色(默认);2-超级管理员;3-酒店自管理员',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='系统角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_role`
--

LOCK TABLES `scfg_role` WRITE;
/*!40000 ALTER TABLE `scfg_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_role_map`
--

DROP TABLE IF EXISTS `scfg_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_role_map` (
  `rid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `amid` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `dmlflag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作标识：1：新增；2：更新；3：删除。',
  `dmltime` datetime NOT NULL,
  PRIMARY KEY (`rid`,`amid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_role_map`
--

LOCK TABLES `scfg_role_map` WRITE;
/*!40000 ALTER TABLE `scfg_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scfg_threshold`
--

DROP TABLE IF EXISTS `scfg_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scfg_threshold` (
  `name` varchar(32) NOT NULL COMMENT '门限名',
  `value` int(11) NOT NULL COMMENT '门限值',
  `flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用:未启用（默认）',
  `mark` varchar(64) NOT NULL COMMENT '备注',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统阀值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scfg_threshold`
--

LOCK TABLES `scfg_threshold` WRITE;
/*!40000 ALTER TABLE `scfg_threshold` DISABLE KEYS */;
/*!40000 ALTER TABLE `scfg_threshold` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-17 18:33:31
