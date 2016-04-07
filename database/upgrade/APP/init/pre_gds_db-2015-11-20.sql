create table pre_gds_radio(
     radio_id int(11) unsigned not null auto_increment comment '��̨ID',
     host_id int(11) unsigned not null default 0 comment '����ID������������� ����',
     name char(32) not null default '' comment '��Ʒ����',
     total int(11) not null default 0 comment '����',
     pos smallint(5) not null default 0 comment 'λ��',
     url varchar(255) not null default '' comment '��ַ',
     duration smallint(5) not null default 0 comment 'ʱ��',
     `desc` varchar(255) not null default '' comment '���',
     status tinyint(1) not null default 0 comment '״̬��0-δ�ϼܣ�1-�ϼ�',
     publish_time datetime null comment '�ϼ�ʱ��',
     img varchar(64) not null default '' comment '����ͼƬ',
     init_time datetime not null default current_timestamp comment '���ݴ���ʱ ��',
     dml_time datetime not null default current_timestamp on update current_timestamp comment '��������޸�ʱ��',
     dml_flag tinyint(3) not null default 1 comment '���ݲ�����ʶ��:1-������2- �޸ģ�3-ɾ��',
     PRIMARY KEY (radio_id),
     INDEX host_index(host_id),
     INDEX status_index(status)
     )ENGINE=InnoDB Default CHARSET=utf8 comment '��̨�б��';

	 
	 
create table pre_gds_host(
	host_id int(11) unsigned not null auto_increment comment '����ID',
	name varchar(32) not null default '' comment '��������',
	pos smallint(5) not null default 0 comment '����λ��',
	`desc` varchar(255) not null default '' comment '���',
	img varchar(64) not null default '' comment '����ͼƬ',
    init_time datetime not null default current_timestamp comment '���ݴ���ʱ ��',
    dml_time datetime not null default current_timestamp on update current_timestamp comment '��������޸�ʱ��',
    dml_flag tinyint(3) not null default 1 comment '���ݲ�����ʶ��:1-������2- �޸ģ�3-ɾ��',
    PRIMARY KEY (host_id)
)ENGINE=InnoDB Default CHARSET=utf8 comment '�����б��';