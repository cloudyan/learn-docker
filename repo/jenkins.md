# jenkins

- https://jenkins.io/zh/doc/book/installing/#setup-wizard

docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v ~/docker/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

-v "$HOME":/home \
