# FROM node:latest
FROM node:18-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm i -g pnpm serve
RUN pnpm install

COPY . .

RUN npm run build

EXPOSE 8080

CMD ["serve", "./dist", "-p", "8080"]

# docker build -f dockerfile/serve.dockerfile -t hello:2 .
# docker run -td --name hello-2 -p 8080:8080 hello:2
