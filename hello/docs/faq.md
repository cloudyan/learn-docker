# 常见问题

构建报错

```bash
ERROR: failed to solve: failed to compute cache key: failed to read expected number of bytes: unexpected EOF
```

拉取镜像时报错

```bash
docker pull node:20-alpine

Unable to pull node:latest

failed to read expected number of bytes: unexpected EOF
```

原因分析

可能的原因如下：

- 基础镜像所在仓库与构建集群间的网络不佳，例如跨境。
- 触发了仓库的限流机制，例如 Dockerhub 限制镜像拉取数量。

解决方案

建议将您的基础镜像存储至火山引擎镜像仓库 CR，在 Dockerfile 中从镜像仓库 CR 下载基础镜像。

```bash
# 查看配置
cat ~/.docker/daemon.json

# 确认网络连接
ping hub.docker.com

# 清除缓存
docker system prune -a --volumes
# 清理掉所有无用的镜像、容器和卷（注意备份需要的镜像和容器）
```

问题 2

pnpm 安装有 node_modules 时，构建镜像未按预期执行。

当项目安装过依赖时，需要添加 .dockerignore 文件，如 node_modules 文件夹。

不然构建镜像，`COPY . .` 等导致镜像运行不正常。

注意，可能会忽略 COPY 命令所需要的文件，如设置忽略 dist 目录，那么 nginx 镜像示例中 `COPY dist .` 会无效。

查看端口占用

```bash
# 端口使用情况
netstat -ntulp | grep 5173

# 查看端口占用
lsof -i:端口号

# Mac 下查看占用端口的进程
lsof -i tcp:5173

# 杀进程
kill -9 PID
```

### 为什么 Dockerfile 有的时候需要加 `ln -s /sbin/runc /usr/bin/runc`

在 Dockerfile 中使用  `ln -s /sbin/runc /usr/bin/runc` 的原因是为了解决某些 Linux 发行版中 runc 的路径问题。

runc 是一个用于运行容器的工具，它是 Docker 的一个子项目，也是 OCI（Open Container Initiative）的一个标准。在某些 Linux 发行版中，runc 的路径可能不是 `/usr/bin/runc`，而是 `/sbin/runc` 或其他路径。这会导致在构建 Dockeer 镜像时无法找到 runc，从而导致构建失败。为了解决这个问题，可以在 Dockerfile 中使用 `ln -s /sbin/runc /usr/bin/runc` 命令，将 `/sbin/runc` 软链接到 `/usr/bin/runc`，这样就可以在构建镜像时找到 runc。

需要注意的是，这个问题只是出现在某些 Linux 发行版中，如果你的 Linux 发行版中 runc 的路径是 `/usr/bin/runc`，那么就不需要在 Dockerfile 中使用 `ln -s /sbin/runc /usr/bin/runc` 命令。

参考：

- https://www.volcengine.com/docs/6461/191606
- https://www.volcengine.com/docs/6461/163867
