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
-- Table structure for table `pre_plugin_quizzes_option`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_quizzes_option` (
  `id` int(10) unsigned NOT NULL,
  `qid` int(10) NOT NULL,
  `option` enum('A','B','C','D') NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_plugin_quizzes_option`
--

INSERT INTO `pre_plugin_quizzes_option` (`id`, `qid`, `option`, `description`) VALUES
(1, 1, 'A', 'RMB彩金是论坛积分之一，赚取满1万彩金，可以提现RMB100元啊；'),
(3, 1, 'C', 'RMB彩金就是论坛一种积分，和金币、银币一样啊；'),
(4, 1, 'D', 'RMB彩金是博彩公司给论坛的返水啊；'),
(2, 1, 'B', 'RMB彩金是博彩公司给论坛的返水啊'),
(5, 2, 'A', 'http://my.discuz.plugin/data/download/v1.0.2.zip'),
(6, 2, 'B', 'http://my.discuz.plugin/data/download/LotteryQuiz.xls'),
(8, 3, 'A', '澳门上葡京http://www.spj0011.com/?intr=8945079 '),
(9, 3, 'B', '伯爵娱乐城http://www.116433.comm/?aff=300803 '),
(10, 3, 'C', '太阳城娱乐城http://www.sun4411.com/?Extend=18338870'),
(11, 3, 'D', '以上ABC答案都是正确的(我是对的，戳我) ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_plugin_quizzes_option`
--
ALTER TABLE `pre_plugin_quizzes_option`
  ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_plugin_quizzes_option`
--
ALTER TABLE `pre_plugin_quizzes_option`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
