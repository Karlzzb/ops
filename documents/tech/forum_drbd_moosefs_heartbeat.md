### 论坛MFS+DRBD+heartbeat的安装、测试

#### 1. 说明
#####  1.1 这份安装文档基本参照Adam之前写的安装文档，主要有以下几个地方的不同：
1. mfs使用的是官方的yum源，因为之前使用的是1.6.26版本，已经是2年前的版本。新版是2.0，除了修复了一些bug之外，最重要是增加了master的HA功能，但是这个功能是Pro版本，收费的
2. mfsmaster除了修复了一些bug之外，2.0版本能够看到更详细的内存使用信息
2. drbd使用的是8.4版本，一些命令与之前有些微不同（比如设置primary节点,drbdadm primary mfs）
3. mfsmetarestore在1.7版本中已经移除，新版本中直接使用mfsmaster -a启动即可，因此注意修改heartbeat的资源管理脚本
4. heartbeat默认使用udp 694端口通信，在广播模式下，如果有多个heartbeat节点可能造成干扰，注意修改udpport
5. heartbeat可以通过ha_propagate来复制配置文件到对端（原理是scp），同样可以验证配置是否正确，注意要配置hosts

##### 1.2 相关服务器
dfs1 192.168.10.206
dfs2 192.168.10.207
dfs3 192.168.10.208
dfs4 192.168.10.211
drbd对外IP 192.168.10.220

#### 2. 安装drbd
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm --force
yum install drbd84-utils kmod-drbd84
  
##### 2.1 创建用于drbd同步的分区
  [root@node1 yum.repos.d]#lvcreate -L 3G -n drbd /dev/domuvg
  Logical volume "drbd" created
  [root@node2 yum.repos.d]#lvcreate -L 3G -n drbd /dev/domuvg
  Logical volume "drbd" created
  
##### 2.2 配置drbd
注意所有的DRBD配置文件应该在多个节点上面完全一致

[root@node1 yum.repos.d]#cat /etc/drbd.d/global_common.conf
```
global {
        usage-count no;
}

common {
        protocol C; #指定同步完成的标准

        handlers {
                # These are EXAMPLE handlers only.
                # They may have severe implications,
                # like hard resetting the node under certain circumstances.
                # Be careful when chosing your poison.

                # pri-on-incon-degr "/usr/lib/drbd/notify-pri-on-incon-degr.sh; /usr/lib/drbd/notify-emergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
                # pri-lost-after-sb "/usr/lib/drbd/notify-pri-lost-after-sb.sh; /usr/lib/drbd/notify-emergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
                # local-io-error "/usr/lib/drbd/notify-io-error.sh; /usr/lib/drbd/notify-emergency-shutdown.sh; echo o > /proc/sysrq-trigger ; halt -f";
                # fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
                # split-brain "/usr/lib/drbd/notify-split-brain.sh root";
                # out-of-sync "/usr/lib/drbd/notify-out-of-sync.sh root";
                # before-resync-target "/usr/lib/drbd/snapshot-resync-target-lvm.sh -p 15 -- -c 16k";
                # after-resync-target /usr/lib/drbd/unsnapshot-resync-target-lvm.sh;
        }

        startup {
        wfc-timeout 30;  #初始化的超时
        outdated-wfc-timeout 20;
        degr-wfc-timeout 30;  #降级重启后的等待超时
        }

        disk {
        on-io-error detach;  #出现io错误时的处理方式
        fencing resource-and-stonith; 
        }

        net {
        cram-hmac-alg sha1; #网络数据加密算法
        shared-secret "how_r_u";
        }

        syncer {
        rate 100M;
        verify-alg sha1;
        }
}


resource mfs {
    #　host-name is mandatory and must match the Linux host name (uname -n) of one of the nodes
    on dfs1 {
        device    /dev/drbd1;   #必须以drbd打头,/dev可以省略
        disk      /dev/domuvg/drbd;  #用于承载drbd的块设备，如/dev/sdb1等
        address   192.168.10.206:2001; 
        meta-disk  internal;
    }

    on dfs2 {
        device    /dev/drbd1;
        disk      /dev/domuvg/drbd;
        address   192.168.10.207:2002;
        meta-disk internal;
    }
}
```

##### 2.3 初始化DRBD并创建文件系统
1. 注意格式化文件系统的操作，仅在创建DRBD主节点后，在主节点上面执行即可。
1. 在dfs1和dfs2上面执行：`drbdadm create-md mfs && /etc/init.d/drbd start`
1. 查看DRBD的状态： `cat /proc/drbd`或者`drbd-overview`，此时的状态应该是Secondary/Secondary
>0:mfs  Connected Secondary/Secondary Inconsistent/Inconsistent C r----- 
1. 将**dfs1**设置为主节点：`drbdadm primary mfs --force`(与8.3中drbdadm -- --overwrite-data-of-peer primary mfs不同)
2. 再次查看DRBD的状态: `drbd-overview`会看到Primary/Secondary则说明成功，同时能看到同步进度
>  0:mfs  SyncSource Primary/Secondary UpToDate/Inconsistent C r---n- 
    [>....................] sync'ed:  0.2% (204588/204792)M
1. 在**dfs1**上创建文件系统：`mkfs.xfs /dev/drbd1`


#### 3. 安装heartbeat
##### 3.1 安装：`yum install -y heartbeat`
##### 3.2 heartbeat设置
ha.cf 保持node1和node2一致
auto_failback on # 生产环境为了更安全会设置成off

[root@node1 ha.d]# cat ha.cf
```
logfacility     local0
keepalive 2
bcast   eth0
deadtime 20
warntime 10
initdead 120

auto_failback on
node    node1   
node    node2
```

---------------
authkeys权限600，node1和node2一致
[root@node1 ha.d]# cat authkeys 
```
auth 1
1 crc
```

---------------------
resources，node1和node2一致
[root@node1 ha.d]# cat haresources 
node1 initdrbd 192.168.10.222
     
-----------------
创建新的脚本resource.d/initdrbd ，权限755，对应haresources 定义的initdrbd
[root@node1 ha.d]# cat resource.d/initdrbd 
```
#!/bin/bash

META_DATA="/mfs/metadata"

case "$1" in
    start)
        while true; do
            drbd_status=$(/etc/init.d/drbd status | grep -Ew "Connected|WFConnection" | wc -l)
            if [ $drbd_status -eq 0 ]; then
                logger "$(date) drbd's status is inconsisten, waiting..."
                sleep 1
            else
                echo "$(date) drbd's status is ok"
                break
            fi
        done
        
        mkdir -p $META_DATA
        drbdsetup /dev/drbd1 primary
        mount /dev/drbd1 $META_DATA
        chown mfs:mfs $META_DATA  -R
        #mfsmetarestore -a -d $META_DATA
        mfsmaster -a
        #/usr/sbin/mfsmaster start

    ;;
    stop)
        /usr/sbin/mfsmaster stop
        #fuser -ck /data/mfs
        umount -fl /dev/drbd1
        drbdadm secondary mfs

    ;;
    status)
        echo ;;

    *)
    echo "Usage: drbddisk [resource] {start|stop|status}"
    exit 1
    ;;
esac

exit 0
```


#### 4. MFS配置
#####  4.1 mfs master的配置
1. 添加相应的yum源
```
curl "http://ppa.moosefs.com/yum/RPM-GPG-KEY-MooseFS" > /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS
curl "http://ppa.moosefs.com/yum/MooseFS.repo" > /etc/yum.repos.d/MooseFS.repo
```
2. 在dfs1和dfs2上安装master： `yum install -y moosefs-ce-master moosefs-ce-client moosefs-ce-cgiserv`
3. 挂载文件系统： `mkdir -p  /mfs/metadata/; mount /dev/drbd0 /mfs/metadata/ ; chown daemon:daemon /mfs/metadata/`
4. 编辑相关的配置文件
```
 vim /etc/mfs/mfsexports.cfg #允许挂载的客户端
 vim /etc/mfs/mfsmaster.cfg  #master主配置文件，修改DATA_PATH为/mfs/metadata/
 cp /var/lib/mfs/metadata.mfs.empty /mfs/metadata/metadata.mfs
 chown -R mfs:mfs /mfs/metadata
```
6. 启动mfsmaster（只在**dfs1**上执行）
mfsmaster start
>working directory: /mfs/metadata
lockfile created and locked
initializing mfsmaster modules ...
loading sessions ... ok
sessions file has been loaded
exports file has been loaded
mfstopology configuration file (/etc/mfs/mfstopology.cfg) not found - using defaults
loading metadata ...
create new empty filesystemmetadata file has been loaded
no charts data file - initializing empty charts
master <-> metaloggers module: listen on *:9419
master <-> chunkservers module: listen on *:9420
main master server module: listen on *:9421
mfsmaster daemon initialized properly

#####  4.2 chunk节点的创建
```
mkdir /data/mfs
chown mfs:mfs /data/mfs
vim /etc/mfs/mfshdd.cfg #配置存储路径，可以是多个，/data/mfs 10GB
vim /etc/mfs/mfschunckserver.cfg #修改mfsmaster为VIP地址,MASTER_HOST = 192.168.10.220
mfschunkserver start
```

#####  4.3 配置cgi页面查看mfs的状态
1. 在dfs1和dfs2上执行： mfscgiserv
2. 使用VIP访问即可：[mfs监控页面](http://192.168.10.220:9425/mfs.cgi?masterhost=192.168.10.220&sections=IN)

#### 5. 测试
##### 5.1 高可用测试
1. 主节点reboot，可正常切换到从机，主机再恢复之后也能自动auto_failback。
2. 主节点reboot，从节点也reboot，都启动之后，主节点接管服务
2. 主节点ifdown或者拔掉网线，切换异常，出现闹裂，只能手动恢复。见[8.4的官方文档](http://www.drbd.org/users-guide/s-resolve-split-brain.html)

##### 5.2 磁盘性能测试
1. 读。根据以下的数据显示，读的IO在80Mbps左右，但由于这里是单进程执行的，还需要进一步测试。
>[root@node1 dezii]# time cp -pr /mnt/mfs/ /tmp/mfs
real    2m33.377s
user    0m0.100s
sys     0m1.966s
[root@node1 dezii]# du -s /tmp/mfs
1637904 /tmp/mfs
85Mbps
time find  /mnt/mfs/Mon_1008 -type f -exec cp {} /dev/null  \;
real    1m19.386s
user    0m0.083s
sys     0m0.714s
[root@node1 dezii]# du -s /mnt/mfs/Mon_1008
721549  /mnt/mfs/Mon_1008
72Mbps

2. 写。由于这里是百兆交换速度，写入速度已经达到极限。
>[root@srv-ieg-svn1 dezii]# dd if=/dev/zero of=/data/mfs/myzerofile bs=512k count=20k conv=fdatasync
20480+0 records in
20480+0 records out
10737418240 bytes (11 GB) copied, 966.611 s, 11.1 MB/s
