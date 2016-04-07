#!/bin/sh

#editor Kerl 2014-9-28
#required soft
#mysql-5.6.21-linux-glibc2.5-x86_64.tar.gz
#my.cnf
#mysql
# changelog: 
# 2014/09/29 Adam - Add more checks.
# changelog: 
# 2014/09/29 kerl - Add monitor privileges.
# changelog: 
# 2014/10/16 kerl - Change data dir.

usage () {
    cat <<EOF
    Usage: $0 [OPTIONS]
      --instance-ports           Specific all instance's ports that need to be installed. 
      Multiple posts are separated by Commas. use as:--instance-ports=3306,3307,3308
    For single instance in the first time: oninstall_mysql5.6.sh --instance-ports=3306
EOF
    exit 1
}

parse_arguments() {
  for arg do
    # the parameter after "=", or the whole $arg if no match
    val=`echo "$arg" | sed -e 's;^--[^=]*=;;'`
    # what's before "=", or the whole $arg if no match
    optname=`echo "$arg" | sed -e 's/^\(--[^=]*\)=.*$/\1/'`
    # replace "_" by "-" ; mysqld_safe must accept "_" like mysqld does.
    optname_subst=`echo "$optname" | sed 's/_/-/g'`
    arg=`echo $arg | sed "s/^$optname/$optname_subst/"`
    case "$arg" in
      --instance-ports*) PORTSTR="$val" ;;
      --help) usage ;;
      *) usage ;;
    esac
  done
}

if [ $# -eq 0 ]; then
    usage
fi

MYSQL_VERSION="5.6.21"
BASE_PREFIX=/usr
MYDATA_PREFIX=/data/db
LOD_PREFIX=/data/dblogs
ROOTPWD="myadmin"
MYSQL_INIT="./mysql"
MYSQL_DEFAULT_CNF="./my.cnf"

parse_arguments "$@"
PORTS=(${PORTSTR//,/ })

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

# check current user.
if [ $EUID -ne 0 ]; then
    err_echo "please run this script as root user."
fi

if [ ! -x /usr/sbin/lsof ]; then
    warn_echo "Command /usr/sbin/lsof not found, running yum install lsof .."
    yum install lsof -y
    if [ $? -ne 0 ]; then
        err_echo "[ERROR]: Failed to install lsof" 
    fi
fi

if [ -f /etc/my.cnf ]; then
    err_echo "[ERROR]: /etc/my.cnf found, MySQL already installed?"
fi

info_echo "Installing MySQL from yum"
yum install libaio mysql-community-client-$MYSQL_VERSION mysql-community-server-$MYSQL_VERSION -y 
if [ $? -ne 0 ]; then
    err_echo "[ERROR]: Failed to install MySQL server."
fi

for port in ${PORTS[@]}
do
    MYSQL_SOCK="$MYDATA_PREFIX/mysql${port}/mysql${port}.sock"
    if [ -d "$MYDATA_PREFIX/mysql${port}/" ]; then
        echo "---------------------------------------"
        warn_echo "Directory $MYDATA_PREFIX/mysql${port} already exists, skipping instance on $port !!! "
        echo "---------------------------------------"
    else
        #(4)cfg mysql
        echo "###################################################"
        info_echo "Cfg MySQL($port)..."
        rm -f /etc/my.cnf
        mkdir -p $MYDATA_PREFIX/mysql${port}/data
        mkdir -p $MYDATA_PREFIX/mysql${port}/mysqltmp
        mkdir -p $LOD_PREFIX/mysql${port}/binlogs
	mkdir -p $LOD_PREFIX/mysql${port}/slowlogs
        mkdir -p $LOD_PREFIX/mysql${port}/relaylogs
        /bin/cp my.cnf $MYDATA_PREFIX/mysql${port}/
        /bin/cp mysql $MYDATA_PREFIX/mysql${port}/mysql
        chown -R mysql.mysql $MYDATA_PREFIX/mysql${port}
        chown -R mysql.mysql $LOD_PREFIX/mysql${port}
        
        info_echo "Creating MySQL config file ..."
        sed -i 's#{MY-PORT}#'${port}'#g' $MYDATA_PREFIX/mysql${port}/my.cnf
        sed -i 's#{DATA-PREFIX}#'$MYDATA_PREFIX/mysql${port}'#g' $MYDATA_PREFIX/mysql${port}/my.cnf
        sed -i 's#{BASE-PREFIX}#'${BASE_PREFIX}'#g' $MYDATA_PREFIX/mysql${port}/my.cnf
        sed -i 's#{LOG-PREFIX}#'${LOD_PREFIX}'#g' $MYDATA_PREFIX/mysql${port}/my.cnf
        
        sed -i 's#{MYCNF-DIR}#'$MYDATA_PREFIX/mysql${port}/my.cnf'#g' $MYDATA_PREFIX/mysql${port}/mysql
        sed -i 's#{BIN-DIR}#'$BASE_PREFIX/bin'#g' $MYDATA_PREFIX/mysql${port}/mysql
        sed -i 's#{PID-DIR}#'${LOD_PREFIX}/mysql${port}/mysql.pid'#g' $MYDATA_PREFIX/mysql${port}/mysql
        /bin/cp -rf $MYDATA_PREFIX/mysql${port}/mysql /etc/init.d/mysql${port}
		/bin/rm -rf $MYDATA_PREFIX/mysql${port}/mysql

        # remove init from rpm 
        /bin/rm -f /etc/init.d/mysqld

        # create our own init script 
        chmod 700 /etc/init.d/mysql${port}
		/sbin/chkconfig mysql${port} on
        
        find $MYDATA_PREFIX/mysql${port} -name mysql -exec chmod 700 {} \;

        if ! grep -qw mysql${port} /etc/profile; then 
            echo alias mysql${port}=\"/usr/bin/mysql --defaults-file=$MYDATA_PREFIX/mysql${port}/my.cnf\" >> /etc/profile
        fi
        
        info_echo "Initialize MySQL..."
        $BASE_PREFIX/bin/mysql_install_db --defaults-file=$MYDATA_PREFIX/mysql${port}/my.cnf --user=mysql --explicit_defaults_for_timestamp >/dev/null 
        if [ $? -ne 0 ]; then
            warn_echo "Failed to initialize MySQL data directory. Port: $port" 
            break 
        fi

        #(5)start mysql 
        info_echo "Starting MySQL on $port .... "
        
        /etc/init.d/mysql${port} start
        if [ $? -ne 0 ]; then
            warn_echo "MySQL failed to start on $port" 
            break
        fi
		
	/sbin/chkconfig add mysql${port}

        #(6)mysql privileges cfg
        info_echo "Cfg MySQL($port) Privileges"
        /usr/sbin/lsof -i :${port} &>/dev/null && mysqladmin -u root password "$ROOTPWD" -S $MYSQL_SOCK >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            warn_echo "Failed to set MySQL root password! Please do it manually."
            break
        fi

        mysql -uroot -p$ROOTPWD -S $MYSQL_SOCK -Bse "SELECT concat(version(),' started in ${port} port')" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            info_echo "Connected to port $port successful."
        else
            warn_echo "Failed to connect to port $port! You need to create MySQL monitoring user manually."
        fi
        
        info_echo "Creating MySQL monitoring user..."
        mysql -uroot -p$ROOTPWD -S $MYSQL_SOCK -Bse "GRANT PROCESS,REPLICATION CLIENT ON *.* TO 'monitoring'@'127.0.0.1 identified by '8e3d7855e5681ee463e28394c2bb33043e65dbb9';FLUSH PRIVILEGES;" 2>/dev/null
		
	#(7)mysql privileges cfg
	info_echo "Install rpl_semi_sync on $port .... "
        mysql -uroot -p$ROOTPWD -S $MYSQL_SOCK -e "INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so';" 2>/dev/null
        if [ $? -ne 0 ]; then
            warn_echo "Install rpl_semi_sync failed on $port" 
            break
        fi		
    fi
done

info_echo "Running MySQL instances:"
netstat -ntlp | grep mysqld 
info_echo "Please run command: source /etc/profile"
