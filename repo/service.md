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

常用命令

```bash
docker pull [选项] [Docker Registry地址]<仓库名>:<标签>

docker exec -it CONTAINER bash

docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```

启动示例

```bash
docker run \
  -d \
  --rm
  --name <YOUR-NAME> \
  -p 27017:27017 \
  -v /data/db:/data/db \
  mongo:3.4
```

- `--rm`:
- `--name <YOUR-NAME>`: 容器命名
- `-p 27017:27017`: 将容器的27017 端口映射到主机的27017 端口
- `-v $PWD/db:/data/db` 将主机中当前目录下的db挂载到容器的/data/db，作为mongo数据存储目录

容器链接

```bash
docker run \
  -d \
  --rm \
  -p 8081:8081 \
  --link YOUR_MONGODB_CONTAINER:mongo\
  mongo-express
```

- `--link YOUR_MONGODB_CONTAINER:mongo`: mongo 是别名

## 热门镜像操作

#

### nginx

docker run --name mynginx -d -p 8080:80 -v /some/nginx.conf:/etc/nginx/nginx.conf nginx


## sonarqube

```bash
docker run --name db -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d postgres

docker run --name sq --link db -e SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonar -p 9000:9000 -d sonarqube

docker cp ~/sonarqube/plugins/sonar-gitlab-plugin-4.1.0.jar e5a785409b80:/opt/sonarqube/extensions/plugins
```

https://www.jianshu.com/p/edcb6f9ca394
https://blog.csdn.net/aixiaoyang168/article/details/77565756
https://github.com/SonarQubeCommunity/sonar-l10n-zh
https://juejin.im/post/58a539488d6d8100581fd7f5
https://docs.sonarqube.org/display/PLUG/Plugin+Library

## mysql

```bash
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql

docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql

```

## redis

```bash
docker run --name some-redis -d -p 6379:6379 redis

# 持久存储
docker run --name some-redis -d -p 6379:6379 redis redis-server --appendonly yes

# 链接到容器
docker run --name some-app --link some-redis:redis -d application-that-uses-redis

```

## nodejs

```bash
docker run -it --rm --name my-running-app my-nodejs-app
```

## busybox

BusyBox 是一个集成了一百多个最常用 Linux 命令和工具（如 cat、echo、grep、mount、telnet 等）的精简工具箱，它只需要几 MB 的大小，很方便进行各种快速验证，被誉为“Linux 系统的瑞士军刀”。

```bash
docker run -it busybox

```

## centos

```bash
docker run -it —name mycentos centos bash

```

docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

ElasticSearch
ElasticSearch-Head



docker run \
  --rm \
  --name wordpress \
  --volume "$PWD/docker/wordpress":/var/www/html \
  php

docker run \
  -d \
  --rm \
  --name wordpressdb \
  --env MYSQL_ROOT_PASSWORD=123456 \
  --env MYSQL_DATABASE=wordpress \
  mysql

docker run \
  -d \
  -p 9003:80 \
  --rm \
  --name wordpress \
  --env WORDPRESS_DB_PASSWORD=123456 \
  --link wordpressdb:mysql \
  --volume "$PWD/docker/wordpress":/var/www/html \
  wordpress


docker run -d --name es -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2

- https://www.cnblogs.com/jianxuanbing/p/9410800.html
- https://blog.csdn.net/belonghuang157405/article/details/83301937

参考：

- https://blog.csdn.net/qaz5209103/article/details/82563053
- https://yeasy.gitbooks.io/docker_practice/appendix/repo/
- https://jenkins.io/zh/doc/book/installing/

