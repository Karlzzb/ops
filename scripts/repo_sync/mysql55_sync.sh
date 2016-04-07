#!/bin/bash
# download mysql55 rpm and createrepo

MYSQL55_URL="http://repo.mysql.com/yum/mysql-5.5-community/el/6/x86_64/"
MYSQL55_TMP="/tmp/mysql_log.txt"

ROOT_DIR="/var/www/repo/mysql55/"

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

/usr/bin/elinks --dump  $MYSQL55_URL | awk '/http/ {print $NF}' | grep rpm | egrep -v 'debug|embedded' > $MYSQL55_TMP 

if [ $(cat $MYSQL55_TMP | wc -l) -eq 0 ]; then
    echo "failed to get mysql55 urls."
    exit 1
fi

for URL in $(cat $MYSQL55_TMP); do
    MYSQL55_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$MYSQL55_RPM ]; then
        echo "$MYSQL55_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$MYSQL55_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$MYSQL55_RPM
        else
            /bin/mv /tmp/$MYSQL55_RPM $ROOT_DIR 
        fi
          
    fi    
done
/usr/bin/createrepo $ROOT_DIR
/bin/rm $MYSQL55_TMP
