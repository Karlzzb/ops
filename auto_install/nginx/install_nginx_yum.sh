#!/bin/bash
#
# nginx auto install
#
#  - enable our repo first.
# 

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

check_return() {
  if [ $? -ne 0 ]; then
      err_echo "$1"
  fi
}

if [ -x /usr/sbin/nginx ]; then
    err_echo "nginx already installed"
fi

##install
/usr/bin/yum install -y nginx-1.6.2 
if [ $? -ne 0 ]; then
    err_echo "failed to install nginx"    
    exit 1
fi

##add to service
/sbin/chkconfig nginx on

##config
NPROC=$(/usr/bin/nproc)

cat > /etc/nginx/nginx.conf << EOF
user nginx; 
worker_processes  $NPROC;
worker_rlimit_nofile 102400;

pid        /var/run/nginx.pid;
error_log  /var/log/nginx/error.log warn;

events {
    worker_connections  65535;
    use epoll;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    charset  utf-8;

    access_log off;
    log_not_found off;

    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
            '\$status \$body_bytes_sent "\$http_referer" '
            '"\$http_user_agent" "\$http_x_forwarded_for"';

    server_names_hash_bucket_size 128;
    client_header_buffer_size 64k;
    large_client_header_buffers 4 64k;
    client_max_body_size 300m;
    types_hash_max_size 2048;
    types_hash_bucket_size 64;

    gzip on;
    gzip_min_length  1024;
    gzip_buffers     4 16k;
    gzip_http_version 1.0;
    gzip_comp_level 2;
    gzip_types  application/json application/javascript application/x-javascript application/rss+xml application/xhtml+xml application/xml text/css text/javascript text/plain text/xml;
    gzip_vary on;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";

    sendfile       on;
    tcp_nopush     on;
    tcp_nodelay    on;

    fastcgi_connect_timeout 60;
    fastcgi_send_timeout 300;
    fastcgi_read_timeout 300;
    fastcgi_buffers 8 64k;
    fastcgi_busy_buffers_size 384k;

    error_page 403 = http://www.google.com;

    #more_set_headers 'Server: GFE/2.0';
    #more_set_headers 'X-Powered-By: Lua 5.3.0';

    keepalive_timeout  10;

    include  conf.d/*.conf;
} 

EOF


cat > /etc/nginx/conf.d/monitoring.conf << 'EOF' 
server {
    listen 127.0.0.1:81;

    access_log off;

    location /nginx_status {
        stub_status on;
    }

    location ~ ^/(php-fpm_status|php-fpm_ping)$ {
        include fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_param SCRIPT_FILENAME $fastcgi_script_name;
    }
}

EOF

info_echo "Checking nginx configuration file..."

/usr/sbin/nginx -t
check_return "Invalid nginx config file."

/etc/init.d/nginx restart 
check_return "failed to start nginx" 
info_echo "Done"
