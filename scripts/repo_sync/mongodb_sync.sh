#!/bin/bash
# download mongdb rpm and createrepo

MONGODB_URL="http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/RPMS/"
MONGODB_TMP="/tmp/mongodb_log.txt"

ROOT_DIR="/var/www/repo/mongodb/"

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

/usr/bin/elinks --dump  $MONGODB_URL | awk '/http/ {print $NF}' | grep rpm | egrep -v 'debug|10gen|unstable' > $MONGODB_TMP 

if [ $(cat $MONGODB_TMP | wc -l) -eq 0 ]; then
    echo "failed to get mongdb urls."
    exit 1
fi

for URL in $(cat $MONGODB_TMP); do
    MONGODB_RPM=$(basename $URL)
    if [ -f $ROOT_DIR/$MONGODB_RPM ]; then
        echo "$MONGODB_RPM -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$MONGODB_RPM
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$MONGODB_RPM
        else
            /bin/mv /tmp/$MONGODB_RPM $ROOT_DIR 
        fi
          
    fi    
done
/usr/bin/createrepo $ROOT_DIR
/bin/rm $MONGODB_TMP
