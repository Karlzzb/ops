alter table FC_STATISTICS_WITHDRAW_TIME add RISK_VIEW_WAIT_TIME varchar(32)  COMMENT '每笔风控初审等待作业时间';

alter table FC_STATISTICS_WITHDRAW_TIME add RISK_REVIEW_WAIT_TIME varchar(32)  COMMENT '每笔风控复审等待作业时间';

alter table FC_STATISTICS_WITHDRAW_TIME add OPERATE_ONE_WAIT_TIME varchar(32)  COMMENT '运营一级特批等待时间';

alter table FC_STATISTICS_WITHDRAW_TIME add OPERATE_TWO_WAIT_TIME varchar(32)  COMMENT '运营二级特批等待时间';

alter table FC_STATISTICS_WITHDRAW_TIME add LABOUR_LOAN_WAIT_TIME varchar(32)  COMMENT '人工放款等待时间';

alter table FC_STATISTICS_WITHDRAW_TIME add TRANS_ERROR_WAIT_TIME varchar(32)  COMMENT '出款异常等待时间';

alter table FC_STATISTICS_WITHDRAW_TIME add LABOUR_TRANS_WAIT_TIME varchar(32)  COMMENT '人工出款等待时间';


alter table FC_STATISTICS_WITHDRAW_DAY add RISK_VIEW_WAIT_TIME varchar(32)  COMMENT '每笔风控初审等待作业时间';

alter table FC_STATISTICS_WITHDRAW_DAY add RISK_REVIEW_WAIT_TIME varchar(32)  COMMENT '每笔风控复审等待作业时间';

alter table FC_STATISTICS_WITHDRAW_DAY add OPERATE_ONE_WAIT_TIME varchar(32)  COMMENT '运营一级特批等待时间';

alter table FC_STATISTICS_WITHDRAW_DAY add OPERATE_TWO_WAIT_TIME varchar(32)  COMMENT '运营二级特批等待时间';

alter table FC_STATISTICS_WITHDRAW_DAY add LABOUR_LOAN_WAIT_TIME varchar(32)  COMMENT '人工放款等待时间';

alter table FC_STATISTICS_WITHDRAW_DAY add TRANS_ERROR_WAIT_TIME varchar(32)  COMMENT '出款异常等待时间';

alter table FC_STATISTICS_WITHDRAW_DAY add LABOUR_TRANS_WAIT_TIME varchar(32)  COMMENT '人工出款等待时间'