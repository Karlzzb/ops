#!/bin/bash
# rabbitmq vhost auto discovery script

RABBITMQADMIN="/usr/sbin/rabbitmqadmin"

if [ ! -x "$RABBITMQADMIN" ]; then
    echo "can't execute $RABBITMQADMIN"
    exit 1
fi

printf '{\n'
printf '\t"data":[\n'

COUNT=1
VHOST_COUNT=$($RABBITMQADMIN list vhosts name messages_unacknowledged | sed 's/ //g;'| awk -F'|' '$3 ~ /[0-9]+/ {print $2}'|wc -l)
for i in $($RABBITMQADMIN list vhosts name messages_unacknowledged | sed 's/ //g;'| awk -F'|' '$3 ~ /[0-9]+/ {print $2}'); do 
    echo "
        {
                \"{#VHOST}\":\"$i\"
        }"
    if [ $COUNT -lt $VHOST_COUNT ]; then
       echo ","
    fi
    COUNT=$((COUNT+1))
done
printf '\t ]\n'
printf '}\n'
