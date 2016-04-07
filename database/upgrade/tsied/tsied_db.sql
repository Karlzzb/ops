use tsied_db;

CREATE TABLE `tsied_index_conf` (
  `index_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ָ��ID',
  `index_name` varchar(32) NOT NULL COMMENT 'ָ��չ������',
  `es_index` varchar(32) NOT NULL COMMENT 'ָ�������Ӧ��Elasticsearsh��index',
  `es_index_type` varchar(32) NOT NULL COMMENT 'ָ�������Ӧ��Elasticsearch��index type',
  `es_template_name` varchar(64) NOT NULL COMMENT 'Elasticsearch�ű�����',
  `chart_type` char(16) NOT NULL COMMENT 'ͼ�����ͣ�barchart;linechart',
  `view_div_id` char(8) NOT NULL COMMENT 'չ�ֲ�DIV��ID', 
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ݴ���ʱ��',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '��������޸�ʱ��',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '���ݲ�����ʶ: 1-����;2-�޸�;3-ɾ��',
  PRIMARY KEY (`index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ָ�����ñ�';