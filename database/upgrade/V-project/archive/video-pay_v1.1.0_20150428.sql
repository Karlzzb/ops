use fcpay;
drop table if exists FC_PAY_ORDER_RECORD;

/*==============================================================*/
/* Table: FC_PAY_ORDER_RECORD                                   */
/*==============================================================*/
create table FC_PAY_ORDER_RECORD
(
   FC_RECORD_ID         national varchar(64) not null comment '纪录流水号',
   FC_MESSAGE_NO        national char(64) not null comment '发送命令号',
   ORDER_NO             national varchar(38) not null comment '客户订单编号',
   STATE_CODE           national varchar(2) comment '订单状态（ 0.未交易1. 处理中 2. 已交易3.交易失败)',
   SUBMIT_TIME          datetime not null comment '交易时间',
   COMPLATE_TIME        datetime comment '完成时间',
   COMMIT               national varchar(255) comment '备注',
   LAST_UPDATE_TIME     datetime not null comment '最后修改时间',
   TYPE                 national char(2) comment '交易类型（ 1.支付2.退款）',
   REFUND_ID            national varchar(38) comment '退款编号',
   ORDER_ID             national varchar(38) comment '订单编号',
   TRADE_CHANNEL        national varchar(32) comment '交易平台类型（新生支付，支付宝...... ）',
   PLATFORM_ID          national varchar(32) comment '客戶平台',
   ORG_CODE             varchar(20) comment '机构代码',
   REFUND_STATE_CODE    varchar(50) comment '退款代码',
   REFUND_RECORD_NO     varchar(64) comment '退款流水号',
   PAID_AMOUNT          varchar(8) comment '支付金额',
   REFUND_AMOUNT        varchar(8) comment '退款金额',
   CODE                 varchar(100) comment '代码',
   CODE_MSG             varchar(300) comment '代码说明',
   primary key (FC_RECORD_ID),
   key fc_pay_order_record_ix2 (FC_RECORD_ID)
);


drop table if exists FC_PAY_TO_IPS;

/*==============================================================*/
/* Table: FC_PAY_TO_IPS                                         */
/*==============================================================*/
create table FC_PAY_TO_IPS
(
   FC_MESSAGE_NO        char(38) not null comment '发送命令号',
   SUBMIT_DATE          varchar(8) comment '订单日期',
   CURRENCY_TYPE        varchar(3) comment '币种',
   GATEWAY_TYPE         varchar(2) comment '支付卡种',
   LANG                 varchar(10) comment '语言',
   MERCHANT_URL         varchar(255) comment '支付结果成功返回的商户URL',
   FAIL_URL             varchar(255) comment '支付结果失败返回的商户URL',
   RET_ENCODE_TYPE      varchar(2) comment '交易返回接口加密方式',
   RET_TYPE             char(1) comment '返回方式',
   DO_CREDIT            char(1) comment '直连选项',
   BANK_CO              varchar(5) comment '银行代码',
   primary key (FC_MESSAGE_NO)
);



drop table if exists FC_PAY_FROM_IPS;

/*==============================================================*/
/* Table: FC_PAY_FROM_IPS                                       */
/*==============================================================*/
create table FC_PAY_FROM_IPS
(
   FC_ORDER_NO          varchar(32) not null comment '給新生的ID',
   MER_CODE             varchar(6) comment '商户编号',
   CURRENCY_TYPE        varchar(3) comment '币种',
   AMOUNT               varchar(10) comment '订单金额',
   SUBMIT_DATE          varchar(8) comment '订单日期',
   SUCC                 char(1) comment '成功标志',
   MSG                  varchar(255) comment '发卡行的返回信息',
   ATTACH               varchar(1024) comment '商户数据包',
   IPS_BILL_NO          varchar(18) comment 'IPS 订 单
            号',
   RET_ENCODE_TYPE      char(2) comment '交易返回签名方式',
   SIGNATURE            varchar(1024) comment '数字签名信息',
   BANK_BILL_NO         varchar(30) comment '银行订单号',
   primary key (FC_ORDER_NO)
);

