#/bin/bash
Hosts=./hosts.cfg
while true; do
clear
echo ""
echo ""
echo -e "\033[32m................................................\033[0m"
echo -e "\033[32m ID Hostname IP User Port \033[0m" |awk '{printf "%-5s%-5s%-15s%-15s%-10s%-5s\n",$1,$2,$3,$4,$5,$6}'
cat $Hosts |egrep -v "^#|^$"| awk '$0=NR" "$0' |while read line ;do
ID=`echo $line|awk -F "|" '{print $1}'`
Hostname=`echo $line|awk -F "|" '{print $2}'`
IP_list=`echo $line|awk -F "|" '{print $3}'`
echo -e "\033[32m $ID $Hostname $IP_list $User $Port \033[0m" |awk '{printf "%-5s%-5s%-15s%-15s%-10s%-5s\n",$1,$2,$3,$4,$5,$6}'
done

echo ""
printf "\033[32m Please enter the deleted IP address:_\033[0m"
read  option
if [ "$option" == "quit" ] || [ "$option" == "q" ] ;then
exit
fi
#echo "$option"
function check_ip() {
    VALID_CHECK=$(echo $option|awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
    if echo $option|grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
        if [ $VALID_CHECK == "yes" ]; then
          Host_line=`cat $Hosts |grep -w "$option"|wc -l`
          if [ $Host_line -eq 1 ] ;then
          Del_host=`cat $Hosts |awk -F "|" '{if($2 == "'$option'") print $0}'`
           sed -i '/'"$Del_host"'/d' $Hosts
          cat $Hosts |grep -w "$option"
		if [ $? -eq 0 ] ;then
		echo -e "\033[31m $option  Host deleted failed \033[0m"
		else
		echo -e "\033[32m $option  Host deleted successfully \033[0m"
		fi
	  elif [ $Host_line -gt 1 ] ;then
          printf  "\033[32m Please enter del User:_"
          read User
          sed -i '/'$option'|'$User'/d' $Hosts
          cat $Hosts |grep -w "$option|$User"
                if [ $? -eq 0 ] ;then
                echo -e "\033[31m $option  Host deleted failed \033[0m"
                else
                echo -e "\033[32m $option  Host deleted successfully \033[0m"
                fi
	  fi

         sleep 1
            return 0
        else
            echo -e "\033[31m IP $option not available! \033[0m"
            return 1
        fi
    else
        echo -e "\033[31m $option Host does not exist \033[0m"
        return 1
    fi   }
   check_ip $option
    [ $? -eq 0 ] && break
sleep 1
done
