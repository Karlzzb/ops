#!/bin/bash
# download remi php rpm and createrepo

PHP_URL="http://rpms.famillecollet.com/enterprise/6/php55/x86_64/"
PHP_TMP="/tmp/php_log.txt"

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

/usr/bin/elinks --dump  $PHP_URL | awk '/http/ {print $NF}' | grep -w rpm | grep -v phpMyAdmin > $PHP_TMP 

if [ $(cat $PHP_TMP | wc -l) -eq 0 ]; then
    echo "failed to get php urls."
    exit 1
fi

for URL in $(cat $PHP_TMP); do
    PHP_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$PHP_RPM ]; then
        echo "$PHP_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$PHP_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$PHP_RPM
        else
            /bin/mv /tmp/$PHP_RPM $ROOT_DIR 
        fi
          
    fi    
done
/usr/bin/createrepo $ROOT_DIR
/bin/rm $PHP_TMP
