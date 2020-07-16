#!/bin/bash
LOGDATE=$(date +%Y%m%d) &&
# 创建 twowen-api 日志文件
touch /data/srv/twowen-api/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-api/logs/ &&
# 创建 twowen-gs 日志文件
touch /data/srv/twowen-gs/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-gs/logs/ &&
# 创建 twowen-admin 日志文件
touch /data/srv/twowen-admin/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/srv/twowen-admin/logs/ &&
# 创建 api.51wheatsearch.api 日志文件
touch /data/api.51wheatsearch.com/api/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/api.51wheatsearch.com/api/logs/ &&
# 创建 api.51wheatsearch.gs 日志文件
touch /data/api.51wheatsearch.com/gs/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/api.51wheatsearch.com/gs/logs/ &&
# 创建 api.51wheatsearch.admin 日志文件
touch /data/api.51wheatsearch.com/admin/logs/${LOGDATE}-access.pipe &&
chown -R nginx:nginx /data/api.51wheatsearch.com/admin/logs/ &&