#ansible all -i /home/elmeast/ops/ansible/common/check_raid_list -s -m script -a "/home/elmeast/ops/ansible/common/file/check_MegaSAS.sh"
ansible all -i /home/elmeast/ops/ansible/common/check_raid_list -s -m shell -a "sh /opt/MegaRAID/MegaCli/check_MegaSAS.sh"
