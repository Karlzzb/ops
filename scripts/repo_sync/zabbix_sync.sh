#!/bin/bash
# download zabbix rpm and createrepo

ZABBIX_URL="http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/"
ZABBIX_VERSION="2.2.6"
ZABBIX_TMP="/tmp/zabbix_log.txt"

ROOT_DIR="/var/www/repo/public/"

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

if [ ! -x /usr/bin/createrepo ]; then
    echo "/usr/bin/createrepo not found"
    exit 1
fi

if [ ! -x /usr/bin/elinks ]; then
    echo "/usr/bin/elinks not found"
    exit 1
fi

mkdir -p $ROOT_DIR

/usr/bin/elinks --dump  $ZABBIX_URL | awk '/http/ {print $NF}' | grep rpm | grep "$ZABBIX_VERSION" > $ZABBIX_TMP 

if [ $(cat $ZABBIX_TMP | wc -l) -eq 0 ]; then
    echo "failed to get zabbix urls."
    exit 1
fi

for URL in $(cat $ZABBIX_TMP); do
    ZABBIX_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$ZABBIX_RPM ]; then
        echo "$ZABBIX_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$ZABBIX_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$ZABBIX_RPM
        else
            /bin/mv /tmp/$ZABBIX_RPM $ROOT_DIR 
        fi
          
    fi    
done

/usr/bin/createrepo $ROOT_DIR
/bin/rm $ZABBIX_TMP
