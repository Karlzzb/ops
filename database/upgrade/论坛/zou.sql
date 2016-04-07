-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 
-- 服务器版本: 5.7.1-m11
-- PHP 版本: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zou`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `insert_time` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`name`, `pwd`, `id`, `insert_time`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `base_count`
--

CREATE TABLE IF NOT EXISTS `base_count` (
  `count` int(4) NOT NULL,
  `hour` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `base_count`
--

INSERT INTO `base_count` (`count`, `hour`) VALUES
(72, '2015041500'),
(64, '2015041501'),
(88, '2015041522'),
(3, '2015041523'),
(1, '2015041620'),
(68, '2015041622'),
(82, '2015041623');

-- --------------------------------------------------------

--
-- 表的结构 `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `hour` varchar(60) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `num` int(4) NOT NULL,
  `sort` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(4) DEFAULT NULL,
  `use_num` int(4) NOT NULL COMMENT '已经开出的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `lottery`
--

INSERT INTO `lottery` (`hour`, `prize_id`, `num`, `sort`, `id`, `balance`, `use_num`) VALUES
('2015041401', 1, 2, '1,2', 14, 0, 2),
('2015041401', 2, 4, '1,2,3,4', 15, 0, 4),
('2015041410', 1, 2, '2,3', 16, 0, 2),
('2015041500', 1, 2, '2,4', 17, 2, 2),
('2015041500', 2, 2, '7,9', 18, 2, 2),
('2015041500', 3, 2, '10,13', 19, 2, 2),
('2015041500', 4, 1, '15', 20, 1, 1),
('2015041500', 5, 2, '16,17', 21, 2, 2),
('2015041500', 6, 3, '20,21,22', 22, 3, 3),
('2015041500', 7, 2, '24,26', 23, 2, 2),
('2015041500', 8, 2, '35,50', 24, 2, 3),
('2015041500', 9, 2, '65,67', 25, 2, 5),
('2015041500', 10, 3, '72,73,74', 26, 2, 5),
('2015041501', 8, 1, '30', 27, 0, 4),
('2015041501', 10, 3, '15,18,20', 28, 3, 3),
('2015041501', 5, 1, '25', 29, 0, 1),
('2015041522', 1, 4, '85,88,90,95', 30, 2, 8),
('2015041622', 10, 2, '63,64', 31, 2, 12),
('2015041622', 9, 3, '38,39,40', 32, 3, 4),
('2015041622', 8, 3, '41,42,43', 33, 3, 3),
('2015041622', 7, 2, '49,50', 34, 2, 4),
('2015041622', 1, 2, '61,62', 35, 2, 2),
('2015041622', 2, 2, '66,67', 36, 0, 4),
('2015041622', 3, 2, '57,58', 37, 2, 2),
('2015041622', 4, 2, '55,56', 38, 2, 2),
('2015041622', 5, 2, '53,54', 39, 2, 2),
('2015041622', 6, 2, '51,52', 40, 2, 2),
('2015041623', 5, 1, '75', 41, 1, 5),
('2015041623', 6, 3, '56,57,58', 42, 3, 3),
('2015041623', 8, 2, '79,80', 43, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `lottery_log`
--

CREATE TABLE IF NOT EXISTS `lottery_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `prize_id` int(11) DEFAULT NULL,
  `is_give` int(11) DEFAULT '0' COMMENT '是否派奖了 0/1 否/是',
  `uid` varchar(40) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `position` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `lottery_log`
--
-- --------------------------------------------------------

--
-- 表的结构 `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `lottery_rule` text,
  `prize_rule` text,
  `need_score` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `page`
--

INSERT INTO `page` (`lottery_rule`, `prize_rule`, `need_score`) VALUES
('中奖规则                                          ', '奖项 规则', 332);

-- --------------------------------------------------------

--
-- 表的结构 `prize`
--

CREATE TABLE IF NOT EXISTS `prize` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `ex` varchar(20) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `prize`
--

INSERT INTO `prize` (`id`, `name`, `type`, `ex`, `info`) VALUES
(1, '全年VIP', '特等奖', 'vip', NULL),
(2, '季度VIP', '特等奖', 'vip', NULL),
(3, '月度VIP', '特等奖', 'vip', NULL),
(4, '18天VIP', '幸运奖', 'vip', NULL),
(5, '5元小仙儿门票', '幸运奖', 'link', 'http://www.jd.com/'),
(6, '鼠标垫', '幸运奖', 'link', 'http://www.baidu.com'),
(7, '500金币', '幸运奖', 'gold', '500'),
(8, '50金币', '鼓励奖', 'gold', '50'),
(9, '10金币', '鼓励奖', 'gold', '10'),
(10, '再来一局', '鼓励奖', 'again', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;