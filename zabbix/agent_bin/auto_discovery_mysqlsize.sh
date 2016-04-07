#!/bin/bash
#Fucation:mysql low-level discovery
db_path=/data/db/mysql3366/data/
size_limit="100M"
top_limit=5
MYSQL_USER="monitoring"
MYSQL_PASS="8e3d7855e5681ee463e28394c2bb33043e65dbb9"
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3366"
MYSQL_BIN="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS -h $MYSQL_HOST -P $MYSQL_PORT"
MYSQL_COMMAND="$MYSQL_BIN " 


tbs=($($MYSQL_COMMAND -Bse "select concat(table_schema, '.',table_name) from information_schema.tables where TABLE_SCHEMA NOT IN ('common_schema','mysql','information_schema','performance_schema') AND TABLE_TYPE = 'BASE TABLE'  group by table_schema, table_name order by sum(data_length+index_length) desc  limit $top_limit")) 

#port=($(find $db_path -name "*" -type f -size +$size_limit |awk '/.ibd$|.MYD$/ {n=split($0, a, "/"); split(a[n], b, "."); print a[n-1]"."b[1]}' ))
printf '{\n'
printf '\t"data":[\n'
for key in ${!tbs[@]}
do
 if [[ "${#tbs[@]}" -gt 1 && "${key}" -ne "$((${#tbs[@]}-1))" ]];then
	  printf '\t {\n'
	  printf "\t\t\t\"{#TB_NAME}\":\"${tbs[${key}]}\"},\n"
 else [[ "${key}" -eq "((${#tbs[@]}-1))" ]]
	  printf '\t {\n'
	  printf "\t\t\t\"{#TB_NAME}\":\"${tbs[${key}]}\"}\n"
 fi
done
printf '\t ]\n'
printf '}\n'
