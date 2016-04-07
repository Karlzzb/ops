##innobackupex_mysql_backup.sh
#!/bin/sh
# 
#author: array
#version: 1.0
#date: 2012/08/21

INNOBACKUPEX=innobackupex
INNOBACKUPEXFULL=/usr/bin/$INNOBACKUPEX
USEROPTIONS="--user=root --password="
TMPFILE="/tmp/innobackupex-runner.$$.tmp"
MYCNF=/usr/local/webserver/mysql/my.cnf
MYSQL=/usr/local/webserver/mysql/bin/mysql
MYSQLADMIN=/usr/local/webserver/mysql/bin/mysqladmin
BACKUPDIR=/dbbackup/backupex # Backups base directory
FULLBACKUPDIR=$BACKUPDIR/full # Full backups directory
INCRBACKUPDIR=$BACKUPDIR/incr # Incremental backups directory
FULLBACKUPLIFE=86400 # Lifetime of the latest full backup in seconds
KEEP=7 # Number of full backups (and its incrementals) to keep

# Grab start time
STARTED_AT=`date +%s`

#############################################################################
# Display error message and exit
#############################################################################
error()
{
	echo "$1" >>/var/log/innobackupex_mysql_backup.sh
	exit 1
}

# Check options before proceeding
if [ ! -x $INNOBACKUPEXFULL ]; then
  error "$INNOBACKUPEXFULL does not exist."
fi

if [ ! -d $BACKUPDIR ]; then
  error "Backup destination folder: $BACKUPDIR does not exist."
fi

if [ -z "`$MYSQLADMIN -S /mysqldb/run/mysql.sock  $USEROPTIONS status | grep 'Uptime'`" ] ; then
 error "HALTED: MySQL does not appear to be running."
fi

if ! `echo 'exit' | $MYSQL -s $USEROPTIONS` ; then
 error "HALTED: Supplied mysql username or password appears to be incorrect (not copied here for security, see script)."
fi

# Some info output
echo "----------------------------"
echo
echo "$0: MySQL backup script"
echo "started: `date`"
echo

# Create full and incr backup directories if they not exist.
mkdir -p $FULLBACKUPDIR
mkdir -p $INCRBACKUPDIR

# Find latest full backup
LATEST_FULL=`find $FULLBACKUPDIR -mindepth 1 -maxdepth 1 -type d -printf "%P\n" | sort -nr | head -1`

# Get latest backup last modification time
LATEST_FULL_CREATED_AT=`stat -c %Y $FULLBACKUPDIR/$LATEST_FULL`

# Run an incremental backup if latest full is still valid. Otherwise, run a new full one.
if [ "$LATEST_FULL" -a `expr $LATEST_FULL_CREATED_AT + $FULLBACKUPLIFE + 5` -ge $STARTED_AT ] ; then
  # Create incremental backups dir if not exists.
  TMPINCRDIR=$INCRBACKUPDIR/$LATEST_FULL
  mkdir -p $TMPINCRDIR
  
  # Find latest incremental backup.
  LATEST_INCR=`find $TMPINCRDIR -mindepth 1 -maxdepth 1 -type d | sort -nr | head -1`
  
  # If this is the first incremental, use the full as base. Otherwise, use the latest incremental as base.
  if [ ! $LATEST_INCR ] ; then
    INCRBASEDIR=$FULLBACKUPDIR/$LATEST_FULL
  else
    INCRBASEDIR=$LATEST_INCR
  fi
  
  echo "Running new incremental backup using $INCRBASEDIR as base."  >>/var/log/innobackupex_mysql_backup.sh
  $INNOBACKUPEXFULL --defaults-file=$MYCNF $USEROPTIONS --incremental $TMPINCRDIR --incremental-basedir $INCRBASEDIR > $TMPFILE 2>&1
else
  echo "Running new full backup."  >>/var/log/innobackupex_mysql_backup.sh
  $INNOBACKUPEXFULL --defaults-file=$MYCNF $USEROPTIONS $FULLBACKUPDIR > $TMPFILE 2>&1
fi

if [ -z "`tail -1 $TMPFILE | grep 'completed OK!'`" ] ; then
 echo "$INNOBACKUPEX failed:"; echo
 echo "---------- ERROR OUTPUT from $INNOBACKUPEX ----------"
 cat $TMPFILE
 rm -f $TMPFILE
 exit 1
fi

THISBACKUP=`awk -- "/Backup created in directory/ { split( \\\$0, p, \"'\" ) ; print p[2] }" $TMPFILE`
rm -f $TMPFILE

echo "Databases backed up successfully to: $THISBACKUP"  >>/var/log/innobackupex_mysql_backup.sh
echo

# Cleanup
echo "Cleanup. Keeping only $KEEP full backups and its incrementals."  >>/var/log/innobackupex_mysql_backup.sh
AGE=$(($FULLBACKUPLIFE * $KEEP / 60))
find $FULLBACKUPDIR -maxdepth 1 -type d -mmin +$AGE -execdir echo "removing: "$FULLBACKUPDIR/{} \; -execdir rm -rf $FULLBACKUPDIR/{} \; -execdir echo "removing: "$INCRBACKUPDIR/{} \; -execdir rm -rf $INCRBACKUPDIR/{} \;

echo
echo "completed: `date`"  >>/var/log/innobackupex_mysql_backup.sh
exit 0
