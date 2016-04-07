#!/bin/bash
# Zabbix monitoring script for Redis 
 
PORT="$1"
ZABBIX_REQ="$2"
WGET_BIN="/usr/bin/wget"
REDIS_CLI="/usr/bin/redis-cli"
TMP_DIR="/home/zabbix/tmp"
REDIS_TMP="$TMP_DIR/redis.tmp"
 
# Error handling:
ERROR_USER="-0.90"
ERROR_WRONG_PARAM="-0.91"
ERROR_DATA="-0.92"
ERROR_PERMISSION="-0.93"
ERROR_BIN="-0.94"
 

if [ $# -lt 2 ]; then
    echo $ERROR_WRONG_PARAM
    exit 1
fi

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

if [ ! -x "$REDIS_CLI" ]; then
    echo $ERROR_BIN
    exit 1
fi 

status_query() {
    PORT="$1"
    ZABBIX_REQ="$2"

    $REDIS_CLI -p $PORT info > $REDIS_TMP.$PORT 2>/dev/null
    
    if [ -z "$REDIS_TMP.$PORT" ]; then
        echo $ERROR_DATE
        exit 1
    fi 

    awk -F: "/$ZABBIX_REQ:/ {print \$2}" $REDIS_TMP.$PORT
}


if [ ! -f "$REDIS_TMP.$PORT" -o "$3" == "-f" ]; then
    status_query "$PORT" "$ZABBIX_REQ"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $REDIS_TMP.$PORT)
 
    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then
        awk -F: "/$ZABBIX_REQ:/ {print \$2}" $REDIS_TMP.$PORT
    else
        status_query "$PORT" "$ZABBIX_REQ"
    fi
fi
exit 0

