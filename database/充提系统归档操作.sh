--表 FC_RISK_GAME_FLOW_DETAIL 归档，依赖字段 RECORD_DATA, 保留14天
CREATE TABLE archive_db.FC_RISK_GAME_FLOW_DETAIL20150720 LIKE fcpay.FC_RISK_GAME_FLOW_DETAIL;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=fcpay,t=FC_RISK_GAME_FLOW_DETAIL --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=FC_RISK_GAME_FLOW_DETAIL20150720 --charset utf8 --where "RECORD_DATA < DATE_ADD(NOW(),interval -14 day)"  --limit 100 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 FC_RISK_GAME_WINNING_INFO 归档，依赖字段 RECORD_DATA, 保留14天
CREATE TABLE archive_db.FC_RISK_GAME_WINNING_INFO20150709 LIKE fcpay.FC_RISK_GAME_WINNING_INFO;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=fcpay,t=FC_RISK_GAME_WINNING_INFO --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=FC_RISK_GAME_WINNING_INFO20150709 --charset utf8 --where "RECORD_DATA < DATE_ADD(NOW(),interval -14 day)"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 FC_WEB_GAME_TRADE 归档，依赖字段 TRAD_MSG_UPDATE_TIME, 保留14天
CREATE TABLE archive_db.FC_WEB_GAME_TRADE20150709 LIKE fcpay.FC_WEB_GAME_TRADE;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=fcpay,t=FC_WEB_GAME_TRADE --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=FC_WEB_GAME_TRADE20150709 --charset utf8 --where "TRAD_MSG_UPDATE_TIME < DATE_ADD(NOW(),interval -14 day)"  --limit 100 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 FC_BANKMSG_WEB_TO_ASSISTANT 归档，依赖字段 MSG_UPDATE_TIME, 保留8天
CREATE TABLE archive_db.FC_BANKMSG_WEB_TO_ASSISTANT20150709 LIKE fcpay.FC_BANKMSG_WEB_TO_ASSISTANT;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=fcpay,t=FC_BANKMSG_WEB_TO_ASSISTANT --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=FC_BANKMSG_WEB_TO_ASSISTANT20150709 --charset utf8 --where "MSG_UPDATE_TIME < DATE_ADD(NOW(),interval -8 day)"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 FC_BANKMSG_ASSISTANT_TO_WEB 归档，依赖字段 MSG_UPDATE_TIME, 保留8天
CREATE TABLE archive_db.FC_BANKMSG_ASSISTANT_TO_WEB20150709 LIKE fcpay.FC_BANKMSG_ASSISTANT_TO_WEB;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=fcpay,t=FC_BANKMSG_ASSISTANT_TO_WEB --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=FC_BANKMSG_ASSISTANT_TO_WEB20150709 --charset utf8 --where "MSG_UPDATE_TIME < DATE_ADD(NOW(),interval -8 day)"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 oplogs 归档，依赖字段 createtime, 保留9天
CREATE TABLE archive_db.oplogs20150709 LIKE npe.oplogs;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=npe,t=oplogs --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=oplogs20150709 --no-check-charset --where "createtime < UNIX_TIMESTAMP(DATE_ADD(NOW(),interval -9 day))"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 

--表 tasks 归档，依赖字段 createtime, 保留9天
CREATE TABLE archive_db.tasks20150709 LIKE npe.tasks;
pt-archiver --ask-pass  --source h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=npe,t=tasks --dest h=localhost,u=root,S=/data/db/mysql3398/mysql3398.sock,D=archive_db,t=tasks20150709 --no-check-charset --where "createtime < UNIX_TIMESTAMP(DATE_ADD(NOW(),interval -9 day))"  --limit 1000 --low-priority-insert --bulk-insert --ignore --low-priority-delete --commit-each  --statistics --why-quit --local --progress 100000 --dry-run 