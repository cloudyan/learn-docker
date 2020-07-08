#!/bin/sh

# 运行

# 默认端口 3306
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
