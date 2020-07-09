#!/bin/sh

# 运行

# 默认端口 3306
docker run -it \
  -p 3306:3306 \
  --name my-mysql \
  -e MYSQL_ROOT_PASSWORD=xiaohan \
  -d mysql:5.7
