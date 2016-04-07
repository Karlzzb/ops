#!/bin/bash
# Zabbix monitoring script for MySQL/MariaDB

OPTION=$1
TARGET_TABLE=$2
MYSQL_USER="monitoring"
MYSQL_PASS="8e3d7855e5681ee463e28394c2bb33043e65dbb9"
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3366"
MYSQL_BIN="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS -h $MYSQL_HOST -P $MYSQL_PORT"
MYSQL_COMMAND="$MYSQL_BIN " 

# error code
ERROR_USER="-0.0090"
ERROR_DATA="-0.0091"
ERROR_OPTION="-0.0092"
ERROR_PERMISSION="-0.0093"
ERROR_IP_PORT="-0.0094"
ERROR_BINARY="-0.0095"

# run as zabbix user
if [ $(whoami) != "zabbix" ]; then
    echo "$ERROR_USER"
    exit 1
fi

TB_SCHEMA=`echo $TARGET_TABLE |awk -F. '{print $1}'`
TB_NAME=`echo $TARGET_TABLE |awk -F. '{print $2}'`

status_generate() {

    case "$OPTION" in
        tbrows)                $MYSQL_COMMAND -Bse "SELECT COUNT(1) FROM $TARGET_TABLE" 2>/dev/null; exit ;;
        tbsize)                $MYSQL_COMMAND -Bse "SELECT (DATA_LENGTH + INDEX_LENGTH) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$TB_SCHEMA' AND TABLE_NAME = '$TB_NAME'" 2>/dev/null; exit ;;
    esac


    if [ -n "$VALUE" ]; then
        echo "$VALUE"
    else
        echo "$ERROR_DATA"
    fi
    exit 0
}

status_generate
