#!/bin/bash
# fix wrong process number with proc.num[]
case "$1" in
    java) ps aux|grep -Ev "(JMXClient.jar|cmdline-jmxclient|\.sh|\-version)" |grep [j]ava| grep -v 'zabbix' | wc -l;;
    masterha_manager) ps aux | grep [m]asterha_manager | grep -v 'zabbix' | wc -l;;
    *) echo 0 ;;
esac
