# strapi

问题：

- https://github.com/strapi/strapi-docker/issues/225

参考：

- https://github.com/strapi/strapi-docker
- https://github.com/strapi/strapi-docker/blob/master/examples

```bash
docker build \
  --build-arg NODE_ENV=production \
  # --build-arg STRAPI_URL=https://api.example.com \ # Uncomment to set the Strapi Server URL
  -t mystrapiapp:latest \ # Replace with your image name
  -f Dockerfile.prod .
```
