# sonarqube

## SonarQube 代码质量检测平台

Sonar (SonarQube)是一个开源平台，用于管理源代码的质量.

Sonar 不只是一个质量数据报告工具，更是代码质量管理平台。

```bash
docker run --name db -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d postgres

docker run --name sq --link db -e SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonar -p 9000:9000 -d sonarqube

docker cp ~/sonarqube/plugins/sonar-gitlab-plugin-4.1.0.jar e5a785409b80:/opt/sonarqube/extensions/plugins
```

## 环境变量配置

- sonar.jdbc.username : 数据库账号
- sonar.jdbc.password : 数据库密码
- sonar.jdbc.url: jdbc : 数据库连接驱动

映射配置:

- /opt/sonarqube/conf : 配置文件，例如 sonar.properties
- /opt/sonarqube/data：数据文件，例如嵌入式H2数据库和Elasticsearch索引
- /opt/sonarqube/logs：包含有关访问，Web进程，CE进程，Elasticsearch日志的SonarQube日志
- /opt/sonarqube/extensions：插件，例如语言分析器 经提供了支持的数据库（Oracle除外）的驱动程序。

不要更换提供的驱动程序；他们是唯一受支持的。对于Oracle，请将JDBC驱动程序复制到中$SONARQUBE_HOME/extensions/jdbc-driver/oracle。


参考：

- https://www.jianshu.com/p/9080642d4179
- https://www.jianshu.com/p/edcb6f9ca394
- https://blog.csdn.net/aixiaoyang168/article/details/77565756
- https://github.com/SonarQubeCommunity/sonar-l10n-zh
- https://juejin.im/post/58a539488d6d8100581fd7f5
- https://docs.sonarqube.org/display/PLUG/Plugin+Library
