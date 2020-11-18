# Docker

如何查看 docker 容器的相关配置信息，如暴露的端口，数据配置路径等

<a href="http://play-with-docker.com"><img src="https://github.com/play-with-docker/stacks/raw/cff22438cb4195ace27f9b15784bbb497047afa7/assets/images/button.png" alt="Try in PWD"></a>

## 常用服务

1. mongo, mysql, postgres, redis
2. nginx, node
3. sonarqube, yapi
4. github ci, jenkins
5. busybox, alpine, centos, ubuntu
6. rabbitmq, ElasticSearch
7. 制作 docker

BusyBox 是一个集成了一百多个最常用 Linux 命令和工具（如 cat、echo、grep、mount、telnet 等）的精简工具箱，它只需要几 MB 的大小，很方便进行各种快速验证，被誉为“Linux 系统的瑞士军刀”。

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
- 保存后重新操作即可



参考:

- http://yeasy.gitbooks.io/docker_practice/content/
- https://github.com/kstaken/dockerfile-examples
- https://github.com/komljen/dockerfile-examples
- https://github.com/docker-library/docs
