-- phpMyAdmin SQL Dump
-- version 4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2015 at 04:42 PM
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
-- Table structure for table `pre_plugin_quizzes_log`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_quizzes_log` (
  `logid` int(11) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uname` varchar(64) DEFAULT NULL,
  `qid` int(10) NOT NULL,
  `type` enum('quiz','pc','mob','') NOT NULL,
  `answer` enum('A','B','C','D') NOT NULL,
  `reward` int(10) NOT NULL DEFAULT '0',
  `dateline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_plugin_quizzes_log`
--

INSERT INTO `pre_plugin_quizzes_log` (`logid`, `uid`, `uname`, `qid`, `type`, `answer`, `reward`, `dateline`) VALUES
(1, 1, 'admin', 1, 'quiz', 'A', 10, '2015-07-13 03:14:57'),
(2, 1, 'admin', 1, 'quiz', 'D', 0, '2015-07-14 03:20:57'),
(3, 11, 'test', 1, 'quiz', 'D', 0, '2015-07-13 15:45:24'),
(4, 1, 'admin', 1, 'quiz', 'A', 10, '2015-07-14 03:21:47'),
(5, 1, 'admin', 1, 'quiz', 'A', 10, '2015-07-14 03:21:51'),
(6, 1, 'admin', 1, 'quiz', 'C', 0, '2015-07-14 05:27:12'),
(7, 1, 'admin', 3, 'quiz', 'A', 0, '2015-07-13 05:37:20'),
(8, 1, 'admin', 3, 'quiz', 'B', 20, '2015-07-11 05:41:52'),
(9, 0, '', 2, 'mob', 'A', 0, '2015-07-12 05:54:17'),
(10, 0, '', 2, 'pc', 'A', 0, '2015-07-10 05:55:39'),
(11, 1, 'admin', 2, 'mob', 'A', 0, '2015-07-14 05:56:39'),
(12, 1, 'admin', 2, 'pc', 'A', 0, '2015-07-14 05:57:13'),
(13, 1, 'admin', 2, 'pc', 'A', 0, '2015-07-14 05:57:20'),
(14, 1, 'admin', 3, 'quiz', 'B', 20, '2015-07-14 06:34:10'),
(15, 1, 'admin', 2, 'pc', 'A', 0, '2015-07-14 07:37:13'),
(16, 1, 'admin', 2, 'pc', 'A', 0, '2015-07-14 07:37:25'),
(17, 1, 'admin', 2, 'mob', 'A', 0, '2015-07-14 08:05:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_plugin_quizzes_log`
--
ALTER TABLE `pre_plugin_quizzes_log`
  ADD PRIMARY KEY (`logid`), ADD KEY `uid` (`uid`), ADD KEY `operation` (`qid`), ADD KEY `relatedid` (`answer`), ADD KEY `dateline` (`dateline`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_plugin_quizzes_log`
--
ALTER TABLE `pre_plugin_quizzes_log`
  MODIFY `logid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
