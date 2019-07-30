#!/bin/bash
#k8s information
#集群监控检测
Ch_k8s=./kubectl.txt

clear
while  true ;do
#kubectl get cs
echo -e "\033[32m    ---------- 获取集群状态信息 ---------  \033[0m"
kubectl get cs
echo -e "\033[32m    ---------- 获取集群节点信息 ---------  \033[0m"
kubectl get nodes
#check k8s pod running
echo -e "\033[32m    ---------  检查k8s 运行异常pod -----   \033[0m"
kubectl get pod


#check k8s pod not running
echo -e "\033[32m    ---------  检查k8s 运行异常pod -----   \033[0m"
kubectl get pod |grep -v  Running


read option
case $optin in
        *)
        break
        ;;
esac
done

