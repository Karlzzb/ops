-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2015 at 05:33 PM
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
-- Table structure for table `pre_plugin_wheel_prizes`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_wheel_prizes` (
  `prize_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` enum('A','B','C','D') NOT NULL,
  `type` char(12) DEFAULT NULL COMMENT 'vip,gold,link,again',
  `prize_name` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodify` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adminid` int(10) unsigned NOT NULL,
  `status` smallint(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`prize_id`),
  KEY `openid` (`prize_name`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pre_plugin_wheel_prizes`
--

INSERT INTO `pre_plugin_wheel_prizes` (`prize_id`, `group`, `type`, `prize_name`, `value`, `createtime`, `lastmodify`, `adminid`, `status`) VALUES
(1, 'A', 'vip', '全年VIP', '', '2015-07-15 19:17:50', '2015-07-22 06:14:40', 1, 1),
(2, 'A', 'vip', '半年VIP', '', '2015-07-15 19:17:50', '2015-07-22 06:14:40', 1, 1),
(3, 'A', 'vip', '季度VIP', '', '2015-07-15 19:18:17', '2015-07-22 06:14:40', 1, 1),
(4, 'B', 'vip', '18天VIP', '', '2015-07-15 21:35:28', '2015-07-22 06:14:40', 1, 1),
(5, 'B', 'link', '主播发布会门票', 'http://www.jd.com/', '2015-07-15 21:35:28', '2015-07-22 06:14:40', 1, 1),
(6, 'B', 'link', '鼠标垫', 'http://www.baidu.com', '2015-07-15 21:37:49', '2015-07-22 06:14:40', 1, 1),
(7, 'B', 'gold', '500金币', '500', '2015-07-15 21:37:49', '2015-07-22 06:14:40', 1, 1),
(8, 'C', 'gold', '50金币', '50', '2015-07-15 21:51:00', '2015-07-22 06:14:40', 1, 1),
(9, 'C', 'gold', '10金币', '10', '2015-07-15 21:51:00', '2015-07-22 06:14:40', 1, 1),
(10, 'C', 'again', '再来一局', '', '2015-07-15 21:51:42', '2015-07-22 06:14:40', 1, 1),
(11, 'D', '1', '每次摇奖扣除金币数', '2', '2015-07-15 21:59:29', '0000-00-00 00:00:00', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
