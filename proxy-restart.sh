#!/bin/bash
# 接受参数
while [ -n "$1" ]  
do  
    case "$1" in
        # sshIp
        -sshIp)
            SSHIP=$2 
            shift  
            ;;
        # sshPort
        -sshPort)
            SSHPORT=$2 
            shift  
            ;;
    esac  
    shift  
done
# 进行签名验证 
SIGN=$(echo -n ${SSHIP}|md5sum|cut -d ' ' -f1) &&
# 关闭代理
curl -i -X POST -F "sshIp=${SSHIP}" -F "sshPort=${SSHPORT}" -F "sign=${SIGN}" -F 'status=0' http://admin.2weng.com/webhook/proxy &&
# 重启路由器
adsl-stop &&
adsl-start &&
# 获取IP地址
IP=$(ifconfig ppp0 | grep "inet" | awk '{ print $2 }') &&
# 打开代理
curl -i -X POST -F "sshIp=${SSHIP}" -F "sshPort=${SSHPORT}" -F "sign=${SIGN}" -F "ip=${IP}" -F 'status=1' http://admin.2weng.com/webhook/proxy &&
# 输出地址
echo ip地址:${IP}
exit