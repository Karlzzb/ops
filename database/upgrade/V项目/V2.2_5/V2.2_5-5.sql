/*
/home/script/svn/trunk/video-admin/V2.2_5/sql
2.video_admin_20151026_F.sql
*/
use video_bos;
﻿/*raby*/
ALTER TABLE `vbos_bill_stat` ADD COLUMN `new_totalPoints` int(11) NOT NULL DEFAULT '0' COMMENT '新增用户充值总额';



