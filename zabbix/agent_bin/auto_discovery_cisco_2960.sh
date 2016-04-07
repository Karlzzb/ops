#!/bin/bash
# Zabbix auto discovery script for Cisco 

# error code
ERROR_DATA="-0.0091"
ERROR_OPTION="-0.0092"
ERROR_PERMISSION="-0.0093"
ERROR_IP_PORT="-0.0094"
ERROR_BINARY="-0.0095"

SNMPWALK="/usr/bin/snmpwalk"
SNMP_COMMAND="$SNMPWALK -v 2c -c public "

# run as zabbix user
if [ `whoami` != "zabbix" ]; then
    echo "Please run this script as 'zabbix' user."
    exit 1
fi

# check binary
binary_check() {
    if [ ! -x "$1" ]; then
        echo "$ERROR_BINARY"
        exit 1
    fi
}
binary_check $SNMPWALK

mkdir -p /home/zabbix/tmp 2>/dev/null

if [ $# -ne 1 ]; then
    echo $ERROR_OPTION
    exit 1
fi 

SNMP_IP="$1"
if [[ "$SNMP_IP" =~ ^([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})$ ]]; then
    :
else
    echo $ERROR_OPTION
    exit 1
fi

COUNT=1
POOL_COUNT=$($SNMP_COMMAND $SNMP_IP 2>/dev/null|  awk '/^IF-MIB::ifIndex/ {print $NF}' | tee /home/zabbix/tmp/${SNMP_IP}.tmp | wc -l)
if [ $POOL_COUNT -gt 2 ]; then
echo '{
    "data":[ '
    for i in $(cat /home/zabbix/tmp/${SNMP_IP}.tmp); do
        echo "
            {
                    \"{#IF}\":\"$i\"
            }"
        if [ $COUNT -lt $POOL_COUNT ]; then
           echo ","
        fi
        COUNT=$((COUNT+1))
    done
else
    echo $ERROR_DATA   
    exit 1
fi

echo '
        ]
}'
