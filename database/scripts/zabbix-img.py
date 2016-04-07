#! /usr/bin/env python
#coding=utf-8
# Kerl

import argparse
import time,os
import urllib
import urllib2
import cookielib
import smtplib


parser = argparse.ArgumentParser()

parser.add_argument('-s', action='store', dest='start_time',required=True,type=int,
        help='Graph start time ex:-s 20150110161109')
		
parser.add_argument('-p', action='store', dest='period',required=True,type=int,
        help='Graph lasting period, second ex:-p 3600')

parser.add_argument('-path', action='store', dest='save_graph_path',required=True,
        help='Graph save path ex: -path /home/src')

parser.add_argument('-g', action='append', dest='graphids',required=True,type=int,
        default=[],
        help='You can add multiple graphids ex: -g 694 -g 695')

results = parser.parse_args()



##########cfg##########


#graph start time %Y%m%d%H%M%S
start_time = results.start_time
#start_time = 201501111725

# graph Time period, s
period = results.period
#period = 3600



#save_graph_path = "/home/kerl"
save_graph_path = results.save_graph_path


graphid = results.graphids
#graphid = ["694","695","693","825","824","826","876","782","744","729","731","728","740"]


if not os.path.exists(save_graph_path):
       os.makedirs(save_graph_path)
# zabbix host
zabbix_host = "118.201.56.206:14808"
# zabbix login username
username = "Admin"
# zabbix login password
password = "zbxSGP321"
# graph width
width = 600
# graph height
height = 150

def get_graph(zabbix_host,username,password,graphid_list,width,height,period,save_graph_path,stime):
    screenid = ""
    global html
    html = ''
    for graphid in graphid_list:
        login_opt = urllib.urlencode({
        "name": username,
        "password": password,
        "autologin": 1,
        "enter": "Sign in"})
        get_graph_opt = urllib.urlencode({
        "graphid": graphid,
        "screenid": screenid,
        "width": width,
        "height": height,
        "stime" : stime,
        "period": period})
        cj = cookielib.CookieJar()
        opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
        login_url = r"http://%s/index.php"%zabbix_host
        save_graph_url = r"http://%s/chart2.php"%zabbix_host
        opener.open(login_url,login_opt).read()
        data = opener.open(save_graph_url,get_graph_opt).read()
        filename = "%s/%s.png"%(save_graph_path,graphid)
        html += '<img width="600" height="250" src="http://%s/%s/%s/%s.%s.png">'%(zabbix_host,save_graph_path.split("/")[len(save_graph_path.split("/"))-2],save_graph_path.split("/")[len(save_graph_path.split("/"))-1],screenid,graphid)
        f = open(filename,"wb")
        f.write(data)
        f.close()


if __name__ == '__main__':
        get_graph(zabbix_host,username,password,graphid,width,height,period,save_graph_path,start_time)
