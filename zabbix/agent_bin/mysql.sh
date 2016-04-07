#!/bin/bash
# Zabbix monitoring script for MySQL 

ZABBIX_REQ=$1
ZABBIX_REQ_DATA=$2
MYSQL_USER="root"
MYSQL_PASS="a"
MYSQL_COMMAND="/usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASS"

TMP_DIR="/home/zabbix/tmp"
MYSQL_TMP="$TMP_DIR/mysql.tmp"
INNODB_TMP="$TMP_DIR/innodb.tmp"

# Error handling:
ERROR_USER="-0.0090"
ERROR_OPTIONS="-0.0091"
ERROR_DATA="-0.0092"
ERROR_PERMISSION="-0.0093"
ERROR_WRONG_PARAM="-0.0094"

innodb_status() {
    if [ ! -f $INNODB_TMP -o ! -s $INNODB_TMP ]; then
        $MYSQL_COMMAND -e 'SHOW ENGINE INNODB STATUS\G' > $INNODB_TMP
        if [ $? -ne 0 ]; then
            exit 1
        fi
        sed -i 's/[,;]/\n/g' $INNODB_TMP
        sed -i 's/^ *//g' $INNODB_TMP
    else
        NOW=$(date +%s)
        LAST_CTIME=$(stat -c %Y $INNODB_TMP)
        if [ $((NOW - LAST_CTIME)) -gt 30 ]; then 
            $MYSQL_COMMAND -e 'SHOW ENGINE INNODB STATUS\G' > $INNODB_TMP
            if [ $? -ne 0 ]; then
                echo $ERROR_DATA
                exit 1
            fi
            sed -i 's/[,;]/\n/g' $INNODB_TMP
            sed -i 's/^ *//g' $INNODB_TMP
        fi
    fi


    case $1 in 
        deadlock)                   grep -c 'DEADLOCK'  $INNODB_TMP ;;
        foreign_key_error)          grep -c 'FOREIGN KEY ERROR'  $INNODB_TMP ;;
        pending_flushes)            awk '/Pending flushes/ {print $NF}' $INNODB_TMP ;;
        pending_buffer_pool)        awk '/buffer pool/ {print $NF}' $INNODB_TMP ;;
        io_os_file_reads)           awk '/OS file reads/ {print $1}' $INNODB_TMP ;;
        io_os_file_writes)          awk '/OS file writes/ {print $1}' $INNODB_TMP ;;
        io_os_fsyncs)               awk '/OS fsyncs/ {print $1}' $INNODB_TMP ;;
        row_inserts_sec)            awk '/inserts\/s/ {print $1}' $INNODB_TMP ;;
        row_updates_sec)            awk '/updates\/s/ {print $1}' $INNODB_TMP ;;
        row_deletes_sec)            awk '/deletes\/s/ {print $1}' $INNODB_TMP ;;
        row_reads_sec)              awk '/reads\/s/ {print $1}'   $INNODB_TMP | tail -1;;
        *)                          echo $ERROR_OPTIONS; exit 1;;
    esac
    exit 0
}

mysql_status() {
    KEY="$1" 
    if [ ! -f $MYSQL_TMP -o ! -s $MYSQL_TMP ]; then
        $MYSQL_COMMAND -e 'SHOW GLOBAL STATUS; SHOW GLOBAL VARIABLES; SHOW MASTER STATUS \G SHOW SLAVE STATUS \G' > $MYSQL_TMP
        if [ $? -ne 0 ]; then
            exit 1
        fi
    else
        NOW=$(date +%s)
        LAST_CTIME=$(stat -c %Y $MYSQL_TMP)
        if [ $((NOW - LAST_CTIME)) -gt 30 ]; then 
            $MYSQL_COMMAND -e 'SHOW GLOBAL STATUS; SHOW GLOBAL VARIABLES; SHOW MASTER STATUS \G SHOW SLAVE STATUS \G' > $MYSQL_TMP
            if [ $? -ne 0 ]; then
                echo $ERROR_DATA
                exit 1
            fi
        fi
    fi
    
    VALUE=$(awk '/\<'"$KEY"'\>/ {print $2}' $MYSQL_TMP)
    if [ -n "$VALUE" ]; then
        echo "$VALUE"
    else
        echo "$ERROR_DATA"
    fi
    exit 0
}

case $ZABBIX_REQ in
  mysql)        mysql_status          "$ZABBIX_REQ_DATA";;
  innodb)       innodb_status         "$ZABBIX_REQ_DATA";;
  *) echo $ERROR_WRONG_PARAM; exit 1;;
esac

