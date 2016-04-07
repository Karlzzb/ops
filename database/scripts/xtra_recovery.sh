#!/bin/bash
FULL_DIR="/backup/discuz/full"
INCR_DIR="/backup/discuz/incr"
FULL_INFO="/tmp/x_full.info"
INCR_INFO="/tmp/x_incr.info"
INCR_DIR_LIST="/tmp/x_incr_dir.list"
BINLOG_DIR="/backup/binlog-backup/my-dev1"
MYSQL_CNF="/data/db/mysql3386/my.cnf"
FULL_BACKUP_FOUND=0
INCR_BACKUP_FOUND=0
FULL_ONLY_RESTORE=1

INCR_POSTION_READY=0

CUSTOM_FULL_BACKUP_DIR=""
CUSTOM_INCR_BACKUP_DIR=""
CUSTOM_START_POSTION=""

INNOBACKUPEX_BIN="/usr/bin/innobackupex"
MYSQLBINLOG="/opt/mysql/bin/mysqlbinlog"

check_binary() {
    if [ ! -x "$1" ]; then
        echo "[ERROR]: Can't find command $1"
        exit 1
    fi
}

check_dir() {
    if [ ! -d "$1" ]; then
        echo "Invalid diretory: $1"
        exit 1
    fi
}

date_input() {
    echo "---------------------------------------------"
    echo ">>>>>>>  MySQL innobackupex recovery  <<<<<<<"
    echo "---------------------------------------------"
    read -p "Please input the date/time: (ie, 2015-03-22 09:44:00): " RECOVER_DATE
    echo "Setting mysqlbinlog --stop-datetime to '$RECOVER_DATE'"
    DST_DATE=$(date +%s --date="$RECOVER_DATE" 2>/dev/null)
    #echo "EPOCH: $DST_DATE"
    
    if [[ $DST_DATE -lt 900000000 ]]; then
        echo "Invalid date."
        exit 1
    fi
}

if [ $EUID -ne 0 ]; then
    echo "please run this script as root user"
    exit 1
fi

check_binary "$INNOBACKUPEX_BIN"
check_binary "$MYSQLBINLOG"

INNOBACKUPEX="$INNOBACKUPEX_BIN --defaults-file=$MYSQL_CNF --user=root "

if [ -n "$CUSTOM_FULL_BACKUP_DIR" -o -n "$CUSTOM_INCR_BACKUP_DIR" ]; then
    echo "[INFO]: Restoring MySQL data from user-specific diretory ..."
    if [ -z "$CUSTOM_START_POSTION" ]; then
        echo "[ERROR]: You must specify mysqlbinlog start position!"
        exit 1
    fi

    if [ -z "$CUSTOM_FULL_BACKUP_DIR" ]; then
        echo "[ERROR]: You must specify a full backup directory"
        exit 1
    else
        check_dir "$CUSTOM_FULL_BACKUP_DIR"
        if [ -z "$CUSTOM_INCR_BACKUP_DIR" ]; then
            FULL_BACKUP_DIR="$CUSTOM_FULL_BACKUP_DIR"
            FULL_POSTION="$CUSTOM_START_POSTION"
        else
            check_dir "$CUSTOM_INCR_BACKUP_DIR"
            FULL_BACKUP_DIR="$CUSTOM_FULL_BACKUP_DIR"
            INCR_BACKUP_DIR="$CUSTOM_INCR_BACKUP_DIR"
            INCR_POSTION="$CUSTOM_START_POSTION"
            FULL_ONLY_RESTORE=0 
        fi 
    fi
    date_input
else
    check_dir "$FULL_DIR"
    check_dir "$INCR_DIR"
    date_input
    
    > "$FULL_INFO"
    echo "checking current FULL backup files..."
    for i in $(find "$FULL_DIR" -name 'xtrabackup_slave_info' ); do
        echo -n "$(stat -c %Y $i) " >> $FULL_INFO
        echo "$(dirname $i)" >> $FULL_INFO
    done
    
    
    tac $FULL_INFO > /tmp/tac_full.list
    while read i ; do 
        BACKUP_DATE=$(echo "$i" | awk '{print $1}')
        if [[ $DST_DATE -gt $BACKUP_DATE ]]; then
            FULL_BACKUP_FOUND=1
            FULL_BACKUP_DIR=$(echo "$i" | awk '{print $2}')
            PART_BACKUP_DIR=$(basename "$FULL_BACKUP_DIR")
            echo "[INFO]: Valid full MySQL backup found, the directory is $FULL_BACKUP_DIR"
            break
        fi
    done < /tmp/tac_full.list
     

    if [ $FULL_BACKUP_FOUND -ne 1 ]; then
        echo "No valid MySQL full backup found. !!!"
        exit 1
    fi
    
    # get full backup position
    FULL_POSTION=$(awk -F'=' '{print $NF}' "$FULL_BACKUP_DIR/xtrabackup_slave_info")
    if [ -z "$FULL_POSTION" ]; then
        echo "Failed to get full backup position"
        exit 1
    fi
    
    > "$INCR_INFO"
    echo > "$INCR_DIR_LIST"
    echo "Checking current INCR backup files..."
    for i in $(find "$INCR_DIR/$PART_BACKUP_DIR" -name 'xtrabackup_slave_info' 2>/dev/null ); do
        echo -n "$(stat -c %Y $i) " >> "$INCR_INFO"
        echo "$(dirname $i)" >> "$INCR_INFO"
        INCR_BACKUP_FOUND=1
    done
    
    if [ $INCR_BACKUP_FOUND -eq 1 ]; then
        tac $INCR_INFO > /tmp/tac_incr.list
        while read i; do 
            BACKUP_DATE=$(echo "$i" | awk '{print $1}')
            if [ $DST_DATE -gt $BACKUP_DATE ]; then
                FULL_ONLY_RESTORE=0
                INCR_BACKUP_FOUND=1
                INCR_BACKUP_DIR="$(echo $i | awk '{print $2}')"
    
                #echo ">>>>>>>> $i"
                echo "$INCR_BACKUP_DIR" >> $INCR_DIR_LIST 

                # get last incr backup position
                if [ $INCR_POSTION_READY  -ne 1 ]; then
                    INCR_POSTION=$(awk -F'=' '{print $NF}' "$INCR_BACKUP_DIR"/xtrabackup_slave_info)
                    if [ -n "$INCR_POSTION" ]; then
                        INCR_POSTION_READY=1 
                    fi
                fi
            fi
        done < /tmp/tac_incr.list
        cat "$INCR_DIR_LIST"
        
        if [ $FULL_ONLY_RESTORE -eq 1 ]; then
             echo "No incr backup found under $INCR_DIR/$PART_BACKUP_DIR,restore from full backup only!" 
        fi
    else
        echo "No incr backup found,restore from full backup only!" 
    fi
    
fi

full_restore() {
    echo "$INNOBACKUPEX --apply-log --redo-only $FULL_BACKUP_DIR"
    echo "$INNOBACKUPEX --copy-back $FULL_BACKUP_DIR"
    echo "$MYSQLBINLOG --start-positon=$FULL_POSTION --stop-datetime='$RECOVER_DATE' $BINLOG_DIR/mysql-bin.* > /tmp/my.sql"
}

full_incr_restore() {
    echo "$INNOBACKUPEX --apply-log --redo-only $FULL_BACKUP_DIR"

    for dir in $(tac $INCR_DIR_LIST); do 
        echo "$INNOBACKUPEX --apply-log --redo-only $FULL_BACKUP_DIR --incremental-dir=$dir"
    done

    echo "$INNOBACKUPEX --copy-back $FULL_BACKUP_DIR"

    echo "$MYSQLBINLOG --start-positon=$INCR_POSTION --stop-datetime='$RECOVER_DATE' $BINLOG_DIR/mysql-bin.* > /tmp/my.sql"
}

# start to restore data
if [ $FULL_ONLY_RESTORE -eq 1 ]; then
    echo "Starting MySQL data restore from FULL backup only!" 
    echo ">>> FULL BACKUP DIR: $FULL_BACKUP_DIR"
    echo ">>> mysqlbinlog Start Position: $FULL_POSTION"
    echo ">>> mysqlbinlog Stop time: $RECOVER_DATE"
    full_restore
else
    echo "Starting MySQL data restore from (FULL + INCR) backup!"    
    echo ">>> FULL BACKUP DIR: $FULL_BACKUP_DIR"
    echo ">>> INCR BACKUP DIR:"
    cat $INCR_DIR_LIST
    echo ">>> mysqlbinlog Start Position: $INCR_POSTION"
    echo ">>> mysqlbinlog Stop time: $RECOVER_DATE"
    full_incr_restore
fi
