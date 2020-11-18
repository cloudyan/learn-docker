# redis

```bash
docker run --name some-redis -d -p 6379:6379 redis

# 持久存储
docker run --name some-redis -d -p 6379:6379 redis redis-server --appendonly yes

# 链接到容器
docker run --name some-app --link some-redis:redis -d application-that-uses-redis

```
