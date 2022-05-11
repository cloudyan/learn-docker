# mysql

初次启动

```bash
docker run -itd \
  --name demo-mysql \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=xiaohan \
  mysql:8

# 查看
docker ps

docker stop mysql_8
docker container ls -a
docker container remove mysql_8

```

