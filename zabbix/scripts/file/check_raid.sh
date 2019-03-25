#!/bin/bash
raidfile=/tmp/MegaSAS.log
Disks_num=`cat ${raidfile} |grep -A1 "Physical Devices"  |grep Disks |awk -F ":" '{print $NF}'`
Critical_Disks=`cat ${raidfile} |grep "Critical Disks" |awk -F ":" '{print $NF}'`
Failed_Disks=`cat ${raidfile} |grep "Failed Disks" |awk -F ":" '{print $NF}'`
Offline_num=`cat ${raidfile} |grep -B1 "Physical Devices"  |grep Offline |awk -F ":" '{print $NF}'`
case $1 in 
      Disks)
      echo ${Disks_num}
      ;;
      Critical)
      echo  ${Critical_Disks}
      ;;
      Failed)
      echo ${Failed_Disks}
      ;;
      Offline)
      echo $Offline_num
      ;;
esac  
