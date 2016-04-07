CREATE TABLE discuz_db.`plug_feedback` (
  `uid` int(11) unsigned NOT NULL,
  `rs` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;