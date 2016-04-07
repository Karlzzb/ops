## install
yum install -y tomcat6 tomcat6-webapps tomcat6-admin-webapps

## add to init scripts
/sbin/chkconfig tomcat6 on
/sbin/service tomcat6 start


## config


## reference link: http://www.oracle-base.com/articles/linux/apache-tomcat-installation-on-linux.php
