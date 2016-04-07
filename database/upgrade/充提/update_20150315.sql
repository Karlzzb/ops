USE fcpay;

alter table FC_WEB_GAME_TRADE add  DRAW_APPLY_ID  varchar(38)  comment '提款申请流水号(游戏平台提款申请流水号)';
alter table FC_BANK_DETAIL_QUERY add  FC_WITH_APPLY_ID     char(38) comment '提现申请ID';
alter table FC_BANK_DETAIL_QUERY  add DETAIL_TYPE  char(1) comment '详细信息类型：1 交易明细查询，2 交易状态查询。';
alter table FC_BANK_DETAIL_QUERY  add   TASK_ID   char(64) comment '任务ID';
alter table FC_SHIFT_SIGN_RECORD add SIGN_STATUS   char(2) comment '1已签到，2预签退，0已签退';