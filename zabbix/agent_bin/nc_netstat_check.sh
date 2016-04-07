#!/bin/bash

TMP_DIR="/home/zabbix/tmp"
SS_TMP="$TMP_DIR/ss.tmp"
if [ $# -ne 1 ];then
    echo $ERROR_PARAM
    exit 1
fi
ERROR_OPTION="-0.9902"

SS_BIN="/usr/sbin/ss"
SS_OUTPUT=$($SS_BIN -s)

#
# Error handling:
ERROR_USER="-0.90"
ERROR_IP_PORT="-0.91"
ERROR_PERMISSION="-0.92"
ERROR_DATA="-0.93"

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

if [ ! -w "$TMP_DIR" ]; then
    echo $ERROR_PERMISSION
    exit 1
fi

status_generate() {
    ZABBIX_REQ="$1"

    SS_STATS=$($SS_BIN -s 2>/dev/null)

    if [ -z "$SS_STATS" ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$SS_STATS" > $SS_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi

    SS_TCP=$(grep synrecv $SS_TMP)
    case "$1" in
      udp_connections)       echo "$SS_OUTPUT" | awk '/UDP/ {print $2}' ;;
      tcp_connections)       echo "$SS_TCP" | awk '{print $2}' ;;
      tcp_closed)            echo "$SS_TCP" | perl -ne 'if ( /.*closed (\d+),?.*/) {print $1}' ;;
      tcp_established)       echo "$SS_TCP" | perl -ne 'if ( /.*estab (\d+),?.*/) {print $1}' ;;
      tcp_timewait)          echo "$SS_TCP" | perl -ne 'if ( /.*timewait (\d+),?.*/) {print $1}' ;;
      tcp_synrecv)           echo "$SS_TCP" | perl -ne 'if ( /.*synrecv (\d+),?.*/) {print $1}' ;;
      tcp_orphaned)          echo "$SS_TCP" | perl -ne 'if ( /.*orphaned (\d+),?.*/) {print $1}' ;;
      *)                     echo "$ERROR_OPTION"; exit 1 ;;
    esac
}


if [ ! -f "$SS_TMP" -o "$2" == "-f" ]; then
    status_generate "$1"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $SS_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 15 ]; then
        SS_TCP=$(grep synrecv $SS_TMP)
        case "$1" in
          udp_connections)       echo "$SS_OUTPUT" | awk '/UDP/ {print $2}' ;;
          tcp_connections)       echo "$SS_TCP" | awk '{print $2}' ;;
          tcp_closed)            echo "$SS_TCP" | perl -ne 'if ( /.*closed (\d+),?.*/) {print $1}' ;;
          tcp_established)       echo "$SS_TCP" | perl -ne 'if ( /.*estab (\d+),?.*/) {print $1}' ;;
          tcp_timewait)          echo "$SS_TCP" | perl -ne 'if ( /.*timewait (\d+),?.*/) {print $1}' ;;
          tcp_synrecv)           echo "$SS_TCP" | perl -ne 'if ( /.*synrecv (\d+),?.*/) {print $1}' ;;
          tcp_orphaned)          echo "$SS_TCP" | perl -ne 'if ( /.*orphaned (\d+),?.*/) {print $1}' ;;
          *)                     echo "$ERROR_OPTION"; exit 1 ;;
        esac
    else
        status_generate "$1"
    fi
fi
exit

