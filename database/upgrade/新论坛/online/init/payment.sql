-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 10.10.10.201
-- Generation Time: 2015-07-22 03:58:35
-- 服务器版本： 5.6.19
-- PHP Version: 5.5.12




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discuz_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_plugin_payment_log`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_payment_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `servicecode` varchar(6) NOT NULL,
  `version` varchar(2) NOT NULL,
  `servicetype` varchar(2) NOT NULL,
  `signtype` varchar(10) NOT NULL,
  `sign` varchar(255) NOT NULL,
  `sysplatcode` varchar(10) NOT NULL,
  `senttime` varchar(32) NOT NULL,
  `exptime` varchar(32) DEFAULT NULL,
  `charset` varchar(10) NOT NULL,
  `smessageno` varchar(32) NOT NULL,
  `datadetails` text,
  `datano` varchar(32) NOT NULL,
  `returnurl` varchar(128) DEFAULT NULL,
  `noticeurl` varchar(128) DEFAULT NULL,
  `orderid` varchar(32) DEFAULT NULL,
  `payorderid` varchar(32) DEFAULT NULL,
  `refundid` varchar(32) DEFAULT NULL,
  `result` smallint(1) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` smallint(1) DEFAULT NULL,
  `completetime` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `codemsg` varchar(255) DEFAULT NULL,
  `channel` varchar(8) DEFAULT NULL,
  `transactiontype` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `pre_plugin_payment_log`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_plugin_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payorderid` varchar(32) NOT NULL,
  `ugroup` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createtime` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payorderid` (`payorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_plugin_setting`
--

CREATE TABLE IF NOT EXISTS `pre_plugin_setting` (
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  UNIQUE KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pre_plugin_setting`
--

INSERT INTO `pre_plugin_setting` (`pid`, `value`) VALUES
(170, 'a:7:{s:8:"formhash";s:8:"d6f0c0ac";s:10:"requestUrl";s:48:"http://210.213.242.114:8086/fc_iface/service/g2p";s:6:"secret";s:32:"59b4f7b17c91cd8e6febfe1252c0db34";s:9:"returnUrl";s:52:"http://www.discuz32.com/plugin.php?id=payment:reback";s:9:"noticeUrl";s:52:"http://www.discuz32.com/plugin.php?id=payment:notice";s:11:"paymentType";a:5:{i:10;a:5:{s:6:"amount";s:2:"10";s:3:"gid";s:2:"41";s:5:"money";s:1:"0";s:3:"day";s:2:"31";s:11:"description";s:64:"性吧网电包月(￥10) - 享受性吧网电全部浏览权限";}i:68;a:5:{s:6:"amount";s:2:"68";s:3:"gid";s:2:"42";s:5:"money";s:3:"200";s:3:"day";s:2:"31";s:11:"description";s:66:"包月VIP (￥68) - 享受全站浏览权限 额外获赠200金币";}i:238;a:5:{s:6:"amount";s:3:"238";s:3:"gid";s:2:"42";s:5:"money";s:3:"500";s:3:"day";s:2:"92";s:11:"description";s:68:"季度VIP (￥238)  - 享受全站浏览权限 额外获赠500金币";}i:398;a:5:{s:6:"amount";s:3:"398";s:3:"gid";s:2:"42";s:5:"money";s:4:"1000";s:3:"day";s:3:"183";s:11:"description";s:68:"半年VIP (￥398) - 享受全站浏览权限 额外获赠1000金币";}i:618;a:5:{s:6:"amount";s:3:"618";s:3:"gid";s:2:"42";s:5:"money";s:4:"2000";s:3:"day";s:3:"365";s:11:"description";s:174:"年度VIP (￥796，<span class="style1">限时优惠价：￥618</span>) - 享受全站浏览权限 额外获赠2000金币  <span class="style1">超值抢购中...</span>";}}s:11:"serviceType";a:5:{s:3:"pay";a:3:{s:4:"name";s:3:"pay";s:4:"code";s:6:"FC0028";s:4:"type";s:2:"03";}s:5:"query";a:3:{s:4:"name";s:5:"query";s:4:"code";s:6:"FC0029";s:4:"type";s:2:"03";}s:11:"queryReturn";a:3:{s:4:"name";s:11:"queryReturn";s:4:"code";s:6:"FC0030";s:4:"type";s:2:"03";}s:6:"refund";a:3:{s:4:"name";s:6:"refund";s:4:"code";s:6:"FC0031";s:4:"type";s:2:"03";}s:12:"refundReturn";a:3:{s:4:"name";s:12:"refundReturn";s:4:"code";s:6:"FC0032";s:4:"type";s:2:"03";}}}'),
(171, 'a:8:{s:8:"formhash";s:8:"d6f0c0ac";s:13:"ml_mailifopen";s:2:"on";s:11:"ml_smtphost";s:19:"smtp.googlemail.com";s:11:"ml_smtpfrom";s:20:"s8.members@gmail.com";s:9:"fromemail";s:17:"sex8adv@gmail.com";s:11:"ml_smtpuser";s:10:"s8.members";s:11:"ml_smtppass";s:16:"ijgaoisjGWER1314";s:6:"windid";s:44:"性吧 | 春暖花开 性吧有你 | Sex8.CC";}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
