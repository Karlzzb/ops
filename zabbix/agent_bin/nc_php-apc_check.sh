#!/bin/bash
##################################
# Zabbix monitoring script for APC
# 
# wget http://pecl.php.net/get/APCu -O - | tar xz --wildcards apcu*/apc.php
#

TMP_DIR="/home/zabbix/tmp"
APC_TMP="$TMP_DIR/apc.tmp"
APC_URL="http://localhost:8088/apc.php"
ELINKS="/usr/bin/elinks"

#
# Error handling:
ERROR_USER="-0.90"
ERROR_URL="-0.91"
ERROR_PERMISSION="-0.92"
ERROR_PARAM="-0.93"
ERROR_ELINKS="-0.94"


if [ ! -x "$ELINKS" ]; then
    echo $ERROR_ELINKS
    exit 1
fi

ZABBIX_REQ="$1"

get_data() {
    case $1 in 
      hit_rate)            awk '/Hit Rate/ {print $3;exit}' $APC_TMP ;; 
      insert_rate)         awk '/Insert Rate/ {print $3;exit}' $APC_TMP ;; 
      miss_rate)           awk '/Miss Rate/ {print $3;exit}' $APC_TMP ;; 
      request_rate)        awk '/Request Rate/ {print $5;exit}' $APC_TMP ;;
      mem_free)            awk '/Free:/ {gsub("[()%]","");print $4}' $APC_TMP ;;
      mem_used)            awk '/Used:/ {gsub("[()%]","");print $4}' $APC_TMP ;;
      shm_size)            awk '/apc.shm_size/ {print $2}' $APC_TMP ;; 
      apc_version)         awk '/APC Version/ {print $3;exit}' $APC_TMP ;;
      php_version)         awk '/PHP Version/ {print $3;exit}' $APC_TMP ;;
      server_software)     awk '/Server Software/ {print $3;exit}' $APC_TMP ;;
      hit_ratio)           awk '/Free:/ {gsub("[()%]","");print $7}' $APC_TMP ;;
      miss_ratio)          awk '/Used:/ {gsub("[()%]","");print $7}' $APC_TMP ;;
      fragmentation)       awk '/Fragmentation:/ {gsub("%","");print $2}' $APC_TMP ;; 
      *)  echo "$ERROR_PARAM"; exit 1 ;;
    esac
    exit 0 
}

status_generate() {

    mkdir -p /home/zabbix/tmp

    APC_STAT=$($ELINKS -config-dir /tmp --dump $APC_URL)

    if [ $(echo "$APC_STAT" | grep -c APC) -lt 1 ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$APC_STAT" > $APC_TMP
    if [ $? -ne 0 ]; then
        echo $ERROR_PERMISSION
        exit 1
    fi
    get_data "$1"

}


if [ ! -f "$APC_TMP" -o "$2" == "-f" ]; then
    status_generate "$ZABBIX_REQ"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $APC_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 15 ]; then
        get_data "$ZABBIX_REQ"
    else
        status_generate "$ZABBIX_REQ"
    fi
fi

