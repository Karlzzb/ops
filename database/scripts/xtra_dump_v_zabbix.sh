#!/bin/sh
# 
#author: Kerl
#version: 1.0
#date: 2015/02/04

#error header
error(){
  echo "`date +%F_%T` [ERROR]  $1" >> $EXECUTE_LOG
  /usr/bin/zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.backup  -o 172.16.30.16-zabbix > /dev/null 2>&1
  exit 1
}

#data dump
my_dump(){
  
  # Find latest full backup
  LATEST_FULL=`find $FULL_BACK_DIR -mindepth 1 -maxdepth 1 -type d -printf "%P\n" | sort -nr | head -1`
  
  # Get latest backup last modification time
  LATEST_FULL_CREATED_AT=`stat -c %Y $FULL_BACK_DIR/$LATEST_FULL`


  # Run an incremental backup if latest full is still valid. Otherwise, run a new full one.
  if [ "$LATEST_FULL" -a `expr $LATEST_FULL_CREATED_AT + $FULL_BACKUP_GAP + 5` -ge $STARTED_AT ] ; then
  
    # Create incremental backups dir if not exists.
    TMPINCRDIR=$INCR_BACK_DIR/$LATEST_FULL
    mkdir -p $TMPINCRDIR
  
    # Find latest incremental backup.
    LATEST_INCR=`find $TMPINCRDIR -mindepth 1 -maxdepth 1 -type d | sort -nr | head -1`
  
    # If this is the first incremental, use the full as base. Otherwise, use the latest incremental as base.
    if [ ! $LATEST_INCR ] ; then
      INCRBASEDIR=$FULL_BACK_DIR/$LATEST_FULL
    else
      INCRBASEDIR=$LATEST_INCR
    fi
  
    #Running new incremental backup using $INCRBASEDIR as base
    $BACKUP_TOOL --defaults-file=$MYSQL_CNF $MYSQL_SECURITIES --incremental $TMPINCRDIR --incremental-basedir $INCRBASEDIR > $TMPFILE 2>&1
  else
    #Running new full backup
    $BACKUP_TOOL --defaults-file=$MYSQL_CNF $MYSQL_SECURITIES $FULL_BACK_DIR > $TMPFILE 2>&1
  fi

  if [ -z "`tail -1 $TMPFILE | grep 'completed OK!'`" ] ; then
    error "Backup failed, pls check $TMPFILE"
  fi

}

#data clean
my_clean() {
  find $FULL_BACK_DIR -mindepth 1 -maxdepth 1 -type d -mtime +$KEEP | xargs rm -rf
  find $INCR_BACK_DIR -mindepth 1 -maxdepth 1 -type d -mtime +$KEEP | xargs rm -rf
}

#DB info
HOSTNAME=172.16.30.16
PORT=3306
USERNAME="root"
PASSWORD=""
MYSQL_CNF=/data/db/mysql3306/my.cnf
MYSQL_SECURITIES="--user=${USERNAME} --password=${PASSWORD} --socket=/data/db/mysql3306/mysql3306.sock"

#Mysql Tools
MYSQL_ADMIN=/usr/bin/mysqladmin
MYSQL_CLI=/usr/bin/mysql
BACKUP_TOOL="/usr/bin/innobackupex --slave-info --safe-slave-backup --parallel=8"

#All Directories or Files
BACK_DIR=/data/zabbix-dbbackup
FULL_BACK_DIR=$BACK_DIR/full # Full backups directory
INCR_BACK_DIR=$BACK_DIR/incr # Incremental backups directory
EXECUTE_LOG=/var/log/xtra-mysql-backup.log
TMPFILE="/tmp/xtra-mysql_runner.$$.tmp"

#Limitations
FULL_BACKUP_GAP=604800 # Lifetime of the latest full backup in seconds
KEEP=8 # Number of full backups to keep
STARTED_AT=`date +%s`

# Check options before proceeding
if [ ! -x $BACK_DIR ]; then
  error "${BACK_DIR} does not exist."
fi

if [ -z "`$MYSQL_ADMIN $MYSQL_SECURITIES status | grep 'Uptime'`" ] ; then
  error "HALTED: MySQL does not appear to be running."
fi

if ! `echo 'exit' | $MYSQL_CLI -s $MYSQL_SECURITIES` ; then
  error "HALTED: Supplied mysql username or password appears to be incorrect (not copied here for security, see script)."
fi

#proceeding
mkdir -p $FULL_BACK_DIR
mkdir -p $INCR_BACK_DIR
my_dump
my_clean
echo "`date +%F_%T` [info]  Backup completed!" >> $EXECUTE_LOG
/usr/bin/zabbix_sender -z 172.16.30.16 -p 10051 -s caegi-backup-check -k mysql.backup  -o OK > /dev/null 2>&1
