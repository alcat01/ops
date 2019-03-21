!/bin/bash
User="zabbix"
Passwd="Databea_zab01"
Date=`date -d $(date -d "-60 day" +%Y%m%d) +%s` 
$(which mysql) -u${User} -p${Passwd} -e "
use zabbix;
DELETE FROM history WHERE clock < $Date;
optimize table history;
DELETE FROM history_str WHERE clock < $Date;
optimize table history_str;
DELETE FROM history_uint WHERE clock < $Date;
optimize table history_uint;
DELETE FROM history_text WHERE clock < $Date;
optimize table history_text;
DELETE FROM  trends WHERE clock < $Date;
optimize table  trends;
DELETE FROM trends_uint WHERE clock < $Date;
optimize table trends_uint;
DELETE FROM events WHERE clock < $Date;
optimize table events;
"
