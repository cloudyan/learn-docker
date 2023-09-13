# wordpress

适用

```bash
docker-compose up -d
```

```bash
# https://gist.github.com/dougalcorn/7815725

# 总是提示 3306 端口占用，但是
# lsof -i :3306 无结果
# netstat -an | grep 3306
# 结果如下，但没有 127.0.0.1:3306 类似的数据
# tcp46      0      0    *.3306     *.*      LISTEN
# ps -ef | grep mysql
# 出现了此类进程 /usr/local/mysql
# 强制关闭，则*.3306类似数据消失
```

```bash
# docker-compose -f test.yml up
# https://github.com/yeasy/docker_practice/pull/415 撤销 PR

# https://qiita.com/vc7/items/e88026c75f2280f95ed4
# docker volume ls -q
```

关于 db_data 命名卷

- https://yeasy.gitbooks.io/docker_practice/content/image/config/volume.html
- https://yeasy.gitbooks.io/docker_practice/content/data_management/volume.html

无主的数据卷可能会占据很多空间，要清理请使用以下命令

```bash
docker volume prune
```

一些错误

不推荐使用 links

```bash
# Linking is a legacy feature. Please use "user defined networks":
# https://stackoverflow.com/questions/41768157/how-to-link-container-in-docker/41768466
# sudo docker run --name rabbitmq -p 8080:80 -d --network mynetwork rabbitmq

# https://cntnr.io/setting-up-wordpress-with-docker-262571249d50
# https://docs.docker.com/compose/networking/



# info: No 'wp-config.php' found in /var/www/html, but 'WORDPRESS_...' variables supplied; copying 'wp-config-docker.php' (WORDPRESS_DB_HOST WORDPRESS_DB_NAME WORDPRESS_DB_PASSWORD WORDPRESS_DB_USER)

# [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
    # [Warning] [MY-010918] [Server] 'default_authentication_plugin' is deprecated and will be removed in a future release. Please use authentication_policy instead.

```
