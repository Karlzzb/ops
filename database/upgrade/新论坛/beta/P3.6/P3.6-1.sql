/*
/home/script/bbs/online_svn/SQL/P3.6
1.pre_plugin_lotteryadv_advmanage.sql
*/
use discuz_db;
﻿-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 192.168.1.222
-- Generation Time: 2015-11-27 00:10:39
-- 服务器版本： 5.6.19
-- PHP Version: 5.5.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discuz_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_plugin_lotteryadv_advmanage`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_lotteryadv_advmanage` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增长广告商ID编号',
  `title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '广告商名称',
  `position` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '广告位置',
  `logo` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '广告logo',
  `sortid` int(3) DEFAULT NULL COMMENT '广告排序',
  `security` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '安全保障',
  `gameplatform` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '游戏平台',
  `cashtime` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '提现时间',
  `description` text COLLATE utf8_bin COMMENT '广告描述',
  `site` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '官方网站',
  `cservice` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '客服链接',
  `focus` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '热点关注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '初始状态0值，后台广告编辑框加红边提醒输入明细，明细添加后1值',
  `time` int(20) NOT NULL COMMENT '记录添加或明细更新时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博彩广告公司信息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `pre_plugin_lotteryadv_advmanage`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

