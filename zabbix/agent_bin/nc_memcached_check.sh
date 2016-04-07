#!/bin/bash
##################################
# Zabbix monitoring script

# Memcached defaults
MEMCACHED_HOST="127.0.0.1"
MEMCACHED_PORT="11211"
MEMCACHED_TOOL_BIN="/usr/bin/memcached-tool"
MEMCACHED_TMP="/home/zabbix/tmp/memcached.tmp"

#
# Error handling:
ERROR_USER="-0.90"
ERROR_IP_PORT="-0.91"
ERROR_PERMISSION="-0.92"
ERROR_DATA="-0.93"
ERROR_PARAM="-0.94"

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

if ! nc -w 3 -z $MEMCACHED_HOST $MEMCACHED_PORT &>/dev/null; then
    echo "$ERROR_IP_PORT"
    exit 1
fi

status_generate() {
    ZABBIX_REQ="$1"

    mkdir -p /home/zabbix/tmp
    MEMCACHED_STATS=$($MEMCACHED_TOOL_BIN $MEMCACHED_HOST:$MEMCACHED_PORT stats 2> /dev/null )

    if [ $? -ne 0 -o -z "$MEMCACHED_STATS" ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$MEMCACHED_STATS" > $MEMCACHED_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi

    MEMCACHED_VALUE=$(awk '/'"$ZABBIX_REQ"'/ {print $2}' $MEMCACHED_TMP)

    if [ ! -z "$MEMCACHED_VALUE" ]; then
      echo $MEMCACHED_VALUE
    else
      echo $ERROR_PARAM
      exit 1
    fi
}


if [ ! -f "$MEMCACHED_TMP" -o "$2" == "-f" ]; then
    status_generate "$1"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $MEMCACHED_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then
        MEMCACHED_VALUE=$(awk '/\<'"$1"'\>/ {print $2}' $MEMCACHED_TMP)

        if [ ! -z "$MEMCACHED_VALUE" ]; then
          echo $MEMCACHED_VALUE
        else
          echo $ERROR_PARAM
        fi
    else
        status_generate "$1"
    fi
fi
exit

