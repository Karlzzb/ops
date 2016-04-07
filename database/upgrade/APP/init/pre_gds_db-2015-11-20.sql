create table pre_gds_radio(
     radio_id int(11) unsigned not null auto_increment comment '电台ID',
     host_id int(11) unsigned not null default 0 comment '主播ID，和主播表进行 关联',
     name char(32) not null default '' comment '作品名称',
     total int(11) not null default 0 comment '集数',
     pos smallint(5) not null default 0 comment '位置',
     url varchar(255) not null default '' comment '地址',
     duration smallint(5) not null default 0 comment '时长',
     `desc` varchar(255) not null default '' comment '简介',
     status tinyint(1) not null default 0 comment '状态：0-未上架，1-上架',
     publish_time datetime null comment '上架时间',
     img varchar(64) not null default '' comment '封面图片',
     init_time datetime not null default current_timestamp comment '数据创建时 间',
     dml_time datetime not null default current_timestamp on update current_timestamp comment '数据最后修改时间',
     dml_flag tinyint(3) not null default 1 comment '数据操作标识符:1-新增；2- 修改；3-删除',
     PRIMARY KEY (radio_id),
     INDEX host_index(host_id),
     INDEX status_index(status)
     )ENGINE=InnoDB Default CHARSET=utf8 comment '电台列表表';

	 
	 
create table pre_gds_host(
	host_id int(11) unsigned not null auto_increment comment '主播ID',
	name varchar(32) not null default '' comment '主播名称',
	pos smallint(5) not null default 0 comment '主播位置',
	`desc` varchar(255) not null default '' comment '简介',
	img varchar(64) not null default '' comment '主播图片',
    init_time datetime not null default current_timestamp comment '数据创建时 间',
    dml_time datetime not null default current_timestamp on update current_timestamp comment '数据最后修改时间',
    dml_flag tinyint(3) not null default 1 comment '数据操作标识符:1-新增；2- 修改；3-删除',
    PRIMARY KEY (host_id)
)ENGINE=InnoDB Default CHARSET=utf8 comment '主播列表表';