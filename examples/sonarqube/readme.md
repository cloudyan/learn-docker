# sonarqube

代码质量检测平台

环境变量配置:

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
