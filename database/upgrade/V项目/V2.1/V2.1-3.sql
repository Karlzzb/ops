 create table video.video_user_mexp like video_bos.vbos_user_mexp;
 insert into video.video_user_mexp select * from video_bos.vbos_user_mexp;
 drop table video_bos.vbos_user_mexp;