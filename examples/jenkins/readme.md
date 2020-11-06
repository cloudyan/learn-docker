# jenkins docker

- https://www.jenkins.io/zh/doc/book/installing/
- 一些示例
  - https://github.com/jenkins-docs

## install

```bash
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v ~/docker/jenkins/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean
```



