USE `pre_gds_db`;

ALTER TABLE `pre_gds_book_type`
	ADD COLUMN `dml_flag` TINYINT(1) NOT NULL COMMENT '数据操作标识符:1-新增；2- 修改；3-删除' AFTER `sort`;

ALTER TABLE `pre_gds_book_type_t`
	ADD COLUMN `dml_flag` INT(1) NULL COMMENT '数据操作标识符:1-新增；2- 修改；3-删除' AFTER `sort`;
ALTER TABLE `pre_gds_push`
	ADD COLUMN `author` VARCHAR(50) NULL COMMENT '操作人' AFTER `send_num`;

