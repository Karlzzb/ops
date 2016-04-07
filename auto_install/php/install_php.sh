#!/bin/bash
# auto install php-fpm 
# 

DEFAULT_PHP_VERSION="5.5.20"
PHP_INI="/etc/php.ini"
FPM_CONF="/etc/php-fpm.d/www.conf"

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

check_return() {
  if [ $? -ne 0 ]; then
      err_echo "$1"
  fi
}

show_usage() {
    echo " $0 [php-version]
        -h | --help     Show this help
" 
}

# make sure script is runing as root
if [ $EUID -ne 0 ]; then
    err_echo " Please run this script as 'root' user."
fi


if [ "$1" == '-h' -o "$1" == "--help" ]; then
    show_usage
fi

if [ $# -eq 0 ]; then
    PHP_VERSION="$DEFAULT_PHP_VERSION"
else
    PHP_VERSION="$1"
fi 

if ! rpm --quiet -qi nginx; then
    err_echo "please install nginx first."
fi

if [ -f /etc/php-fpm.conf ]; then
    err_echo "PHP-FPM already installed."
fi

info_echo "Start to install php-fpm and modules ..."
yum install -y php-fpm-$PHP_VERSION \
php-gd-$PHP_VERSION \
php-mbstring-$PHP_VERSION \
php-mcrypt-$PHP_VERSION \
php-mysqlnd-$PHP_VERSION \
php-opcache-$PHP_VERSION \
php-pdo-$PHP_VERSION \
php-soap-$PHP_VERSION \
php-xml-$PHP_VERSION \
php-xmlrpc-$PHP_VERSION \
php-pecl-apcu \
php-pecl-memcache \
php-pecl-mongo \
php-pecl-redis-2.2.5 \
php-pecl-xhprof \
php-twig

check_return "Failed to install php-fpm"

info_echo "Start to config $PHP_INI ..."
sed -i 's/^;default_charset/default_charset/' $PHP_INI

sed -i '/^expose_php/cexpose_php = Off' $PHP_INI 
sed -i '/^max_execution_time/cmax_execution_time = 600' $PHP_INI
sed -i '/^max_input_time/cmax_input_time = 600' $PHP_INI
sed -i '/^memory_limit/cmemory_limit = 256M'  $PHP_INI
sed -i '/^post_max_size/cpost_max_size = 32M' $PHP_INI
sed -i '/^upload_max_filesize/cupload_max_filesize = 300M' $PHP_INI
sed -i '/^max_file_uploads/cmax_file_uploads = 30' $PHP_INI
sed -i '/^;date.timezone/cdate.timezone = "Asia/Shanghai"'  $PHP_INI
sed -i '/^disable_functions/cdisable_functions = exec,system,passthru,shell_exec,escapeshellarg,escapeshellcmd,proc_close,proc_open,dl,popen,show_source syslog,readlink,symlink,popepassthru,stream_socket_server'  $PHP_INI
info_echo "done"

info_echo "Start to config $FPM_CONF ..."
sed -i 's/apache/nginx/g' $FPM_CONF
sed -i '/^pm = dynamic/cpm = static' $FPM_CONF
sed -i '/^pm.max_children/cpm.max_children = 50' $FPM_CONF
sed -i '/^;pm.status_path/cpm.status_path = /php-fpm_status' $FPM_CONF
sed -i '/^;request_terminate_timeout/crequest_terminate_timeout=600' $FPM_CONF
sed -i '/^;request_slowlog_timeout/crequest_slowlog_timeout=3' $FPM_CONF 
info_echo "done"

chown nginx. /var/lib/php/ -R &>/dev/null


if [ -f /etc/php-zts.d/opcache.ini ]; then
    sed -i '/^opcache.memory_consumption/copcache.memory_consumption=512' /etc/php-zts.d/opcache.ini
fi

info_echo "Checking php-fpm configuration file..."
/etc/init.d/php-fpm configtest

check_return "PHP-FPM configuration syntax error"

chkconfig php-fpm on
info_echo "Starting PHP-FPM ..."
/etc/init.d/php-fpm restart
