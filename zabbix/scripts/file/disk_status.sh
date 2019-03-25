#/bin/sh
 
device=$1
item=$2
 
case $item in
         rrqm)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b"|tail -1|awk '{print $2}'
            ;;
         wrqm)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b"|tail -1|awk '{print $3}'
            ;;
          rps)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b"|tail -1|awk '{print $4}'
            ;;
          wps)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $5}'
            ;;
        rKBps)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $6}'
            ;;
        wKBps)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $7}'
            ;;
     avgrq-sz)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $8}'
            ;;
     avgqu-sz)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $9}'
            ;;
        await)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $10}'
            ;;
        svctm)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $11}'
            ;;
         util)
            /usr/bin/iostat -dxkt 1 2 | tail -n 30 |grep "\b$device\b" |tail -1|awk '{print $12}'
            ;;
esac
