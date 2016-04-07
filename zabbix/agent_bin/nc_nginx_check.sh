#!/bin/bash
# Zabbix monitoring script for Nginx

# please define nginx status page
NGINX_STATUS_URL="http://127.0.0.1:81/nginx_status"

ZABBIX_REQ="$1"
NGINX_BIN="/usr/sbin/nginx"
WGET_BIN="/usr/bin/wget -q -O - "
NGINX_TMP="/home/zabbix/tmp/nginx.tmp"

# Error handling:
ERROR_USER="-0.90"
ERROR_OPTIONS="-0.91"
ERROR_DATA="-0.92"
ERROR_PERMISSION="-0.93"

# Nginx Version Check
if [ "$ZABBIX_REQ" == "version" ]; then
    $NGINX_BIN -v 2>&1 | awk -F '/' '{print $2}'
    exit 0
fi

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

status_generate() {
    mkdir -p /home/zabbix/tmp
    NGINX_STATS=$($WGET_BIN $NGINX_STATUS_URL 2> /dev/null)

    if [ $? -ne 0 -o -z "$NGINX_STATS" ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$NGINX_STATS" > $NGINX_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi

    case "$1" in
        active_connections)           cat "$NGINX_TMP" | awk '/Active/ {print $NF}' ;;
        accepted_connections)         cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $1}' ;; 
        handled_connections)          cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $2}' ;; 
        handled_requests)             cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $3}' ;; 
        reading)                      cat "$NGINX_TMP" | awk '/Reading/ {print $2}' ;; 
        writing)                      cat "$NGINX_TMP" | awk '/Writing/ {print $4}' ;; 
        waiting)                      cat "$NGINX_TMP" | awk '/Waiting/ {print $6}' ;; 
        *)                            echo $ERROR_OPTIONS; exit 1;;
    esac
    exit 0
}

if [ ! -f "$NGINX_TMP" -o "$2" == "-f" ]; then
    status_generate "$ZABBIX_REQ"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $NGINX_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then
        case "$1" in
            active_connections)           cat "$NGINX_TMP" | awk '/Active/ {print $NF}' ;;
            accepted_connections)         cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $1}' ;; 
            handled_connections)          cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $2}' ;; 
            handled_requests)             cat "$NGINX_TMP" | awk '! /[A-Z]/ {print $3}' ;; 
            reading)                      cat "$NGINX_TMP" | awk '/Reading/ {print $2}' ;; 
            writing)                      cat "$NGINX_TMP" | awk '/Writing/ {print $4}' ;; 
            waiting)                      cat "$NGINX_TMP" | awk '/Waiting/ {print $6}' ;; 
            *)                            echo $ERROR_WRONG_PARAM; exit 1;;
        esac
    else
        status_generate "$ZABBIX_REQ"
    fi
fi
exit 0
