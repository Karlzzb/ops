#!/bin/bash
# 
# description: rsync percona DB to local.

PERCONA_URL="rsync://rsync.percona.com/rsync/centos/6/os/x86_64/"

ROOT_DIR="/var/www/sites/repo/percona"
LOG_FILE="/tmp/percona_rsync.txt"

if [ $EUID -ne 0 ]; then
    echo "please run this script as root user."
    exit 1
fi

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

start_rsync "PERCONA"
/usr/bin/rsync -avzH  --partial --delete-after --delay-updates --exclude="*debug*" $PERCONA_URL $ROOT_DIR 
check_return
