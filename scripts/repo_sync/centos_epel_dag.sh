#!/bin/bash
# 
# description: rsync centos official repositories/epel/dag to local.

EPEL="rsync://mirror.sfo12.us.leaseweb.net/epel"
DAG="rsync://apt.sw.be/pub/freshrpms/pub/dag/redhat"
CENTOS="rsync://mirrors.bestthaihost.com/centos"

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
    echo "$(date) - Start to rsync - " >> $LOG_FILE
}

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user."
    exit 1
fi


mkdir -p $ROOT_DIR/epel/{5..7}/
mkdir -p $ROOT_DIR/centos/{5..7}/
mkdir -p $ROOT_DIR/dag/{5..7}/x86_64

## EPEL - https://mirrors.fedoraproject.org/publiclist/EPEL/
#start_rsync "EPEL5"
#rsync -avzH --delete --partial --delete-after --delay-updates --exclude="debug/*" $EPEL/5/ $ROOT_DIR/epel/5/
#check_return
#
start_rsync "EPEL6"
rsync -avzH --delete --partial --delete-after --delay-updates --exclude="debug/*" $EPEL/6/ $ROOT_DIR/epel/6/
check_return
#
#start_rsync "EPEL7"
#rsync -avzH --delete --partial --delete-after --delay-updates --exclude="debug/*" $EPEL/7/ $ROOT_DIR/epel/7/
#check_return
#
#
## CentOS - http://www.centos.org/download/mirrors/
#
#start_rsync "CentOS5"
#rsync  -avzH --delete --partial --delete-after --delay-updates $CENTOS/5/ $ROOT_DIR/centos/5/
#check_return
#
start_rsync "CentOS6"
rsync  -avzH --delete --partial --delete-after --delay-updates $CENTOS/6/ $ROOT_DIR/centos/6/
check_return
#
#start_rsync "CentOS7"
#rsync  -avzH --delete --partial --delete-after --delay-updates $CENTOS/7/ $ROOT_DIR/centos/7/
#check_return
#
#
## http://dag.wiee.rs/rpm/links.php
#start_rsync "DAG5"
#rsync -avzH --delete --partial --delete-after --delay-updates $DAG/el5/en/x86_64/dag/      $ROOT_DIR/dag/5/x86_64
#check_return
#
start_rsync "DAG6"
rsync -avzH --delete --partial --delete-after --delay-updates $DAG/el6/en/x86_64/dag/      $ROOT_DIR/dag/6/x86_64
check_return
#
#start_rsync "DAG7"
#rsync -avzH --delete --partial --delete-after --delay-updates $DAG/el7/en/x86_64/dag/      $ROOT_DIR/dag/7/x86_64
#check_return

