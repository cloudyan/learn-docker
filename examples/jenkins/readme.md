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
  -v /usr/local/bin/docker:/usr/bin/docker \
  jenkinsci/blueocean
```

遇到问题

Getting “Permission Denied” error when pulling a docker image in Jenkins docker container on Mac

解决权限问题/以root用户运行

```bash
docker exec -it -u root jenkins bash

usermod -aG root jenkins
# doesn’t have usermod command？
# apk --no-cache add shadow

id jenkins
uid=1000(jenkins) gid=1000(jenkins) groups=1000(jenkins),0(root),1(daemon)
```

- https://medium.com/swlh/getting-permission-denied-error-when-pulling-a-docker-image-in-jenkins-docker-container-on-mac-b335af02ebca
