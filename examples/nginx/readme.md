# Readme

```bash
docker run \
  --name hello-nginx \
  -p 80:80 \
  -v /tmp/hello:/usr/share/nginx/html \
  -e KEY1=VALUE1 \
  -d \
  nginx:latest
```


