#!/bin/bash
# Zabbix agent check script for Cisco 

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

if [ $# -ne 2 ]; then
    echo $ERROR_OPTION
    exit 1
fi 

if [[ "$1" =~ ^([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})$ ]]; then
    :
else
    echo $ERROR_OPTION
    exit 1
fi

case $1 in 
    sysDescr.0)     snmpwalk -v 2c -c public $1 $2 2>/dev/null | awk -F: '{print $NF}' ;;
    *)	            snmpwalk -v 2c -c public $1 $2 2>/dev/null | awk  '{print $NF}' ;;
esac
