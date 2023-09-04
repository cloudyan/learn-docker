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
