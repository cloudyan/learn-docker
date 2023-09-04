FROM node:18

WORKDIR /app

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm i -g pnpm

COPY . .

RUN pnpm install
RUN npm run build

EXPOSE 3000

CMD [ "hs", "./dist/main.js" ]
