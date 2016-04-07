#!/bin/sh



HOSTNAME=118.201.56.206
PORT=54321
USERNAME=wfcusr
PASSWORD=496bfc621ade67fd8312a94b7637fd315
imspath=/home/kerl/zabbiximgs

MYSQL_TOOL=`which mysql`

query_sql="select distinct concat(table_schema,'.',table_name) from  analyze_db.analyze_table_stat;"
tbs=`${MYSQL_TOOL} -h${HOSTNAME}   -P${PORT}   -u${USERNAME} -p${PASSWORD} -NLe "${query_sql}"` 2>/dev/null

for tbstr in $tbs
do
  tbschema=`echo $tbstr |awk -F. '{print $1}'`
  tb=`echo $tbstr |awk -F. '{print $2}'`
  query_sql="select DATE_FORMAT(dml_time, '%d/%m/%y/%H%i'), table_rows from  analyze_db.analyze_table_stat where table_name = \"$tb\" and dml_time between '$1' and '$2'"
  #query_sql="select unix_timestamp(dml_time), table_rows from  analyze_db.analyze_table_stat where table_name = \"$tb\" and dml_time between '$1' and '$2'"
  ${MYSQL_TOOL} -h${HOSTNAME}   -P${PORT}   -u${USERNAME} -p${PASSWORD} -NLe "${query_sql}" > $imspath/${tb}.tmp 2> /dev/null

gnuplot << EOP
    set terminal png medium size 640,480
    set title  font ",18" offset 0,5
    set style data fsteps
    ### set data source file
    datafile = '$imspath/${tb}.tmp'
    ### set graph type and size
    set format x "%m/%d\n%H:%M"
    set format y "%.0f" 
    set timefmt "%d/%m/%y/%H%M"
    set xdata time
    ### set titles
    set grid x y
    set xlabel "Date Time"
    set ylabel "Table Rows"
    set output '$imspath/imgs/${tb}.png'
plot datafile using 1:2 title "TABLE $tb row trends" with lines
EOP

rm -rf $imspath/${tb}.tmp

done
