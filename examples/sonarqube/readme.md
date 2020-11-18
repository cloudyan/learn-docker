# SonarQube代码质量检查工具简介

Sonar (SonarQube)是一个开源平台，用于管理源代码的质量.

Sonar 不只是一个质量数据报告工具，更是代码质量管理平台。

```bash
docker run --name db -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d postgres

docker run --name sq --link db -e SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonar -p 9000:9000 -d sonarqube

docker cp ~/sonarqube/plugins/sonar-gitlab-plugin-4.1.0.jar e5a785409b80:/opt/sonarqube/extensions/plugins
```

https://www.jianshu.com/p/edcb6f9ca394
https://blog.csdn.net/aixiaoyang168/article/details/77565756
https://github.com/SonarQubeCommunity/sonar-l10n-zh
https://juejin.im/post/58a539488d6d8100581fd7f5
https://docs.sonarqube.org/display/PLUG/Plugin+Library
