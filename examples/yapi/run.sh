
# 升级 Yapi

# 1、停止并删除旧版容器
# docker rm -f yapi

# 2、获取最新镜像
# docker pull registry.cn-hangzhou.aliyuncs.com/anoy/yapi

# 3、启动新容器
docker run -d \
  --name yapi \
  --link mongo-yapi:mongo \
  --workdir /api/vendors \
  -p 3000:3000 \
  registry.cn-hangzhou.aliyuncs.com/anoy/yapi \
  server/app.js
