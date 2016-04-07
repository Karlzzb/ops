-- phpMyAdmin SQL Dump
-- version 4.1.14.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2015 at 05:35 PM
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
-- Table structure for table `pre_plugin_wheel_rules`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_wheel_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_id` int(11) DEFAULT NULL,
  `group` char(2) DEFAULT NULL,
  `hour` char(10) NOT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `num` int(4) DEFAULT NULL,
  `use_num` int(4) DEFAULT '0',
  `balance` int(4) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastmodified` timestamp NULL DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
