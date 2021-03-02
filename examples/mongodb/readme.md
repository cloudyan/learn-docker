## mongo

一些[配置](https://docs.mongodb.com/manual/administration/configuration/)参数

```yaml
# mongod --config /etc/mongod.conf
# mongod -f /etc/mongod.conf

fork = true
bind_ip = localhost
port = 27017
quiet = true
dbpath = /srv/mongodb
logpath = /var/log/mongodb/mongod.log
logappend = true
journal = true
```

https://hub.docker.com/_/mongo

```bash
docker run \
  -u root \
  -d \
  --rm \
  --name <YOUR-NAME> \
  -p 27017:27017 \
  -v $PWD/db:/data/db \
  -v $PWD/configdb:/data/configdb \
  mongo:4.2
  --config /etc/mongod.conf
  --auth

docker run \
  -d \
  --name mongo-blog \
  -p 27017:27017 \
  -v ~/db/mongo:/data/db \
  mongo
```

参数解释：

- `-v $PWD/backup:/data/backup`: 备份文件
- `-v $PWD/mongod.conf:/data/configdb`: 启动的配置文件目录挂载到容器的/data/configdb
- `--config /etc/mongod.conf`: `--config` 是mongod参数，也可以使用`-f`，确保`mongod.conf`存在
  - 此参数是否也可以使用 -v 挂载
- `--auth`: 启动权限验证

如果启用权限验证，需要进入容器创建用户

```bash
docker exec -it mongo-xxx bash

use admin
db.createUser({ # 先创建root用户
  user: 'admin',
  pwd: '123456',
  roles: [{role:'root',db:'admin'}],
})

db.auth('admin','123456') # 认证

# 然后创建普通用户
```

docker-compose.yml:

```yaml
version: '4.2'
services:
 mongodb_server:
    container_name: mongodb_server
    image: mongo:4.2
    env_file: './dev.env'
    command:
        - '--auth'
        - '-f'
        - '/etc/mongo.conf'
    volumes:
        - '/home/sa/data/mongod.conf:/etc/mongod.conf'
        - '/home/sa/data/db:/data/db'
    ports:
        - '37017:27017'
```

使用了 `docker run -d` 运行 mongo，还是退出，log 报错 `***aborting after fassert() failure`

解决办法

> Does the file /tmp/mongodb-27017.sock exist? If so try to delete it, ie. 'sudo rm /tmp/mongodb-27017.sock'.

是因为 mongodb 升级导致的问题，按照网上的方法尝试了以下操作

```
rm /data/db/mongod.lock
rm /data/db/WiredTiger.lock

chmod -R 777 /data/db

但是无效，只能临时改目录了，这真是个灾难，还好我没有用的数据
```

参考：

- https://stackoverflow.com/questions/37063662/docker-mongodb-config-file
- https://stackoverflow.com/questions/34555603/mongodb-failing-to-start-aborting-after-fassert-failure
- https://www.mkyong.com/mongodb/mongodb-failed-to-unlink-socket-file-tmpmongodb-27017/
- https://jira.mongodb.org/browse/SERVER-28601
