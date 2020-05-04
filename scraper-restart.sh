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
# 进入项目调用脚本
cd twowen-scraper &&
sh upgrade.sh
exit