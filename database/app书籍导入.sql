 CREATE TABLE `tmp_bookshelf` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(155) COLLATE utf8_bin NOT NULL,
  `author` varchar(155) COLLATE utf8_bin NOT NULL,
  `status` varchar(55) COLLATE utf8_bin NOT NULL,
  `introduce` longtext COLLATE utf8_bin NOT NULL,
  `toke1_id` int(11) NOT NULL DEFAULT '0',
  `toke1` varchar(255) COLLATE utf8_bin NOT NULL,
  `toke2_id` int(11) NOT NULL DEFAULT '0',
  `toke2` varchar(255) COLLATE utf8_bin NOT NULL,
  `toke3_id` int(11) NOT NULL DEFAULT '0',
  `toke3` varchar(255) COLLATE utf8_bin NOT NULL,
  `toke4` varchar(255) COLLATE utf8_bin NOT NULL,
  `fengmian` varchar(32) COLLATE utf8_bin NOT NULL,
  `dangan` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

update tmp_bookshelf t, pre_gds_book_type d set t.toke1_id = d.id where t.toke1 = d.b_type;
update tmp_bookshelf t, pre_gds_book_type d set t.toke2_id = d.id where t.toke2 = d.b_type;
update tmp_bookshelf t, pre_gds_book_type d set t.toke3_id = d.id where t.toke3 = d.b_type;

#如果介绍过长按照255个字符截断，运营确认的
insert into pre_gds_bookshelf(id,book_name,author,introduce,t_id,img_url,file_url,status,sort,create_time,recom_time,size) select null, book_name,author,introduce,concat_ws(" ",toke1_id,toke2_id,toke3_id),fengmian,dangan,status,auto_id,unix_timestamp(),unix_timestamp(),'' from tmp_bookshelf;