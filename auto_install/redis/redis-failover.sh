#!/bin/bash
# Failover script for Redis - sentinel

IFACE="eth0"
VIP="10.1.100.99"
NETMASK="255.255.255.0"
LOGGER="/bin/logger -t redis"

MASTER_IP="$6"
LOCAL_IP=$(/sbin/ifconfig eth0 | awk -F'[: ]+' '/inet addr:/ {print $4}')

check_exit() {
    if [ $? -ne 0 ]; then
        $LOGGER "Failed to run command : $1"
    fi
}

# current server should be redis master
if [ "$MASTER_IP" == "$LOCAL_IP" ]; then
    if [ $(/sbin/ip addr show ${IFACE} | grep -w ${VIP} | wc -l) -eq 0 ]; then
        $LOGGER "* Setting To Master." 
        /usr/bin/sudo /sbin/ifconfig ${IFACE}:0 $VIP netmask $NETMASK up
        check_exit "/usr/bin/sudo /sbin/ifconfig"
        
        /usr/bin/sudo /sbin/arping -q -c 3 -A $VIP -I $IFACE 
        check_exit "/usr/bin/sudo /sbin/arping"
    else
        $LOGGER "* Already is Master and VIP found. " 
    fi

    exit 0
else
    if [ $(/sbin/ip addr show ${IFACE} | grep ${VIP} | wc -l) -ne 0 ]; then
        $LOGGER "* Should be Slave, Removing VIP." 
        /usr/bin/sudo /sbin/ifconfig ${IFACE}:0 $VIP netmask $NETMASK down 
        check_exit "/usr/bin/sudo /sbin/ifconfig"
    else
        $LOGGER "* Already is Slave and no VIP found."
    fi
    exit 0
fi
