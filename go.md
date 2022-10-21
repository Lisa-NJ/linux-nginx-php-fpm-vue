[go 安装]
1. 下载二进制包：go1.16.15.linux-amd64.tar.gz
2. 将下载的二进制包解压至 /usr/local目录。
```bash
$ tar -C /usr/local -xzf go1.16.15.linux-amd64.tar.gz
```
3. 将 /usr/local/go/bin 目录添加至 PATH 环境变量：
```bash
$ export PATH=$PATH:/usr/local/go/bin
```
以上只能暂时添加 PATH，关闭终端下次再登录就没有了。
4. 可以编辑 ~/.bash_profile 或者 /etc/profile，并将以下命令添加该文件的末尾，这样就永久生效了：
export PATH=$PATH:/usr/local/go/bin

```bash
$ source /etc/profile
# 或者
$ source ~/.bash_profile
```

[json / go]
JSON is used as the de-facto standard for data serialization
How to marshal (encode) and unmarshal (decode) JSON in Go

[development settings]
	- Zotac: 10.1.1.134 + /hadaly/Hadaly/Config.pm 'PLAYLIST_ADDR' => 'http://10.1.1238:8000'
	- $ sudo ufw allow 8000 + 80
	- ~/work-lisa/api/public - $ php -S 0.0.0.0:8000 index.php

