#!/bin/bash
if [ $# -ne 5 ];then
    echo "Usage: $0 vmname vmcpu vmmemory(MB) vmdisk_size(GB) vncport"
else
    vmname=$1
    vmcpu=$2
    vmmem=$3
    vmdisk_size=$4
    vncport=$5
    CDROM=iso/CentOS-7-x86_64-Minimal-1708.iso
    qemu-img create -f qcow2 /data1/images/${vmname}.qcow2 ${vmdisk_size}G
    virt-install --virt-type kvm --name $vmname --vcpus $vmcpu --ram $vmmem \
    --disk /data1/images/${vmname}.qcow2,format=qcow2,size=$vmdisk_size \
    --network bridge=br0 \
    --vnc --vncport=$vncport --vnclisten=127.0.0.1 \
    --os-type=linux --os-variant=rhel7.3 \
    --cdrom=$CDROM
fi

