#pw_adminlog(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_adminlog,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "timestamp < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
pt-online-schema-change --alter "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8" u=root,D=s8_bbs,t=pw_msgc,S=/mysqldb/run/mysql.sock --charset utf8 --chunk-size 1000 --critical-load Threads_running=800 --max-load Threads_running=300 --ask-pass --statistics --dry-run



#pw_creditlog(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_creditlog,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "adddate < unix_timestamp('2015-1-1 00:00:00')"  --limit 500 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
pt-online-schema-change --alter "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8" u=root,D=s8_bbs,t=pw_creditlog,S=/mysqldb/run/mysql.sock --charset utf8 --chunk-size 1000 --critical-load Threads_running=800 --max-load Threads_running=300 --ask-pass --statistics --dry-run


#pw_datanalyse(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_datanalyse,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "timeunit < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_datanalyse;

#pw_msglog(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_msglog,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "mdate < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run

#pw_pinglog(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_pinglog,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "pingdate < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_pinglog;

#pw_jober(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_jober,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "creattime < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_jober;

#pw_hack_bzqd_log(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_hack_bzqd_log,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "time < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_hack_bzqd_log;

#pw_voter(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_voter,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "time < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_voter;

#pw_recycle(保留一年)
pt-archiver --ask-pass --source u=root,D=s8_bbs,t=pw_recycle,S=/mysqldb/run/mysql.sock --purge --charset utf8 --where "deltime < unix_timestamp('2015-1-1 00:00:00')"  --limit 1000 --low-priority-delete  --statistics --why-quit  --bulk-delete --local --progress 100000 --dry-run
optimize table s8_bbs.pw_recycle;