#!/bin/sh

# 运行

docker run --name some-redis -d -p 6379:6379 redis redis-server --appendonly yes
