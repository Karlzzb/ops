/*
/home/script/svn/trunk/video-front/V2.2_7/sql
1.video_front_20151026_F.sql
*/
use video;
/*raby*/

ALTER TABLE `video_user_check` ADD COLUMN `day` int(11) DEFAULT '0' COMMENT '有效天数';

