#!/bin/bash

# 51wheatsearch 项目

LOGDATE=$(date +%Y%m%d) &&

# 压缩清空 api.51wheatsearch.api 日志文件
LOGDIR=/data/api.51wheatsearch.com/api/logs/ &&
zip -q -9 ${LOGDIR}${LOGDATE}-access.pipe.zip ${LOGDIR}access.pipe &&
echo '' > ${LOGDIR}access.pipe &&
# 压缩清空 api.51wheatsearch.gs 日志文件
LOGDIR=/data/api.51wheatsearch.com/gs/logs/ &&
zip -q -9 ${LOGDIR}${LOGDATE}-access.pipe.zip ${LOGDIR}access.pipe &&
echo '' > ${LOGDIR}access.pipe &&
# 压缩清空 api.51wheatsearch.admin 日志文件
LOGDIR=/data/api.51wheatsearch.com/admin/logs/ &&
zip -q -9 ${LOGDIR}${LOGDATE}-access.pipe.zip ${LOGDIR}access.pipe &&
echo '' > ${LOGDIR}access.pipe &&
