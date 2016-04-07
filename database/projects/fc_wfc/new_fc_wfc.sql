drop table if exists FC_LOAD_BANK_TRANS_FLOW;

drop table if exists FC_LOAD_CHECK_RECORD;

drop table if exists FC_LOAD_CUSTOMER_EXCEPTION_RECORD;

drop table if exists FC_LOAD_DEPOSIT_APPLY;

drop table if exists FC_LOAD_PAYMENT_TRANS_FLOW;

drop table if exists FC_LOAD_RECORD;

/*==============================================================*/
/* Table: FC_LOAD_BANK_TRANS_FLOW                               */
/*==============================================================*/
create table FC_LOAD_BANK_TRANS_FLOW
(
   BANK_TRANS_FLOW_ID   char(38) not null comment '银行充值交易流水ID',
   FC_DEPOSIT_APPLY_ID  char(38) not null comment '充值申请ID',
   PAY_DATE             date not null comment '支付日期',
   PAY_TIME             time not null comment '支付时间',
   TRANS_FLAG           int not null comment '收付标志',
   BANK_FLOW_NO         varchar(50) not null comment '银行流水号',
   SRC_BANK_ACCOUNT_NO  varchar(32) not null comment '支付账户',
   SRC_BANK_NAME        varchar(32) not null comment '支付人姓名',
   AMOUNT               decimal(16,4) not null comment '支付金额',
   CHARGE               decimal(16,4) not null comment '手续费',
   SRC_BANK_TYPE        int not null comment '支付银行类型',
   SRC_BANK_BRANCH_NAME varchar(32) not null comment '开户行名称',
   SRC_BANK_BRANCH_NO   varchar(100) not null comment '开户行号',
   BALANCE              decimal(16,4) not null comment '账户余额',
   TRANSACTION_WAY      int not null comment '交易渠道',
   TRANSACTION_STATE    int not null comment '交易状态',
   COMMENTS             varchar(64) not null comment '附言',
   DEST_BANK_ACCOUNT_TYPE int not null comment '收款银行类型',
   DEST_ACCOUNT_NO      varchar(32) not null comment '收款账户号',
   DEST_ACCOUNT_NAME    varchar(32) not null comment '收款人姓名',
   DEST_BANK_TYPE       int not null comment '收款人银行类型',
   DEST_BANK_BRANCH_NAME varchar(32) not null comment '收款方开户行名',
   DEST_BANK_BRANCH_NO  varchar(100) not null comment '开户行行号',
   CHECK_STATUS         int not null comment '是否处理状态(0,默认值没有被勾兑，1已被勾兑，勾兑后不能再使用)',
   RECEIVE_TIME         datetime not null comment '接收时间(当前时间，设置为默认当前时间)',
   CHECK_TIME           datetime not null comment '勾兑时间',
   CHECK_COMMENTS       varchar(500) comment '勾兑备注',
   CHECK_TYPE           int not null comment '勾兑类型(1,自动勾兑，2手工勾兑)',
   primary key (BANK_TRANS_FLOW_ID)
);

alter table FC_LOAD_BANK_TRANS_FLOW comment '银行充值交易流水表(客户充值的流水，银行流水)';

/*==============================================================*/
/* Table: FC_LOAD_CHECK_RECORD                                  */
/*==============================================================*/
create table FC_LOAD_CHECK_RECORD
(
   CUSTOMER_EXCEPTION_RECORD_ID varchar(64) not null comment '充值异常登记ID',
   USER_ID              char(38) not null comment '用户ID',
   BANK_TRANS_FLOW_ID   char(38) not null comment '银行充值交易流水ID',
   FC_DEPOSIT_APPLY_ID  char(38) not null comment '充值申请ID',
   CREATED_TIME         datetime not null comment '勾兑时间',
   COMMENTS             varchar(200) comment '勾兑备注',
   primary key (CUSTOMER_EXCEPTION_RECORD_ID)
);

alter table FC_LOAD_CHECK_RECORD comment '手工勾兑记录表(手工勾兑相关操作记录，记录勾兑过程，最终勾兑后的结果写到关系表)';

/*==============================================================*/
/* Table: FC_LOAD_CUSTOMER_EXCEPTION_RECORD                     */
/*==============================================================*/
create table FC_LOAD_CUSTOMER_EXCEPTION_RECORD
(
   CUSTOMER_EXCEPTION_RECORD_ID char(38) not null comment '充值异常登记ID',
   USER_ID              char(38) not null comment '用户ID',
   USER_NAME            varchar(32) not null comment '会员号',
   REAL_NAME            varchar(32) not null comment '会员真实姓名',
   BANK_SERIAL_NO       varchar(50) not null comment '银行流水号',
   BANK_TYPE            varchar(16) not null comment '银行类型',
   PAY_ACCOUNT_NO       varchar(32) not null comment '付款账号',
   PAYER_NAME           varchar(32) not null comment '付款名',
   PAY_AMOUNT           decimal(16,4) not null comment '汇款金额',
   PAY_TIME             datetime not null comment '汇款时间',
   RECEIPT_ACCOUNT_NO   varchar(32) not null comment '收款账号',
   RAW_COMMENT          varchar(32) not null comment '原附言',
   CHANGED_COMMENT      varchar(32) comment '修改后附言',
   ATTACHMENT           varchar(200) not null comment '附件(附件地址)',
   SUSPEND_REASON       varchar(64) comment '挂起原因',
   PLATF_NAME           varchar(32) not null comment '平台类型',
   DEAL_STATE           int not null comment '处理状态(0 已上分 1挂起)',
   CREATED_TIME         datetime not null comment '异常登记时间',
   COMMENTS             varchar(512) comment '异常登记备注',
   primary key (CUSTOMER_EXCEPTION_RECORD_ID)
);

alter table FC_LOAD_CUSTOMER_EXCEPTION_RECORD comment '充值异常登记表(用于客服人员登记会员提交的充值异常)';

/*==============================================================*/
/* Table: FC_LOAD_DEPOSIT_APPLY                                 */
/*==============================================================*/
create table FC_LOAD_DEPOSIT_APPLY
(
   FC_DEPOSIT_APPLY_ID  char(38) not null comment '充值申请ID',
   DEPOSIT_APPLY_ID     varchar(32) not null comment '游戏平台充值申请流水号',
   USER_NAME            varchar(32) not null comment '会员账号',
   CHANNEL_TYPE         int not null comment '充值渠道(1 银行 2第三方支付)',
   DEPOSIT_NO           varchar(50) not null comment '充值账号',
   DEPOSIT_NAME         varchar(32) not null comment '充值姓名',
   RECEIPT_NO           varchar(32) not null comment '收款账户',
   AGENT                varchar(32) not null comment '代理',
   AMOUNT               decimal(16,4) not null comment '申请充值金额',
   DEPOSIT_APPLY_TIME   datetime not null comment '充值申请时间',
   COMMENTS             varchar(128) not null comment '申请附言',
   RECEIVE_TIME         datetime not null comment '接收时间(当前时间，设置为默认当前时间)',
   STATUS               int not null comment '处理状态(0，未处理，1已处理，2,已失效（假定3天失效）)',
   DATA_NO              varchar(32) not null comment '报文流水号(交易报文中的dataNo，返回时以这个为准)',
   primary key (FC_DEPOSIT_APPLY_ID)
);

alter table FC_LOAD_DEPOSIT_APPLY comment '充值申请表(业务平台发送充值申请到充提平台)';

/*==============================================================*/
/* Table: FC_LOAD_PAYMENT_TRANS_FLOW                            */
/*==============================================================*/
create table FC_LOAD_PAYMENT_TRANS_FLOW
(
   PAYMENT_TRANS_FLOW_ID char(38) not null comment '第三方充值交易流水ID',
   PAYMENT_FLOW_NO      varchar(32) not null comment '第三方充值订单',
   PAYER_NAME           varchar(32) not null comment '支付人姓名',
   PAY_ACCOUNT_NO       varchar(32) not null comment '支付账户',
   PAY_TIME             datetime not null comment '支付时间',
   PAY_AMOUNT           decimal(16,4) not null comment '支付金额',
   CHARGE               decimal(16,4) not null comment '手续费',
   RECEIPT_ACCOUNT_NO   varchar(32) not null comment '收款账户号',
   primary key (PAYMENT_TRANS_FLOW_ID)
);

alter table FC_LOAD_PAYMENT_TRANS_FLOW comment '第三方充值交易流水表(客户通过第三方支付充值的流水)';

/*==============================================================*/
/* Table: FC_LOAD_RECORD                                        */
/*==============================================================*/
create table FC_LOAD_RECORD
(
   LOAD_RECORD_ID       char(38) not null comment '充值上分记录',
   BUSINESS_ID          CHAR(38) not null comment '平台编码',
   FC_DEPOSIT_APPLY_ID  char(38) comment '充值申请ID',
   USER_NAME            varchar(32) not null comment '会员账号',
   STATUS               int not null comment '上分状态(0未上分，1已上分，2上分失败)',
   AMOUNT               decimal(16,4) not null comment '充值金额(以银行流水合计为准，参考充值申请与银行流水关系表)',
   CHARGE               decimal(16,4) not null comment '手续费(以银行流水中的手续费合计为准，参考充值申请与银行流水关系表)',
   COMMENTS             varchar(200) not null comment '上分结果描述',
   ADD_TIME             datetime not null comment '上分时间',
   ADD_TYPE             int not null comment '上分类别(0 自动上分、1 手工勾兑上分、2异常人工上分（无银行交易记录，暂不考虑）)',
   DEAL_STATUS          int comment '处理状态(0未处理，1处理中（已发送游戏平台未返回结果），2已处理)',
   primary key (LOAD_RECORD_ID)
);

alter table FC_LOAD_RECORD comment '充值上分记录表(充值上分成功记录，数据字段参考充值上分接口字段，上分数据有三个来源，自动上分、手工勾兑上分和异常人工上分';
drop table if exists FC_RISK_CUSTOMER_ACCOUNT_INFO;

drop table if exists FC_RISK_GAME_FLOW_DETAIL;

drop table if exists FC_RISK_GAME_WINNING_INFO;

drop table if exists FC_RISK_PREPAID_ACCOUNT_CHANGE_INFO;

drop table if exists FC_RISK_WITHDRAW_CHECK;

/*==============================================================*/
/* Table: FC_RISK_CUSTOMER_ACCOUNT_INFO                         */
/*==============================================================*/
create table FC_RISK_CUSTOMER_ACCOUNT_INFO
(
   CUSTOMER_ACCOUNT_INFO_ID char(38) not null comment '会员总账信息ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   CUSTOMER_NAME        varchar(32) not null comment '会员名',
   AGENT                varchar(32) comment '代理人',
   ACCOUNT_BALANCE      decimal(16,4) not null comment '账户余额',
   BLOCKED_AMOUNT       decimal(16,4) not null comment '冻结金额',
   AVAILABLE_BALANCE    decimal(16,4) not null comment '可用余额',
   GAME_BALANCE         varchar(500) not null comment '第三方游戏平台余额',
   REGISTER_DATE        datetime comment '注册日期',
   RECORD_DATA          datetime comment '记录生成时间',
   primary key (CUSTOMER_ACCOUNT_INFO_ID)
);

alter table FC_RISK_CUSTOMER_ACCOUNT_INFO comment '会员总账信息表(会员总账信息)';

/*==============================================================*/
/* Table: FC_RISK_GAME_FLOW_DETAIL                              */
/*==============================================================*/
create table FC_RISK_GAME_FLOW_DETAIL
(
   GAME_FLOW_DETAIL_ID  char(38) not null comment '游戏流水明细ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   GAME_RECORD_ID       varchar(32) not null comment '游戏平台流水ID',
   GAME_CHANGE_TIME     datetime not null comment '账变时间',
   CHANGE_TYPE          varchar(100) not null comment '账变类型',
   GAME_TYPE            varchar(100) not null comment '游戏类型',
   GAME_RULE            varchar(100) not null comment '游戏玩法',
   GAME_PATTERN         varchar(16) not null comment '投注模式',
   IN_COME              decimal(16,4) comment '收入金额',
   PAY_AMOUNT           decimal(16,4) comment '支出金额',
   AVAILABLE_AMOUNT     decimal(16,4) comment '可用余额(暂无数据，保留)',
   IP_ADDRESS           varchar(32) comment '网络IP',
   COMMENTS             varchar(512) comment '备注',
   CUSTOMER_NAME        varchar(32) not null comment '会员名',
   RECORD_DATA          datetime comment '记录生成时间',
   primary key (GAME_FLOW_DETAIL_ID)
);

alter table FC_RISK_GAME_FLOW_DETAIL comment '游戏流水明细表(游戏流水明细)';

/*==============================================================*/
/* Table: FC_RISK_GAME_WINNING_INFO                             */
/*==============================================================*/
create table FC_RISK_GAME_WINNING_INFO
(
   GAME_WINNING_INFO_ID varchar(64) not null comment '游戏中奖信息ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   GAME_RECORD_ID       varchar(32) not null comment '游戏中奖流水号',
   BET_TIME             datetime not null comment '下注时间',
   BET_CLOSED_TIME      datetime not null comment '封盘时间',
   GAME_DRAW_TIME       datetime not null comment '开奖时间',
   WINNING_AMOUNT       decimal(16,4) not null comment '中奖金额',
   BET_AMOUNT           decimal(16,4) not null comment '投注金额',
   DRAW_RATE            real(5,3) not null comment '中奖比例',
   BET_DOUBLE           int not null comment '投注倍数',
   DRAW_NO              varchar(100) not null comment '开奖号码',
   WINNING_NO           varchar(1024) not null comment '中奖号码',
   GAME_TYPE            varchar(100) not null comment '游戏类型',
   GAME_RULE            varchar(100) not null comment '游戏玩法',
   BET_PATTERN          varchar(1024) not null comment '投注方案',
   GAME_PATTERN         varchar(16) not null comment '投注模式',
   IP_ADDRESS           varchar(32) not null comment '网络IP',
   BET_RATE             int not null comment '码数',
   COMMENTS             varchar(512) comment '备注信息',
   CUSTOMER_NAME        varchar(32) not null comment '会员名',
   RECORD_DATA          datetime not null comment '记录生成时间',
   primary key (GAME_WINNING_INFO_ID)
);

alter table FC_RISK_GAME_WINNING_INFO comment '游戏中奖信息表(游戏中奖信息)';

/*==============================================================*/
/* Table: FC_RISK_PREPAID_ACCOUNT_CHANGE_INFO                   */
/*==============================================================*/
create table FC_RISK_PREPAID_ACCOUNT_CHANGE_INFO
(
   PREPAID_ACCOUNT_CHANGE_INFO_ID char(38) not null comment '充值账变信息ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   ACCOUNT_CHANGE_ID    varchar(30) not null comment '充值账变流水号',
   ACCOUNT_CHANGE_TIME  datetime not null comment '账变时间',
   ACCOUNT_CHANGE_TYPE  varchar(100) not null comment '账变类型',
   ACCOUNT_CHANGE_AMOUNT decimal(16,4) not null comment '账变金额',
   AVAILABLE_AMOUNT     decimal(16,4) not null comment '可用余额',
   IP_ADDRESS           INT not null comment '网络地址',
   ACCOUNT_NO_REMARK    varchar(50) comment '卡号备注',
   LOAD_TYPE            int not null comment '上分类型(0 自动上分 1 手动上分)',
   REMARK               varchar(512) comment '备注',
   CUSTOMER_NAME        varchar(32) not null comment '会员名',
   RECORD_DATA          datetime not null comment '记录生成时间',
   primary key (PREPAID_ACCOUNT_CHANGE_INFO_ID)
);

alter table FC_RISK_PREPAID_ACCOUNT_CHANGE_INFO comment '充值账变信息表(充值账变信息)';

/*==============================================================*/
/* Table: FC_RISK_WITHDRAW_CHECK                                */
/*==============================================================*/
create table FC_RISK_WITHDRAW_CHECK
(
   FC_WITHDRAW_CHECK_ID char(38) not null comment 'ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   FC_WITH_APPLY_ID     char(38) not null comment '提现申请ID',
   PLATFORM_NAME        varchar(32) not null comment '平台类型',
   CUSTOMER_NAME        varchar(32) not null comment '用户名',
   CHECK_TYPE           int not null comment '审核类型(0 初审， 1复审)',
   CHECK_NAME           int comment '审核名称(0 流水初审，1流水复审，2中奖初审，3中奖复审，4账变初始，5账变复审)',
   CHECK_TIME           datetime not null comment '审核时间',
   USER_NAME            varchar(32) not null comment '审核用户名',
   CHECK_RESULT         int not null comment '审核结果',
   CHECK_REMARK         varchar(320) comment '审核备注',
   primary key (FC_WITHDRAW_CHECK_ID)
);

alter table FC_RISK_WITHDRAW_CHECK comment '订单审批记录表()';
drop table if exists FC_SHIFT_ACCOUNT_CHANGE_RECORD;

drop table if exists FC_SHIFT_ACCOUNT_DETAIL;

drop table if exists FC_SHIFT_ACCOUNT_STATUS_RECORD;

drop table if exists FC_SHIFT_ACTIVE_ACCOUNT_MANAGE;

drop table if exists FC_SHIFT_BANK_TRANS_FLOW;

drop table if exists FC_SHIFT_CHECK_LOAN_DETAIL;

drop table if exists FC_SHIFT_MAKE_BALANCE_RECORD;

drop table if exists FC_SHIFT_RETURN_TRANS;

drop table if exists FC_SHIFT_SIGN_RECORD;

/*==============================================================*/
/* Table: FC_SHIFT_ACCOUNT_CHANGE_RECORD                        */
/*==============================================================*/
create table FC_SHIFT_ACCOUNT_CHANGE_RECORD
(
   ACCOUNT_CHANGE_RECORD_ID char(38) not null comment '账户交接班记录ID',
   USER_ID              varchar(64) comment '交接班操作员(自增长)',
   ACCOUNT_ALIAS        CHAR(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   UPLOAD_BEGIN_TIME    datetime comment '交接班开始时间(上卡时间)',
   UNLOAD_END_TIME      datetime comment '交接班结束时间(签退时，设置时间，卡一定选择在加载时间与卸载时间之间，同时状态有效)',
   ACCOUNT_BEGIN_BALANCE decimal(16,4) comment '帐户初始余额(交接班时读取内部账户表余额作为初始余额)',
   primary key (ACCOUNT_CHANGE_RECORD_ID)
);

alter table FC_SHIFT_ACCOUNT_CHANGE_RECORD comment '账户交接班记录表()';

/*==============================================================*/
/* Table: FC_SHIFT_ACCOUNT_DETAIL                               */
/*==============================================================*/
create table FC_SHIFT_ACCOUNT_DETAIL
(
   ACCOUNT_DETAIL_ID    char(38) not null comment '分户汇总表ID',
   ACCOUNT_ALIAS        CHAR(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   ACCOUNT_NO           varchar(20) comment '账户号',
   BEGIN_BALANCE        decimal(16,4) comment '初始余额',
   TOTAL_INCOME         decimal(16,4) comment '总收入',
   TOTAL_PAY            decimal(16,4) comment '总支出',
   LAST_BALANCE         decimal(16,4) comment '账户余额',
   账务变动时间               char(10) comment '账务变动时间',
   TRANS_OUT_COUNT      int comment '转账条数',
   TRANS_IN_COUNT       int comment '转入条数',
   primary key (ACCOUNT_DETAIL_ID)
);

alter table FC_SHIFT_ACCOUNT_DETAIL comment '活动账户分户汇总表(记录各活动账户分户账的当期汇总信息，每个交接班为一个周期，与轰动账户管理表中的活动账户一致，当发生交';

/*==============================================================*/
/* Table: FC_SHIFT_ACCOUNT_STATUS_RECORD                        */
/*==============================================================*/
create table FC_SHIFT_ACCOUNT_STATUS_RECORD
(
   ACCOUNT_STATUS_RECORD_ID char(38) not null comment '账户状态记录表ID',
   ACCOUNT_CHANGE_RECORD_ID varchar(64) comment '账户交接班记录ID',
   ACCOUNT_ALIAS        CHAR(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   STATUS               int comment '账户状态(0 无效， 1 有效，2,冻结（冻结时卡不能使用），新增时默认为1)',
   CHANGE_REASON        varchar(200) comment '状态变化原因',
   CHANGE_TIME          datetime comment '状态变化时间',
   primary key (ACCOUNT_STATUS_RECORD_ID)
);

alter table FC_SHIFT_ACCOUNT_STATUS_RECORD comment '账户状态记录表()';

/*==============================================================*/
/* Table: FC_SHIFT_ACTIVE_ACCOUNT_MANAGE                        */
/*==============================================================*/
create table FC_SHIFT_ACTIVE_ACCOUNT_MANAGE
(
   ACCOUNT_ALIAS        char(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   STATUS               int comment '卡是否有效(0 无效， 1 有效，2,冻结（冻结时卡不能使用），新增时默认为1)',
   ISTRANSFERING        int comment '交易状态(1正在转账，0没有转账)',
   primary key ()
);

alter table FC_SHIFT_ACTIVE_ACCOUNT_MANAGE comment '当前活动账户(记录已经发出的所有自动和手动的上分卡、出款卡、中转卡，卡登陆时在这里做登陆标记，表示卡可用，心跳监听卡记录';

/*==============================================================*/
/* Table: FC_SHIFT_BANK_TRANS_FLOW                              */
/*==============================================================*/
create table FC_SHIFT_BANK_TRANS_FLOW
(
   BANK_TRANS_FLOW_ID   char(38) not null comment '银行交易明细ID',
   FC__ACCOUNT_ALIAS    CHAR(38) not null comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   ACCOUNT_NO           varchar(20) not null comment '账户号',
   ACCOUNT_ALIAS        varchar(32) not null comment '卡号(别名)',
   TRANS_TIME           datetime not null comment '交易时间',
   TRANS_AMOUNT         decimal(16,4) not null comment '存入金额',
   TRANFLAG             int not null comment '收付标志(收付标志 0 收款 1 付款)',
   POUNDAGE             decimal(16,4) not null comment '手续费',
   BALANCE              decimal(16,4) not null comment '账户余额',
   DEST_ACCOUNT_NO      varchar(32) not null comment '对方账号',
   DEST_ACCOUNT_NAME    varchar(32) not null comment '对方姓名',
   BANK_ALIAS           varchar(10) not null comment '对方银行别名',
   TRANSACTION_WAY      varchar(20) not null comment '交易方式',
   COMMENTS             varchar(50) comment '摘要',
   TRANSACTIONSTATE     int not null comment '交易状态(0支付失败，1 支付成功)',
   primary key (BANK_TRANS_FLOW_ID)
);

alter table FC_SHIFT_BANK_TRANS_FLOW comment '银行交易明细(出款卡、中转卡的交易明细（不含上分卡，上分卡交易明细在充值交易明细表中），交接班时，自动从网银导入的交易)';

/*==============================================================*/
/* Table: FC_SHIFT_CHECK_LOAN_DETAIL                            */
/*==============================================================*/
create table FC_SHIFT_CHECK_LOAN_DETAIL
(
   CHECK_RESULT_RECORD_ID char(38) not null comment '核对结果记录ID',
   BANK_TRANS_FLOW_ID   varchar(64) comment '银行交易明细ID',
   ACCOUNT_ALIAS        CHAR(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   CHECK_TIME           datetime comment '核对时间',
   USER_NAME            varchar(32) comment '操作员',
   RESULT               int comment '核对结果(0表示银行记录不存在（没有出款） ,1表示出款记录不存在（重复出款或出错款）)',
   ERROR_INFO           varchar(200) comment '错误描述',
   DIFF_BALANCE         decimal(16,4) comment '差错金额(差错的金额，正数为我们欠客户的，负数为多出款，可能造成损失)',
   IS_DEALED            bool comment '是否处理完成',
   primary key (CHECK_RESULT_RECORD_ID)
);

alter table FC_SHIFT_CHECK_LOAN_DETAIL comment '出款核对结果记录(核对出款卡银行交易明细与充提平台内部账户明细账表核对的结果记录，应该是收付一致，出款通过银行交易明细的';

/*==============================================================*/
/* Table: FC_SHIFT_MAKE_BALANCE_RECORD                          */
/*==============================================================*/
create table FC_SHIFT_MAKE_BALANCE_RECORD
(
   MAKE_BALANCE_RECORD_ID char(38) not null comment '交接平差记录ID',
   DIFF_AMOUNT          decimal(16,4) comment '平差金额',
   DEAL_TIME            datetime comment '平差时间',
   USER_NAME            varchar(32) comment '操作人',
   RESULT               int comment '平差结果(0 失败，1成功)',
   primary key (MAKE_BALANCE_RECORD_ID)
);

alter table FC_SHIFT_MAKE_BALANCE_RECORD comment '交接平差记录(平差记录，平差后在内部账户分户账表中增加一条交易明细，手工帐，在修改账户余额)';

/*==============================================================*/
/* Table: FC_SHIFT_RETURN_TRANS                                 */
/*==============================================================*/
create table FC_SHIFT_RETURN_TRANS
(
   FC_ORDER_NO          char(38) not null comment '平台交易流水号(充提平台的转账操作视为与银行发起的一次交易，每次会生成一个流水号，此流水号为交易的唯一标识，也是发给网银助手的命令序列号)',
   PAY_BANK_ALIAS       CHAR(38) not null comment '付款账户编号',
   PAY_BANK_NO          varchar(20) not null comment '付款行账号',
   PAY_USER_NAME        varchar(10) not null comment '付款人用户名称',
   INCOME_BANK_ALIAS    CHAR(38) not null comment '收款账户编号',
   INCOME_BANK_NO       varchar(20) not null comment '收款行账号',
   INCOME_USER_NAME     varchar(10) not null comment '收款人用户名称',
   AMOUNT               decimal(16,4) not null comment '付款金额',
   INCOME_BANK_CITY     varchar(10) comment '收款账号开户城市名',
   INCOME_BANK_NAME     varchar(20) comment '收款账号开户行名称',
   TRANSFER_TYPE        int not null comment '转账类型',
   POUNDAGE             decimal(16,4) not null comment '手续费',
   INCOME_USER_PHONE    varchar(20) comment '收款人手机号码',
   INCOME_CONTACTS      varchar(10) comment '收款联系人',
   ORDER_TIMES          int not null comment '命令发送次数(每笔放款只进行固定次数发送，每次次数+1)',
   STATUS               int not null comment '状态(1成功，0失败，2处理中)',
   TRANS_TIME           datetime comment '交易时间(网银返回的实际交易时间)',
   CURRENT_TIME         datetime comment '当前时间(记录产生时间，以后后续查询用)',
   OPERATOR             varchar(20) comment '操作员ID(如果是全自动放款，此字段为空，如果是半自动、异常处理、人工放款此字段为操作员Id)',
   BANK_COMMENTS        varchar(500) comment '银行交易结果描述',
   TRANS_COMMENTS       varchar(200) comment '交易附言',
   primary key (FC_ORDER_NO)
);

alter table FC_SHIFT_RETURN_TRANS comment '交接班转回记录表(有转回记录时，要调用转账程序，完成转账)';

/*==============================================================*/
/* Table: FC_SHIFT_SIGN_RECORD                                  */
/*==============================================================*/
create table FC_SHIFT_SIGN_RECORD
(
   SIGN_RECORD_ID       char(38) not null comment '签到签退ID',
   USER_NAME            varchar(50) comment '签到签退操作员',
   SIGN_IN_TIME         datetime comment '签到时间',
   SIGN_OUT_TIME        datetime comment '签退时间',
   IS_BALANCE           int comment '是否平账',
   IS_NORMAL_SIGN_IN    int comment '是否正常签到',
   IS_NORMAL_SIGN_OUT   int comment '是否正常签退',
   ACCOUNT_ID           int comment '账户ID',
   USER_ID              varchar(64) not null comment '签退审核操作员(外键)',
   CHECK_TIME           datetime comment '审核时间',
   primary key (SIGN_RECORD_ID)
);

alter table FC_SHIFT_SIGN_RECORD comment '签到签退表(交接班管理记录,签到签退记录)';
drop table if exists FC_BANKMSG_ACCOUNT_QUERY_RESULT;

drop table if exists FC_BANKMSG_ACCOUNT_SERVICE_REF;

drop table if exists FC_BANKMSG_ASSISTANT_TO_WEB;

drop table if exists FC_BANKMSG_ASSISTANT_TO_WEB_HB;

drop table if exists FC_BANKMSG_CARD_STATUS_INFO;

drop table if exists FC_BANKMSG_TRANS_RESULT_INFO;

drop table if exists FC_BANKMSG_WEB_TO_ASSISTANT;

/*==============================================================*/
/* Table: FC_BANKMSG_ACCOUNT_QUERY_RESULT                       */
/*==============================================================*/
create table FC_BANKMSG_ACCOUNT_QUERY_RESULT
(
   RES_ORDERNO          varchar(64) not null comment '交易序列号',
   RES_CARDALIAS        CHAR(38) comment '账户编号',
   RES_BANKNAME         varchar(64) comment '银行名称',
   RES_CREATE_TIME      datetime comment '交易入库时间',
   RES_TRADE_DATE       date comment '卡交易日期',
   RES_TRADE_TIME       time comment '卡交易时间',
   RES_TRANFLAG         int comment '卡收付标志：余额查询时,0-有效,1-无效
            自动余额查询.0- 收款,1-付款',
   RES_SRC_CARDNO       varchar(32) comment '付款账号',
   RES_SRC_CARDNAME     varchar(512) comment '付款人用户名称',
   RES_MONEY            decimal(16,4) comment '付款金额',
   RES_POUNDAGE         decimal(16,4) comment '手续费',
   RES_SRC_BANKNAME     varchar(32) comment '付款人银行类型',
   RES_SRC_BANKBRANCENAME varchar(512) comment '开户行名称',
   RES_SRC_BANKBRANCHNO varchar(32) comment '开户行号',
   RES_BALANCE          decimal(16,4) comment '卡账户余额',
   RES_AVAIABLE         decimal(16,4) comment '卡可用余额',
   RES_TRANSACTION_WAY  varchar(64) comment '交易渠道',
   RES_TRANSACTION_STATE int comment '交易状态：1-交易成功,0-交易失败',
   RES_TRANSACTION_COMMENTS varchar(512) comment '交易附言',
   RES_DEST_CARDNO      varchar(32) comment '收款账号',
   RES_DEST_CARDNAME    varchar(512) comment '收款人用户名',
   RES_DEST_BANKNAME    varchar(64) comment '收款人银行类型',
   RES_DEST_BANK_BRANCHNAME varchar(512) comment '收款方开户行名称',
   RES_DEST_BANKBRANCH_NO varchar(64) comment '收款方开户行号',
   RES_QUERY_TYPE       int comment '交易类型：1-自动查询,2余额查询',
   RES_STATE_MESSAGE    varchar(512) comment '转账结果信息',
   primary key (RES_ORDERNO)
);

alter table FC_BANKMSG_ACCOUNT_QUERY_RESULT comment '自动查询、余额查询结果表';

/*==============================================================*/
/* Table: FC_BANKMSG_ACCOUNT_SERVICE_REF                        */
/*==============================================================*/
create table FC_BANKMSG_ACCOUNT_SERVICE_REF
(
   ACCOUNT_NO           char(38) comment '卡号',
   ACCOUNT_NAME         varchar(64) comment '持卡人',
   ACCOUNT_ALIAS        varchar(50) not null comment '账户编号',
   SERVICE_NO           varchar(20) comment '服务器编号',
   U_NO                 varchar(20) comment 'U口编号',
   OS_IP                INT comment '操作系统IP',
   STATUS               int comment '状态1-已启动,2-已登入.3-已登出;4-未启动',
   ACCOUNT_BALANCE      decimal(16,4) comment '账户余额',
   ACCOUNT_BANK_ALIAS   CHAR(38) comment '余额',
   STATUS_UPD_TIME      datetime comment '状态修改时间'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='只管理内部卡账户，不管理第三方账户';

alter table FC_BANKMSG_ACCOUNT_SERVICE_REF comment '卡状态监控表';

/*==============================================================*/
/* Table: FC_BANKMSG_ASSISTANT_TO_WEB                           */
/*==============================================================*/
create table FC_BANKMSG_ASSISTANT_TO_WEB
(
   MSG_ORDERID          char(38) not null comment '交易序列号',
   MSG_CONTENT          text not null comment '消息内容',
   MSG_CMDTYPE          int comment '消息类型:8-余额查询结果.10-转账结果,14-网银助手返回登录结果,16-网银助手返回注销结果',
   MSG_CREATE_TIME      datetime not null comment '入库时间',
   MSG_STATUS           varchar(10) not null comment '消息状态:0-未拆解,1-已拆解',
   MSG_UPDATE_TIME      datetime not null comment '消息状态修改时间',
   MSG_RESERV1          varchar(256) comment '保留字段1',
   MSG_RESERV2          text comment '保留字段2',
   primary key (MSG_ORDERID)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table FC_BANKMSG_ASSISTANT_TO_WEB comment '网银助手发往充提系统的报文';

/*==============================================================*/
/* Table: FC_BANKMSG_ASSISTANT_TO_WEB_HB                        */
/*==============================================================*/
create table FC_BANKMSG_ASSISTANT_TO_WEB_HB
(
   CARD_IDENTIFY        char(38) not null comment '卡别名',
   CARD_BANK            varchar(32) not null comment '卡所属银行简称',
   CARD_UPDATE_TIME     datetime not null comment '心跳接收时间',
   CARD_LOOP_TIME       varchar(8) not null comment '心跳间隔,秒单位',
   CARD_STATUS          varchar(8) not null comment '卡状态:0-正常,1-不正常',
   CARD_RESERVED1       varchar(512) comment '备注1',
   CARD_RESERVED2       varchar(512) comment '备注2',
   primary key (CARD_IDENTIFY)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table FC_BANKMSG_ASSISTANT_TO_WEB_HB comment '卡状态监控心跳表, 当卡心跳异常时, 修改卡命令状态表,修改卡账户状态';

/*==============================================================*/
/* Table: FC_BANKMSG_CARD_STATUS_INFO                           */
/*==============================================================*/
create table FC_BANKMSG_CARD_STATUS_INFO
(
   MSG_ID               int not null comment '卡状态命令信息ID',
   MSG_CARDNO           varchar(32) not null comment '卡别号',
   MSG_BANKNAME         varchar(64) not null comment '卡所属银行名称',
   MSG_CREATE_TIME      datetime not null comment '交易入库时间',
   MSG_STATUS           int not null comment '交易状态:0-失败.1-成功(注册或注销或卡登入或者卡登出)',
   MSG_CMDTYPE          int comment '交易命令类型:1-注册(启动),4-注销(未启动),13-卡登入,15-卡登出',
   MSG_UPD_ACCOUNT      int comment ' 是否已修改FC_ACCOUNT_SERVICE_REF表的status字段, 
            0-否,1-是,修改成功,2-修改失败.',
   MSG_ERROR_INFO       varchar(128) comment '状态处理失败原因',
   primary key (MSG_ID)
);

alter table FC_BANKMSG_CARD_STATUS_INFO comment '登录，登出，注册，注销';

/*==============================================================*/
/* Table: FC_BANKMSG_TRANS_RESULT_INFO                          */
/*==============================================================*/
create table FC_BANKMSG_TRANS_RESULT_INFO
(
   TRAN_ORDERNO         varchar(64) not null comment '交易序列号',
   TRAN_CARD_ALIAS      CHAR(38) not null comment '账户编号',
   TRAN_BANK_NAME       varchar(32) not null comment '银行名称',
   TRAN_CREATE_TIME     datetime not null comment '交易入库时间',
   TRAN_SRC_CARDNO      varchar(32) not null comment '付款账户',
   TRAN_SRC_CARDNAME    varchar(512) not null comment '付款人用户名称',
   TRAN_DEST_CARDNO     varchar(32) not null comment '收款账户',
   TRAN_DEST_CARDNAME   varchar(64) not null comment '收款人姓名',
   TRAN_MONEY           decimal(16,4) not null comment '转账金额',
   TRAN_POUNDAGE        decimal(16,4) not null comment '转账手续费',
   TRAN_RESULT_STATE    int not null comment '转账处理结果',
   TRAN_RESULT_MESSAGE  varchar(512) not null comment '转账处理结果信息',
   TRAN_RESERVE1        varchar(64) comment '备注1',
   TRAN_RESERVE2        varchar(512) comment '备注2',
   primary key (TRAN_ORDERNO)
);

alter table FC_BANKMSG_TRANS_RESULT_INFO comment '转账交易信息表';

/*==============================================================*/
/* Table: FC_BANKMSG_WEB_TO_ASSISTANT                           */
/*==============================================================*/
create table FC_BANKMSG_WEB_TO_ASSISTANT
(
   MSG_ORDERID          char(38) not null comment '交易序列号',
   MSG_CARD_IDENTIFY    char(38) not null comment '账户编号',
   MSG_CONTENT          text not null comment '消息内容',
   MSG_CMDTYPE          int not null comment '消息类型',
   MSG_CREATE_TIME      datetime not null comment '消息入库时间',
   MSG_STATUS           int not null comment '消息状态:0-消息入库,1-发往MQ,2-网银助手接收成功',
   MSG_UPDATE_TIME      datetime not null comment '消息状态修改时间',
   MSG_RESERVED1        varchar(255) comment '保留字段1',
   MSG_RESERVED2        varchar(1024) comment '保留字段2',
   primary key (MSG_ORDERID)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table FC_BANKMSG_WEB_TO_ASSISTANT comment '充提系统发给网银助手的交易.(自动登入登入,余额查询交易,卡转账交易)';
drop table if exists FC_CRM_CUSTOMER;

drop table if exists FC_CRM_CUSTOMER_ACCOUNT;

drop table if exists FC_CRM_CUSTOMER_BLACKLIST_INFO;

drop table if exists FC_CRM_CUSTOMER_PAY_ACCOUNT;

drop table if exists FC_CRM_MEMBER;

drop table if exists 客户支付平台账户;

/*==============================================================*/
/* Table: FC_CRM_CUSTOMER                                       */
/*==============================================================*/
create table FC_CRM_CUSTOMER
(
   FC_CUSTOMER_ID       char(38) not null comment '客户ID',
   CUSTOMER_NAME        varchar(32) not null comment '会员名',
   CUSTOMER_REAL_NAME   varchar(32) not null comment '姓名',
   MOBILE               varchar(20) comment '联系方式',
   AGENT                varchar(32) not null comment '代理人',
   BIRTHDAY             date comment '生日',
   STATUS               int not null comment '有效状态',
   primary key (FC_CUSTOMER_ID)
);

alter table FC_CRM_CUSTOMER comment '客户关联信息表';

/*==============================================================*/
/* Table: FC_CRM_CUSTOMER_ACCOUNT                               */
/*==============================================================*/
create table FC_CRM_CUSTOMER_ACCOUNT
(
   ACCOUNT_ID           CHAR(38) not null comment '账户ID',
   FC_CUSTOMER_ID       char(38) not null comment '客户ID',
   ACCOUNT_NO           varchar(20) not null comment '银行账户号',
   ACCOUNT_NAME         varchar(20) not null comment '银行账户名',
   ACCOUNT_BANK_NAME    varchar(200) not null comment '银行开户行名(内部转账如果不走加急转账，可以走普通转账，节省费用)',
   BANK_ALIAS           varchar(10) not null comment '银行别名(充提平台的简码，要与游戏系统有对应关系)',
   ACCOUNT_STATUS       int not null comment '账户状态(1正常，2停用，3冻结，4预警或危险，5已注销)',
   ACCOUNT_STATUS_INFO  varchar(50) comment '账户状态说明(如果改变了状态，可以增加说明描述，以备跟踪原因)',
   ACCOUNT_EDIT_DATETIME datetime comment '账户变更状态时间',
   ACCOUNT_REGISTER_DATETIME datetime not null comment '账户注册时间',
   IS_DEFAULT           bool not null comment '是否默认账户',
   primary key (ACCOUNT_ID)
);

alter table FC_CRM_CUSTOMER_ACCOUNT comment '客户账户表(会员卡账户信息,前期逐步积累客户的账户信息)';

/*==============================================================*/
/* Table: FC_CRM_CUSTOMER_BLACKLIST_INFO                        */
/*==============================================================*/
create table FC_CRM_CUSTOMER_BLACKLIST_INFO
(
   FC_CUSTOMER_ID       char(38) not null comment '客户ID',
   LEVEL                int not null comment '级别(-1黑名单，0 正常，1白名单)',
   VALID_BEND_TIME2     datetime comment '有效结束时间',
   VALID_BEGIN_TIME     datetime comment '有效开始时间',
   VALID_FLAG           bool not null comment '有效状态',
   primary key (FC_CUSTOMER_ID)
);

alter table FC_CRM_CUSTOMER_BLACKLIST_INFO comment '客户黑名单表';

/*==============================================================*/
/* Table: FC_CRM_CUSTOMER_PAY_ACCOUNT                           */
/*==============================================================*/
create table FC_CRM_CUSTOMER_PAY_ACCOUNT
(
   FC_CUSTOMER_PAY_ACCOUNT_ID char(38) not null comment '钱包账户ID',
   FC_CUSTOMER_ID       char(38) comment '客户ID',
   PAY_ACCOUNT_ID       varchar(32) not null comment '平台钱包账户号',
   BALANCE              decimal(16,4) not null comment '平台钱包余额',
   AVAILABLE_BALANCE    decimal(16,4) not null comment '可用余额',
   FROZEN_AMOUNT        decimal(16,4) not null comment '冻结金额',
   VALID_BEGIN_TIME     datetime comment '起始有效时间',
   VALID_END_TIME       datetime comment '起始结束时间',
   VALID_STATE          bool not null comment '有效状态',
   primary key (FC_CUSTOMER_PAY_ACCOUNT_ID)
);

alter table FC_CRM_CUSTOMER_PAY_ACCOUNT comment '平台钱包账户信息表(客户在支付平台注册的账户)';

/*==============================================================*/
/* Table: FC_CRM_MEMBER                                         */
/*==============================================================*/
create table FC_CRM_MEMBER
(
   FC_CUSTOMER_TRADE_ID varchar(64) not null comment '会员ID',
   BUSINESS_ID          char(38) not null comment '平台编码',
   FC_CUSTOMER_ID       char(38) not null comment '客户ID',
   CUSTOMER_NAME        varchar(32) not null comment '会员名，来源于游戏平台会员名',
   CUSTOMER_REAL_NAME   varchar(32) not null comment '姓名',
   MOBILE               varchar(20) comment '联系方式',
   AGENT                varchar(32) not null comment '代理人',
   BIRTHDAY             date comment '生日',
   STATUS               int not null comment '有效状态',
   primary key (FC_CUSTOMER_TRADE_ID)
);

alter table FC_CRM_MEMBER comment '会员信息表';

/*==============================================================*/
/* Table: 客户支付平台账户                                              */
/*==============================================================*/
create table 客户支付平台账户;

alter table 客户支付平台账户 comment '客户支付平台账户(客户在支付平台注册的账户)';
drop table if exists FC_INNERC_ACCOUNT;

drop table if exists FC_INNERC_ACCOUNT_DETAIL;

drop table if exists FC_INNERC_ACCOUNT_GROUP;

drop table if exists FC_INNERC_ACCOUNT_LEDGER;

drop table if exists FC_INNERC_BANK_ACCOUNT_SECURITY;

drop table if exists FC_INNERC_BANK_INFO;

drop table if exists FC_INNERC_PAYMENT_ACCOUNT;

drop table if exists FC_INNERC_PAYMENT_ACCOUNT_SECURITY;

drop table if exists FC_INNERC_PAYMENT_CHANNEL;

drop table if exists FC_INNERC_PAYMENT_INFO;

drop table if exists U;

/*==============================================================*/
/* Table: FC_INNERC_ACCOUNT                                     */
/*==============================================================*/
create table FC_INNERC_ACCOUNT
(
   ACCOUNT_ALIAS        CHAR(38) not null comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   ACCOUNT_NO           varchar(20) not null comment '账户号',
   ACCOUNT_NAME         varchar(20) not null comment '账户名称',
   ACCOUNT_BANK_NAME    varchar(200) not null comment '开户行名(内部转账如果不走加急转账，可以走普通转账，节省费用)',
   ACCOUNT_BANK_ALIAS   varchar(10) not null comment '银行别名(有字典表)',
   ACCOUNT_GROUP_ID     varchar(64) not null comment '账户组ID',
   ACCOUNT_AUTO_TYPE    int not null comment '账户处理方式(1.自动，0手动，用于出款卡的控制)',
   ACCOUNT_STATUS       int not null comment '账户状态(1正常，2停用，3冻结，4预警或危险，5已注销)',
   ACCOUNT_STATUS_INFO  varchar(200) not null comment '账户状态说明(如果改变了状态，可以增加说明描述，以备跟踪原因)',
   PAYMENT_TYPE         int not null comment '充提标识(1为收入类账户（收款卡），2为支出类账户（付款卡），0即可收入也可支出，系统暂时无此类账户)',
   ACCOUNT_TIER         int not null default 0 comment '账户层级(0,充提账户，1中转账户，2资金池账户（资金池账户内部由其它表来具体描述）)',
   UPDATE_TIME          datetime not null comment '账户变更状态时间',
   CREATE_TIME          datetime not null comment '账户注册时间',
   CREATED_BY           varchar(32) not null comment '注册人',
   MODIFIED_BY          varchar(32) not null comment '修改人',
   BANK_NAME            varchar(30) not null comment '银行全称',
   EMAIL                varchar(50) not null comment '转账EMAIL',
   primary key (ACCOUNT_ALIAS)
);

alter table FC_INNERC_ACCOUNT comment '卡账户表(只管理内部卡账户，不管理第三方账户)';

/*==============================================================*/
/* Table: FC_INNERC_ACCOUNT_DETAIL                              */
/*==============================================================*/
create table FC_INNERC_ACCOUNT_DETAIL
(
   ACCOUNT_DETAIL_ID    char(38) not null comment '内部账户明细账ID',
   ACCOUNT_ALIAS        CHAR(38) comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   AMOUNT               decimal(16,4) comment '交易金额',
   TRANS_TIME           datetime comment '交易时间',
   TRANS_FLAG           int comment '收付标志(1,收入，2支出)',
   CURRENCY             int comment '币种(默认1，人民币)',
   ACCOUNT_TYPE         int comment '账务类型(1系统记账（平台记得都是系统账），1.手工记账（手工调账，人工打款，平台没记录的账务变动）)',
   CURRENT_RELATIONSHIPS int comment '往来关系(1.内部测试（1元测试），2.与内部账户往来，3.与外部账户往来)',
   FUND_USED            int comment '资金用途(1.往来收付，2.手续费)',
   TRANS_COMMENTS       varchar(200) comment '交易附言',
   BANK_TRANS_COMMENTS  varchar(200) comment '银行交易摘要',
   BANK_FLOW            varchar(32) comment '银行交易流水号',
   POUNDAGE             decimal(16,4) not null comment '手续费',
   LAST_BALANCE         decimal(16,4) comment '账户当前余额',
   FC_ORDER_NO          varchar(32) not null comment '平台交易流水号(充提平台的转账操作视为与银行发起的一次交易，每次会生成一个流水号，此流水号为交易的唯一标识，也是发给网银助手的命令序列号)',
   FC_TRADE_CODE        int comment '业务表标识(标识不同的业务表，产生交易的业务表，与平台交易流水号共同使用（放款表 出款表 回转表 充值表 ）)',
   TO_ACCOUNT_ID        varchar(20) not null comment '交易对手账户ID',
   TO_ACCOUNT_TYPE      int not null comment '交易对手类型(1，内部账户，2，客户账户)',
   primary key (ACCOUNT_DETAIL_ID)
);

alter table FC_INNERC_ACCOUNT_DETAIL comment '内部账户明细账表(记录各账户的明细账，有手续费的，会形成两笔记录，所有交易都会影响此表，充值，提现，转回，人工处理网银（';

/*==============================================================*/
/* Table: FC_INNERC_ACCOUNT_GROUP                               */
/*==============================================================*/
create table FC_INNERC_ACCOUNT_GROUP
(
   ACCOUNT_GROUP_ID     char(38) not null comment '账户组ID',
   BUSINESS_ID          varchar(32) comment '平台编码',
   ACCOUNT_GROUP_NAME   varchar(30) comment '账户组名称',
   ACCOUNT_GROUP_DESC   varchar(100) comment '账户组描述',
   PARENT_ACCOUNT_GROUP_ID int comment '父账户组ID',
   BEGIN_TIME           datetime comment '有效开始时间',
   END_TIME             datetime comment '有效结束时间',
   primary key (ACCOUNT_GROUP_ID)
);

alter table FC_INNERC_ACCOUNT_GROUP comment '账户组表(每个账户组属于不同的账户类型，同时也属于不同的业务平台)';

/*==============================================================*/
/* Table: FC_INNERC_ACCOUNT_LEDGER                              */
/*==============================================================*/
create table FC_INNERC_ACCOUNT_LEDGER
(
   ACCOUNT_ALIAS        CHAR(38) not null comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   LAST_BALANCE         decimal(10,2) comment '账户当前余额',
   LAST_TIME            datetime comment '最后一次变动时间',
   primary key (ACCOUNT_ALIAS)
);

alter table FC_INNERC_ACCOUNT_LEDGER comment '内部账户分户账表(记录各账户的分户账)';

/*==============================================================*/
/* Table: FC_INNERC_BANK_ACCOUNT_SECURITY                       */
/*==============================================================*/
create table FC_INNERC_BANK_ACCOUNT_SECURITY
(
   ACCOUNT_ALIAS        CHAR(38) not null comment '账户编号(内部用于方便记忆的编号，比如ICBC5, 与平台编号共同确保唯一号，要有规则)',
   LOGIN_NAME           varchar(50) comment '银行登陆名称',
   LOGIN_PASSWORD       varchar(50) comment '银行登陆密码',
   TRANSACT_PASSWORD    varchar(50) comment '银行交易密码',
   UFLAG                int comment '是否需要U盾(0不需要U盾可以查询，1需要U盾查询，2需要U盾转账)',
   UNO                  varchar(100) comment 'U盾编号',
   UPDATE_TIME          datetime comment '修改时间',
   ENCRYPT              varchar(50) comment '加密算法(密码等需要加密，加密算法不同账号可以不同，不同阶段可以不同)',
   UD_PASSWORD          varchar(50) comment 'U盾密码',
   BANK_WEB_BROWER_DLL  varchar(50) comment '对应的动态库',
   primary key (ACCOUNT_ALIAS)
);

alter table FC_INNERC_BANK_ACCOUNT_SECURITY comment '银行账户安全信息管理表(银行账户安全性管理)';

/*==============================================================*/
/* Table: FC_INNERC_BANK_INFO                                   */
/*==============================================================*/
create table FC_INNERC_BANK_INFO
(
   BANK_ALIAS           varchar(10) not null comment '银行别名',
   BANK_NAME            varchar(30) comment '银行全称',
   primary key (BANK_ALIAS)
);

alter table FC_INNERC_BANK_INFO comment '银行简码字典表(银行简码字典)';

/*==============================================================*/
/* Table: FC_INNERC_PAYMENT_ACCOUNT                             */
/*==============================================================*/
create table FC_INNERC_PAYMENT_ACCOUNT
(
   PAYMENT_ID           char(38) not null comment '第三方支付账户ID',
   SELLER_NO            varchar(100) comment '商户支付账号',
   SELLER_ALIAS         varchar(100) not null comment '商户账户别名(自己内部定义的别名，用于区分不同账户)',
   SELLER_NAME          varchar(100) comment '商户名称',
   SELLER_INFO          varchar(100) comment '商户描述',
   PAYMENT_ALIAS        varchar(10) comment '第三方支付别名',
   BUSINESS_ID          char(64) comment '平台编码',
   ACCOUNT_AUTO_TYPE    int comment '账户处理方式(1.自动，0手动，用于出款卡的控制)',
   ACCOUNT_STATUS       int comment '账户状态(1正常，2停用，3冻结，4预警或危险，5已注销)',
   ACCOUNT_STATUS_INFO  varchar(50) comment '账户状态说明(如果改变了状态，可以增加说明描述，以备跟踪原因)',
   ACCOUNT_UPDATE_TIME  datetime comment '账户变更状态时间',
   ACCOUNT_REGISTER_TIME datetime comment '账户注册时间',
   PAYMENT_TYPE         int comment '收付属性(1为收入类账户（收款卡），2为支出类账户（付款卡），0即可收入也可支出，系统暂时无此类账户)',
   ACCOUNT_TIER         int default 0 comment '账户层级(0,充提账户，1中转账户，2资金池账户（资金池账户内部由其它表来具体描述）)',
   primary key (PAYMENT_ID)
);

alter table FC_INNERC_PAYMENT_ACCOUNT comment '第三方支付账户表(第三方账户表)';

/*==============================================================*/
/* Table: FC_INNERC_PAYMENT_ACCOUNT_SECURITY                    */
/*==============================================================*/
create table FC_INNERC_PAYMENT_ACCOUNT_SECURITY
(
   PAYMENT_ID           char(38) not null comment '第三方支付账户ID',
   LOGIN_NAME           varchar(50) not null comment '第三方支付登陆名称',
   LOGIN_PASSWORD       varchar(50) not null comment '第三方支付登陆密码',
   TRANSACT_PASSWORD    varchar(50) not null comment '第三方支付交易密码',
   UFLAG                int not null comment '是否需要U盾(0不需要U盾可以查询，1需要U盾查询，2需要U盾转账)',
   UNO                  varchar(100) not null comment 'U盾编号',
   UPDATE_TIME          datetime not null comment '修改时间',
   ENCRYPT              varchar(50) not null comment '加密算法(密码等需要加密，加密算法不同账号可以不同，不同阶段可以不同)',
   DEFAULT_TYPE         int comment '默认类型(0为登录，支付默认名称，1为登录默认名称，2为支付默认名称)',
   primary key (PAYMENT_ID)
);

alter table FC_INNERC_PAYMENT_ACCOUNT_SECURITY comment '第三方支付账户安全信息管理表(第三方支付账户安全性管理，由于第三方支付有多个登录账户，支付账户，所以一个商户可能对于多个';

/*==============================================================*/
/* Table: FC_INNERC_PAYMENT_CHANNEL                             */
/*==============================================================*/
create table FC_INNERC_PAYMENT_CHANNEL
(
   PAYMENT_CHANNEL_ID   char(38) not null comment '支付渠道ID',
   CHANNEL_NAME         varchar(30) comment '渠道名称',
   primary key (PAYMENT_CHANNEL_ID)
);

alter table FC_INNERC_PAYMENT_CHANNEL comment '支付渠道类型表(支付渠道表)';

/*==============================================================*/
/* Table: FC_INNERC_PAYMENT_INFO                                */
/*==============================================================*/
create table FC_INNERC_PAYMENT_INFO
(
   PAYMENT_ALIAS        varchar(10) not null comment '第三方支付别名',
   PAYMENT_NAME         varchar(30) comment '第三方支付全称',
   primary key (PAYMENT_ALIAS)
);

alter table FC_INNERC_PAYMENT_INFO comment '第三方支付简码字典表(第三方支付简码字典)';

/*==============================================================*/
/* Table: U                                                     */
/*==============================================================*/
create table U
(
   BANK_VERSION         varchar(100) comment '使用银行的版本',
   BANK_WEB_BROWER_DLL  varchar(50) comment '对应的动态库',
   UNO                  varchar(100) comment 'U盾编号'
);

alter table U comment 'U()';
drop table if exists FC_WITHDRAW_APPLY;

drop table if exists FC_WITHDRAW_DRAW_APPLY_REF;

drop table if exists FC_WITHDRAW_LOAN_RECORD;

drop table if exists FC_WITHDRAW_LOAN_TRANS_DETAIL;

drop table if exists FC_WITHDRAW_RECORD;

drop table if exists FC_WITHDRAW_TRANS_DETAIL;

/*==============================================================*/
/* Table: FC_WITHDRAW_APPLY                                     */
/*==============================================================*/
create table FC_WITHDRAW_APPLY
(
   FC_WITH_APPLY_ID     char(38) not null comment '提现申请ID',
   BUSINESS_ID          char(64) not null comment '平台编码',
   DRAW_APPLY_ID        varchar(30) not null comment '提款申请流水号(游戏平台提款申请流水号)',
   USER_NAME            varchar(20) not null comment '会员账号',
   AMOUNT               decimal(16,4) not null comment '提现金额',
   DRAW_TYPE            int not null comment '提现渠道(渠道类型字典表外键)',
   DRAW_BANK_ALIAS      CHAR(38) not null comment '提现卡银行别名',
   DRAW_NO              varchar(50) not null comment '提现账号',
   DRAW_NAME            varchar(50) not null comment '提现账号真实姓名',
   APPLY_TIME           datetime not null comment '提现申请时间',
   APPLY_RECEIVE_TIME   datetime not null comment '提现申请接收时间(充提平台收到提现申请的时间)',
   DATA_NO              varchar(32) comment '报文流水号(交易报文中的dataNo，返回时以这个为准)',
   RISK_STATUS          int comment '风控数据状态(1未同步，2已同步，0同步失败)',
   STATUS               int comment '状态(1待提现，2已提现，3提现未成功（查看提现备注）)',
   COMMENTS             varchar(300) comment '提现备注',
   RISK_SYN_TYPE        int comment '风控数据同步失败类型(1.充提账变失败，2流水失败，4中奖数据失败，8总账数据失败)',
   primary key (FC_WITH_APPLY_ID)
);

alter table FC_WITHDRAW_APPLY comment '提现申请表(业务平台提现申请记录)';

/*==============================================================*/
/* Table: FC_WITHDRAW_DRAW_APPLY_REF                            */
/*==============================================================*/
create table FC_WITHDRAW_DRAW_APPLY_REF
(
   ID                   int not null comment 'ID',
   LOAN_RECORD_ID       char(38) comment '放款ID',
   FC_WITH_APPLY_ID     char(38) comment '提现申请ID',
   primary key (ID)
);

alter table FC_WITHDRAW_DRAW_APPLY_REF comment '放款申请关系表(申请与出款的关系表，申请和出款是多对一关系，1、直接出款和拆分出款：一次申请出款一次；2、合并出款：多次';

/*==============================================================*/
/* Table: FC_WITHDRAW_LOAN_RECORD                               */
/*==============================================================*/
create table FC_WITHDRAW_LOAN_RECORD
(
   LOAN_RECORD_ID       char(38) not null comment '放款ID',
   USER_ID              char(38) not null comment '操作员ID',
   BANK_ALIAS           varchar(10) not null comment '放款银行别名(取自银行别名字典表)',
   CARD_ALIAS           varchar(10) not null comment '放款卡别名',
   AMOUNT               decimal(16,4) not null comment '放款金额',
   LOAN_TYPE            int not null comment '放款类型(1全自动放款、2半自动放款、3异常处理、4人工放款)',
   LOAN_PATTERN         int not null comment '放款模式(1单笔放款、2拆分放款、3合并放款)',
   LOAN_STATUS          int not null comment '放款状态(1放款中、2放款成功、9放款失败)',
   LOAN_TIME            datetime not null comment '放款时间',
   COMMENT              varchar(200) comment '备注(放款状态描述，如放款失败原因等)',
   primary key (LOAN_RECORD_ID)
);

alter table FC_WITHDRAW_LOAN_RECORD comment '放款表(放款记录表，流程到达放款任务前，根据金额自动生成不同模式任务，记录该表)';

/*==============================================================*/
/* Table: FC_WITHDRAW_LOAN_TRANS_DETAIL                         */
/*==============================================================*/
create table FC_WITHDRAW_LOAN_TRANS_DETAIL
(
   FC_ORDER_NO          char(64) not null comment '平台交易流水号(充提平台的转账操作视为与银行发起的一次交易，每次会生成一个流水号，此流水号为交易的唯一标识，也是发给网银助手的命令序列号)',
   LOAN_RECORD_ID       char(38) comment '放款ID',
   PAY_BANK_ALIAS       varchar(10) not null comment '付款行别名',
   PAY_BANK_NO          varchar(20) not null comment '付款行账号',
   PAY_USER_NAME        varchar(10) not null comment '付款人用户名称',
   INCOME_BANK_ALIAS    varchar(10) not null comment '收款行别名',
   INCOME_BANK_NO       varchar(20) not null comment '收款行账号',
   INCOME_USER_NAME     varchar(10) not null comment '收款人用户名称',
   TRANS_COMMENTS       varchar(200) comment '交易附言',
   AMOUNT               decimal(16,4) not null comment '付款金额',
   INCOME_BANK_CITY     varchar(10) comment '收款账号开户城市名',
   INCOME_BANK_NAME     varchar(20) comment '收款账号开户行名称',
   TRANSFER_TYPE        int not null comment '转账类型',
   POUNDAGE             decimal(16,4) not null comment '手续费',
   INCOME_USER_PHONE    varchar(20) comment '收款人手机号码',
   INCOME_CONTACTS      varchar(10) comment '收款联系人',
   ORDER_TIMES          int not null comment '命令发送次数(每笔放款只进行固定次数发送，每次次数+1)',
   STATUS               int not null comment '状态(1成功，0失败，2处理中)',
   TRANS_TIME           datetime comment '交易时间(网银返回的实际交易时间)',
   CURRENTD_TIME        datetime comment '当前时间(记录产生时间，以后后续查询用)',
   OPERATOR             varchar(20) comment '操作员ID(如果是全自动放款，此字段为空，如果是半自动、异常处理、人工放款此字段为操作员Id)',
   BANK_COMMENTS        varchar(500) comment '银行交易结果描述',
   primary key (FC_ORDER_NO)
);

alter table FC_WITHDRAW_LOAN_TRANS_DETAIL comment '放款卡交易明细表(放款卡交易明细，提交放款任务时，记录此表，卡交易完成后修改此表状态)';

/*==============================================================*/
/* Table: FC_WITHDRAW_RECORD                                    */
/*==============================================================*/
create table FC_WITHDRAW_RECORD
(
   WITHDRAW_RECORD_ID   char(38) not null comment '出款ID',
   FC_WITH_APPLY_ID     char(38) comment '提现申请ID',
   BANK_ALIAS           varchar(10) not null comment '出款银行别名(取自银行别名字典表)',
   CARD_ALIAS           varchar(10) not null comment '出款卡别名',
   AMOUNT               decimal(16,4) not null comment '出款金额',
   OPERATOR             char(38) default 'NF' comment '操作员ID(如果是全自动放款，此字段为NF，如果是半自动、异常处理、人工放款此字段为操作员Id)',
   LOAN_TYPE            int not null comment '出款类型(1全自动放款、2半自动放款、3异常处理、4人工放款)',
   LOAN_PATTERN         int not null comment '出款模式(1单笔放款、2拆分放款、3合并放款)',
   LOAN_STATUS          int not null comment '出款状态(1放款中、2放款成功、9放款失败)',
   LOAN_TIME            datetime not null comment '出款时间',
   COMMENT              varchar(200) comment '备注(放款状态描述，如放款失败原因等)',
   primary key (WITHDRAW_RECORD_ID)
);

alter table FC_WITHDRAW_RECORD comment '出款表(出款记录表，流程到达出款任务前，根据金额自动生成不同模式任务，记录该表)';

/*==============================================================*/
/* Table: FC_WITHDRAW_TRANS_DETAIL                              */
/*==============================================================*/
create table FC_WITHDRAW_TRANS_DETAIL
(
   FC_ORDER_NO          char(38) not null comment '平台交易流水号(充提平台的转账操作视为与银行发起的一次交易，每次会生成一个流水号，此流水号为交易的唯一标识，也是发给网银助手的命令序列号)',
   WITHDRAW_RECORD_ID   char(38) not null comment '出款ID',
   LOAN_RECORD_ID       int not null comment '放款表ID(每条放款记录对应1到多条银行卡交易（多条时为拆分放款）)',
   PAY_BANK_ALIAS       varchar(10) not null comment '付款行别名',
   PAY_BANK_NO          varchar(20) not null comment '付款行账号',
   PAY_USER_NAME        varchar(10) not null comment '付款人用户名称',
   INCOME_BANK_ALIAS    varchar(10) not null comment '收款行别名',
   INCOME_BANK_NO       varchar(20) not null comment '收款行账号',
   TRANS_COMMENTS       varchar(200) comment '交易附言',
   INCOME_USER_NAME     varchar(10) not null comment '收款人用户名称',
   AMOUNT               decimal(16,4) not null comment '付款金额',
   INCOME_BANK_CITY     varchar(10) comment '收款账号开户城市名',
   INCOME_BANK_NAME     varchar(20) comment '收款账号开户行名称',
   TRANSFER_TYPE        int not null comment '转账类型',
   POUNDAGE             decimal(16,4) not null comment '手续费',
   INCOME_USER_PHONE    varchar(20) comment '收款人手机号码',
   INCOME_CONTACTS      varchar(10) comment '收款联系人',
   ORDER_TIMES          int not null comment '命令发送次数(每笔放款只进行固定次数发送，每次次数+1)',
   STATUS               int not null comment '状态(1成功，0失败，2处理中)',
   TRANS_TIME           datetime comment '交易时间(网银返回的实际交易时间)',
   CURRENTD_TIME        datetime comment '当前时间(记录产生时间，以后后续查询用)',
   OPERATOR             varchar(20) comment '操作员ID(如果是全自动放款，此字段为空，如果是半自动、异常处理、人工放款此字段为操作员Id)',
   BANK_COMMENTS        varchar(500) comment '银行交易结果描述',
   primary key (FC_ORDER_NO)
);

alter table FC_WITHDRAW_TRANS_DETAIL comment '出款卡交易明细表(记录交易明细，提交出款任务时，记录此表，卡交易完成后修改此表状态)';
drop table if exists FC_SYS_BRANCH;

drop table if exists FC_SYS_BUSINESS;

drop table if exists FC_SYS_MENU;

drop table if exists FC_SYS_ROLE;

drop table if exists FC_SYS_ROLE_MENU;

drop table if exists FC_SYS_ROLE_MUTEX;

drop table if exists FC_SYS_USER;

drop table if exists FC_SYS_USER_ROLE;

/*==============================================================*/
/* Table: FC_SYS_BRANCH                                         */
/*==============================================================*/
create table FC_SYS_BRANCH
(
   BRANCH_ID            int not null comment '机构ID(按层级编码，三位一级，100开头，顺序递增，有系统自动控制)',
   BRANCH_NAME          varchar(100) not null comment '机构名称',
   BRANCH_DESC          varchar(200) not null comment '机构描述',
   BRANCH_MANAGER       varchar(50) not null comment '机构负责人',
   MOBILE               varchar(20) not null comment '机构负责人电话',
   BEGIN_TIME           datetime not null comment '有效开始时间',
   END_TIME             datetime not null comment '有效截止时间',
   PARENT_ID            int not null comment '机构上一级ID',
   LEAF_FLAG            boolean not null comment '是否叶子节点，1是，0不是',
   BRANCH_SEQ           int not null comment '同级机构顺序',
   LEVEL                int not null comment '层级',
   primary key (BRANCH_ID)
);

alter table FC_SYS_BRANCH comment '机构表(机构表)';

/*==============================================================*/
/* Table: FC_SYS_BUSINESS                                       */
/*==============================================================*/
create table FC_SYS_BUSINESS
(
   BUSINESS_ID          char(64) not null comment '平台编码',
   BUSINESS_NAME        varchar(100) not null,
   BUSINESS_DESC        varchar(100),
   BUSINESS_MANAGER     varchar(100) not null,
   BUSINESS_MOBILE      varchar(100),
   BUSINESS_SEQ         int not null,
   BEGIN_TIME           datetime,
   END_TIME             datetime,
   STATUS               int not null,
   BUSINESS_DATA_PERMISSION int not null comment '系统分配值，从1,2,4,8,16,32.。。。。',
   primary key (BUSINESS_ID)
);

alter table FC_SYS_BUSINESS comment '业务平台表';

/*==============================================================*/
/* Table: FC_SYS_MENU                                           */
/*==============================================================*/
create table FC_SYS_MENU
(
   MENU_ID              int not null comment '菜单ID',
   MENU_NAME            varchar(100) not null comment '菜单名称',
   MENU_DESC            varchar(200) comment '菜单描述',
   MENU_SEQ             int not null comment '菜单顺序',
   MENU_URL             varchar(200) not null comment '菜单地址',
   PARENT_ID            int not null comment '上级菜单ID',
   LEAF_FLAG            int not null comment '是否叶子节点',
   LEVEL                int not null comment '层级',
   primary key (MENU_ID)
);

alter table FC_SYS_MENU comment '菜单表(菜单表)';

/*==============================================================*/
/* Table: FC_SYS_ROLE                                           */
/*==============================================================*/
create table FC_SYS_ROLE
(
   ROLE_ID              char(38) not null comment '角色ID',
   ROLE_NAME            varchar(50) not null comment '角色名称',
   ROLE_DESC            varchar(100) comment '角色权限描述',
   STATUS               int not null comment '角色状态',
   primary key (ROLE_ID)
);

alter table FC_SYS_ROLE comment '角色表(角色表)';

/*==============================================================*/
/* Table: FC_SYS_ROLE_MENU                                      */
/*==============================================================*/
create table FC_SYS_ROLE_MENU
(
   ID                   char(38) not null comment '角色权限表ID',
   MENU_ID              int comment '菜单ID',
   ROLE_ID              char(38) comment '角色ID',
   STATUS               int not null comment '状态，采用统一状态字典',
   primary key (ID)
);

alter table FC_SYS_ROLE_MENU comment '角色权限表(角色权限表)';

/*==============================================================*/
/* Table: FC_SYS_ROLE_MUTEX                                     */
/*==============================================================*/
create table FC_SYS_ROLE_MUTEX
(
   ROLE_MUTEX_ID        char(38) not null comment '角色互斥ID',
   ROLE_ID_A            char(38) not null comment '角色ID',
   ROLE_ID_B            char(38) not null comment '角色ID',
   STATUS               int not null comment '状态',
   primary key (ROLE_MUTEX_ID)
);

alter table FC_SYS_ROLE_MUTEX comment '角色互斥表(角色互斥表)';

/*==============================================================*/
/* Table: FC_SYS_USER                                           */
/*==============================================================*/
create table FC_SYS_USER
(
   USER_ID              char(38) not null comment '用户ID',
   BRANCH_ID            int not null comment '机构ID(按层级编码，三位一级，100开头，顺序递增，有系统自动控制)',
   LOGIN_NAME           varchar(32) not null comment '登录名',
   USER_NAME            varchar(50) not null comment '用户名称',
   MOBILE               varchar(20) comment '用户手机',
   USER_WORKADDRESS     varchar(100) comment '用户办公地址',
   STATUS               int not null comment '用户状态',
   PASSWORD             varchar(32) not null comment '用户系统密码(md5加密处理)',
   UPDATE_TIME          datetime not null comment '变更时间',
   CREATE_TIME          datetime not null comment '注册时间',
   CREATED_BY           varchar(32) not null comment '注册人(取登录名称（用户的唯一名称）)',
   MODIFIED_BY          varchar(32) not null comment '修改人',
   EMAIL                varchar(32) not null comment 'EMAIL',
   DATA_ENVIRON         int not null comment '数据范围权限(现在只有平台权限)',
   ICON                 varchar(100) not null comment '用户头像图标',
   primary key (USER_ID)
);

alter table FC_SYS_USER comment '用户表(用户表)';

/*==============================================================*/
/* Table: FC_SYS_USER_ROLE                                      */
/*==============================================================*/
create table FC_SYS_USER_ROLE
(
   USER_ROLE_ID         char(38) not null comment '用户与角色关系ID',
   ROLE_ID              varchar(64) comment '角色ID',
   USER_ID              char(38) comment '用户ID',
   STATUS               tinyint comment '状态',
   primary key (USER_ROLE_ID)
);

alter table FC_SYS_USER_ROLE comment '用户与角色关系表(用户与角色)';
