#!/usr/bin/python
# -*- coding: utf-8 -*-
#author: dezill
#date: 2014-11-18
#monitor ftp connections

import ftplib
import socket
import sys

ftp = {'host' : '10.1.0.6',
        'user' : 'myftpuser',
        'pass' : 'myftppass',
	'port' : 21,
	'timeout' : 2,
        }
try:
    myftp = ftplib.FTP()
    myftp.connect(ftp['host'], ftp['port'], ftp['timeout'])
    myftp.login(ftp['user'], ftp['pass'])
    myftp.pwd()
except socket.timeout:
    print "SOCKTIMEOUT"
    exit(1)
except ftplib.all_errors:
    print "FTPERROR"
    exit(2)
else:
    print "OK"
