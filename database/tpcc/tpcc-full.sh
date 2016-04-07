#!/bin/sh
analyze_out () {
	TIMESLOT=1
	if [ -n "$2" ]
	then
	TIMESLOT=$2
	fi
	cat $1 | grep -v HY000 | grep -v payment | grep -v neword | awk -v timeslot=$TIMESLOT 'BEGIN { FS="[,():]"; s=0; cntr=0; aggr=0 } /MEASURING START/ { s=1} /STOPPING THREADS/ {s=0} /0/ { if (s==1) { cntr++; aggr+=$2; } if ( cntr==timeslot ) { printf ("%d %3d\n",$1,(aggr/timeslot)) ; cntr=0; aggr=0 } }'
}

build_graph () {
	rm -f '$2'
	gnuplot << EOP
	### set data source file
	datafile = '$1'
	### set graph type and size
	set terminal jpeg size 640,480
	### set titles
	set grid x y
	set xlabel "Time (sec)"
	set ylabel "Transactions"
	### set output filename
	set output '$2'
	### build graph
	# plot datafile with lines
	plot datafile using 1:2 title '$title1' ls 1 with lines,datafile using 3:4 title '$title2' ls 2 with lines axes x1y1
EOP
}
#test out put files
out_file1=/home/kerl/tpcc_data_io200.out
out_file2=/home/kerl/tpcc_data_io200-d.out

#analyse out put files
stat_file1=/home/kerl/tpcc_data_io200.stat
stat_file2=/home/kerl/tpcc_data_io200-d.stat

#tow title
title1="Mysql-innodb_purge_threads-1"
title2="Mysql-innodb_purge_threads-8"

full_stat=/home/kerl/tpcc-output-paste.stat

#prepare data 
mysql -utpcusr -ptpcpwd tpcc1000 < /home/kerl/tpcc-mysql/create_table.sql
mysql -utpcusr -ptpcpwd tpcc1000 < /home/kerl/tpcc-mysql/add_fkey_idx.sql
/home/kerl/tpcc-mysql/tpcc_load 127.0.0.1:3366 tpcc1000 tpcusr tpcpwd 100 

#execute bench
#echo cfq > /sys/block/sdb/queue/scheduler
#sed -i "s#innodb-log-buffer-size         = 4M#innodb-log-buffer-size         = 4M#g" /data/db/mysql3366/my.cnf && cat /data/db/mysql3366/my.cnf |grep innodb-log-buffer-size
sed -i "s#innodb_purge_threads           = 8#innodb_purge_threads           = 1#g" /data/db/mysql3366/my.cnf && cat /data/db/mysql3366/my.cnf |grep innodb_purge_threads

/etc/init.d/mysql3366 restart && /home/kerl/tpcc-mysql/tpcc_start -h127.0.0.1 -P3366 -dtpcc1000 -utpcusr -ptpcpwd -w200 -c16 -r100 -l2000 > $out_file1 2>&1

#echo deadline > /sys/block/sdb/queue/scheduler
#sed -i "s#innodb-log-buffer-size         = 4M#innodb-log-buffer-size         = 2M#g" /data/db/mysql3366/my.cnf && cat /data/db/mysql3366/my.cnf |grep innodb-log-buffer-size
sed -i "s#innodb_purge_threads           = 1#innodb_purge_threads           = 8#g" /data/db/mysql3366/my.cnf && cat /data/db/mysql3366/my.cnf |grep innodb_purge_threads

/etc/init.d/mysql3366 restart && /home/kerl/tpcc-mysql/tpcc_start -h127.0.0.1 -P3366 -dtpcc1000 -utpcusr -ptpcpwd -w200 -c16 -r100 -l2000 > $out_file2 2>&1



#analyse result
analyze_out $out_file1 > $stat_file1
analyze_out $out_file2 > $stat_file2

paste $stat_file1 $stat_file2 > $full_stat

#build graph
build_graph $full_stat /home/kerl/tpcc-graph-`hostname`.jpg