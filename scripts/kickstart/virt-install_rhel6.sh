virt-install \
--name harrision_p27 \
--ram 1024 \
--cpu host \
--vcpus 2,maxvcpus=2 \
--os-type=linux \
--os-variant=rhel6 \
--extra-args="ks=http://192.168.10.253/centos_6.5_kvm_guest.cfg text console=tty0 utf8 console=ttyS0,115200 edd=off" \
--disk path=/dev/mainvg/harrision_p27 \
--location http://192.168.10.253/CentOS6.5/ \
--network bridge=br0,model=virtio