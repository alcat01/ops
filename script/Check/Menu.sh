#!/bin/bash

while true ; do
clear
echo ""
echo ""
echo ""
echo -e "\033[32m	            	巡检Menu\033[0m"
echo -e "\033[32m	            1:检查OS 系统信息:_\033[0m"
echo -e "\033[32m	            2:检查k8s 集群信息:_\033[0m"
echo -e "\033[32m	            3:检查ceph 集群信息:_\033[0m"
echo -e "\033[32m	            4:检查应用 运行状态:_ \033[0m"
echo -e "\033[32m	            5:quit(q) \033[0m"
#sh ./3.sh
printf  "\033[32m       	                input:_\033[0m"
stty erase '^H'
read  option
     case $option in
	1)
	clear
	sh ./os.sh
	;;
	2)
	clear
	sh ./k8s.sh
	;;
        3)
        sh ./ceph.sh
	;;
        4)
        sh ./app.sh
	;;
        5)
        exit
        clear
        ;;
        q)
        exit
        clear
        ;;
        quit)
        exit
        clear
        ;;
     esac
done
