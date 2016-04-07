USE discuz_stat;
CREATE TABLE `discuz_access_stat` (
  `auid` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `stat_date` DATE NOT NULL COMMENT '数据统计时间',
  `domain_name` VARCHAR(64) NOT NULL COMMENT '域名',
  `fid` INT NOT NULL DEFAULT 0 COMMENT '板块ID, 默认为0表示非板块访问',
  `access_pv` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日PV量',
  `access_ip` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日访问IP量',
  `access_uv` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日UV量',
  `dml_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除',
  `init_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `dml_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
  PRIMARY KEY (`auid`),
  UNIQUE KEY `myunique_index` (`stat_date`, `domain_name`, `fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛访问统计表（天维度）';