#/bin/bash
#dezill@weststarinc.co
#install java jdk 7/8 from self hosted rpm
#
# changelog
# 09/28  add env - adam

JAVA7="jdk.x86_64"
JAVA8="jdk1.8.0_20"

LOG_FILE=/tmp/java_install.log

function check_return() {
    if [ $? -ne 0 ]; then
        echo "$(date) - Failed to install java" 
    else
        echo "$(date) - Done."
    fi  
}

function install_java7 {
    if rpm --quiet -qi $JAVA7 ; then
        echo "Java 7 already installed."
        exit 0
    fi
    /usr/bin/yum install -y $JAVA7
    check_return
    MY_JAVA_HOME=$(dirname $(dirname $(rpm -ql $JAVA7 | grep -w '/usr/java/.*[0-9]/bin/java$')))
    MY_JAVA_LIB=$(dirname $(rpm -ql $JAVA7 | grep '/tools.jar'))
}

function install_java8 {
    if rpm --quiet -qi $JAVA8 ; then
        echo "Java 8 already installed."
        exit 0
    fi
    yum install -y $JAVA8
    check_return
    MY_JAVA_HOME=$(dirname $(dirname $(rpm -ql $JAVA8 | grep -w '/usr/java/.*[0-9]/bin/java$')))
    MY_JAVA_LIB=$(dirname $(rpm -ql $JAVA8 | grep '/tools.jar'))
}

if [ $EUID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

if [ "$1" == '' ]; then
    echo "please specify java version you want to install: 7/8"
    exit 1
elif [ "$1" == '7' ]; then
    install_java7
elif [ "$1" == '8' ]; then
    install_java8
fi

# setting varaibles
cat > /etc/profile.d/java.sh << EOF
export JAVA_HOME=$MY_JAVA_HOME
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar:./classes:./lib:$MY_JAVA_LIB
export PATH=$MY_JAVA_HOME/bin:\$PATH
EOF
echo
echo "[INFO]: Please run command: source /etc/profile.d/java.sh"
