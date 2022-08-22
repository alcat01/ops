#!/bin/bash
ip_list=`cat dd_ip_list|awk '{print $1}'`
for IP in `echo ${ip_list}` ;do
echo ${IP}
scp zabbix-agent-4.4.1-1.el7.x86_64.rpm ${IP}:/root/
ssh ${IP}  "rpm -iv /root/zabbix-agent-4.4.1-1.el7.x86_64.rpm"
scp  zabbix_agentd.conf ${IP}:/etc/zabbix/
ssh ${IP} "systemctl enable zabbix-agent && systemctl restart zabbix-agent"
done
