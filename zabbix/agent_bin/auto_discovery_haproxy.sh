#!/bin/bash
# Zabbix auto discovery script for Haproxy

CONF_FILE="/home/zabbix/conf/haproxy_zabbix.conf"
SOCAT_BIN="/usr/bin/socat"
SOCKET="/var/lib/haproxy/stats"

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

# json validation - http://www.ij2ee.com/bejson/bejson.html
echo '{
        "data":[ '


if [ "$1" == "frontend" ]; then
    COUNT=1
    POOL_COUNT=$(echo 'show stat' | sudo $SOCAT_BIN unix-connect:$SOCKET stdio | grep FRONTEND | grep -v haproxy-stats | wc -l)
    for i in $(echo "show stat" | sudo $SOCAT_BIN $SOCKET stdio | grep -Ev "(^$|^#)" | awk -F, '/FRONTEND/ {print $1":"$2}' | grep -v haproxy-stats); do
        echo "
            {
                    \"{#POOL}\":\"$i\"
            }"
        if [ $COUNT -lt $POOL_COUNT ]; then
           echo ","
        fi
        COUNT=$((COUNT+1))
         
    done
elif [ "$1" == "backend" ]; then
    COUNT=1
    POOL_COUNT=$(echo 'show stat' | sudo $SOCAT_BIN unix-connect:$SOCKET stdio | grep BACKEND | grep -v haproxy-stats | wc -l)
    for i in $(echo "show stat" | sudo $SOCAT_BIN $SOCKET stdio | grep -Ev "(^$|^#)" | awk -F, '/BACKEND/ {print $1":"$2}' | grep -v haproxy-stats ); do
        echo "
            {
                    \"{#BACKEND}\":\"$i\"
            }"
        if [ $COUNT -lt $POOL_COUNT ]; then
           echo ","
        fi
        COUNT=$((COUNT+1))
         
    done
elif [ "$1" == "server" ]; then
    COUNT=1
    SERVER_COUNT=$(echo 'show stat' | sudo $SOCAT_BIN unix-connect:$SOCKET stdio | grep -Ev "(^$|^#|FRONTEND|BACKEND)" | grep -v haproxy-stats | wc -l)
    for i in $(echo "show stat" | sudo $SOCAT_BIN $SOCKET stdio | grep -Ev "(^$|^#|FRONTEND|BACKEND)"|awk -F, '{print $1":"$2}' | grep -v haproxy-stats ); do
        echo "
            {
                    \"{#SERVER}\":\"$i\"
            }"
        if [ $COUNT -lt $SERVER_COUNT ]; then
           echo ","
        fi
        COUNT=$((COUNT+1))
    done
     
fi

echo '
        ]
}'

