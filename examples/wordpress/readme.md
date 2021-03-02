# wordpress

```bash
# https://gist.github.com/dougalcorn/7815725

# 总是提示 3306 端口占用，但是
# lsof -i :3306 无结果
# netstat -an | grep 3306
# 结果如下，但没有 127.0.0.1:3306 类似的数据
# tcp46      0      0    *.3306     *.*      LISTEN
# ps -ef | grep mysql
# 出现了此类进程 /usr/local/mysql
# 强制关闭，则*.3306类似数据消失
```
