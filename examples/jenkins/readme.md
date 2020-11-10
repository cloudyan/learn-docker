# jenkins docker

- https://www.jenkins.io/zh/doc/book/installing/
- 一些示例
  - https://github.com/jenkins-docs

## install

```bash

docker run \
  --name jenkins \
  -u root \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v ~/docker/jenkins/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v ~/docker/jenkins/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean


```

遇到问题

Getting “Permission Denied” error when pulling a docker image in Jenkins docker container on Mac

解决权限问题/以root用户运行

```bash
docker exec -it -u root jenkins bash

# doesn’t have usermod command？
apk --no-cache add shadow

usermod -aG root jenkins

docker exec -it jenkins bash
id jenkins
uid=1000(jenkins) gid=1000(jenkins) groups=1000(jenkins),0(root),1(daemon)
```

还报错误 Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

参见 https://medium.com/crowdbotics/a-complete-one-by-one-guide-to-install-docker-on-your-mac-os-using-homebrew-e818eb4cfc3

This is because on macOS the docker binary is only a client and you cannot use it to run the docker daemon, because Docker daemon uses Linux-specific kernel features, therefore you can’t run Docker natively in OS X. So you have to install docker-machine in order to create VM and attach to it. ([source](https://stackoverflow.com/questions/44084846/cannot-connect-to-the-docker-daemon-on-macos/49719638#49719638))

mac:

```bash
launchctl list
brew services start xxx
brew services restart xxx
brew services stop xxx
```

```bash
systemctl daemon-reload
sudo service docker restart
sudo service docker status
```

```bash
brew cask install docker
brew install docker-machine
brew cask install virtualbox
docker-machine create --driver virtualbox default
docker-machine env default
```

- https://stackoverflow.com/questions/44084846/cannot-connect-to-the-docker-daemon-on-macos
- https://docs.docker.com/docker-for-mac/troubleshoot/
  - `export DOCKER_HOST=unix:///var/run/docker.sock`
- https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617/9

参考：

- https://medium.com/swlh/getting-permission-denied-error-when-pulling-a-docker-image-in-jenkins-docker-container-on-mac-b335af02ebca
- https://testerhome.com/topics/9426
- https://www.runoob.com/docker/docker-machine.html
