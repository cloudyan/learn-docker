# vite-project

```bash
pnpm create vite

# 选择 react+typescript

pnpm i
pnpm run dev
pnpm run build
# 输出 dist
```

构建镜像与运行容器

```bash
# 构建镜像
docker build -t hello:first -f first.dockerfile .

# 运行容器（重新命令）
docker run -td --name hello-1 -p 5173:5173 hello:first npm run dev -- --host 0.0.0.0
# 或多行
docker run -td \
  --name hello-1 \
  -p 5173:5173 \
  hello:first \
  npm run dev -- --host 0.0.0.0
```

错误

```bash
ERROR: failed to solve: failed to compute cache key: failed to read expected number of bytes: unexpected EOF
```

```bash
Unable to pull node:latest

failed to read expected number of bytes: unexpected EOF
```

原因分析

可能的原因如下：

- 基础镜像所在仓库与构建集群间的网络不佳，例如跨境。
- 触发了仓库的限流机制，例如 Dockerhub 限制镜像拉取数量。

解决方案

建议将您的基础镜像存储至火山引擎镜像仓库 CR，在 Dockerfile 中从镜像仓库 CR 下载基础镜像。

当项目安装过依赖时，需要添加 .dockerignore 文件，忽略 node_modules 文件夹。

不然构建镜像，`COPY . .` 等导致镜像运行不正常。

参考：

- https://www.volcengine.com/docs/6461/191606
- https://www.volcengine.com/docs/6461/163867
