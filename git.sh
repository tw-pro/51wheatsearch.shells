#!/bin/bash

################################# Subsodule 模块 #################################

########## 删除模块 ##########
## 51wheatsearch.components.backend
git submodule deinit www/app/components &&
    rm -rf .git/modules/www/ &&
    git rm --cached www/app/components

vi .gitmodules # 删除项目目录下.gitmodules文件中子模块相关条目
vi .git/config # 删除配置项中子模块相关条目

########## 安装模块 ##########
# 51wheatsearch.components.backend
git submodule add https://github.com/tw-pro/51wheatsearch.components.backend.git www/app/components

########## 修改模块 ##########
# 确定并设置新url
1. 修改'.gitmodules'文件中对应模块的”url“属性
# 使用 git submodule sync 命令，将新的URL更新到文件.git/config；
2. git submodule sync
