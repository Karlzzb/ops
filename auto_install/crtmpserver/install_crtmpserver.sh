#!/bin/bash
# description: new server initialization script 
#

# functions
err_echo() {
    echo -e "\e[91m[Error]: $1 \033[0m"
    exit 1
}

info_echo() {
    echo -e "\e[92m[Info]: $1 \033[0m"
}

warn_echo() {
    echo -e "\e[93m[Warning]: $1 \033[0m"
}

if [ $EUID -ne 0 ]; then
    echo "please run this script as root user."
    exit 1
fi


if [ -f /etc/.server.init ]; then
    err_echo "You should not run init script on the same server twice."
fi

# disable SELINUX 
sed -i '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config

#!/bin/sh
# sysctl.conf
cat > /etc/sysctl.conf << EOF
# ADDED BY POST INSTALLATION SCRIPT

# Reboot a minute after an Oops
kernel.panic = 60

# Syncookies make SYN flood attacks ineffective
net.ipv4.tcp_syncookies = 1

# Ignore bad ICMP
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Disable ICMP Redirect Acceptance
net.ipv4.conf.all.accept_redirects = 0

# Enable IP spoofing protection, turn on source route verification
net.ipv4.conf.all.rp_filter = 0

# Log Spoofed Packets, Source Routed Packets, Redirect Packets
net.ipv4.conf.all.log_martians = 1

# Reply to ARPs only from correct interface (required for DSR load-balancers)
net.ipv4.conf.all.arp_announce = 2
net.ipv4.conf.all.arp_ignore = 1
fs.file-max = 2000000
fs.nr_open  = 2000000

net.ipv4.tcp_max_syn_backlog = 65536
net.core.netdev_max_backlog =  32768
net.core.somaxconn = 32768

net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216

net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 2

net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1

net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_max_orphans = 3276800

net.ipv4.ip_local_port_range = 1024  65535

net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_fin_timeout = 30

vm.swappiness = 0

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF

cat >> /etc/security/limits.conf << EOF
*           soft   nofile       65535
*           hard   nofile       65535
*           soft   nproc       32768
*           hard   nproc       32768
EOF

# useradd - A1n6e3RD 
useradd -p '$6$rwC5.JZY$pkWazQfxeQqQfmuupiyxJ2Yu9keMyKbx4z/qsHBK7NJiuqMKDPDRy9WA6FmMJh3/nJ9VLuM4lPC42fhWIJs7D.' wsadmin

# /etc/sudoers
echo "wsadmin     ALL=(ALL)    NOPASSWD: ALL" >> /etc/sudoers
sed -i 's/Defaults    requiretty/Defaults    !requiretty/' /etc/sudoers

# sshd
sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/#PrintMotd yes/PrintMotd no/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#AddressFamily any/AddressFamily inet/g' /etc/ssh/sshd_config
echo "AllowGroups wsadmin" >> /etc/ssh/sshd_config

# profile.d
cat > /etc/profile.d/z.sh << 'EOF'
# color manual
export LESS_TERMCAP_mb=$'\E[01;36m'  
export LESS_TERMCAP_md=$'\E[01;36m'  
export LESS_TERMCAP_me=$'\E[0m'  
export LESS_TERMCAP_se=$'\E[0m'  
export LESS_TERMCAP_so=$'\E[01;44;33m'  
export LESS_TERMCAP_ue=$'\E[0m'  
export LESS_TERMCAP_us=$'\E[01;33m'

# history
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=""
export HISTSIZE=50000

# alias
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias rm='rm -i'
alias grep='grep --color'

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 
unset MAILCHECK
EOF

for i in rpcbind rpcgssd nfslock netfs; do 
    chkconfig $i off 
done

#
/bin/rm -f /root/{anaconda-ks.cfg,install.log,install.log.syslog}

# repositories
/bin/touch /etc/.server.init

info_echo "Finished."



#!/bin/bash
# 
# description: install tomcat automatically
# 2014/09/28  Adam - init.

URL="http://50.117.12.9/source/crtmp0323.tar.gz"
GZ_FILE=/tmp/$(basename $URL)

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
    Usage: $0
    This script will install C++ RTMP Server (http://www.rtmpd.com) version 0.811 

    Options:
        -h | --help  Show this help 
    
EOF

    exit 1
}

check_return() {
  if [ $? -ne 0 ]; then
      err_echo "$1"
  fi
}

if [ "$1" == '-h' -o "$1" == "--help" ]; then
    show_usage
fi

if [ $EUID -ne 0 ]; then
    echo "please run this script as root user."
    exit 1
fi

cat >  /etc/yum.repos.d/ws_epel.repo << 'EOF' 
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=0

EOF

# install dependencies
if ! rpm --quiet -qi tinyxml-devel lua-devel; then
    info_echo "start to install tinyxml-devel lua-devel ..."
    yum install tinyxml-devel lua-devel -y
    check_return "failed to install tinyxml-devel lua-devel!"
fi

info_echo "Downloading C++ RTMP Server..."
wget -O /tmp/crtmpserver.tmp $URL
check_return "Failed to download C++ RTMP Server!"
/bin/mv /tmp/crtmpserver.tmp $GZ_FILE

echo "Uncompressing... "
tar -C / -zxvf $GZ_FILE 
check_return "Failed to uncompress $GZ_FILE" 


echo '/lib/crtmpserver/' >> /etc/ld.so.conf
/sbin/ldconfig


useradd -r -s /sbin/nologin crtmpserver &>/dev/null

chmod 755 /etc/init.d/crtmpserver
chkconfig --add crtmpserver
/etc/init.d/crtmpserver start
sleep 3
if [ $(netstat -ntlp | grep crtmpserver | wc -l) -lt 3 ]; then
    err_echo "Failed to start C++ RTMP Server!!!" 
else
    info_echo "C++ RTMP Server Started."
    netstat -ntlp | grep crtmpserver
fi
