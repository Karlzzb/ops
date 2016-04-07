
alter table video.`video_room_duration` Add column reuid int(10) not null default 0  COMMENT '用户预约ID'  AFTER `status` ;


/*Morgan*/

/*2015-06-05  修改*/
CREATE TABLE `video_room_duration_day` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `duration` bigint(20) NOT NULL DEFAULT '0' COMMENT '时长',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_uniq` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/* 2015-06-05  end*/

ALTER TABLE `video`.video_domain DROP INDEX url_uniq;
ALTER TABLE `video`.video_domain ADD `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否已删除：0正常,1删除';


ALTER TABLE `video`.video_agents ADD `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否已删除：0正常,1删除';

ALTER TABLE `video`.video_redirect ADD `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否已删除：0正常,1删除';

/*Morgan*/
alter table `video`.`video_user` Add column lv_type smallint(2) DEFAULT '1' COMMENT '主播类型1普通艺人,2中级艺人,3高级艺人';



/*orino*/
CREATE TABLE `video`.`video_gift_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giftname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `moneymin` mediumint(8) DEFAULT NULL COMMENT '赠送的限制起始金额',
  `moneymax` int(11) DEFAULT NULL COMMENT '赠送的限制结束金额',
  `packid` int(11) unsigned DEFAULT NULL COMMENT '默认是延长天数',
  `giftday` smallint(2) DEFAULT NULL,
  `gitmoney` mediumint(5) DEFAULT NULL,
  `type` smallint(2) DEFAULT '1' COMMENT '活动的类型,1:充值送礼',
  `flag` smallint(2) DEFAULT '1' COMMENT '改活动默认开启',
  `richlv` smallint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `video`.`video_gift_activity` VALUES ('1', '18元靓丽礼包：哈雷摩托座驾（10天使用期）', '19', '98', '120007', '10', '0', '1', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('2', '46元尊贵礼包：兰博基尼座驾（15天试用期）+ 68钻石', '99', '398', '120004', '15', '68', '1', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('3', '238元尊享礼包：双层大客机座驾（30天试用期）+388钻石', '399', '1000000000', '120008', '30', '388', '1', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('4', '充1-149元，送10钻石+猪猪快跑(30天)', '1', '149', '120010', '30', '10', '2', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('5', '充150-299元，送288钻石+法拉利超跑（7天）', '150', '299', '120016', '7', '288', '2', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('6', '充300-799元, 送888钻 + 兰博基尼座驾(30天)', '300', '799', '120004', '30', '888', '2', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('7', '充800-1999元，送2888钻石+私人直升机(30天)', '800', '1999', '120001', '30', '2888', '2', '1', '0');
INSERT INTO `video`.`video_gift_activity` VALUES ('8', '充2000-9999元，送8888钻石+双层大客机(30天) + \"男爵\"', '2000', '9999', '120008', '30', '8888', '2', '1', '12');
INSERT INTO `video`.`video_gift_activity` VALUES ('9', '充10000-49999，送88888钻石+航空母舰(30天) + \"王爵', '10000', '49999', '120013', '30', '88888', '2', '1', '19');
INSERT INTO `video`.`video_gift_activity` VALUES ('10', '充50000元以上，送438888钻石+航空母舰(60天) + \"皇帝\"', '50000', '1000000000', '120013', '60', '438888', '2', '1', '25');
INSERT INTO  `video`.video_conf VALUES('imagesFocusConfig',5),('imagesAdsConfig',3);
