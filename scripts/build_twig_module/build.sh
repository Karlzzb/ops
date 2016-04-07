#!/bin/bash

#wget https://github.com/fabpot/Twig/archive/v1.16.0.tar.gz
#cd Twig-1.16.0/ext/twig/
#phpize 
#./configure
#make
#make test
#make install

VERSION="1.16"
TWIG_VERSION="php-twig-$VERSION"

DATE=$(date +%Y%m%d%S)

BUILD_HOME="/root/rpmbuild"
BUILD="$BUILD_HOME/BUILD/"
BUILD_ROOT="$BUILD_HOME/BUILDROOT"
SPEC_FILE="/tmp/php-twig_$DATE.spec"

check_return() {
    if [ $? -ne 0 ]; then
        echo "Failed"
        exit 1
    fi
}

tar -czvf $BUILD_HOME/SOURCES/$TWIG_VERSION.tar.gz /usr/lib64/php/modules/twig.so 

mkdir -p $BUILD_HOME/BUILDROOT/${TWIG_VERSION}-1.el6.x86_64/usr/lib64/php/modules/
mkdir -p $BUILD_HOME/BUILDROOT/${TWIG_VERSION}-1.el6.x86_64/etc/php.d/

cp /usr/lib64/php/modules/twig.so $BUILD_HOME/BUILDROOT/${TWIG_VERSION}-1.el6.x86_64/usr/lib64/php/modules/
echo extension=twig.so > $BUILD_HOME/BUILDROOT/${TWIG_VERSION}-1.el6.x86_64/etc/php.d/twig.ini 

cat > $SPEC_FILE << EOF
Name:     php-twig 
Version:  $VERSION 
Release:  1%{?dist} 
Summary:  Twig is a template language for PHP, 
Group:    System Environment/Deamons
License:  BSDv3
Url:      https://github.com/fabpot/Twig 
Packager: www.sex8.cc 
Source:   %{name}-%{version}.tar.gz
BuildRoot:%{_tmppath}/%{name}-%{version}-%{release}-root
Prefix:   %{_prefix}
Prefix:   %{_sysconfdir}

%description
Twig uses a syntax similar to the Django and Jinja template languages which inspired the Twig runtime environment.

%clean
rm -rf $RPM_BUILD_ROOT
rm -rf $RPM_BUILD_DIR/%{name}-%{version}

%files
%defattr(-,root,root)
/usr/lib64/php/modules/twig.so
/etc/php.d/twig.ini


EOF

rpmbuild -ba $SPEC_FILE
rm -f $SPEC_FILE
