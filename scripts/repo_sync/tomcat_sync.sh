#!/bin/bash
# download tomcat 6.0,7.0 &8.0 binary files from official website

TOMCAT_TMP="/tmp/nginx_log.txt"

ROOT_DIR="/var/www/repo/source/"

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

TOMCAT6_URL=$(curl http://tomcat.apache.org/download-60.cgi -s | grep -P 'apache-tomcat-6.0.\d+.tar.gz"' | awk -F'"' '{print $2}')
TOMCAT7_URL=$(curl http://tomcat.apache.org/download-70.cgi -s | grep -P 'apache-tomcat-7.0.\d+.tar.gz"' | awk -F'"' '{print $2}')
TOMCAT8_URL=$(curl http://tomcat.apache.org/download-80.cgi -s | grep -P 'apache-tomcat-8.0.\d+.tar.gz"' | awk -F'"' '{print $2}')

#echo $TOMCAT6_URL $TOMCAT7_URL $TOMCAT8_URL


for URL in $TOMCAT6_URL $TOMCAT7_URL $TOMCAT8_URL; do
    TOMCAT_BIN=$(basename $URL)
    if [ -f $ROOT_DIR/$TOMCAT_BIN ]; then
        echo "$TOMCAT_BIN -- good "
    else
        echo "Downloading $URL "
        wget $URL -O /tmp/$TOMCAT_BIN
        if [ $? -ne 0 ]; then
            echo "Failed to download "
            /bin/rm /tmp/$TOMCAT_BIN
        else
            /bin/mv /tmp/$TOMCAT_BIN $ROOT_DIR 
        fi
          
    fi    
done
/bin/rm $TOMCAT_TMP
