FROM node:12
COPY ./ /admin
WORKDIR /admin
RUN npm install && npm run build

FROM nginx
RUN mkdir /admin
COPY --from=0 /admin/dist /admin
COPY nginx.conf /etc/nginx/nginx.conf
