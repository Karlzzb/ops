
TRUNCATE TABLE ucenter_new.`u_admin`;
REPLACE INTO ucenter_new.`u_admin`(`uid`,`user_name`,`userpwd`,`email`,`pools`,`groups`,`regtime`,`regip`,`sta`,`logintime`,`loginip`) SELECT `uid`,`user_name`,`userpwd`,`email`,`pools`,`groups`,`regtime`,`regip`,`sta`,`logintime`,`loginip` FROM `ucenter_old`.`u_admin`;

TRUNCATE TABLE ucenter_new.u_admin_config;
REPLACE INTO ucenter_new.`u_admin_config`(`key`,`value`,`remark`,`up_time`) SELECT `key`,`value`,`remark`,`up_time` FROM ucenter_old.u_admin_config;

TRUNCATE TABLE ucenter_new.`u_admin_log`;
REPLACE INTO ucenter_new.`u_admin_log`(`id`,`user_name`,`operate_msg`,`operate_time`,`isalert`,`msg_hash`,`isread`) SELECT `id`,`user_name`,`operate_msg`,`operate_time`,`isalert`,`msg_hash`,`isread` FROM ucenter_old.`u_admin_log`;

TRUNCATE TABLE ucenter_new.`u_admin_login_history`;
REPLACE INTO ucenter_new.`u_admin_login_history`(`autoid`,`uid`,`accounts`,`loginip`,`logintime`,`pools`,`loginsta`,`cli_hash`) SELECT `autoid`,`uid`,`accounts`,`loginip`,`logintime`,`pools`,`loginsta`,`cli_hash` FROM ucenter_old.`u_admin_login_history`;

TRUNCATE TABLE ucenter_new.`u_admin_purview`;
REPLACE INTO ucenter_new.`u_admin_purview`(`uid`,`purviews`) SELECT `uid`,`purviews` FROM ucenter_old.`u_admin_purview`;

TRUNCATE TABLE ucenter_new.`u_config`;
REPLACE INTO ucenter_new.`u_config`(`id`,`title`,`key`,`value`,`limit`,`comment`,`config_type`) SELECT `id`,`title`,`key`,`value`,`limit`,`comment`,`config_type` FROM ucenter_old.`u_config`;

TRUNCATE TABLE ucenter_new.`u_login_err_log`;
REPLACE INTO ucenter_new.`u_login_err_log`(`account`,`login_time`,`ip`) SELECT `account`,`login_time`,`ip` FROM ucenter_old.`u_login_err_log`;


TRUNCATE TABLE ucenter_new.`u_login_history`;
REPLACE INTO ucenter_new.`u_login_history`(`user_id`,`user_name`,`msg`,`login_ip`,`atime`,`login_status`,`login_agent`) SELECT `user_id`,`user_name`,`msg`,`login_ip`,`atime`,`login_status`,`login_agent` FROM ucenter_old.`u_login_history`;

TRUNCATE TABLE ucenter_new.`u_user`;
REPLACE INTO ucenter_new.`u_user`(`user_id`,`email`,`passwd`,`user_name`,`is_login`,`new_face`,`mobile`,`pay_passwd`) SELECT `user_id`,`email`,`passwd`,`user_name`,`is_login`,`new_face`,`mobile`,`pay_passwd` FROM ucenter_old.`u_user`;

TRUNCATE TABLE ucenter_new.`u_user_api`;
REPLACE INTO ucenter_new.`u_user_api`(`user_api_id`,`user_api_name`,`user_id`,`flag`) SELECT `user_api_id`,`user_api_name`,`user_id`,`flag` FROM ucenter_old.`u_user_api`;

TRUNCATE TABLE ucenter_new.`u_user_api_log`;
REPLACE INTO ucenter_new.`u_user_api_log`(`id`,`app`,`method`,`etime`,`dtime`) SELECT `id`,`app`,`method`,`etime`,`dtime` FROM ucenter_old.`u_user_api_log`;

TRUNCATE TABLE ucenter_new.`u_user_details`;
REPLACE INTO ucenter_new.`u_user_details`(`user_id`,`reg_ip`,`reg_app`,`reg_app_channel`,`reg_app_rid`,`reg_app_info`,`reg_time`,`last_login`,`pwd_question`,`pwd_answer`,`super_passwd`,`real_certify`,`email_verify`,`idcard_verify`,`mobile_verify`,`face`,`is_new`,`gender`,`name`,`pet_name`,`birthday`,`idcard`,`star`,`animal`,`sign`,`introduce`,`location`,`location_birth`,`interest`,`book`,`move`,`idol`,`maxim`,`wish`,`resource`,`intent`,`welling`,`character`,`weight`,`height`,`is_marry`,`blood_type`,`pet`,`religion`,`is_smoke`,`is_drink`,`location_link`,`address`,`mobile`,`tel`,`pub_email`,`homepage`,`ims`,`jobs`,`school`,`privacy`,`feed_privacy`) SELECT `user_id`,`reg_ip`,`reg_app`,`reg_app_channel`,`reg_app_rid`,`reg_app_info`,`reg_time`,`last_login`,`pwd_question`,`pwd_answer`,`super_passwd`,`real_certify`,`email_verify`,`idcard_verify`,`mobile_verify`,`face`,`is_new`,`gender`,`name`,`pet_name`,`birthday`,`idcard`,`star`,`animal`,`sign`,`introduce`,`location`,`location_birth`,`interest`,`book`,`move`,`idol`,`maxim`,`wish`,`resource`,`intent`,`welling`,`character`,`weight`,`height`,`is_marry`,`blood_type`,`pet`,`religion`,`is_smoke`,`is_drink`,`location_link`,`address`,`mobile`,`tel`,`pub_email`,`homepage`,`ims`,`jobs`,`school`,`privacy`,`feed_privacy` FROM ucenter_old.`u_user_details`;

TRUNCATE TABLE ucenter_new.`u_user_score`;
REPLACE INTO ucenter_new.`u_user_score`(`user_id`,`total`,`silver_total`,`silver_balance`,`init_time`,`dml_time`,`dml_flag`) SELECT `user_id`,`total`,`silver_total`,`silver_balance`,`init_time`,`dml_time`,`dml_flag` FROM ucenter_old.`u_user_score`;

TRUNCATE TABLE ucenter_new.`u_user_score_history`;
REPLACE INTO ucenter_new.`u_user_score_history`(`auto_id`,`user_id`,`user_name`,`trade_id`,`source_code`,`in_silver`,`out_silver`,`notes`,`action_type`,`ip`,`init_time`,`dml_time`,`dml_flag`) SELECT `id`,`uid`,`user_name`,`trade_id`,`source_code`,`in_silver`,`out_silver`,`notes`,`action_type`,`ip`,`init_time`,`dml_time`,`dml_flag` FROM ucenter_old.`u_user_score_history`;