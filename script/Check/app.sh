#!/bin/bash
clear
while true ;do
echo -e "\033[32m            1:应用服务检查\033[0m"


stty erase '^H'
read  option
	case $option in
	1)
	ssh app1.sh
	;;
	esac
done

