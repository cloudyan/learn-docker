#!/bin/sh

# 运行

# 默认端口 :27017
docker run --name mongo -d mongo

docker run --name some-app --link some-mongo:mongo -d application-that-uses-mongo
