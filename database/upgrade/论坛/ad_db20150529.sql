-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 05 月 27 日 09:30
-- 服务器版本: 5.5.36
-- PHP 版本: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ad13565`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `ad`
--

INSERT INTO `ad` (`id`, `classid`, `name`) VALUES
(38, 62, '推广页面12'),
(36, 50, '推广页面测试3'),
(34, 49, '推广页面测试1'),
(35, 49, '推广页面测试2'),
(47, 58, '推广页面19'),
(46, 65, '推广页面18'),
(45, 65, '推广页面137'),
(44, 65, '推广页面17'),
(43, 65, '推广页面12'),
(42, 62, '推广页面15'),
(41, 58, '推广页面14'),
(40, 56, '推广页面14'),
(39, 61, '推广页面13'),
(48, 53, '推广页面13'),
(49, 58, '推广页面22'),
(50, 58, '推广页面23'),
(51, 58, '推广页面24'),
(52, 52, '推广页面25');

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
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'xim', 1432690071),
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `ad_class`
--

INSERT INTO `ad_class` (`id`, `name`, `path`, `domain`) VALUES
(54, '广告单元测试', 'test0988', 'http://www.baidu.com/'),
(53, '广告单元测试7', 'test543', 'http://www.sohu.com/'),
(50, '广告单元测试3', 'test3', 'http://ad2.13565.com/'),
(52, '广告单元测试6', 'test345', 'http://www.sina.com/'),
(49, '测试广告单元2', 'test', 'http://ad1.13565.com/'),
(55, '广告单元测试890', 'test90897', 'http://www.baidu.com/'),
(56, '广告单元测试456', 'test5', 'http://www.baidu.com/'),
(57, '广告单元测试652', 'test451', 'http://www.baidu.com/'),
(58, '广告单元测试9', 'test654', 'http://www.baidu.com/'),
(59, '广告单元测试12', 'test781', 'http://www.baidu.com/'),
(60, '广告单元测试21', 'test098', 'http://www.baidu.com/'),
(61, '广告单元测试90', 'test67', 'http://www.baidu.com/'),
(62, '广告单元测试072', 'test560', 'http://www.baidu.com/'),
(63, '广告单元测试', 'test904', 'http://www.baidu.com/'),
(64, '广告单元测试', 'test892', 'http://www.baidu.com/'),
(65, '广告单元测试289', 'test901', 'http://www.baidu.com/');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `ad_position`
--

INSERT INTO `ad_position` (`classid`, `id`, `adid`, `name`, `code`, `height`, `width`, `link`, `path`) VALUES
(53, 55, 48, '国庆7天1折起', '57890', 300, 200, NULL, NULL),
(58, 54, 51, '5.1全站促销', '454590', 200, 200, NULL, NULL),
(58, 52, 51, '维多利亚诞辰金币送送送', '56879', 200, 200, NULL, NULL),
(58, 53, 51, '视频会员免费', '435435', 100, 200, NULL, NULL),
(56, 51, 40, '足彩中奖', '3534545', 180, 171, 'www.online.sh.cn', '3534545.gif'),
(53, 49, 48, '送金币', '4545', 100, 100, NULL, NULL),
(61, 50, 39, '新春抢号-vip', '342123', 200, 100, NULL, NULL),
(58, 48, 49, '终身免费', '4545', 100, 200, NULL, NULL),
(49, 47, 34, '买一送一', '4543545', 100, 100, NULL, NULL),
(62, 46, 38, 'VIP 0元起', '43656', 180, 180, NULL, NULL),
(56, 45, 40, '双十一', '68780', 100, 200, NULL, NULL),
(58, 44, 49, '母亲节', '46879', 200, 800, NULL, NULL),
(62, 43, 38, '2015情人节', '24659', 100, 200, NULL, NULL),
(50, 42, 36, '广告标题测试123', '4545711646676', 300, 300, 'http://www.qq.com', '4545711646676.gif'),
(49, 41, 35, '广告标题测试5', '23253567000', 200, 200, 'www.online.sh.cn', '23253567000.gif'),
(49, 39, 34, '顶部横幅', '1', 60, 480, 'https://grabcad.com/', '1.gif');

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `insert_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `log`
--

INSERT INTO `log` (`id`, `content`, `insert_time`) VALUES
(1, 'admin执行了 添加广告单元fdasfff的操作', '2015-05-25 23:06:38'),
(2, 'admin 执行了 编辑 广告单元 fdasfff的操作', '2015-05-25 23:07:13'),
(3, 'admin 执行了 添加 广告单元 FDSAFASFAS的操作', '2015-05-25 23:13:52'),
(4, 'admin 执行了 编辑 广告单元 FDSAFASFAS的操作', '2015-05-26 10:07:36'),
(5, 'admin 执行了 添加 广告单元 测试广告单元的操作', '2015-05-26 10:09:58'),
(6, 'admin 执行了 更新广告位置 测试广告位  的操作', '2015-05-26 10:11:57'),
(7, 'admin 执行了 更新广告位置 测试广告位  的操作', '2015-05-26 10:26:54'),
(8, 'admin 执行了 删除  广告  38,37,36,35的操作', '2015-05-26 10:50:21'),
(9, 'admin 执行了 删除  广告单元 48的操作', '2015-05-26 11:01:12'),
(10, 'admin 执行了 删除  广告单元 47,46,43,42的操作', '2015-05-26 11:01:19'),
(11, 'admin 执行了 更新广告位置 顶部横幅  的操作', '2015-05-26 11:04:26'),
(12, 'admin 执行了 更新广告位置 顶部横幅  的操作', '2015-05-26 11:07:18'),
(13, 'admin 执行了 编辑 广告单元 测试广告单元1的操作', '2015-05-26 11:08:37'),
(14, 'admin 执行了 编辑 广告单元 测试广告单元2的操作', '2015-05-26 11:09:48'),
(15, 'admin 执行了 添加 广告单元 广告单元测试3的操作', '2015-05-26 11:25:49'),
(16, 'admin 执行了 更新广告位置 测试广告标题  的操作', '2015-05-26 11:35:37'),
(17, 'admin 执行了 删除  广告  40的操作', '2015-05-26 11:39:10'),
(18, 'admin 执行了 更新广告位置 广告标题测试5  的操作', '2015-05-26 11:40:40'),
(19, 'admin 执行了 编辑 广告单元 广告单元测试3的操作', '2015-05-26 18:15:30'),
(20, 'admin 执行了 添加 广告单元 fdsafasfa的操作', '2015-05-26 18:15:58'),
(21, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 18:17:21'),
(22, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 18:17:24'),
(23, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 19:07:08'),
(24, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 19:07:16'),
(25, 'admin 执行了 编辑 广告单元 测试广告单元2的操作', '2015-05-26 19:07:24'),
(26, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 19:07:28'),
(27, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 19:07:51'),
(28, 'admin 执行了 编辑 广告单元 fdsafasfa的操作', '2015-05-26 19:08:11'),
(29, 'admin 执行了 编辑 广告单元 广告单元测试3的操作', '2015-05-26 19:08:42'),
(30, 'admin 执行了 删除  广告单元 51的操作', '2015-05-26 19:08:46'),
(31, 'admin 执行了 更新广告位置 广告标题测试123  的操作', '2015-05-26 19:13:29'),
(32, 'admin 执行了 编辑 广告单元 测试广告单元2的操作', '2015-05-26 19:14:05'),
(33, 'admin 执行了 编辑 广告单元 广告单元测试3的操作', '2015-05-26 19:14:11'),
(34, 'admin 执行了 更新广告位置 广告标题测试123  的操作', '2015-05-26 19:15:06'),
(35, 'admin 执行了 添加 广告单元 广告单元测试6的操作', '2015-05-27 03:22:07'),
(36, 'admin 执行了 添加 广告单元 广告单元测试7的操作', '2015-05-27 03:23:39'),
(37, 'admin 执行了 添加 广告单元 广告单元测试的操作', '2015-05-27 03:24:36'),
(38, 'admin 执行了 添加 广告单元 广告单元测试890的操作', '2015-05-27 03:25:00'),
(39, 'admin 执行了 添加 广告单元 广告单元测试456的操作', '2015-05-27 03:25:40'),
(40, 'admin 执行了 添加 广告单元 广告单元测试652的操作', '2015-05-27 03:26:04'),
(41, 'admin 执行了 添加 广告单元 广告单元测试9的操作', '2015-05-27 03:26:24'),
(42, 'admin 执行了 添加 广告单元 广告单元测试12的操作', '2015-05-27 03:26:48'),
(43, 'admin 执行了 添加 广告单元 广告单元测试21的操作', '2015-05-27 03:27:10'),
(44, 'admin 执行了 添加 广告单元 广告单元测试90的操作', '2015-05-27 03:27:25'),
(45, 'admin 执行了 添加 广告单元 广告单元测试072的操作', '2015-05-27 03:27:46'),
(46, 'admin 执行了 添加 广告单元 广告单元测试的操作', '2015-05-27 03:28:05'),
(47, 'admin 执行了 添加 广告单元 广告单元测试的操作', '2015-05-27 03:28:27'),
(48, 'admin 执行了 添加 广告单元 广告单元测试289的操作', '2015-05-27 03:28:48'),
(49, 'admin 执行了 更新广告位置 足彩中奖  的操作', '2015-05-27 03:40:38');
