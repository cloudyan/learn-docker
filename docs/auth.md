# auth

访问registry需要先使用命令 docker login 进行登录，登录成功之后，会在文件 `~/.docker/config.json` 中生成 auth 串，在后续对docker进行pull和push的时候，这个auth就是凭证。

```json
{
  "auths": {
    "registry.cn-shanghai.aliyuncs.com": {
      "auth": "ZG9ja2Vyc2hhbjpkb2NrZXJwYXNz"
    }
  }
}
```

这其中的auth，其实就是账号密码的base64结果。以账号 dockershan，密码 dockerpass 为例，执行命令：

```bash
~ echo -n "dockershan:dockerpass" | base64
ZG9ja2Vyc2hhbjpkb2NrZXJwYXNz
```

得到的结果就是上面的 auth 值。

经测试, 上述方法在拉取
