#!/bin/bash
# Zabbix monitoring script for Apache
 
# Please define Apache status page
APACHE_STATUS_PAGE="http://127.0.0.1/apache-status?auto"

ZABBIX_REQ="$1"
WGET_BIN="/usr/bin/wget"
HTTPD_BIN="/usr/sbin/httpd"
APACHE_TMP="/home/zabbix/tmp/apache.tmp"
 
# Error handling:
ERROR_USER="-0.90"
ERROR_WRONG_PARAM="-0.91"
ERROR_DATA="-0.92"
ERROR_PERMISSION="-0.93"
 

if [ "$ZABBIX_REQ" == "version" ]; then
    $HTTPD_BIN -v | awk -F / '/version/ {print $2}' 
    exit 0
fi

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

status_query() {
    APACHE_STATUS=$($WGET_BIN -q $APACHE_STATUS_PAGE -O - 2> /dev/null)
    if [ $? -ne 0 -o -z "$APACHE_STATUS" ]; then
      echo $ERROR_DATA
      exit 1
    fi

    echo "$APACHE_STATUS" > $APACHE_TMP     
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi

    case "$1" in
        total_kbytes)                 cat "$APACHE_TMP" | grep 'Total kBytes' | awk -F':' '{print $2}';;
        total_accesses)               cat "$APACHE_TMP" | grep 'Total Accesses' | awk -F':' '{print $2}';;
        sb_waiting_connection)        awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "\_";;
        sb_reading_request)           awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "R";;
        sb_free_slot)                 awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "\.";;
        sb_closing_connection)        awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "C";;
        reqpersec)                    cat "$APACHE_TMP" | grep 'ReqPerSec' | awk -F':' '{print $2}';;
        idleworkers)                  cat "$APACHE_TMP" | grep 'IdleWorkers' | awk -F':' '{print $2}';;
        cpuload)                      cat "$APACHE_TMP" | grep 'CPULoad' | awk -F':' '{print $2}';;
        bytespersec)                  cat "$APACHE_TMP" | grep 'BytesPerSec' | awk -F':' '{print $2}';;
        bytesperreq)                  cat "$APACHE_TMP" | grep 'BytesPerReq' | awk -F':' '{print $2}';;
        busyworkers)                  cat "$APACHE_TMP" | grep 'BusyWorkers' | awk -F':' '{print $2}';;
        uptime)                       cat "$APACHE_TMP" | grep 'Uptime' | awk -F':' '{print $2}';;
        *)                            echo $ERROR_WRONG_PARAM; exit 1;;
    esac
}

if [ ! -f "$APACHE_TMP" -o "$2" == "-f" ]; then
    status_query "$ZABBIX_REQ"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $APACHE_TMP)
 
    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then
        case "$1" in
            total_kbytes)                 cat "$APACHE_TMP" | grep 'Total kBytes' | awk -F':' '{print $2}';;
            total_accesses)               cat "$APACHE_TMP" | grep 'Total Accesses' | awk -F':' '{print $2}';;
            sb_waiting_connection)        cat "$TMPSCOREBOARD" | grep -o . | grep -c "\_";;
            sb_reading_request)           awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "R";;
            sb_free_slot)                 awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "\.";;
            sb_closing_connection)        awk -F: '/Scoreboard/ {print $2}' "$APACHE_TMP" | grep -o . | grep -c "C";;
            reqpersec)                    cat "$APACHE_TMP" | grep 'ReqPerSec' | awk -F':' '{print $2}';;
            idleworkers)                  cat "$APACHE_TMP" | grep 'IdleWorkers' | awk -F':' '{print $2}';;
            cpuload)                      cat "$APACHE_TMP" | grep 'CPULoad' | awk -F':' '{print $2}';;
            bytespersec)                  cat "$APACHE_TMP" | grep 'BytesPerSec' | awk -F':' '{print $2}';;
            bytesperreq)                  cat "$APACHE_TMP" | grep 'BytesPerReq' | awk -F':' '{print $2}';;
            busyworkers)                  cat "$APACHE_TMP" | grep 'BusyWorkers' | awk -F':' '{print $2}';;
            uptime)                       cat "$APACHE_TMP" | grep 'Uptime' | awk -F':' '{print $2}';;
            *)                            echo $ERROR_WRONG_PARAM; exit 1;;
        esac
    else
        status_query "$ZABBIX_REQ"
    fi
fi
exit 0

