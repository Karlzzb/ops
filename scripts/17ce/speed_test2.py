#!/usr/bin/python
# -*- coding:utf-8 -*-
#
# this script is used to work with zabbix monitoring.
# get IDC name,speed,http code, dns time,etc
# 
from __future__ import division
import re
import simplejson; 
import os
import sys
# set default encoding UTF-8
reload(sys)
sys.setdefaultencoding('UTF8')
#print sys.getdefaultencoding()  

def send_error():
    cmd = "/usr/bin/zabbix_sender -vvv -z 72.13.87.66 -s 17ce.com -k 'idc[error]' -o 1" 
    os.system(cmd)

all_nodes="/tmp/all_nodes.json"
#################################
with open(all_nodes) as f:
  try:
      json = simplejson.load(f)
  except:
      print "[ERROR]: Invalid json file."
      send_error
      sys.exit(1)

total_count=len(json["fullips"])

##################################
original_json_file="/tmp/valid_nodes.txt"
tmp_json_file="/tmp/tmp.json"
valid_count=-1

# 
fd=open(original_json_file, 'r').read() 
tmp_string = re.sub(r'freshdata":{([0-9]+)', r'freshdata":{"\1"', fd)
json_string=re.sub(r'},([0-9]+):{', r'},"\1":{', tmp_string)

# write new json file
f = open(tmp_json_file, 'w')
f.write(json_string)

# valid json
with open(tmp_json_file) as f:
  try:
      json = simplejson.load(f)
  except:
      print "[ERROR]: Invalid json file."
      send_error
      sys.exit(1)

def format(s):
    string=re.sub(r',',r'',s)
    return string


# create zabbix file to send
f = open('/tmp/zabbix_data.txt', 'w')


for key in json["freshdata"].keys():
    #print isinstance(idc_name, unicode) 

    idc_name = json["freshdata"][key]["name"].strip()
    idc_code = json["freshdata"][key]["HttpCode"].strip() 
    idc_speed= json["freshdata"][key]["speed"] 
    idc_sid= json["freshdata"][key]["sid"] 
    idc_total_time =  ''.join(json["freshdata"][key]["TotalTime"])
    idc_nslookup_time= ''.join(json["freshdata"][key]["NsLookup"]) 
    idc_connect_time = ''.join(json["freshdata"][key]["ConnectTime"])
    idc_download_time = ''.join(json["freshdata"][key]["downtime"])
    #print idc_name, idc_code, idc_speed, idc_total_time, idc_nslookup_time, idc_connect_time, idc_download_time

    if (idc_code != "200"):
        idc_code="400"

    if (idc_total_time == "*"):
        idc_total_time = "-0.1"


    idc_total_time=idc_total_time.replace("s", "");
    print ("%-16s%-8s%-20s") % (idc_name,idc_code,idc_total_time)
    print >> f, '17ce.com', 'idc[' + idc_name + idc_sid + ',httpcode]', idc_code 
    print >> f, '17ce.com', 'idc[' + idc_name + idc_sid + ',time]' , idc_total_time

    #print ("%-16s%-8s%-20s%-10s%-10s%-10s%-10s") % (idc_name,idc_code,idc_speed,idc_total_time,idc_nslookup_time,idc_connect_time,idc_download_time)
    if (idc_code == "200"):
        valid_count=valid_count+1
        #print valid_count
    else:
        pass 
    #    #print "Invalid:" + idc_name + idc_code
    #    #print valid_count

f.close()

success_rate = round(valid_count / total_count * 100,2)
print valid_count
print total_count

cmd = "/usr/bin/zabbix_sender -vvv -z 72.13.87.66 -s 17ce.com -k 'idc[success_rate]' -o "+ str(success_rate)
print cmd
os.system(cmd)
cmd2 = "/usr/bin/zabbix_sender -vv -z 72.13.87.66 -i /tmp/zabbix_data.txt"
os.system(cmd2)
