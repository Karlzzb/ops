USE `pre_gds_db`;

--
-- Table structure for table `pre_domain_info`
--

DROP TABLE IF EXISTS `pre_domain_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_domain_info` (
  `auid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `domain_name` varchar(128) NOT NULL COMMENT '域名',
  `use_type` tinyint NOT NULL COMMENT '使用类型：1-稳定的域名(通过其来获取域名字典数据);2-APP后台的访问域名;3-推送服务的域名;4-数据统计代理的域名',
  `detail` varchar(255) COMMENT '描述',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`auid`),
  UNIQUE KEY (domain_name,use_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='域名字典表';

insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://192.168.100.200",1,"稳定IP");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://kl-api.s8sina.net",1,"稳定IP");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://app_api.s8s8pc.com:5055",1,"稳定IP");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://192.168.100.3:80",1,"稳定IP");

insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://192.168.100.200",2,"后台API");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://kl-api.s8sina.net",2,"后台API");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://app_api.s8s8pc.com:5055",2,"后台API");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("http://192.168.100.3:80",2,"后台API");

insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("ws://192.168.100.200",3,"WM地址");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("ws://kl-push.s8sina.net",3,"WM地址");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("ws://app_houtai.s8s8pc.com:5056",3,"WM地址");
insert into pre_gds_db.pre_domain_info(domain_name,use_type,detail) values("ws://192.168.100.4:2346",3,"WM地址");
