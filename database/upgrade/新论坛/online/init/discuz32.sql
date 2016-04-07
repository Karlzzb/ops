CREATE TABLE IF NOT EXISTS pre_plugin_setting (
  pid tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO pre_plugin_setting (pid, value) VALUES
(152, 'a:7:{s:6:"title1";s:13:"Task1 Title99";s:8:"content1";s:20:"<p>Task1 Content</p>";s:6:"money1";s:2:"30";s:6:"title2";s:13:"Task2 Title88";s:8:"content2";s:20:"<p>Task2 Content</p>";s:6:"money2";s:2:"20";s:6:"notice";s:38:"<p>任务公告测试 codes !<br/></p>";}'),
(155, 'a:3:{s:3:"ids";s:11:"11,21,22,23";s:4:"fids";s:5:"39,40";s:4:"days";s:15:"10,20,31,90,360";}');

CREATE TABLE IF NOT EXISTS pre_plugin_vip (
  id int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  user1 varchar(30) NOT NULL DEFAULT '',
  user2 varchar(30) NOT NULL DEFAULT '',
  fid varchar(30) NOT NULL DEFAULT '',
  tid varchar(30) NOT NULL DEFAULT '',
  pid varchar(255) NOT NULL DEFAULT '',
  days int(10) NOT NULL DEFAULT '0',
  notice text NOT NULL,
  actime int(10) NOT NULL DEFAULT '0' COMMENT 'action time',
  ip varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=18000010 DEFAULT CHARSET=utf8;


ALTER TABLE pre_plugin_vip
  ADD PRIMARY KEY (id), ADD KEY username1 (user1), ADD KEY username2 (user2);


ALTER TABLE pre_plugin_vip
  MODIFY id int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18000010;
  
ALTER TABLE `pre_plugin_quizzes_log` CHANGE `uid` `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `pre_plugin_wheel_log` CHANGE `uid` `uid` INT(11) UNSIGNED NOT NULL DEFAULT '0';
