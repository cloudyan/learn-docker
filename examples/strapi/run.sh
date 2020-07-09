#!/bin/sh

# https://github.com/strapi/strapi-docker

# 本地运行，默认使用 SQLite database
docker run -it \
  -p 1337:1337 \
  -v `pwd`/mystrapi:/srv/app \
  strapi/strapi

# 链接远程的数据库
docker run -it \
  -e DATABASE_CLIENT=postgres \
  -e DATABASE_NAME=strapi \
  -e DATABASE_HOST=0.0.0.0 \
  -e DATABASE_PORT=5432 \
  -e DATABASE_USERNAME=strapi \
  -e DATABASE_PASSWORD=strapi \
  -p 1337:1337 \
  -v `pwd`/mystrapi:/srv/app \
  strapi/strapi
