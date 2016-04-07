#!/bin/bash
# Zabbix monitoring script for Haproxy 
ZABBIX_REQ="$1"
ZABBIX_REQ_ITEM="$2"

CONF_FILE="/home/zabbix/conf/haproxy_zabbix.conf"
HAPROXY_TMP="/home/zabbix/tmp/haproxy.tmp"
SOCAT_BIN="/usr/bin/socat"
SOCKET_FILE="/var/lib/haproxy/stats"

# error code
ERROR_DATA="-0.0091"
ERROR_OPTION="-0.0092"
ERROR_PERMISSION="-0.0093"
ERROR_IP_PORT="-0.0094"
ERROR_BINARY="-0.0095"

# run as zabbix user
if [ `whoami` != "zabbix" ]; then
    echo "Please run this script as 'zabbix' user."
    exit 1
fi
mkdir -p /home/zabbix/tmp 2>/dev/null

# source config file
if [ -f "$CONF_FILE" ]; then
    source $CONF_FILE 
fi

# check binary
binary_check() {
    if [ ! -x "$1" ]; then
        echo "$ERROR_BINARY"
        exit 1
    fi
}
binary_check $SOCAT_BIN

# create haproxy stats file
status_generate() {
    # get haproxy status 
    echo "show info; show stat" | sudo $SOCAT_BIN unix-connect:$SOCKET_FILE stdio >$HAPROXY_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi
    sed -i 's/,/:/g' $HAPROXY_TMP
}

# 
if [ ! -f "$HAPROXY_TMP" ]; then
    status_generate
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $HAPROXY_TMP)

    if [ $((NOW - LAST_CTIME)) -gt 60 ]; then
        status_generate
    fi
fi

###############################
# START TO GET DATA
###############################

if [ $# -eq 1 ]; then
    VALUE=$(awk '/'$ZABBIX_REQ'/ {print $NF}' $HAPROXY_TMP)
    if [ -z "$VALUE" ]; then
        echo $ERROR_DATA
        exit 1
    else
        echo $VALUE 
    fi 
elif [ $# -eq 2 ]; then
    # create an array
    array=($(sed -n '/#/p;' $HAPROXY_TMP |sed  's/# //g;s/:/ /g'))
    
    # create variables. <ZABBIX ITEM>=<LINE NUMBER>
    for k in "${!array[@]}"; do
        # array starts from 0, awk $N starts from 1 
        eval ${array[$k]}=$(($k+1))
    done
    
    if [ "$ZABBIX_REQ_ITEM" == "" ]; then
        echo $ERROR_OPTION
        exit 1
    fi
    # Indirect References - http://www.tldp.org/LDP/abs/html/ivr.html
    VALUE=$(awk -F:  '/'$ZABBIX_REQ'/ {print $'"${!ZABBIX_REQ_ITEM}"'}' $HAPROXY_TMP)
    
    if [ -z "$VALUE" ]; then
        echo $ERROR_DATA
        exit 1
    else
        echo $VALUE 
    fi
else
    echo $ERROR_OPTION
    exit 1
fi

