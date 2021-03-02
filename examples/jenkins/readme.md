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

- https://stackoverflow.com/questions/44084846/cannot-connect-to-the-docker-daemon-on-macos
- https://docs.docker.com/docker-for-mac/troubleshoot/
  - `export DOCKER_HOST=unix:///var/run/docker.sock`
- https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617/9

docker-machine

```bash
brew cask install docker
brew install docker-machine
brew cask install virtualbox

docker-machine create --driver virtualbox default
docker-machine create -d virtualbox default
# 查看帮助
docker-machine create --driver virtualbox --help

docker-machine env default

docker-machine create -d generic \
  --generic-ip-address=123.59.188.19 \
  --generic-ssh-user=root \
  --generic-ssh-key ~/.ssh/id_rsa \
  dev
```

你也可以在创建时加上如下参数，来配置主机或者主机上的 Docker。

- `--engine-opt dns=114.114.114.114`配置 Docker 的默认 DNS
- `--engine-registry-mirror https://registry.docker-cn.com`配置 Docker 的仓库镜像
- `--virtualbox-memory 2048` 配置主机内存
- `--virtualbox-cpu-count 2` 配置主机 CPU

MacOS xhyve 驱动

xhyve 驱动 GitHub: https://github.com/zchee/docker-machine-driver-xhyve，`xhyve`是`MacOS`上轻量化的虚拟引擎，使用其创建的 Docker Machine 较 VirtualBox 驱动创建的运行效率要高。


```bash
$ brew install docker-machine-driver-xhyve
......
$ docker-machine create \
  -d xhyve \
  # --xhyve-boot2docker-url ~/.docker/machine/cache/boot2docker.iso \
  --engine-opt dns=114.114.114.114 \
  --engine-registry-mirror https://registry.docker-cn.com \
  --xhyve-memory-size 2048 \
  --xhyve-rawdisk \
  --xhyve-cpu-count 2 \
  xhyve

注意：非首次创建时建议加上`--xhyve-boot2docker-url ~/.docker/machine/cache/boot2docker.iso`参数，避免每次创建时都从 GitHub 下载 ISO 镜像。

更多参数请使用`docker-machine create --driver xhyve --help`命令查看。
```

参考：

- https://medium.com/swlh/getting-permission-denied-error-when-pulling-a-docker-image-in-jenkins-docker-container-on-mac-b335af02ebca
- https://testerhome.com/topics/9426
- docker-machine
  - https://www.runoob.com/docker/docker-machine.html
  - https://www.qikqiak.com/k8s-book/docs/9.Docker%20Machine.html
