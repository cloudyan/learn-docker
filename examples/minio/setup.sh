#!/bin/sh

sudo docker run -d -p 9000:9000 --name minio1 \
  -e "MINIO_ACCESS_KEY=改成自己需要的" \
  -e "MINIO_SECRET_KEY=改成自己需要的" \
  -v /mnt/data:/data \
  --restart=always \
  minio/minio server /data
