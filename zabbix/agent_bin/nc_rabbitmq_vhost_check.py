#!/usr/bin/python

import os
import sys
import simplejson

tmp_file="/home/zabbix/tmp/zabbix.json"
rabbitmqadmin="/usr/sbin/rabbitmqadmin"
cmd=rabbitmqadmin + " list vhosts -f pretty_json > " + tmp_file

# error code
error_data="-0.0091"
error_option="-0.0092"
error_permission="-0.0093"
error_ip_port="-0.0094"
error_binary="-0.0095"
error_user_pass="-0.0096"
error_no_module="-0.0097"

# need one argument
if len(sys.argv) < 3:
    print error_option
    sys.exit(1)

vhost=sys.argv[1]
k1=sys.argv[2]
k2=''
k3=''
try:
    k2=sys.argv[3]
    k3=sys.argv[4]
except:
    pass 

# check binary
if not os.path.isfile(rabbitmqadmin):
    print error_binary 
    sys.exit(1)

# should run this script as zabbix user
current_user=os.popen('whoami').readline().strip();
if current_user != "zabbix": 
    print "Please run this script as 'zabbix' user."
    sys.exit(1)

try:
    filehandle = open(tmp_file, 'w' )
except:
    print error_permission
    sys.exit(1)
     

os.system(cmd)

fd = open(tmp_file)
try:
    data = simplejson.load(fd)
except Exception,e:
    #print e
    print error_no_module 
    sys.exit(1)

i = 0 
while i < len(data): 
    #print data[i]['name']
    if data[i]['name'] == vhost:
        if not k2:
            print data[i][k1]
        elif not k3:
            #print str(i) + k1 + k2 + k3
            print data[i][k1][k2]
        else:
            print data[i][k1][k2][k3]
        sys.exit(0)
    i = i + 1 

#{'recv_oct': 617444, 'name': '/', 'send_oct_details': {'rate': 0.0}, 'send_oct': 1094, 'messages_details': {'rate': 0.0}, 'messages': 18526, 'recv_oct_details': {'rate': 0.0}, 'message_stats': {'publish_details': {'rate': 0.0}, 'publish': 9635}, 'messages_unacknowledged_details': {'rate': 0.0}, 'tracing': False, 'messages_ready_details': {'rate': 0.0}, 'messages_unacknowledged': 0, 'messages_ready': 18526}
