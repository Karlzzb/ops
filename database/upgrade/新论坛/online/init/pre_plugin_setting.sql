-- phpMyAdmin SQL Dump
-- version 4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2015 at 09:28 AM
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
-- Table structure for table `pre_plugin_setting`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_setting` (
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_plugin_setting`
--

INSERT INTO `pre_plugin_setting` (`pid`, `value`) VALUES
(1, 's:4:"urlpc";s:37:"http://ad1.13565.com/test/banner1.jpg";s:5:"urlmob";s:37:"http://ad1.13565.com/test/banner1.jpg";');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_plugin_setting`
--
ALTER TABLE `pre_plugin_setting`
  ADD UNIQUE KEY `pid` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
