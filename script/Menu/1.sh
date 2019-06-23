#/bin/bash
Hosts=./hosts.cfg
while true ;do
clear
printf  "\033[32m Please enter the host name:_\033[0m"
read Hostname
if [ "$Hostname" == "quit" ] || [ "$Hostname" == "q" ];then
exit
clear
fi
printf  "\033[32m Please enter the IP adderss:_\033[0m"
read IP
if [ "$IP" == "quit" ] || [ "$IP" == "q" ];then
exit
clear
fi
printf  "\033[32m Please enter the User:_\033[0m"
read User
printf  "\033[32m Please enter the Port:_\033[0m"
read Port

function check_ip() {
    VALID_CHECK=$(echo $IP|awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
    if echo $IP|grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
        if [ $VALID_CHECK == "yes" ]; then
         echo "$Hostname|$IP|$User|$Port|" >> $Hosts
echo -e "\033[32m  $Hostname $IP Hosts infomation add successfully \033[0m"
         sleep 1
            return 0
        else
            echo "IP $IP not available!"
            return 1
        fi
    else
        echo "IP format error!"
        return 1
    fi   }

    check_ip $IP
    [ $? -eq 0 ] && break
sleep 1
done
