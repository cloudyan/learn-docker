#!/bin/sh

# 运行

docker run --name some-wordpress --link some-mysql:mysql -d wordpress

# 启动 WordPress 容器时可以指定的一些环境变量包括：

# - WORDPRESS_DB_USER 缺省为 root
# - WORDPRESS_DB_PASSWORD 缺省为连接 mysql 容器的环境变量 MYSQL_ROOT_PASSWORD 的值
# - WORDPRESS_DB_NAME 缺省为 wordpress
