# strapi

问题：

- https://github.com/strapi/strapi-docker/issues/225

参考：

- https://github.com/strapi/strapi-docker
- Strapi V3: https://github.com/strapi/strapi-docker/blob/master/examples
- Strapi V4: https://github.com/strapi-community/strapi-tool-dockerize

```bash
docker build \
  --build-arg NODE_ENV=production \
  # --build-arg STRAPI_URL=https://api.example.com \ # Uncomment to set the Strapi Server URL
  -t mystrapiapp:latest \ # Replace with your image name
  -f Dockerfile.prod .


npx @strapi-community/dockerize new
  --dbclient=mysql
  --dbhost=localhost
  --dbport=1234
  --dbname=strapi
  --dbusername=strapi
  --dbpassword=strapi
  --projecttype=js
  --packagemanager=yarn
  --usecompose=false
  --env=both
```
