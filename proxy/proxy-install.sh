#!/bin/bash
# 接受参数
while [ -n "$1" ]  
do  
    case "$1" in
        # proxyUser
        -u)
            USER=$2
            shift
            ;; 
        # proxyPass
        -p)  
            PASS=$2
            shift
            ;;  
        # proxyPort
        -port)
            PORT=$2 
            shift  
            ;;
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
# # 代理安装
wget --no-check-certificate https://gitee.com/twowen/socks5/raw/master/install.sh -O install.sh &&
bash install.sh &&
# 重启代理服务
service ss5 restart &&
# 关闭防火墙
systemctl stop firewalld &&
# 下载 headless-shell
yum install epel-release -y &&
yum install chromium-headless -y &&
yum install git -y &&
yum install lsof -y &&
# Node等环境安装
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash - &&
yum install -y nodejs &&
npm config set registry https://registry.npm.taobao.org &&
npm i yarn -g &&
npm i cnpm -g &&
cnpm i -g pm2 &&
# 拉取代码
git clone https://gitee.com/twowen/twowen-scraper.git &&
# 升级并启用服务
cd twowen-scraper &&
sh upgrade.sh &&
# 获取IP地址
IP=$(ifconfig ppp0 | grep "inet" | awk '{ print $2 }') &&
# 打开代理
curl -i -X POST -F "sshIp=${SSHIP}" -F "sshPort=${SSHPORT}" -F "sign=${SIGN}" -F "ip=${IP}" -F "port=${PORT}" -F "user=${USER}" -F "pass=${PASS}" -F 'status=1' http://admin.2weng.com/webhook/proxy &&
# 输出地址
echo ip地址:${IP} 端口:${PORT} 用户:${USER} 密码:${PASS}
exit