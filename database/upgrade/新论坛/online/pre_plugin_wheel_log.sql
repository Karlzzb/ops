-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2015 at 05:58 PM
-- Server version: 5.6.19
-- PHP Version: 5.5.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discuz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pre_plugin_wheel_log`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_wheel_log` (
  `logid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `prize_id` int(10) NOT NULL,
  `is_give` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否派奖了 0/1 否/是',
  `type` char(12) CHARACTER SET utf8 DEFAULT NULL COMMENT 'vip,gold,link,again',
  `position` tinyint(3) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=73 ;

--
-- Dumping data for table `pre_plugin_wheel_log`
--

INSERT INTO `pre_plugin_wheel_log` (`logid`, `uid`, `uname`, `prize_id`, `is_give`, `type`, `position`, `createtime`) VALUES
(9, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 03:01:46'),
(10, 1, 'admin', 0, 0, 'welcome', 4, '2015-07-22 03:03:57'),
(11, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 03:04:45'),
(12, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 03:08:21'),
(13, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 03:08:35'),
(14, 1, 'admin', 0, 0, 'welcome', 8, '2015-07-22 03:11:54'),
(15, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 03:13:29'),
(16, 1, 'admin', 2, 0, 'vip', 2, '2015-07-22 03:15:29'),
(17, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 03:43:59'),
(18, 1, 'admin', 2, 0, 'vip', 4, '2015-07-22 03:44:33'),
(19, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 03:46:29'),
(20, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 03:47:27'),
(21, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 03:48:59'),
(22, 1, 'admin', 0, 0, 'welcome', 8, '2015-07-22 03:49:25'),
(23, 1, 'admin', 0, 0, 'welcome', 9, '2015-07-22 03:51:23'),
(24, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 04:26:51'),
(25, 1, 'admin', 2, 0, 'vip', 2, '2015-07-22 04:28:50'),
(26, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 04:29:56'),
(27, 1, 'admin', 2, 0, 'vip', 4, '2015-07-22 04:30:09'),
(28, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 04:31:16'),
(29, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 04:31:31'),
(30, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 04:31:47'),
(31, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 05:57:17'),
(32, 1, 'admin', 2, 0, '1', 2, '2015-07-22 05:57:57'),
(33, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 05:59:01'),
(34, 1, 'admin', 2, 0, '1', 4, '2015-07-22 05:59:52'),
(35, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 06:00:07'),
(36, 1, 'admin', 2, 0, '1', 2, '2015-07-22 06:00:22'),
(37, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 06:06:36'),
(38, 1, 'admin', 2, 0, '1', 4, '2015-07-22 06:06:51'),
(39, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 06:30:55'),
(40, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 06:32:38'),
(41, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 06:33:46'),
(42, 1, 'admin', 0, 0, 'welcome', 8, '2015-07-22 06:36:26'),
(43, 1, 'admin', 0, 0, 'welcome', 9, '2015-07-22 06:36:37'),
(44, 1, 'admin', 0, 0, 'welcome', 10, '2015-07-22 06:38:04'),
(45, 1, 'admin', 0, 0, 'welcome', 11, '2015-07-22 06:39:43'),
(46, 1, 'admin', 0, 0, 'welcome', 12, '2015-07-22 06:39:58'),
(47, 1, 'admin', 0, 0, 'welcome', 13, '2015-07-22 06:42:23'),
(48, 1, 'admin', 0, 0, 'welcome', 14, '2015-07-22 06:43:21'),
(49, 1, 'admin', 0, 0, 'welcome', 15, '2015-07-22 06:43:42'),
(50, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 08:14:44'),
(51, 1, 'admin', 2, 0, 'vip', 2, '2015-07-22 08:15:31'),
(52, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 08:15:50'),
(53, 1, 'admin', 2, 0, 'vip', 4, '2015-07-22 08:16:04'),
(54, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 08:16:18'),
(55, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 08:16:40'),
(56, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 08:17:19'),
(57, 1, 'admin', 0, 0, 'welcome', 8, '2015-07-22 08:17:35'),
(58, 1, 'admin', 0, 0, 'welcome', 9, '2015-07-22 08:18:24'),
(59, 1, 'admin', 0, 0, 'welcome', 10, '2015-07-22 08:19:34'),
(60, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 08:20:55'),
(61, 1, 'admin', 2, 1, 'vip', 2, '2015-07-22 08:21:37'),
(62, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 08:21:51'),
(63, 1, 'admin', 2, 0, 'vip', 4, '2015-07-22 08:22:07'),
(64, 1, 'admin', 0, 0, 'welcome', 5, '2015-07-22 08:22:32'),
(65, 1, 'admin', 0, 0, 'welcome', 6, '2015-07-22 08:22:47'),
(66, 1, 'admin', 0, 0, 'welcome', 7, '2015-07-22 08:23:23'),
(67, 1, 'admin', 0, 0, 'welcome', 8, '2015-07-22 08:24:05'),
(68, 1, 'admin', 0, 0, 'welcome', 9, '2015-07-22 08:24:43'),
(69, 1, 'admin', 0, 0, 'welcome', 10, '2015-07-22 08:25:02'),
(70, 1, 'admin', 4, 0, 'vip', 1, '2015-07-22 09:41:54'),
(71, 1, 'admin', 2, 0, 'vip', 2, '2015-07-22 09:42:13'),
(72, 1, 'admin', 0, 0, 'welcome', 3, '2015-07-22 09:48:16');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
