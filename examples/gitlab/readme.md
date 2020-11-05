# gitlab

- gitlab/gitlab-ce

```bash
docker run -d \
  -p 443:443 \
  -p 22:22 \
  -p 80:80 \
  --name gitlab \
  --restart always \
  -v ~/docker/gitlab/config:/etc/gitlab \
  -v ~/docker/gitlab/logs:/var/log/gitlab \
  -v ~/docker/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce
```
