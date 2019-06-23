#/bin/bash
Hosts=./hosts.cfg
while true; do
clear
echo ""
echo ""
echo -e "\033[32m................................................\033[0m"
echo -e "\033[32m ID Hostname IP User Port\033[0m" |awk '{printf "%-5s%-5s%-15s%-15s%-10s%-5s\n",$1,$2,$3,$4,$5,$6}'
cat $Hosts |grep -v "^#"| awk '$0=NR" "$0' |while read line ;do
ID=`echo $line|awk -F "|" '{print $1}'`
Hostname=`echo $line|awk -F "|" '{print $2}'`
IP_list=`echo $line|awk -F "|" '{print $3}'`
User=`echo $line|awk -F "|" '{print $4}'`
Port=`echo $line|awk -F "|" '{print $5}'`
echo -e "\033[32m $ID $Hostname $IP_list $User $Port\033[0m" |awk '{printf "%-5s%-5s%-15s%-15s%-10s%-5s\n",$1,$2,$3,$4,$5,$6}'
done

echo ""
printf  "\033[32minput:_\033[0m"
read option
if [ "$option" = "" ] || [ "$option" == "quit" ] || [ "$option" == "q" ] ;then
   break
fi
#IP_list=`cat $Hosts |grep -v "^#"| awk '$0=NR" "$0' |awk -F "|" '$1~"'$option'"{print $2}'`
IP_list=`cat $Hosts |grep -v "^#"| awk '$0=NR" "$0' |grep -w "^$option" |awk -F "|" '{print $2}'`
User=`cat $Hosts |grep -v "^#"| awk '$0=NR" "$0' |grep -w "^$option" |awk -F "|" '{print $3}'`
Port=`cat $Hosts |grep -v "^#"| awk '$0=NR" "$0' |grep -w "^$option" |awk -F "|" '{print $4}'`
	if [ "$User" == "" ] && [ "$Port" == "" ]  ;then
        ssh -o ConnectTimeout=10 $IP_list
	elif [ "$User" == "" ] && [ "$Port" != "" ] ;then
        ssh -o ConnectTimeout=10 ${IP_list} -p ${$Port}
        elif  [ "$User" != "" ] && [ "$Port" == "" ]; then
        ssh -o ConnectTimeout=10 ${User}@${IP_list}
        elif  [ "$User" != "" ] && [ "$Port" != "" ] ;then
        ssh -o ConnectTimeout=10 ${User}@${IP_list} -p ${Port}
	fi
#sleep 4
done
