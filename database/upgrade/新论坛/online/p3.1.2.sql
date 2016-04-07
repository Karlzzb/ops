CREATE TABLE IF NOT EXISTS `pre_common_advertisement_groups` (
  
`id` int(10) NOT NULL,
  
`advtype` enum('common','custom','plugin','other','') COLLATE utf8_bin NOT NULL,
  
`advid` int(11) NOT NULL,
  
`gid` int(11) NOT NULL

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE utf8_bin;