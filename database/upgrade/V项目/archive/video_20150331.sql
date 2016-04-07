
ALTER TABLE `video`.`video_user` ADD COLUMN `safemail`  varchar(128) NULL AFTER `nickname`;

DELETE FROM `video`.`video_user` WHERE uid IN (1121331,1121332,1112030,1112046,1121158,1111305);

alter table `video`.`video_user` add unique username_index (`username`);

del huser_info:1121331
del huser_info:1121332
del huser_info:1112030
del huser_info:1112046
del huser_info:1121158
del huser_info:1111305