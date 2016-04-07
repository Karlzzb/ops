#!/bin/bash
# cronjob -  /var/www/sites/domain_check/daily_cron.sh on 192.168.10.253
#

DAY=$(( $(date +%d | sed 's/^0//') % 2 ))

for i in $(/usr/bin/mysql -N 17ce -e "select id from record;"); do
    if [ "$DAY" == "$(( $i % 2 ))" ]; then 
            echo "testing id: $i ...$(date)"
            DOMAIN=$(/usr/bin/mysql 17ce -N -e "select name from record where id=$i")
            echo $DOMAIN
            /bin/bash /var/www/sites/domain_check/web_test.sh $DOMAIN
            sleep 240
    fi
done




