FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm i -g pnpm

COPY . .

RUN pnpm install
# RUN npm run build

EXPOSE 5173

CMD ["pnpm", "run", "dev"]
