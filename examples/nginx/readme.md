# Readme

```bash
docker run \
  --name hello-nginx \
  -p 80:80 \
  -v /tmp/hello:/usr/share/nginx/html \
  -e KEY1=VALUE1 \
  -d \
  nginx:latest


docker run -it \
  --name my-nginx \
  -p 5500:80 \
  -v ~/docker/nginx/my-nginx:/usr/share/nginx/html \
  -v ~/docker/nginx/config/conf.d:/etc/nginx/conf.d \
  -d \
  nginx:alpine
```


