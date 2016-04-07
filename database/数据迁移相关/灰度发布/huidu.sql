SET sql_log_bin;
create table pw_transforms(
	`id` int(11) unsigned not null auto_increment comment '自增主键',
	`key_id` int(11) unsigned not null comment '对应表的主键',
	`convert` int(11) unsigned not null default 0 comment '转换状态0为未转换，1为正在转换，2已经转换',
	`table` varchar(255) comment '转换的表名',
	`type` int(11) comment '操作类型（insert 1,update 2,delete 3）',  
	`relate_id` int(11) default 0 comment '关联的id,如post表存放tid'  ,
	primary key(`id`),
	key `key_id` (`key_id`)
)engine='innodb' charset=utf8;

alter table pw_transforms add `dml_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间';

DROP TRIGGER IF EXISTS tg_pw_members_insert;
delimiter //
CREATE TRIGGER tg_pw_members_insert after INSERT ON pw_members
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_members', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberdata_insert;
delimiter //
CREATE TRIGGER tg_pw_memberdata_insert after INSERT ON pw_memberdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_memberdata', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberinfo_insert;
delimiter //
CREATE TRIGGER tg_pw_memberinfo_insert after INSERT ON pw_memberinfo
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_memberinfo', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_membercredit_insert;
delimiter //
CREATE TRIGGER tg_pw_membercredit_insert after INSERT ON pw_membercredit
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_membercredit', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forums_insert;
delimiter //
CREATE TRIGGER tg_pw_forums_insert after INSERT ON pw_forums
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.fid, 'pw_forums', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forumdata_insert;
delimiter //
CREATE TRIGGER tg_pw_forumdata_insert after INSERT ON pw_forumdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.fid, 'pw_forumdata', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_threads_insert;
delimiter //
CREATE TRIGGER tg_pw_threads_insert after INSERT ON pw_threads
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_threads', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs_insert;
delimiter //
CREATE TRIGGER tg_pw_tmsgs_insert after INSERT ON pw_tmsgs
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs1_insert;
delimiter //
CREATE TRIGGER tg_pw_tmsgs1_insert after INSERT ON pw_tmsgs1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs1', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs2_insert;
delimiter //
CREATE TRIGGER tg_pw_tmsgs2_insert after INSERT ON pw_tmsgs2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs2', 1, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts_insert;
delimiter //
CREATE TRIGGER tg_pw_posts_insert after INSERT ON pw_posts
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts1_insert;
delimiter //
CREATE TRIGGER tg_pw_posts1_insert after INSERT ON pw_posts1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts1', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts2_insert;
delimiter //
CREATE TRIGGER tg_pw_posts2_insert after INSERT ON pw_posts2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts2', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts3_insert;
delimiter //
CREATE TRIGGER tg_pw_posts3_insert after INSERT ON pw_posts3
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts3', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts4_insert;
delimiter //
CREATE TRIGGER tg_pw_posts4_insert after INSERT ON pw_posts4
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts4', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts5_insert;
delimiter //
CREATE TRIGGER tg_pw_posts5_insert after INSERT ON pw_posts5
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts5', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts6_insert;
delimiter //
CREATE TRIGGER tg_pw_posts6_insert after INSERT ON pw_posts6
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts6', 1, NEW.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_members_update;
delimiter //
CREATE TRIGGER tg_pw_members_update after UPDATE ON pw_members
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_members', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberdata_update;
delimiter //
CREATE TRIGGER tg_pw_memberdata_update after UPDATE ON pw_memberdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_memberdata', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberinfo_update;
delimiter //
CREATE TRIGGER tg_pw_memberinfo_update after UPDATE ON pw_memberinfo
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_memberinfo', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_membercredit_update;
delimiter //
CREATE TRIGGER tg_pw_membercredit_update after UPDATE ON pw_membercredit
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.uid, 'pw_membercredit', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forums_update;
delimiter //
CREATE TRIGGER tg_pw_forums_update after UPDATE ON pw_forums
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.fid, 'pw_forums', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forumdata_update;
delimiter //
CREATE TRIGGER tg_pw_forumdata_update after UPDATE ON pw_forumdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.fid, 'pw_forumdata', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_threads_update;
delimiter //
CREATE TRIGGER tg_pw_threads_update after UPDATE ON pw_threads
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_threads', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs_update;
delimiter //
CREATE TRIGGER tg_pw_tmsgs_update after UPDATE ON pw_tmsgs
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs1_update;
delimiter //
CREATE TRIGGER tg_pw_tmsgs1_update after UPDATE ON pw_tmsgs1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs1', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs2_update;
delimiter //
CREATE TRIGGER tg_pw_tmsgs2_update after UPDATE ON pw_tmsgs2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.tid, 'pw_tmsgs2', 2, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts_update;
delimiter //
CREATE TRIGGER tg_pw_posts_update after UPDATE ON pw_posts
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts1_update;
delimiter //
CREATE TRIGGER tg_pw_posts1_update after UPDATE ON pw_posts1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts1', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts2_update;
delimiter //
CREATE TRIGGER tg_pw_posts2_update after UPDATE ON pw_posts2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts2', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts3_update;
delimiter //
CREATE TRIGGER tg_pw_posts3_update after UPDATE ON pw_posts3
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts3', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts4_update;
delimiter //
CREATE TRIGGER tg_pw_posts4_update after UPDATE ON pw_posts4
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts4', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts5_update;
delimiter //
CREATE TRIGGER tg_pw_posts5_update after UPDATE ON pw_posts5
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts5', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts6_update;
delimiter //
CREATE TRIGGER tg_pw_posts6_update after UPDATE ON pw_posts6
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (NEW.pid, 'pw_posts6', 2, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_members_del;
delimiter //
CREATE TRIGGER tg_pw_members_del after DELETE ON pw_members
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.uid, 'pw_members', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberdata_del;
delimiter //
CREATE TRIGGER tg_pw_memberdata_del after DELETE ON pw_memberdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.uid, 'pw_memberdata', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_memberinfo_del;
delimiter //
CREATE TRIGGER tg_pw_memberinfo_del after DELETE ON pw_memberinfo
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.uid, 'pw_memberinfo', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_membercredit_del;
delimiter //
CREATE TRIGGER tg_pw_membercredit_del after DELETE ON pw_membercredit
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.uid, 'pw_membercredit', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forums_del;
delimiter //
CREATE TRIGGER tg_pw_forums_del after DELETE ON pw_forums
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.fid, 'pw_forums', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_forumdata_del;
delimiter //
CREATE TRIGGER tg_pw_forumdata_del after DELETE ON pw_forumdata
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.fid, 'pw_forumdata', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_threads_del;
delimiter //
CREATE TRIGGER tg_pw_threads_del after DELETE ON pw_threads
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.tid, 'pw_threads', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs_del;
delimiter //
CREATE TRIGGER tg_pw_tmsgs_del after DELETE ON pw_tmsgs
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.tid, 'pw_tmsgs', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs1_del;
delimiter //
CREATE TRIGGER tg_pw_tmsgs1_del after DELETE ON pw_tmsgs1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.tid, 'pw_tmsgs1', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_tmsgs2_del;
delimiter //
CREATE TRIGGER tg_pw_tmsgs2_del after DELETE ON pw_tmsgs2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.tid, 'pw_tmsgs2', 3, 0);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts_del;
delimiter //
CREATE TRIGGER tg_pw_posts_del after DELETE ON pw_posts
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts1_del;
delimiter //
CREATE TRIGGER tg_pw_posts1_del after DELETE ON pw_posts1
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts1', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts2_del;
delimiter //
CREATE TRIGGER tg_pw_posts2_del after DELETE ON pw_posts2
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts2', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts3_del;
delimiter //
CREATE TRIGGER tg_pw_posts3_del after DELETE ON pw_posts3
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts3', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts4_del;
delimiter //
CREATE TRIGGER tg_pw_posts4_del after DELETE ON pw_posts4
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts4', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts5_del;
delimiter //
CREATE TRIGGER tg_pw_posts5_del after DELETE ON pw_posts5
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts5', 3, OLD.tid);
END;//
delimiter ;
DROP TRIGGER IF EXISTS tg_pw_posts6_del;
delimiter //
CREATE TRIGGER tg_pw_posts6_del after DELETE ON pw_posts6
FOR EACH ROW
BEGIN
  insert into pw_transforms (`key_id`, `table` , `type` , `relate_id`) values (OLD.pid, 'pw_posts6', 3, OLD.tid);
END;//
delimiter ;