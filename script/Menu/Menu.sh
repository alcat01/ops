#!/bin/bash

while true ; do
clear
echo ""
echo -e "\033[32m            1:Add hosts information:_\033[0m"
echo -e "\033[32m            2:Del hosts information:_\033[0m"
echo -e "\033[32m            3:Connect hosts:_\033[0m"
echo -e "\033[32m            4:Quit(q) \033[0m"
#sh ./3.sh
printf  "\033[32m                       input:_\033[0m"
stty erase '^H'
read  option
     case $option in
	1)
	clear
	sh ./1.sh
	;;
	2)
	clear
	sh ./2.sh
	;;
        3)
        sh ./3.sh
	;;
        4)
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
