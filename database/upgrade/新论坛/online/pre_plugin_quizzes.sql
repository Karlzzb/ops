-- phpMyAdmin SQL Dump
-- version 4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2015 at 04:43 PM
-- Server version: 5.6.24-log
-- PHP Version: 5.5.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ultrax`
--

-- --------------------------------------------------------

--
-- Table structure for table `pre_plugin_quizzes`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_quizzes` (
  `qid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `answer` enum('A','B','C','D') NOT NULL,
  `reward` tinyint(3) NOT NULL DEFAULT '0',
  `instruction` text,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodify` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adminid` int(10) unsigned NOT NULL,
  `status` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_plugin_quizzes`
--

INSERT INTO `pre_plugin_quizzes` (`qid`, `title`, `answer`, `reward`, `instruction`, `createtime`, `lastmodify`, `adminid`, `status`) VALUES
(1, '神马是RMB彩金啊？', 'B', 15, '1、回答正确，可获得金币 %reward% 枚\r\n2、每天只能参与一次\r\n3、RMB彩金是论坛的一种积分形式，和金币、银币一样。\r\n4、RMB彩金等同于人民币，10000 RMB 彩金就可以换100元人民币。', '2015-07-13 17:00:45', '2015-07-14 05:19:29', 1, 1),
(2, '发布器下载地址', 'A', 0, '', '2015-07-13 17:00:45', '2015-07-14 06:11:01', 1, 1),
(3, '2015年信誉优质的网络博彩公司是？', 'B', 20, '打开地址发布器，答案就在你眼前\r\n1、回答正确，可获得金币 %reward% 枚\r\n2、每天只能参与一次', '2015-07-13 17:01:45', '2015-07-14 06:04:27', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_plugin_quizzes`
--
ALTER TABLE `pre_plugin_quizzes`
  ADD PRIMARY KEY (`qid`), ADD KEY `openid` (`title`), ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_plugin_quizzes`
--
ALTER TABLE `pre_plugin_quizzes`
  MODIFY `qid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
