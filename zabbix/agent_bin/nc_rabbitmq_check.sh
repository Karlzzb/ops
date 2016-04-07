#!/bin/bash

RABBITMQ_CTL="/usr/sbin/rabbitmqctl"
RABBITMQ_ADMIN="/usr/sbin/rabbitmqadmin"

# Error handling:
ERROR_USER="-0.90"
ERROR_WRONG_PARAM="-0.91"
ERROR_DATA="-0.92"
ERROR_PERMISSION="-0.93"
ERROR_BIN="-0.94"

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

if [ ! -x "$RABBITMQ_CTL" -o ! -x "$RABBITMQ_ADMIN" ]; then
    echo $ERROR_BIN
    exit 1
fi


case "$1" in
    nodes) $RABBITMQ_ADMIN list nodes name "$2" | grep -w $HOSTNAME | awk -F '|' '{print $(NF-1)}' ;;
    rabbitmq_version|erlang_version) $RABBITMQ_ADMIN show overview -f long|awk -F: "/$1/ {print \$2}" ;;
    vm_memory_high_watermark)  $RABBITMQ_CTL status |  awk -F ',|}'  '/vm_memory_high_watermark/ {print $2}' ;;
    *) echo "$ERROR_WRONG_PARAM"; exit 1;;   
esac
