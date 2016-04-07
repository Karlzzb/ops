-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 06 月 16 日 14:17
-- 服务器版本: 5.5.36
-- PHP 版本: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `adnew`
--

-- --------------------------------------------------------

--
-- 表的结构 `ad`
--

CREATE TABLE IF NOT EXISTS `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ad`
--


-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `execute_users` varchar(20) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `pwd`, `execute_users`, `last_login_time`) VALUES
(4, 'ning', '18bd9197cb1d833bc352f47535c00320', 'xi9', 1431260411),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'xim', 1434435317),
(7, 'frank', 'e10adc3949ba59abbe56e057f20f883e', '弗兰克', NULL),
(8, '凯尔', 'e10adc3949ba59abbe56e057f20f883e', 'Care', NULL),
(9, 'Rick', 'e10adc3949ba59abbe56e057f20f883e', 'frank', 1431355557),
(10, 'Steven', 'e10adc3949ba59abbe56e057f20f883e', 'frank', NULL),
(11, '约翰', 'e10adc3949ba59abbe56e057f20f883e', 'John', 1431355659),
(12, 'William', 'e10adc3949ba59abbe56e057f20f883e', '威廉姆', NULL),
(13, 'Sharky', 'e10adc3949ba59abbe56e057f20f883e', 'Rodney', NULL),
(14, 'Michael', 'e10adc3949ba59abbe56e057f20f883e', 'Cooper', NULL),
(15, '赵三', 'e10adc3949ba59abbe56e057f20f883e', '李四', NULL),
(16, '鲁迅', 'e10adc3949ba59abbe56e057f20f883e', '赵本山', NULL),
(17, '王五', 'e10adc3949ba59abbe56e057f20f883e', 'wangwu', NULL),
(18, 'Fortinos', '25d55ad283aa400af464c76d713c07ad', 'Sara', NULL),
(19, 'Tena', 'e10adc3949ba59abbe56e057f20f883e', 'Flora', NULL),
(20, 'Johnathan', '25d55ad283aa400af464c76d713c07ad', 'Betty', NULL),
(21, 'Arrow', 'e10adc3949ba59abbe56e057f20f883e', 'Eric', NULL),
(22, 'Jason', 'e10adc3949ba59abbe56e057f20f883e', 'Jason', NULL),
(23, 'James', 'e10adc3949ba59abbe56e057f20f883e', '詹姆斯', NULL),
(24, 'Thomas', 'e10adc3949ba59abbe56e057f20f883e', '托马斯', NULL),
(25, '高登', 'e10adc3949ba59abbe56e057f20f883e', 'Gordon', NULL),
(26, '威尔森', 'e10adc3949ba59abbe56e057f20f883e', '威尔森', 1431370173),
(27, 'Rucas', 'e10adc3949ba59abbe56e057f20f883e', '卢卡斯', NULL),
(28, 'Spencer', 'e10adc3949ba59abbe56e057f20f883e', '斯班塞', NULL),
(29, 'Rock', '827ccb0eea8a706c4c34a16891f84e7b', '鲁克', NULL),
(30, 'Clark', '7215ee9c7d9dc229d2921a40e899ec5f', 'clark', NULL),
(32, '&……%￥3', 'e10adc3949ba59abbe56e057f20f883e', '#@￥%……）——+。。。', NULL),
(33, '12324', 'e10adc3949ba59abbe56e057f20f883e', '123456657', NULL),
(34, '圣斗士', '8da8f47f7c88a0a5dfebb50f6b592aa7', '圣斗士', NULL),
(35, 'authur', 'e10adc3949ba59abbe56e057f20f883e', ' ', NULL),
(36, 'feng', 'd3a16524e02537e36c93c050c7c61f7e', 'jinadmin', 1432403545),
(37, 'fadsfa', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'fasdfa', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ad_class`
--

CREATE TABLE IF NOT EXISTS `ad_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `domain` varchar(250) DEFAULT NULL,
  `tj_domain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ad_class`
--


-- --------------------------------------------------------

--
-- 表的结构 `ad_position`
--

CREATE TABLE IF NOT EXISTS `ad_position` (
  `classid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adid` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `link` varchar(300) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `keyname` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ad_position`
--


-- --------------------------------------------------------

--
-- 表的结构 `ad_tj`
--

CREATE TABLE IF NOT EXISTS `ad_tj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adid` int(11) DEFAULT NULL,
  `insert_time` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ad_tj`
--


-- --------------------------------------------------------

--
-- 表的结构 `css`
--

CREATE TABLE IF NOT EXISTS `css` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL,
  `adid` int(11) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `css`
--


-- --------------------------------------------------------

--
-- 表的结构 `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `classid` int(11) NOT NULL,
  `adid` int(11) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `groups`
--


-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `insert_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `log`
--

