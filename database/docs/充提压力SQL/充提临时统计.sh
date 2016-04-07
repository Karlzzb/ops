#执行分析
scp 10.2.30.220:/data/dblogs/mysql3306/slowlogs/mysql-slow.log /home/kerl/slowlogs/

mv /home/kerl/slowlogs/mysql-slow.log /home/kerl/slowlogs/mysql-slow.log`date +%Y%m%d%H%M`

nohup pt-query-digest --since='2015-01-22 12:45:00' --until='2015-01-22 14:55:00' --group-by fingerprint --order-by Query_time:sum --limit 100 /home/kerl/slowlogs/mysql-slow.log`date +%Y%m%d%H%M`  > /home/kerl/slowlogs/fcpay-sql-sum`date +%Y%m%d%H%M`.rpt 2> /tmp/fcpay-sql-sum.log &

nohup pt-query-digest --since='2015-01-22 12:45:00' --until='2015-01-22 14:55:00' --group-by fingerprint --order-by Query_time:max --limit 100 /home/kerl/slowlogs/mysql-slow.log`date +%Y%m%d%H%M`  > /home/kerl/slowlogs/fcpay-sql-max`date +%Y%m%d%H%M`.rpt 2> /tmp/fcpay-sql-max.log &

nohup pt-query-digest --since='2015-01-22 12:45:00' --until='2015-01-22 14:55:00' --group-by fingerprint --order-by Query_time:cnt --limit 100 /home/kerl/slowlogs/mysql-slow.log`date +%Y%m%d%H%M`  > /home/kerl/slowlogs/fcpay-sql-cnt`date +%Y%m%d%H%M`.rpt 2> /tmp/fcpay-sql-cnt.log &

nohup pt-query-digest --filter '($event->{arg} =~ m/^select/i) && ($event->{arg} !~ m/where/i)' --group-by fingerprint --order-by Query_time:sum --limit 50  /home/kerl/slowlogs/mysql-slow.log`date +%Y%m%d%H%M` > /home/kerl/slowlogs/fcpay-sql-nowwhere`date +%Y%m%d%H%M`.rpt 2>/tmp/nowwhere.log &

ssh 10.2.30.201 ">/data/dblogs/mysql3306/slowlogs/mysql-slow.log"


#监控抓取
/home/kerl/zabbiximgs/zabbix-img.py -g 694 -g 695 -g 693 -g 825 -g 824 -g 826 -g 876 -g 878 -g 744 -g 729 -g 731 -g 728 -g 740 -s 20150122124500 -p 7600 -path /home/kerl/zabbiximgs/imgs > /dev/null &
/home/kerl/zabbiximgs/tbrow.sh 20150122124500 20150122145500 2> /dev/null &