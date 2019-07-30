#!/bin/bash

Hosts="./Hosts.cfg"

clear
echo ""
echo -e  "\033[32m -----------check system infomation-------- \033[0m"
while true ;do
	for I in `cat $Hosts|grep -v ^# |awk '{print $1}'` ;do
	echo -e "\033[32m  -------- $I 系统资源使用情况 --------- \033[0m" 
		for  P in `cat $Hosts |grep $I |awk '{print $2}'` ;do
	ssh ${I} -p ${P} "uptime && free -m && \
	echo -e '\033[32m ---------内存占用top 10 ----------- \033[0m' && \ 
	ps -aux --sort -rss |head &&\
	echo -e '\033[32m ---------CPU 占用top 10 ----------- \033[0m' && \ 
	ps -aux --sort -%cpu |head "
		done
	done
read option
   case $option in 
   *)
   break
   ;;   
   esac
done
