#!/bin/sh

# 运行

# 默认端口 3306
# mysql:5.7
docker run -it \
  -p 3306:3306 \
  --name mysql:5.7 \
  -e MYSQL_ROOT_PASSWORD=xiaohan \
  -d mysql:5.7

# mysql:8
docker run -it \
  --name mysql:8 \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=xiaohan \
  -d mysql:8
