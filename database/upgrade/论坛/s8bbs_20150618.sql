CREATE TABLE IF NOT EXISTS `pw_dayanswer_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('err','pc','mob') DEFAULT NULL,
  `answer` varchar(2) DEFAULT NULL,
  `options` tinyint(2) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `reward` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;