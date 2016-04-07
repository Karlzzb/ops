-- phpMyAdmin SQL Dump
-- version 4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-07-17 22:09:58
-- 服务器版本： 5.6.24-log
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discuz32`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_plugin_daytask`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_daytask` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `reward` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(512) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `ctime` int(11) unsigned NOT NULL,
  `task` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pre_plugin_daytask`
--

INSERT INTO `pre_plugin_daytask` (`id`, `uid`, `title`, `reward`, `url`, `status`, `ctime`, `task`) VALUES
(1, 1, 'task1', 21, 'http://www.baidu.com', 1, 1433448654, 1),
(2, 1, 'task2', 21, '/1_1429796542.jpg', 1, 1433448749, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_plugin_daytask`
--
ALTER TABLE `pre_plugin_daytask`
  ADD PRIMARY KEY (`id`), ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_plugin_daytask`
--
ALTER TABLE `pre_plugin_daytask`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
