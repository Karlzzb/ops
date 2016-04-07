#!/bin/bash
# 
# description: install tomcat automatically
# 2014/09/28  Adam - init.

URL="http://192.168.10.201/source/"
DEFAULT_VERSION="7.0.55"

# functions
err_echo() {
    echo -e "\e[91m[ERROR]: $1 \033[0m"
    exit 1
}

info_echo() {
    echo -e "\e[92m[INFO]: $1 \033[0m"
}

warn_echo() {
    echo -e "\e[93m[WARNING]: $1 \033[0m"
}

show_usage() {
cat << EOF
    Usage: $0 <tomcat version>. Default version is $DEFAULT_VERSION. Use '-l' option to show all tomcat version.

    Options:
        -h | --help  Show this help 
        -l | --list  List all avaiable Tomcat version.
EOF

    exit 1
}

show_version() {
    if [ ! -x /usr/bin/elinks ]; then
        err_echo "please install elinks."
    fi
    echo "Avaiable Tomcat Versions in $URL"
    for i in $(/usr/bin/elinks --dump $URL | awk -F'-' '/http.*apache-tomcat.*.tar.gz/ {print $NF}'); do
        echo "  - ${i//.tar.gz/}"
    done
    exit 1
}

check_return() {
  if [ $? -ne 0 ]; then
      err_echo "$1"
  fi
}

if [ "$1" == '-h' -o "$1" == "--help" ]; then
    show_usage
elif [ "$1" == "-l" -o "$1" == '--list' ]; then
    show_version
fi

if [ $EUID -ne 0 ]; then
    echo "please run this script as root user."
    exit 1
fi

if [ $# -eq 0 ]; then
    TOMCAT_VERSION="$DEFAULT_VERSION"
else
    TOMCAT_VERSION="$1"
fi

# check JAVA env
if ! which java &>/dev/null; then
    err_echo "Please install JDK first"
    exit 1
elif [ -z "$JAVA_HOME" ]; then
    err_echo "\$JAVA_HOME not set"
    exit 1
fi

# get CATALINA_HOME
CATALINA_HOME="/opt/apache-tomcat-$TOMCAT_VERSION"

# check if tomcat already exists
if [ -d "$CATALINA_HOME" ]; then
    err_echo "Tomcat already installed under $CATALINA_HOME"
fi

echo "Downloading tomcat..."
wget -O /tmp/tomcat.tmp $URL/apache-tomcat-$TOMCAT_VERSION.tar.gz
check_return "Failed to download tomcat"
/bin/mv /tmp/tomcat.tmp /opt/apache-tomcat-$TOMCAT_VERSION.tar.gz

echo "Uncompressing... "
tar -C /opt -zxf /opt/apache-tomcat-$TOMCAT_VERSION.tar.gz
check_return "Failed to uncompress apache-tomcat-$TOMCAT_VERSION.tar.gz! "
echo "Done."

useradd -r -m -d $CATALINA_HOME -s /bin/bash tomcat &>/dev/null
if [ $? -ne 0 ]; then
    info_echo "seems tomcat already exists, try to update user info."
    usermod -d $CATALINA_HOME -s /bin/bash tomcat &>/dev/null
fi
chown -R tomcat:tomcat $CATALINA_HOME 
check_return "Failed to set permission for $CATALINA_HOME"

# create sysconfig file
cat > /etc/sysconfig/tomcat << EOF
export TOMCAT_USER=tomcat
export CATALINA_HOME=$CATALINA_HOME

CATALINA_OPTS="\$CATALINA_OPTS -XX:-UseGCOverheadLimit -XX:PermSize=256m -XX:MaxPermSize=256m "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.port=6789 "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.host=127.0.0.1 "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.ssl=false "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.authenticate=true "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.access.file=\$CATALINA_HOME/conf/jmxremote.access "
CATALINA_OPTS=\$CATALINA_OPTS"-Dcom.sun.management.jmxremote.password.file=\$CATALINA_HOME/conf/jmxremote.passwd "
export CATALINA_OPTS

EOF

echo 'zabbix_check zabbix_check' > $CATALINA_HOME/conf/jmxremote.passwd
echo 'zabbix_check readonly' > $CATALINA_HOME/conf/jmxremote.access
chmod 600 $CATALINA_HOME/conf/jmxremote.*

# 
sed -i 's/echo "Tomcat started."//' $CATALINA_HOME/bin/catalina.sh

# init script 
cat > /etc/init.d/tomcat <<'EOF'
#! /bin/bash
# chkconfig: - 99 2
# Startup script for Tomcat Servlet Engine
#
# description: script to launch Tomcat on boot
#
. /etc/sysconfig/tomcat

SHUT_PORT=8005

RETVAL=0

# start, debug, stop, and status functions
start() {
    # Start Tomcat in normal mode
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
    if [ $SHUTDOWN_PORT -ne 0 ]; then
        echo "[ WARN ]:Tomcat is already started"
    else
        echo "Starting tomcat..."
        chown -R $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME
        chown -R $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME
        su  $TOMCAT_USER -c "$CATALINA_HOME/bin/startup.sh"
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        while [ $SHUTDOWN_PORT -eq 0 ]; do
            sleep 1
            SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        done    
        RETVAL=$?
        echo "Tomcat started: [ NORMAL ]"
        [ $RETVAL=0 ] && touch /var/lock/subsys/tomcat
    fi
}

debug() {
    # Start Tomcat in debug mode
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
    if [ $SHUTDOWN_PORT -ne 0 ]; then
        echo "[ WARN ] Tomcat is already started"
    else
        echo "Starting tomcat in debug mode..."
        chown -R $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME
        chown -R $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME
        su  $TOMCAT_USER -c "$CATALINA_HOME/bin/catalina.sh jpda start"
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        while [ $SHUTDOWN_PORT -eq 0 ]; do
            sleep 1
            SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        done    
        RETVAL=$?
        echo "Tomcat started: [ DEBUG ]"
        [ $RETVAL=0 ] && touch /var/lock/subsys/tomcat
    fi
}

stop() {
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
    if [ $SHUTDOWN_PORT -eq 0 ]; then
        echo "[ WARN ] Tomcat is not running"
    else
        echo "Stopping tomcat..."
        su  $TOMCAT_USER -c "$CATALINA_HOME/bin/shutdown.sh"
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        while [ $SHUTDOWN_PORT -ne 0 ]; do
            sleep 1
            SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
        done
    RETVAL=$?
        echo "Tomcat stopped"
        [ $RETVAL=0 ] && rm -f /var/lock/subsys/tomcat $CATALINA_HOME/bin/tomcat.pid
    fi
}

status() {
    SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep $SHUT_PORT|wc -l`
    if [ $SHUTDOWN_PORT -eq 0 ]; then
        echo "Tomcat stopped"
    else
        MODE="[ NORMAL ]"
        JPDA_PORT=`netstat -vatn|grep LISTEN|grep 8000|wc -l`
        if [ $JPDA_PORT -ne 0 ]; then
            MODE="[ DEBUG ]"
        fi
    echo "Tomcat running in $MODE mode"
    fi
}

case "$1" in
  start)
        start
       ;;
  debug)
        debug
       ;;
  stop)
        stop
       ;;
  restart)
        stop
        echo "-------------------------------------"
        sleep 2
        start
       ;;
  redebug)
        stop
        debug
       ;;
  status)
      status
   ;;
  *)
    echo "Usage: $0 {start|debug|stop|restart|redebug|status}"
    exit 1
esac

exit $RETVAL
EOF

chmod 755 /etc/init.d/tomcat
chkconfig tomcat on
/etc/init.d/tomcat restart

info_echo "Please change options in /etc/sysconfig/tomcat"
