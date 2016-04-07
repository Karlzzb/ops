#优化时间2015-01-16
ALTER TABLE video_bos.fileinfo ADD key md5sum_key(md5sum);
ALTER TABLE video.video_live_list ADD key multikey1(uid,start_time);
ALTER TABLE video.video_exit_room ADD KEY uid_key(uid);
ALTER TABLE video_bos.vbos_priv_user ADD key admin_id(admin_id);


#优化时间2015-01-19
ALTER TABLE `video`.`video_online` ADD KEY  created_key(created);
ALTER TABLE `video`.`video_online` ADD KEY users_key(users);