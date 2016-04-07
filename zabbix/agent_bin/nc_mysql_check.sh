#!/bin/bash
# Zabbix monitoring script for MySQL/MariaDB

ZABBIX_REQ=$1
FORCE_FLUSH=$2
MYSQL_USER="monitoring"
MYSQL_PASS="8e3d7855e5681ee463e28394c2bb33043e65dbb9"
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3366"
MYSQL_BIN="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS -h $MYSQL_HOST -P $MYSQL_PORT"
MYSQL_COMMAND="$MYSQL_BIN " 

TMP_DIR="/home/zabbix/tmp"
MYSQL_TMP="$TMP_DIR/mysql.tmp"


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

if [ ! -w $TMP_DIR ]; then
    echo "$ERROR_PERMISSION"
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
binary_check $MYSQL_BIN

status_generate() {
    if [ ! -f $MYSQL_TMP -o ! -s $MYSQL_TMP ]; then
        $MYSQL_COMMAND -e 'SHOW GLOBAL STATUS; SHOW GLOBAL VARIABLES; SHOW MASTER STATUS \G SHOW SLAVE STATUS \G SHOW ENGINE INNODB STATUS\G' > $MYSQL_TMP
        if [ $? -ne 0 -o -z "$MYSQL_TMP" ]; then
            echo $ERROR_DATA
            exit 1
        fi
        sed -i 's/[,;]/\n/g; s/^ *//g;' $MYSQL_TMP
    else
        NOW=$(date +%s)
        LAST_CTIME=$(stat -c %Y $MYSQL_TMP)
        if [ $((NOW - LAST_CTIME)) -gt 30 -o "$FORCE_FLUSH" == "-f" ]; then 
            $MYSQL_COMMAND -e 'SHOW GLOBAL STATUS; SHOW GLOBAL VARIABLES; SHOW MASTER STATUS \G SHOW SLAVE STATUS \G SHOW ENGINE INNODB STATUS\G' > $MYSQL_TMP
            if [ $? -ne 0 ]; then
                echo $ERROR_DATA
                exit 1
            fi
            sed -i 's/[,;]/\n/g; s/^ *//g;' $MYSQL_TMP
        fi
    fi

    check_point() {
        # http://www.mysqlperformanceblog.com/2011/09/18/disaster-mysql-5-5-flushing/
        FLUSHED_UP=$(awk '/Log flushed up/ {print $NF}' $MYSQL_TMP)
        LAST_CHECK=$(awk '/Last checkpoint/ {print $NF}' $MYSQL_TMP)
        MAX_AGE=$(awk '/Max checkpoint/ {print $NF}' $MYSQL_TMP)
        MAX_AGE=$((MAX_AGE / 3))

        SYNC=$((FLUSHED_UP - LAST_CHECK - MAX_AGE))

        if [ $SYNC -gt 1 ]; then
            echo 1
            exit
        else
            echo 0
            exit
        fi
    }
    
    case "$1" in
        Innodb_buffer_pool_pages_made_young_per_second)    awk '/ youngs\/s/ {print $1}' "$MYSQL_TMP"; exit ;; 
        Innodb_buffer_pool_pages_made_not_young_per_second)  awk '/non-youngs\/s/ {print $1}'  "$MYSQL_TMP"; exit ;; 
        Innodb_buffer_pool_hit_ratio)  sed 's#/ 1000##g' "$MYSQL_TMP" | awk '/Buffer pool hit rate/ {print $NF/10}' ; exit ;; 
        Innodb_buffer_pool_young_making_hit_ratio)  sed 's#/ 1000##g' "$MYSQL_TMP" | awk '/young-making rate/ {print $3/10}' ; exit ;; 
        Innodb_buffer_pool_not_young_making_hit_ratio)  sed 's#/ 1000##g' "$MYSQL_TMP" | awk '/young-making rate/ {print $5/10}' ; exit ;; 
        deadlock)                     grep -c "DEADLOCK" "$MYSQL_TMP"; exit ;; 
        foreign_key_error)            grep -c "FOREIGN" "$MYSQL_TMP"; exit ;; 
        check_point)                  check_point ;; 
        processlist)                  $MYSQL_COMMAND -e "show full processlist" | wc -l ; exit ;;
        historylength)                $MYSQL_COMMAND -e "show engine innodb status\G" |awk '/History list length/ {print $4}' ; exit ;;
        mutex_waits)                  $MYSQL_COMMAND -e "show engine innodb status\G" |awk '/Mutex spin waits/ {split($4,a,","); print a[1]}' ; exit ;;
        os_waits)                     $MYSQL_COMMAND -e "show engine innodb status\G" |awk '/Mutex spin waits/ {print $9}' ; exit ;; 
        pending_reads)                $MYSQL_COMMAND -e "show engine innodb status\G" |awk '/Pending reads/ {print $3; exit 0;}' ; exit ;;
        slave_delay)                  /usr/bin/pt-heartbeat -D analyze_db --check -u $MYSQL_USER -h $MYSQL_HOST -P $MYSQL_PORT -p $MYSQL_PASS --master-server-id 111 ; exit ;;
        *)                            VALUE=$(awk '/\<'"$1"'\>/ {print $2;exit}' $MYSQL_TMP) ;;
    esac


    if [ -n "$VALUE" ]; then
        echo "$VALUE"
    else
        echo "$ERROR_DATA"
    fi
    exit 0
}

status_generate "$ZABBIX_REQ"
