USE fcpay;

alter table FC_WEB_GAME_TRADE add  DRAW_APPLY_ID  varchar(38)  comment '���������ˮ��(��Ϸƽ̨���������ˮ��)';
alter table FC_BANK_DETAIL_QUERY add  FC_WITH_APPLY_ID     char(38) comment '��������ID';
alter table FC_BANK_DETAIL_QUERY  add DETAIL_TYPE  char(1) comment '��ϸ��Ϣ���ͣ�1 ������ϸ��ѯ��2 ����״̬��ѯ��';
alter table FC_BANK_DETAIL_QUERY  add   TASK_ID   char(64) comment '����ID';
alter table FC_SHIFT_SIGN_RECORD add SIGN_STATUS   char(2) comment '1��ǩ����2Ԥǩ�ˣ�0��ǩ��';