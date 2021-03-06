use fcpay;

alter table FC_LOAD_BANK_TRANS_FLOW modify column PAY_DATE DATETIME  COMMENT '支付日期' ;
alter table FC_LOAD_BANK_TRANS_FLOW modify column PAY_TIME TIME  COMMENT '支付时间';
alter table FC_LOAD_BANK_TRANS_FLOW add column STATISTICS_STATUS INT;

DROP TABLE if exists  FC_LOAD_BANK_TRANS_RETURN;
CREATE
    TABLE FC_LOAD_BANK_TRANS_RETURN
    (
        ORDER_NO CHAR(38) COLLATE utf8_bin NOT NULL COMMENT '流水号',
        PAY_ACCOUNT_ALIAS VARCHAR(30) COLLATE utf8_bin NOT NULL COMMENT '帐户卡别名',
        REC_ACCOUNT_ALIAS VARCHAR(30) COLLATE utf8_bin NOT NULL,
        AMOUNT DECIMAL(16,4) NOT NULL COMMENT '转出金额',
        STATUS INT(1) NOT NULL COMMENT '转出状态(1.转帐中, 0.转帐成功, 9.转帐失败)',
        CREAT_TIME DATETIME NOT NULL COMMENT '创建时间',
        REMAIN_BALANCE DECIMAL(16,4) NOT NULL,
        UPDATE_TIME DATETIME COMMENT '小助手修改状态时间',
        USER_ID CHAR(38) COLLATE utf8_bin COMMENT '操作人员',
        CHECK_TRAN INT(1),
        PRIMARY KEY (ORDER_NO)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值卡转出记录表';


 alter table FC_LOAD_CUSTOMER_EXCEPTION_RECORD add column STATISTICS_STATUS INT;

 alter table FC_PAY_ORDER_RECORD add column PARTNER_ID VARCHAR(32) COMMENT '商户号';

DROP TABLE if exists FC_STATISTICS_PROCESS_TOPUP;
CREATE
    TABLE FC_STATISTICS_PROCESS_TOPUP
    (
        FC_DEPOSIT_APPLY_ID CHAR(38) COLLATE utf8_bin NOT NULL COMMENT '充值申请ID',
        BANK_TRANS_FLOW_ID VARCHAR(64) COLLATE utf8_bin COMMENT '银行流水ID',
        CHECK_START DATETIME COMMENT '充值勾兑创建时间',
        CHECK_OBTAIN DATETIME COMMENT '充值勾兑获取时间',
        CHECK_END DATETIME COMMENT '充值勾兑结束时间',
        CHECK_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '充值勾兑作业人',
        HUNGUP_START DATETIME COMMENT '充值挂起创建时间',
        HUNGUP_OBTAIN DATETIME COMMENT '充值挂起获取时间',
        HUNGUP_END DATETIME COMMENT '充值挂起结束时间',
        HUNGUP_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '充值挂起作业人',
        RECHECK_START DATETIME COMMENT '充值审核创建时间',
        RECHECK_OBTAIN DATETIME COMMENT '充值审核获取时间',
        RECHECK_END DATETIME COMMENT '充值审核结束时间',
        RECHECK_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '充值审核作业人',
        KEEP_ONE_START DATETIME COMMENT '预留一创建时间',
        KEEP_ONE_OBTAIN DATETIME COMMENT '预留一获取时间',
        KEEP_ONE_END DATETIME COMMENT '预留一结束时间',
        KEEP_ONE_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '预留一作业人',
        KEEP_TWO_START DATETIME COMMENT '预留二创建时间',
        KEEP_TWO_OBTAIN DATETIME COMMENT '预留二获取时间',
        KEEP_TWO_END DATETIME COMMENT '预留二结束时间',
        KEEP_TWO_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '预留二作业人',
        KEEP_THREE_START DATETIME COMMENT '预留三创建时间',
        KEEP_THREE_OBTAIN DATETIME COMMENT '预留三获取时间',
        KEEP_THREE_END DATETIME COMMENT '预留三结束时间',
        KEEP_THREE_OPR VARCHAR(32) COLLATE utf8_bin COMMENT '预留三作业人',
        BUSINESS_ID VARCHAR(64) COLLATE utf8_bin COMMENT '所属平台',
        PRIMARY KEY (FC_DEPOSIT_APPLY_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE if exists FC_STATISTICS_TOPUP_DAY;
CREATE
    TABLE FC_STATISTICS_TOPUP_DAY
    (
        STATISTICS_ID CHAR(38) NOT NULL COMMENT '统计ID',
        STATISTICS_DAY CHAR(10) COMMENT '时间日',
        BUSINESS_ID VARCHAR(32) COMMENT '所属平台',
        TOPUP_NUM INT COMMENT '充值数量',
        TOPUP_BANK_NUM INT COMMENT '银行卡充值数量',
        TOPUP_THIRD_NUMJ INT COMMENT '第三方充值数量',
        WITHDRAW_AMD DECIMAL(16,4) COMMENT '充值金额',
        TOPUP_BANK_TIME INT COMMENT '银行卡每笔充值总时间',
        TOPUP_BANKEXCEPTION_TIME INT COMMENT '银行卡异常每笔充值总时间',
        TOPUP_DELAY_RATE DECIMAL(16,4) COMMENT '延迟率',
        KEEP_ONE_TIME VARCHAR(32) COMMENT '预留一',
        KEEP_TWO_TIME VARCHAR(32) COMMENT '预留二',
        KEEP_THREE_TIME VARCHAR(32) COMMENT '预留三',
        PRIMARY KEY (STATISTICS_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE if exists FC_STATISTICS_TOPUP_TIME;
CREATE
    TABLE FC_STATISTICS_TOPUP_TIME
    (
        STATISTICS_ID CHAR(38) NOT NULL COMMENT '统计ID',
        STATISTICS_DAY CHAR(10) COMMENT '时间日20150701',
        STATISTICS_HOUR INT COMMENT '时间时01',
        FC_DEPOSIT_APPLY_ID CHAR(38) COMMENT '充值申请ID',
        DEPOSIT_APPLY_ID VARCHAR(64) COMMENT '游戏平台申请ID',
        BUSINESS_ID VARCHAR(32) COMMENT '所属平台',
        RISK_VIEW_TIME INT COMMENT '充值勾兑花耗时间',
        RISK_VIEW_OPR VARCHAR(32) COMMENT '充值勾兑作业人',
        OPERATE_ONE_TIME INT COMMENT '充值挂起花耗时间',
        OPERATE_ONE_OPR VARCHAR(32) COMMENT '充值挂起作业人',
        FINANCE_AUDIT_TIME INT COMMENT '充值审核花耗时间',
        FINANCE_AUDIT_OPR VARCHAR(32) COMMENT '充值审核作业人',
        KEEP_ONE_TIME INT COMMENT '预留一花耗时间',
        KEEP_ONE_OPR VARCHAR(32) COMMENT '预留一作业人',
        KEEP_TWO_TIME INT COMMENT '预留二花耗时间',
        KEEP_TWO_OPR VARCHAR(32) COMMENT '预留二作业人',
        KEEP_THREE_TIME INT COMMENT '预留三花耗时间',
        KEEP_THREE_OPR VARCHAR(32) COMMENT '预留三作业人',
        TOTAL_TIME INT COMMENT '总耗时',
        PRIMARY KEY (STATISTICS_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE if exists  FC_STATISTICS_WITHDRAW_DAY;
CREATE
    TABLE FC_STATISTICS_WITHDRAW_DAY
    (
        STATISTICS_ID CHAR(38) NOT NULL COMMENT '统计ID',
        STATISTICS_DAY CHAR(10) COMMENT '时间日',
        BUSINESS_ID VARCHAR(32) COMMENT '所属平台',
        WITHDRAW_NUM INT COMMENT '提现数量',
        WITHDRAW_AMD DECIMAL(16,4) COMMENT '提现金额',
        TOTAL_TIME VARCHAR(32) COMMENT '每笔作业总时间',
        TOTAL_DELAY_RATE DECIMAL(16,4) COMMENT '总时间延迟率',
        RISK_TIME VARCHAR(32) COMMENT '每笔风控作业时间',
        RISK_DELAY_RATE DECIMAL(16,4) COMMENT '风控延迟率',
        OPERATION_TIME VARCHAR(32) COMMENT '每笔运营作业时间',
        OPERATION_DELAY_RATE DECIMAL(16,4) COMMENT '运营延迟率',
        FINANCE_TIME VARCHAR(32) COMMENT '每笔财务作业时间',
        LOAN_TIME VARCHAR(32) COMMENT '每笔放款作业时间',
        LOAN_DELAY_RATE DECIMAL(16,4) COMMENT '资管延迟率',
        TRANSIT_TIME VARCHAR(32) COMMENT '每笔出款作业时间',
        TRANSIT_DELAY_RATE DECIMAL(16,4) COMMENT '结算延迟率',
        KEEP_ONE_TIME VARCHAR(32) COMMENT '预留一',
        KEEP_TWO_TIME VARCHAR(32) COMMENT '预留二',
        KEEP_THREE_TIME VARCHAR(32) COMMENT '预留三',
        FINANCE_DELAY_RATE DECIMAL(16,4),
        PRIMARY KEY (STATISTICS_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE if exists FC_STATISTICS_WITHDRAW_TIME;
CREATE
    TABLE FC_STATISTICS_WITHDRAW_TIME
    (
        STATISTICS_ID CHAR(38) NOT NULL COMMENT '统计ID',
        STATISTICS_START_TIME DATETIME COMMENT '开始时间',
        STATISTICS_END_TIME DATETIME,
        STATISTICS_DAY CHAR(10) COMMENT '时间日20150701',
        STATISTICS_HOUR INT COMMENT '时间时01',
        FC_WITH_APPLY_ID CHAR(38) COMMENT '提现申请ID',
        DRAW_APPLY_ID VARCHAR(64) COMMENT '游戏平台申请ID',
        BUSINESS_ID VARCHAR(32) COMMENT '所属平台',
        RISK_VIEW_TIME INT COMMENT '风控初审花耗时间',
        RISK_VIEW_OPR VARCHAR(32) COMMENT '风控初审作业人',
        RISK_REVIEW_TIME INT COMMENT '风控复审花耗时间',
        RISK_REVIEW_OPR VARCHAR(32) COMMENT '风控复审作业人',
        RISK_AUTO_TIME INT COMMENT '风控自动审核花耗时间',
        RISK_TIME INT COMMENT '风控总耗时',
        OPERATE_ONE_TIME INT COMMENT '运营一级特批花耗时间',
        OPERATE_ONE_OPR VARCHAR(32) COMMENT '运营一级作业人',
        OPERATE_TWO_TIME INT COMMENT '运营二级特批花耗时间',
        OPERATE_TWO_OPR VARCHAR(32) COMMENT '运营二级作业人',
        OPERATE_TIME INT COMMENT '运营总耗时',
        FINANCE_AUDIT_TIME INT COMMENT '财务审核花耗时间',
        FINANCE_AUDIT_OPR VARCHAR(32) COMMENT '财务审核作业人',
        FINANCE_TIME INT COMMENT '财务总耗时',
        AUTO_LOAN_TIME INT COMMENT '全自动放款花耗时间',
        SEMIAUTO_LOAN_TIME INT COMMENT '半自动放款花耗时间',
        SEMIAUTO_LOAN_OPR VARCHAR(32) COMMENT '半自动放款作业人',
        LOAN_ROBOT_TIME INT COMMENT '放款机器人花耗时间',
        LOAN_ERROR_TIME INT COMMENT '放款异常花耗时间',
        LOAN_ERROR_OPR VARCHAR(32) COMMENT '放款异常作业人',
        LABOUR_LOAN_TIME INT COMMENT '人工放款花耗时间',
        LABOUR_LOAN_OPR VARCHAR(32) COMMENT '人工放款作业人',
        LOAN_TIME INT COMMENT '放款总耗时',
        AUTO_TRANSIT_TIME INT COMMENT '全自动出款花耗时间',
        SEMIAUTO_TRANSIT_TIME INT COMMENT '半自动出款花耗时间',
        SEMIAUTO_TRANSIT_OPR VARCHAR(32) COMMENT '半自动出款作业人',
        TRANSIT_ROBOT_TIME INT COMMENT '出款机器人花耗时间',
        TRANSIT_ERROR_TIME INT COMMENT '出款异常花耗时间',
        TRANSIT_ERROR_OPR VARCHAR(32) COMMENT '出款异常作业人',
        LABOUR_TRANSIT_TIME INT COMMENT '人工出款花耗时间',
        LABOUR_TRANSIT_OPR VARCHAR(32) COMMENT '人工出款作业人',
        TRANSIT_WAITCARD_TIME INT COMMENT '人工出款等卡花耗时间',
        TRANSIT_TIME INT COMMENT '出款总耗时',
        KEEP_ONE_TIME INT COMMENT '预留一花耗时间',
        KEEP_ONE_OPR VARCHAR(32) COMMENT '预留一作业人',
        KEEP_TWO_TIME INT COMMENT '预留二花耗时间',
        KEEP_TWO_OPR VARCHAR(32) COMMENT '预留二作业人',
        KEEP_THREE_TIME INT COMMENT '预留三花耗时间',
        KEEP_THREE_OPR VARCHAR(32) COMMENT '预留三作业人',
        TOTAL_TIME INT COMMENT '总耗时',
        WHITDRAW_AMD DECIMAL(16,4) COMMENT '提现金额',
        WHITDRAW_USERNAME VARCHAR(32) COMMENT '提现会员',
        PRIMARY KEY (STATISTICS_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	alter table FC_LOAD_DEPOSIT_APPLY modify  DEPOSIT_NO 	varchar(50)  comment '充值账号';
    alter table FC_LOAD_DEPOSIT_APPLY modify  DEPOSIT_NAME	varchar(32)  comment '充值姓名';
	alter table FC_SYS_BUSINESS add column BUSINESS_PROCESS VARCHAR(100);