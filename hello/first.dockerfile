# FROM node:latest
FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm i -g pnpm
RUN pnpm install

COPY . .

# RUN npm run build

EXPOSE 5173

CMD ["npm", "run", "dev"]
# CMD ["sleep", "10m"]
