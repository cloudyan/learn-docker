# FROM node:latest
FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm i -g pnpm serve
RUN pnpm install

COPY . .

# RUN npm run dev -- --host 0.0.0.0

EXPOSE 5173

CMD ["npm", "run", "dev"]
# CMD ["sleep", "10m"]

# docker build -f dockerfile/first.dockerfile -t hello:1 .
# docker run -td --name hello-1 -p 5173:5173 hello:1 npm run dev -- --host 0.0.0.0
