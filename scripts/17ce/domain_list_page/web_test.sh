#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

URL="$1"

/bin/rm -f /tmp/all_nodes.json
/bin/rm -f /tmp/valid_nodes.txt

/bin/touch /tmp/all_nodes.json
/bin/touch  /tmp/valid_nodes.txt

JSON1="/tmp/all_nodes.json"
JSON2="/tmp/valid_nodes.txt"

curl -m 30 --referer http://www.17ce.com/  --data "&url=${URL}&curl=&rt=1&nocache=0&host=&referer=&cookie=&agent=&speed=&pingcount=&pingsize=&area[]=1&&isp[]=1&isp[]=2&isp[]=6&isp[]=7&isp[]=8&"  http://www.17ce.com/site/http > $JSON1 
if [ $? -ne 0 ]; then
    echo "failed to get data"
    exit 1
fi

TID=$(sed 's/,/\n/g;s/"//g' $JSON1 | grep tid | head -1 | awk -F: '{print $2}')
TOTAL_COUNT=$(cat $JSON1 | perl -pi -e 's/,/\n/g' | grep fullname | wc -l)
if [ $TOTAL_COUNT -lt 50 ]; then
    echo "invalid json data."
    exit 1
fi

sleep 60 
curl --referer http://www.17ce.com/  --data "tid=${TID}&&num=0&&ajax_over=1" http://www.17ce.com/site/ajaxfresh > $JSON2
if [ $? -ne 0 ]; then
    echo "failed to get data2"
    #/usr/bin/zabbix_sender -vvv -z 72.13.87.66 -s 17ce.com -k 'idc[error]' -o 1
    exit 1
fi

VALID_COUNT=$(perl -pe 's/:/\n/g' /tmp/valid_nodes.txt  |grep --color "200 OK"  |wc -l)

OK_RATE=$(( 100 * $VALID_COUNT / $TOTAL_COUNT ))

echo $VALID_COUNT
echo $TOTAL_COUNT
echo $OK_RATE 
mysql 17ce -e "update record set rate='$OK_RATE' where name='$URL'"
