#!/bin/bash
##################################
# Zabbix monitoring script

# PHP-FPM defaults
FPM_URL="http://127.0.0.1:81/php-fpm_status"
PING_URL="http://127.0.0.1:81/php-fpm_ping"
FPM_TMP="/home/zabbix/tmp/php-fpm.tmp"

#
# Error handling:
ERROR_USER="-0.90"
ERROR_IP_PORT="-0.91"
ERROR_PERMISSION="-0.92"
ERROR_DATA="-0.93"
ERROR_PARAM="-0.94"

ZABBIX_REQ="$1"
if [ $# -eq 0 ];then
    echo $ERROR_PARAM
    exit 1
fi

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

get_data() {
    case "$1" in
      pool)             	awk '/^pool/ {print $NF}' $FPM_TMP ;;
      process_manager)   	awk '/^process manager/ {print $NF}' $FPM_TMP ;;
      accepted_conn)   		awk '/^accepted conn/{print $NF}' $FPM_TMP ;;
      listen_queue) 		awk '/^listen queue:/ {print $NF}' $FPM_TMP ;;
      idle_processes)  		awk '/^idle processes/ {print $NF}' $FPM_TMP ;;
      active_processes)   	awk '/^active processes/ {print $NF}' $FPM_TMP ;;
      total_processes)   	awk '/^total processes/ {print $NF}' $FPM_TMP ;;
      max_active_processes)  	awk '/^max active processes/{print $NF}' $FPM_TMP ;;
      max_listen_queue)  	awk '/^max listen queue/{print $NF}' $FPM_TMP ;;
      max_children_reached)  	awk '/^max children reached/ {print $NF}' $FPM_TMP ;;
      slow_requests)            awk '/^slow requests/ {print $NF}' $FPM_TMP ;;
      version)                  echo $(php-fpm -v | awk '/^PHP/ {print $2}');; 
      *) echo $ERROR_WRONG_PARAM; exit 1;;
    esac
}

status_generate() {

    mkdir -p /home/zabbix/tmp
    FPM_STATS=$(curl $FPM_URL 2>/dev/null)

    if [ $? -ne 0 -o -z "$FPM_STATS" ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$FPM_STATS" > $FPM_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi

    FPM_VALUE=$(get_data "$ZABBIX_REQ")

    if [ ! -z "$FPM_VALUE" ]; then
      echo $FPM_VALUE
    else
      echo $ERROR_PARAM
      exit 1
    fi
}


if [ ! -f "$FPM_TMP" -o "$2" == "-f" ]; then
    status_generate "$1"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $FPM_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then

        FPM_VALUE=$(get_data "$ZABBIX_REQ")

        if [ ! -z "$FPM_VALUE" ]; then
          echo $FPM_VALUE
        else
          echo $ERROR_PARAM
        fi
    else
        status_generate "$1"
    fi
fi
