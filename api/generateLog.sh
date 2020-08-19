#!/bin/bash

# 51wheatsearch 项目

# 创建 api.51wheatsearch.api 日志文件
echo '' > /data/api.51wheatsearch.com/api/logs/access.pipe &&
# 创建 api.51wheatsearch.gs 日志文件
echo '' > /data/api.51wheatsearch.com/gs/logs/access.pipe &&
# 创建 api.51wheatsearch.admin 日志文件
echo '' > /data/api.51wheatsearch.com/admin/logs/access.pipe &&



# twowen-xxx项目
LOGDATE=$(date +%Y%m%d) &&
# 清空 twowen-api 今日日志文件
touch /data/srv/twowen-api/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-api/logs/ &&
# 创建 twowen-gs 日志文件
touch /data/srv/twowen-gs/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-gs/logs/ &&
# 创建 twowen-admin 日志文件
touch /data/srv/twowen-admin/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-admin/logs/ &&