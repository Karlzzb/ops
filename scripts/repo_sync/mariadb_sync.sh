#!/bin/bash
# 
# description: rsync mariadb 10.0/10.1 epositories to local.

MARIADB="rsync.osuosl.org::mariadb/yum/"

ROOT_DIR="/var/www/sites/repo"
LOG_FILE="/tmp/repo_rsync.txt"

check_return() {
    if [ $? -ne 0 ]; then
        echo "$(date) - Failed to rsync this mirror: $1" >> $LOG_FILE
    else
        echo "$(date) - Done." >> $LOG_FILE 
    fi
}

start_rsync() {
    echo "$(date) - Start to rsync $1 - " >> $LOG_FILE
}

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user."
    exit 1
fi

## MARIADB - https://mariadb.com/kb/en/mariadb/download/mirroring-mariadb/
#
start_rsync "MARIADB"
rsync -avzH --partial --delete-after --delay-updates -R "$MARIADB/./10.*/centos*/" $ROOT_DIR/mariadb/
check_return
#
