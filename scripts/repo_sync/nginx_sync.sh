#!/bin/bash
# download nginx rpm and createrepo

NGINX_URL="http://nginx.org/packages/centos/6/x86_64/RPMS/"
NGINX_TMP="/tmp/nginx_log.txt"

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

/usr/bin/elinks --dump  $NGINX_URL | awk '/http/ {print $NF}' | grep rpm | grep -v debug > $NGINX_TMP 

if [ $(cat $NGINX_TMP | wc -l) -eq 0 ]; then
    echo "failed to get nginx urls."
    exit 1
fi

for URL in $(cat $NGINX_TMP); do
    NGINX_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$NGINX_RPM ]; then
        echo "$NGINX_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$NGINX_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$NGINX_RPM
        else
            /bin/mv /tmp/$NGINX_RPM $ROOT_DIR 
        fi
          
    fi    
done
/usr/bin/createrepo $ROOT_DIR
/bin/rm $NGINX_TMP
