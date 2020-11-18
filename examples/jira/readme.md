# mysql

https://blog.csdn.net/hxpjava1/article/details/78406495

docker run -d \
  --name=mysql-db \
  --hostname=mysql-db \
  -p 20010:3306 \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -e MYSQL_DATABASE=jira \
  -e MYSQL_USER=jira \
  -e MYSQL_PASSWORD=jira \
  mysql:5.6

docker run -d \
  --name jira \
  --hostname jira \
  --link mysql-db:mysql \
  -p 20011:8085 \
  -p 20012:8080 \
  -p 20013:8443 \
  -p 20014:8090 \
  -p 20015:22 \
  idoall/jira

docker exec jira sh service jira stop && docker exec jira sh service jira start
