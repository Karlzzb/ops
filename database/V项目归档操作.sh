--表 video_mail 归档，依赖字段 RECORD_DATA, 保留14天
create table archive_db.video_mail20150727 like video.video_mail;
optimize table video.video_mail;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3366/mysql3366.sock,D=video,t=video_mail --dest h=localhost,u=root,S=/data/db/mysql3366/mysql3366.sock,D=archive_db,t=video_mail20150727 --charset utf8 --where "created < DATE_ADD(NOW(),interval -14 day)"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 video_exit_room 归档，依赖字段 RECORD_DATA, 保留30天
create table archive_db.video_exit_room20150727 like video.video_exit_room;
optimize table video.video_exit_room;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3366/mysql3366.sock,D=video,t=video_exit_room --dest h=localhost,u=root,S=/data/db/mysql3366/mysql3366.sock,D=archive_db,t=video_exit_room20150727 --charset utf8 --where "created < DATE_ADD(NOW(),interval -30 day)"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 