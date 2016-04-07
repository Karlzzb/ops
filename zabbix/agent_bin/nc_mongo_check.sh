#!/bin/bash
# Zabbix monitoring script for MongoDB 
 
ZABBIX_REQ="$1"
MONGO_BIN="/usr/bin/mongo"

MONGO_USER=""
MONGO_PASS=""

# Error handling:
ERROR_USER="-0.90"
ERROR_IP_PORT="-0.91"
ERROR_PERMISSION="-0.92"
ERROR_DATA="-0.93"
ERROR_BIN="-0.95"

if [ ! -x "$MONGO_BIN" ];then
    echo $ERROR_BIN
fi

if [ -z "$MONGO_PASS" ]; then
    VALUE=$(echo "db.serverStatus().$ZABBIX_REQ" | $MONGO_BIN --shell admin | grep -Ev "^(MongoDB|connecting|type|bye)" | sed 's/NumberLong(//;s/)//;')
else
    VALUE=$(echo "db.serverStatus().$ZABBIX_REQ" | $MONGO_BIN --username $MONGO_USER --password $MONGO_PASS --shell admin | grep -Ev "^(MongoDB|connecting|type|bye)" | sed 's/NumberLong(//;s/)//;')
fi

if [ -z "$VALUE" ]; then
    echo $ERROR_DATA
else
    echo "$VALUE"
fi
