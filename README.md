# docker

## 示例

- test
  - hello
- os
  - CentOS
  - Ubuntu
  - Fedora
  - Raspberry Pi
  - MacOS
  - Windows
- db
  - MySQL
  - Redis
  - MongoDB
  - CouchDB
  - PostgreSQL
  - RethinkDB
- service
  - PHP
  - Node.js
  - Nginx
  - Apache
  - SonarQube
- CI/CD
  - Jenkins
  - GitHub Actions
  - Drone
  - Travis CI
  - LinuxKit
- base
  - BusyBox
  - Alpine
- app
  - WordPress
  - vue-pro-admin
  - docpad
  - icecoder
  - ghost

## 镜像加速

https://docker_practice.gitee.io/zh-cn/install/mirror.html

- [Azure 中国镜像](https://github.com/Azure/container-service-for-azure-china/blob/master/aks/README.md#22-container-registry-proxy) https://dockerhub.azk8s.cn
- [七牛云加速器](https://kirk-enterprise.github.io/hub-docs/#/user-guide/mirror) https://reg-mirror.qiniu.com

## 常见问题

解决Error response from daemon: Get https://registry-1.docker.io/v2/library/hello-world/manifests/ EOF 问题

问题是将 image 文件从仓库抓取到本地一直报错，

解决办法是

- `dig @114.114.114.114 registry-1.docker.io`找到可用IP
- 修改 `/etc/hosts` 设置可用 ip，如
  - `52.4.20.24 registry-1.docker.io`

参考:

- http://yeasy.gitbooks.io/docker_practice/content/
- https://github.com/kstaken/dockerfile-examples
- https://github.com/komljen/dockerfile-examples
