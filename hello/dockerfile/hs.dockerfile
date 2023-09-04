FROM node:18

WORKDIR /app

COPY ../dist .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install -g http-server

EXPOSE 8080

CMD ["http-server", "-p", "8080"]
