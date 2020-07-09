#!/bin/sh

docker run -it \
  --name my-nginx \
  -p 5500:80 \
  -v /data/apps/h5:/data/apps/h5 \
  -v /config/nginx/conf.d:/etc/nginx/conf.d \
  -d \
  nginx:alpine

# --rm
