#/bin/bash
#check ceph cluster health 
echo "-------------ceph -s -----------"
ceph -s

echo "-------------ceph osd df--------"
ceph osd df

echo "-------check rdb---"
for i in `rbd ls`; do rbd info $i; done

