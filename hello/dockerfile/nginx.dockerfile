FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html

# docker build -f dockerfile/nginx.dockerfile -t hello:3 .
# docker run -td --name hello-3 -p 8090:80 hello:3
