CREATE DATABASE /*!32312 IF NOT EXISTS*/ `analyze_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `analyze_db`;

--
-- Table structure for table `analyze_db`.`analyze_binlog`
--
DROP TABLE IF EXISTS `analyze_db`.`analyze_binlog`;
CREATE TABLE `analyze_db`.`analyze_binlog` (
	`host` varchar(32) NOT NULL COMMENT'所在服务器IP',
	`log_name` varchar(32) NOT NULL COMMENT'所在日志名称',
	`at_pos` int(11) NOT NULL COMMENT'起始点',
	`at_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'操作时间',
	`server_id` int(11) NOT NULL,
	`end_log_pos` int(11) NOT NULL COMMENT'结束点',
	`execute_detail` varchar(500) DEFAULT NULL COMMENT'执行详情',
	`thread_id` int(11) NOT NULL,
	`exec_time` int(11) NOT NULL,
	`error_code` int(11) NOT NULL,
	`dml_type` varchar(50) DEFAULT NULL COMMENT'操作详情',
	`dml_table` varchar(500) DEFAULT NULL COMMENT'被操作库表',
	`dml_sql` text DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT'服务器日志统计表';

-- LOAD DATA LOCAL INFILE '/home/kerl/Db-Jo1-full-bin.txt' INTO TABLE analyze_db.analyze_binlog COLUMNS TERMINATED BY '|||||' (at_pos,at_time,server_id,end_log_pos,execute_detail,exec_time,error_code,thread_id,dml_type,dml_table,dml_sql) SET host=INET_ATON('10.1.0.201'), log_name='analyze'



--
-- Table structure for table `analyze_db`.`analyze_binlog`
--
DROP TABLE IF EXISTS `analyze_db`.`analyze_table_stat`;
CREATE TABLE `analyze_db`.`analyze_table_stat` (
	`table_schema` varchar(64) NOT NULL,
	`table_name` varchar(64) NOT NULL,
	`table_rows` bigint(21) unsigned NOT NULL DEFAULT '0',
	`data_size` bigint(21) unsigned NOT NULL DEFAULT '0',
	`index_size` bigint(21) unsigned NOT NULL DEFAULT '0',
	`total_size` bigint(21) unsigned NOT NULL DEFAULT '0',
	`table_info` varchar(128) NOT NULL DEFAULT '',
	`dml_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后修改时间',
	`dml_flag` TINYINT NOT NULL DEFAULT '1' COMMENT '数据操作标识: 1-新增;2-修改;3-删除'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT'库表容量统计表';

--
-- Table procedure for table `analyze_db`.`tbrow_stats`
--
DROP PROCEDURE IF EXISTS analyze_db.tbstats;
DELIMITER //
CREATE PROCEDURE analyze_db.`tbstats`(IN stime DATETIME)
BEGIN
DECLARE tbschema VARCHAR(16);
DECLARE tbname VARCHAR(64);
DECLARE tbstr VARCHAR(128);
DECLARE tbsize INT;
DECLARE done INT DEFAULT 0;
DECLARE cur CURSOR FOR SELECT table_schema, table_name FROM information_schema.columns WHERE column_name = 'init_time' AND table_schema NOT IN ('analyze_db','mysql','performance_schema','information_schema');
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur;
REPEAT
    FETCH cur INTO tbschema, tbname;
	IF NOT done THEN
      SET @sql = concat('INSERT INTO analyze_db.analyze_table_stat(table_schema,table_name,table_rows) SELECT \'',tbschema,'\', \'',tbname,'\', COUNT(1) FROM ',tbschema,'.',tbname,' WHERE init_time < \'',stime,'\'');
	  PREPARE STMT FROM @sql;
	  EXECUTE STMT;
	  DEALLOCATE PREPARE STMT;
    END IF;
UNTIL done END REPEAT;
CLOSE cur;

END //
DELIMITER ;

--
-- Table structure for table `analyze_db`.`tbstatstime`
--
DROP EVENT IF EXISTS `analyze_db`.`tbstatstime`;
CREATE EVENT `analyze_db`.`tbstatstime`
ON SCHEDULE
EVERY 10 MINUTE
DO
CALL analyze_db.tbstats(NOW());
