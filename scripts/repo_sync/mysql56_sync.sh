#!/bin/bash
# download mysql56 rpm and createrepo

MYSQL56_URL="http://repo.mysql.com/yum/mysql-5.6-community/el/6/x86_64/"
MYSQL56_TMP="/tmp/mysql_log.txt"

ROOT_DIR="/var/www/repo/mysql56/"

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

if [ ! -x /usr/bin/createrepo ]; then
    echo "/usr/bin/elinks not found"
    exit 1
fi

if [ ! -x /usr/bin/elinks ]; then
    echo "/usr/bin/elinks not found"
    exit 1
fi

mkdir -p $ROOT_DIR

/usr/bin/elinks --dump  $MYSQL56_URL | awk '/http/ {print $NF}' | grep rpm | egrep -v 'debug|embedded' > $MYSQL56_TMP 

if [ $(cat $MYSQL56_TMP | wc -l) -eq 0 ]; then
    echo "failed to get mysql56 urls."
    exit 1
fi

for URL in $(cat $MYSQL56_TMP); do
    MYSQL56_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$MYSQL56_RPM ]; then
        echo "$MYSQL56_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$MYSQL56_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$MYSQL56_RPM
        else
            /bin/mv /tmp/$MYSQL56_RPM $ROOT_DIR 
        fi
          
    fi    
done
/usr/bin/createrepo $ROOT_DIR
/bin/rm $MYSQL56_TMP
