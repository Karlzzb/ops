#启动脚本
nohup masterha_manager --conf=/etc/mha_discuz.cnf > /var/log/masterha/mha_v.log 2>&1 &

#每次failover后需要删除(否做无法下一次failover)
/var/log/masterha/complete*