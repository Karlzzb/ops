use tsied_db;

CREATE TABLE `tsied_index_conf` (
  `index_id` INT NOT NULL AUTO_INCREMENT COMMENT '指标ID',
  `index_name` varchar(32) NOT NULL COMMENT '指标展现名称',
  `es_index` varchar(32) NOT NULL COMMENT '指标检索对应的Elasticsearsh的index',
  `es_index_type` varchar(32) NOT NULL COMMENT '指标检索对应的Elasticsearch的index type',
  `es_template_name` varchar(64) NOT NULL COMMENT 'Elasticsearch脚本名称',
  `chart_type` char(16) NOT NULL COMMENT '图表类型：barchart;linechart',
  `view_div_id` char(8) NOT NULL COMMENT '展现层DIV的ID', 
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  `dml_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  PRIMARY KEY (`index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经分指标配置表';