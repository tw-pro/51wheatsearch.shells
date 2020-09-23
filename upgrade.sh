#!/bin/bash
# 清空本机git记录
git reset --hard

# 拉去最新版本代码
git pull

# 操作路径
APP_PATH=$(cd "$(dirname "$0")";pwd)

# 重启php-fpm服务
service php-fpm restart

# 配置终端代理, 加快github访问速度
# export all_proxy=socks5://127.0.0.1:1080