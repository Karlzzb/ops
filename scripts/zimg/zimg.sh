#!/bin/bash
# 
# libmemcached-last-libs
# libevent-last 

if [ -n "$1" ]; then
    VERSION="$1"
else
    VERSION="3.1.0"
fi

ZIMG_VERSION="zimg-$VERSION"

DATE=$(date +%Y%m%d%S)

BUILD_HOME="/root/rpmbuild"
BUILD="$BUILD_HOME/BUILD/"
BUILD_ROOT="$BUILD_HOME/BUILDROOT"
SPEC_FILE="/tmp/zimg_$DATE.spec"
ZIMG_PATH="/opt/zimg/"

check_return() {
    if [ $? -ne 0 ]; then
        echo "Failed"
        exit 1
    fi
}

if [ -d "/opt/app/$ZIMG_VERSION" ]; then
    echo "/opt/app/$ZIMG_VERSION already exists".
    exit 1
fi

mkdir -p /opt/app/$ZIMG_VERSION

tar -C /opt/app/$ZIMG_VERSION -zxvf $ZIMG_VERSION.tar.gz 
check_return

cd /opt/app/$ZIMG_VERSION
make
check_return

rm -rf $BUILDROOT/${ZIMG_VERSION}-1.el6.x86_64/
mkdir -p $BUILD_ROOT/$ZIMG_VERSION-1.el6.x86_64/$ZIMG_PATH
check_return

mv /opt/app/$ZIMG_VERSION/bin/*  $BUILD_HOME/BUILDROOT/${ZIMG_VERSION}-1.el6.x86_64/$ZIMG_PATH

cat > $SPEC_FILE << EOF
Name:     zimg
Version:  $VERSION 
Release:  1%{?dist} 
Summary:  zimg - A lightweight and high performance image storage and processing system.
Group:    System Environment/Deamons
License:  BSDv3
Url:      http://zimg.buaa.us
Packager: zp@buaa.us
Source:   %{name}-%{version}.tar.gz
BuildRoot:%{_tmppath}/%{name}-%{version}-%{release}-root
Prefix:   %{_prefix}
Prefix:   %{_sysconfdir}
%define   zimgpath $ZIMG_PATH 


%description
Project zimg's rpm suite.

%clean
rm -rf $RPM_BUILD_ROOT
rm -rf $RPM_BUILD_DIR/%{name}-%{version}

%files
%defattr(-,root,root)
/opt/zimg/

EOF

rpmbuild -ba $SPEC_FILE
rm -f $SPEC_FILE
