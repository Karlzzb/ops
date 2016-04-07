/*
/home/script/bbs/online_svn/SQL/P3.3
2.announcement_carouselgroups.sql
*/
use discuz_db;

ALTER TABLE `pre_forum_announcement` ADD `carouselgroups` TEXT NOT NULL AFTER `groups`;
update `pre_forum_announcement` set `carouselgroups`=`groups`;


