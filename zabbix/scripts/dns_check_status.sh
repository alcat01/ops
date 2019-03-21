#!/bin/bash
Dtime=` date +"%Y-%m-%d %H:%M"`
Check_Log=/tmp/check_dns.log
Dig_time=15
> $Check_Log
#echo "==============Begin Time $Dtime============" >>$Check_Log
check_add () {

for DNS_ip in `cat /etc/zabbix/scripts/server_ip_add.cfg` ;do
   for URL_name in `cat /etc/zabbix/scripts/url_add.cfg` ;do
   dig $URL_name +time=$Dig_time @$DNS_ip   |grep -A 1 "ADDITIONAL SECTION" |grep $URL_name  >/dev/null
#   echo  "$chk"  |grep $URL_name  >/dev/null
   num=`echo $?`
        if [ $num -ne 0 ] ; then
         echo "dig $URL_name +time=$Dig_time @$DNS_ip  fail" >> $Check_Log
       #     echo "DNS server :$DNS_ip $URL_name   fail"  >> $Check_Log
        fi
   done
done
}


check_ans () {
for DNS_ip in `cat /etc/zabbix/scripts/server_ip_ans.cfg` ;do
   for URL_name in `cat /etc/zabbix/scripts/url_ans.cfg` ;do
   dig $URL_name +time=$Dig_time @$DNS_ip   |grep -A 1 "ANSWER SECTION"  |grep $URL_name  >/dev/null
   num=`echo $?`
        if [ $num -ne 0 ] ; then

           echo "dig $URL_name +time=$Dig_time @$DNS_ip  fail"    >>$Check_Log
#         echo "DNS server :$DNS_ip $URL_name   fail"  >> $Check_Log
        fi
   done
done

}


case "$1" in
    check_add)
        check_add
        ;;
    check_ans)
        check_ans
        ;;
    all)
        check_add
        check_ans
        ;;
    *)
        echo "Usage:$0 {check_add|check_ans|all}"
        ;;
esac
