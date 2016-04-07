DROP TABLE IF EXISTS `video_bos`.`vbos_images`;
CREATE TABLE `video_bos`.`vbos_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID',
  `name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '图片名称',
  `temp_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '存储名称（哈希）',
  `url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '跳转路径',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `creater` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `editor` int(11) NOT NULL DEFAULT '0' COMMENT '编辑者ID',
  `etime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除    0 正常   1 删除',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(4) NOT NULL COMMENT '图片类型： 1、首页焦点轮播图     2、首页侧边广告轮播图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
