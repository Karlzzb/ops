#!/bin/bash

TEMP=`getopt -o hd:k:l:n:o:r:v:V:w:W: --long help,disk-size:,ks-file:,location:,name:,os-variant:,ram:,vcpus:,volgroup:,network1:,network2: \
     -n '$0' -- "$@"`

if [ $? != 0 ] ; then
    echo "Terminating..." >&2
    exit 1
fi

eval set -- "$TEMP"

#KS_CFG="http://192.168.10.253/centos_6.5_kvm_guest.cfg"
KS_CFG="http://192.168.10.200/kickstart/"
#LOCATION="http://192.168.10.253/CentOS6.5/"
LOCATION="http://192.168.10.201/centos/6/os/x86_64"

# default vcpu number
DEFAULT_VCPUS=1

# default memory in megabytes. m/M/g/G are not allowed 
DEFAULT_RAM=512

# default disk size for virtual server in gigabytes 
DEFAULT_DISK_SIZE="30"

# default Volume Group to be used to create virtual server's LV.
DEFAULT_VG="mainvg"

# default is rhel6
DEFAULT_OS_VARIANT="rhel6"

#
MAX_VCPU=$(grep vendor_id /proc/cpuinfo | wc -l)

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

show_help() {
cat << EOF
Usage: $0 OPTIONS 

OPTIONS:
    -h | --help                show this help.
    -d | --disk-size           disk size of the virutal server in 'gigabytes'. default is '${DEFAULT_DISK_SIZE}'. no units (m/M/g/G) are allowed. 
    -n | --name                Host name of the virtual server.
    -o | --os-variant          rhel5.4 / rhel6 / rhel7. default is rhel6. 
    -r | --ram                 Memory of the virtual server in 'megabytes'. default is '${DEFAULT_RAM}'. no units (m/M/g/G) are allowed.
    -w | --network1            Internal network setting for the virtual server. format: BRIDGE:DEVICE:BOOTPROTO:IPADDR:GATEWAY:NETMASK
    -W | --network2            Public network setting for the virtual server.   format: BRIDGE:DEVICE:BOOTPROTO:IPADDR:GATEWAY:NETWORK
    -v | --vcpus               Vcpu numbers of the virtual server. default is '$DEFAULT_VCPUS'. 
    -V | --volgroup            Volume Group name. default is '$DEFAULT_VG'.
EOF

exit 1
}

while true ; do
    case "$1" in
        -h | --help)                show_help ; exit 1;;
        -d | --disk-size)           DISK_SIZE="$2" ; shift 2 ;; 
        -n | --name)                SERVER_NAME="$2" ; shift 2 ;;
        -o | --os-variant)          OS_VARIANT="$2" ; shift 2 ;;
        -r | --ram)                 RAM="$2" ; shift 2 ;;
        -v | --vcpus)               VCPUS="$2" ; shift 2 ;;
        -V | --volgroup)            VOL_GROUP="$2" ; shift 2 ;;
        -w | --network1)    NETWORK1="$2" ; shift 2 ;;
        -W | --network2)      NETWORK2="$2" ; shift 2 ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# ensure script is runing as root
if [ $EUID -ne 0 ]; then
    err_echo " Please run this script as 'root' user."
fi

# check server name
echo "*** Checking server name ..."
if [ -z "$SERVER_NAME" ]; then
    err_echo " --name option is required."
elif [ "$(/usr/bin/virsh list --all | grep -w "$SERVER_NAME" | wc -l)" -eq 1 ]; then
    /usr/bin/virsh list --all
    err_echo " $SERVER_NAME already created."
fi 
info_echo "OK"

# check KVM support
echo "*** Checking KVM support ..."
if [ $(/sbin/sysctl -a | awk '/net.ipv4.ip_forward/ {print $NF}') -ne 1 ]; then
    err_echo "ip forward is disabled"
fi

if [ $(grep -Ei 'vmx|svm' /proc/cpuinfo | wc -l) -eq 0 ]; then
    err_echo "KVM not supported by your CPU."
fi

if [ $(/sbin/lsmod | grep -E 'kvm_intel|kvm_amd' | wc -l) -eq 0 ]; then
    err_echo "Failed to load KVM intel|amd module."
fi

if [ $(/bin/dmesg | grep 'kvm: disabled by bios' | wc -l) -ne 0 ]; then
    err_echo "kvm is disabled by bios"
fi
info_echo "OK"

# check volume group
echo "*** Checking Volume Group ..."
if [ -z "$VOL_GROUP" ]; then
    VOL_GROUP="$DEFAULT_VG"
elif ! /sbin/vgs $VOL_GROUP &>/dev/null; then
    err_echo "Can't find Volume Group '$VOL_GROUP'." 
fi
info_echo "OK"

# check logical volume
echo "*** Checking Logical Volume ..."
if /sbin/lvs /dev/$VOL_GROUP/$SERVER_NAME &>/dev/null; then
    err_echo "/dev/$VOL_GROUP/$SERVER_NAME already created."
fi
info_echo "OK"

# check disk size
echo "*** Checking disk space ..."
if [ -z "$DISK_SIZE" ]; then
    DISK_SIZE="$DEFAULT_DISK_SIZE"
elif [[ "$DISK_SIZE" =~ ^[0-9]+$ ]]; then
    FREE_DISK=$(/sbin/vgs --noheadings --nosuffix --units g mainvg 2>/dev/null | awk '{print $NF}')
    if [ "$(echo "$DISK_SIZE > $FREE_DISK " | /usr/bin/bc)" == "1" ]; then 
        err_echo "No enough disk space. Only '$FREE_DISK'g free, but '$DISK_SIZE'g required."
    elif [ $DISK_SIZE -lt $DEFAULT_DISK_SIZE ]; then
        err_echo "Disk allocated is too small, at least '$DEFAULT_DISK_SIZE'g required."
    fi 
else
    err_echo "Invalid disk size: '$DISK_SIZE'." 
fi
info_echo "OK"

# check vcpu
echo "*** Checking vcpus ..."
if [ -z "$VCPUS" ]; then
    VCPUS="$DEFAULT_VCPUS"
elif [[ "$VCPUS" =~ ^[0-9]+$ ]]; then
    if [ $MAX_VCPU -lt $VCPUS ]; then
        err_echo "Number of virtual cpus is set too large."
    fi
else
    err_echo "Invalid vcpus number: '$VCPUS'." 
fi 
info_echo "OK"

# check memory
echo "*** Checking memory ..."
if [ -z "$RAM" ]; then
    RAM="$DEFAULT_RAM"
elif [[ "$RAM" =~ ^[0-9]+$ ]]; then
    FREE_RAM=$(/usr/bin/free -m | awk '/buffers\/cache/{print $NF}')
    if [ "$(echo "$RAM * 1.1 > $FREE_RAM " | /usr/bin/bc)" == "1" ]; then
        err_echo "No enough memory. Only '$FREE_RAM'm free, '$RAM'm required."
    elif [ $RAM -lt $DEFAULT_RAM ]; then
        err_echo "Memory allocated is too small, at least '$DEFAULT_RAM'm required."
    fi
else
    err_echo "Invalid memory size: '$RAM'."
fi
info_echo "OK"

# check os variant
echo "*** Checking os variant ..."
if [ -z "$OS_VARIANT" ]; then
    OS_VARIANT=$DEFAULT_OS_VARIANT 
elif [[ "$OS_VARIANT" =~ ^(rhel5.4|rhel6|rhel7)$ ]]; then
    : 
else
    err_echo "Invalid os variant. Only rhel5.4/rhel6/rhel7 are supported."
fi
info_echo "OK"

# check network setting
# NETWORK_READY --  1, means auto or dhcp ;  2, means static IP address.
if [ -z "$NETWORK1" -a -z "$NETWORK2" ]; then
    err_echo "No network interfaces configured."
fi 

NETWORK1_READY=0
NETWORK2_READY=0

if [ -n "$NETWORK1" ]; then
    BRIDGE1=$(echo "$NETWORK1" | awk -F: '{print $1}') 
    DEVICE1=$(echo "$NETWORK1" | awk -F: '{print $2}') 
    BOOTPROTO1=$(echo "$NETWORK1" | awk -F: '{print $3}')
    IPADDR1=$(echo "$NETWORK1" | awk -F: '{print $4}')
    GATEWAY1=$(echo "$NETWORK1" | awk -F: '{print $5}')
    NETMASK1=$(echo "$NETWORK1" | awk -F: '{print $6}')

    if [ $(/usr/sbin/brctl show | grep -w $BRIDGE1 |wc -l) -eq 0 ];then
       err_echo "Invalid bridge: $BRIDGE1" 
    fi

    if [ -z "$DEVICE1" ]; then
        err_echo "Please specify DEVICE for internal network."
    fi

    if /bin/ping -w3  -c2 $IPADDR1 &>/dev/null; then
        err_echo "$IPADDR1 already used by other hosts."
    fi
    
    if [ "$BOOTPROTO1" == "none" -o "$BOOTPROTO1" == "dhcp" ]; then
        NETWORK1_READY=1
    elif [ "$BOOTPROTO1" == "static" ]; then
        if [ -z "$IPADDR1" -o -z "$GATEWAY1" -o -z "$NETMASK1" ]; then
            err_echo "$DEVICE1 - IPADDR/GATEWAY/NETMASK can't be empty" 
        fi
        NETWORK1_READY=2
    else
        err_echo "$DEVICE1 - Invalid BOOTPROTO,only none/static/dhcp are allowed."
    fi
fi

if [ -n "$NETWORK2" ]; then
    BRIDGE2=$(echo "$NETWORK2" | awk -F: '{print $1}') 
    DEVICE2=$(echo "$NETWORK2" | awk -F: '{print $2}') 
    BOOTPROTO2=$(echo "$NETWORK2" | awk -F: '{print $3}')
    IPADDR2=$(echo "$NETWORK2" | awk -F: '{print $4}')
    GATEWAY2=$(echo "$NETWORK2" | awk -F: '{print $5}')
    NETMASK2=$(echo "$NETWORK2" | awk -F: '{print $6}')

    if [ $(/usr/sbin/brctl show | grep -w $BRIDGE2 |wc -l) -eq 0 ];then
       err_echo "Invalid bridge: $BRIDGE2" 
    fi

    if [ -z "$DEVICE2" ]; then
        err_echo "Please specify DEVICE for public network."
    fi

    if /bin/ping -w3  -c2 $IPADDR2 &>/dev/null ; then
        err_echo "$IPADDR2 already used by other hosts."
    fi
    
    if [ "$BOOTPROTO2" == "none" -o "$BOOTPROTO2" == "dhcp" ]; then
        NETWORK2_READY=1
    elif [ "$BOOTPROTO2" == "static" ]; then
        if [ -z "$IPADDR2" -o -z "$GATEWAY2" -o -z "$NETMASK2" ]; then
            err_echo "$DEVICE2 - IPADDR/GATEWAY/NETMASK can't be empty" 
        fi
        NETWORK2_READY=2
    else
        err_echo "$DEVICE2 - Invalid BOOTPROTO,only none/static/dhcp are allowed."
    fi
fi

info_echo "OK"


# checking kickstart file
echo "*** Checking kickstart file ..."

if [ "$NETWORK1_READY" == "0" -a "$NETWORK2_READY" == "0" ]; then
    # internal: no, public: no 
    NETWORK_TYPE=1
elif [ "$NETWORK1_READY" == "0" -a "$NETWORK2_READY" == "1" ]; then
    # internal: no, public: dhcp/none 
    NETWORK_TYPE=2
elif [ "$NETWORK1_READY" == "0" -a "$NETWORK2_READY" == "2" ]; then
    # internal: no, public: static 
    NETWORK_TYPE=3
elif [ "$NETWORK1_READY" == "1" -a "$NETWORK2_READY" == "0" ]; then
    # internal: dhcp/none, public: no 
    NETWORK_TYPE=4
elif [ "$NETWORK1_READY" == "1" -a "$NETWORK2_READY" == "1" ]; then
    # internal: dhcp/none, public: dhcp/none 
    NETWORK_TYPE=5
elif [ "$NETWORK1_READY" == "1" -a "$NETWORK2_READY" == "2" ]; then
    # internal: dhcp/none, public: static 
    NETWORK_TYPE=6
elif [ "$NETWORK1_READY" == "2" -a "$NETWORK2_READY" == "0" ]; then
    # internal: static, public: no 
    NETWORK_TYPE=7
elif [ "$NETWORK1_READY" == "2" -a "$NETWORK2_READY" == "1" ]; then
    # internal: static, public: dhcp/none 
    NETWORK_TYPE=8
elif [ "$NETWORK1_READY" == "2" -a "$NETWORK2_READY" == "2" ]; then
    # internal: static, public: static 
    NETWORK_TYPE=9
else
    err_echo "Bad network settting, please check."
fi

case $NETWORK_TYPE in
    1)
        err_echo "At least one interface should be correctly configured."    
    ;;
    2)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device2=$DEVICE2&bootproto2=$BOOTPROTO2"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE2,model=virtio"
    ;;
    3)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device2=$DEVICE2&bootproto2=$BOOTPROTO2&ipaddr2=$IPADDR2&gateway2=$GATEWAY2&netmask2=$NETMASK2"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE2,model=virtio"
    ;;
    4)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio"
    ;;
    5)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1&device2=$DEVICE2&bootproto2=$BOOTPROTO2"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio --network bridge=$BRIDGE2,model=virtio"
    ;;
    6)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1&device2=$DEVICE2&bootproto2=$BOOTPROTO2&ipaddr2=$IPADDR2&gateway2=$GATEWAY2&netmask2=$NETMASK2" 
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio --network bridge=$BRIDGE2,model=virtio"
    ;;
    7)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1&ipaddr1=$IPADDR1&gateway1=$GATEWAY1&netmask1=$NETMASK1"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio"
    ;;
    8)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1&ipaddr1=$IPADDR1&gateway1=$GATEWAY1&netmask1=$NETMASK1&device2=$DEVICE2&bootproto2=$BOOTPROTO2"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio --network bridge=$BRIDGE2,model=virtio"
    ;;
    9)
      KS_CFG="$KS_CFG?hostname=$SERVER_NAME&device1=$DEVICE1&bootproto1=$BOOTPROTO1&ipaddr1=$IPADDR1&gateway1=$GATEWAY1&netmask1=$NETMASK1&device2=$DEVICE2&bootproto2=$BOOTPROTO2&ipaddr2=$IPADDR2&gateway2=$GATEWAY2&netmask2=$NETMASK2"
      VIRT_NETWORK_CONF="--network bridge=$BRIDGE1,model=virtio --network bridge=$BRIDGE2,model=virtio"
    ;;
    *)
      echo "You said something weird..."
    ;;
esac


# 

/usr/bin/wget -q -O - $KS_CFG 2>/dev/null | grep "^network" 
if [ $(/usr/bin/wget -q -O - $KS_CFG 2>/dev/null | grep "^network" | wc -l) -eq 0 ]; then
    err_echo "Failed to download kickstart file: $KS_CFG"
fi

info_echo "OK"
 

# START
cat << EOF
###########################################################################
#  * Start to Install $SERVER_NAME
#  * Time: $(date "+%Y/%m/%d %H:%M:%S")
###########################################################################
EOF

echo "*** Creating Logical Volume: /dev/$VOL_GROUP/$SERVER_NAME  ..."
/sbin/lvcreate -n $SERVER_NAME -L ${DISK_SIZE}g $VOL_GROUP
if [ $? -ne 0 ]; then
    err_echo  "Failed to create /dev/$VOL_GROUP/$SERVER_NAME"
fi

echo "*** Generating VM ..."
sleep 3

virt-install \
--name $SERVER_NAME \
--ram $RAM \
--cpu host \
--vcpus $VCPUS,maxvcpus=$MAX_VCPU \
--os-type=linux \
--os-variant=$OS_VARIANT \
--extra-args="ks=$KS_CFG text console=tty0 utf8 console=ttyS0,115200 edd=off" \
--disk path=/dev/$VOL_GROUP/$SERVER_NAME \
--location $LOCATION $VIRT_NETWORK_CONF

