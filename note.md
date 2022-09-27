[English]
Dash delimited format
a comma-separated list of parameters
touch base - to talk to someone for a short time to find out how they are or what they think about something
GUID - Globally Unique Identifier
UUIU - Universaly Unique Identifiers
backwards compatibility with previous version of Rex API
The US government no longer recognizes SHALL as a legal term and recommends using MUST instead.
When used in a question, which form more often indicates that the asker is hesitant? - should
a bona fide sample of Lincoln's handwriting - authentic, true

z

[linux shortcut]
```
Ctrl+Alt+T ==> open the terminal
Window + <-/-> ==> left half / right half

```
[Postman]
Cloud Agent Error: Can not send requests to localhost. Select a different agent.
	- 不能给 localhost 发请求

[Rex API]
	- The Rex application is accessible at https://app.rexsoftware.com
	- The API supports 2 headers - Authorization and X-api-option
	- The token is GUID which represents the session you are logged into. 
	- The X-api-option header allows you to specify options that modify the API request and response handling.

```js
fetch("https://api.rexsoftware.com/v1/rex/Contacts/read", {
  body: JSON.stringify({id: 1}),
  headers: {
    "Accept": "application/json, text/javascript, */*; q=0.01",
    "Authorization": `Bearer ${YOUR_TOKEN}`,
    "Content-Type": "application/json",
    "X-Api-Option": "use_status_codes=true,add_request_prefixes=true,use_strict_arguments=false,strip_response_prefixes=false"
  },
  method: "POST"
}).then(response => response.json())
```

```bash
curl --request POST \
  --url https://api.rexsoftware.com/v1/rex/Contacts/read \
  --header 'accept: application/json, text/javascript, */*; q=0.01' \
  --header 'authorization: Bearer ${YOUR_TOKEN}' \
  --header 'content-type: application/json' \
  --header 'x-api-option: use_status_codes=true,add_request_prefixes=true,use_strict_arguments=true,strip_response_prefixes=true' \
  --data '{"id": 1}'
```

[REST API & RPC API]
- https://www.geeksforgeeks.org/difference-between-rest-api-and-rpc-api/

REST APIs
	- Representational State Transfer
	- A REST API endpoint is a URL that utilizes HTTP verbs to execute CRUD (Create Read Update Delete) operations over the resources. These HTTP verbs are GET, POST, PATCH, PUT and DELETE. It focuses on providing resources from the server to the clients. 
	- Allows Standard-based protection with the use of OAuth protocols to verify REST requests.
	- payload is quite big hence the entire files get back while you needed one field
	- loses the ability to maintain state in REST

RPC APIs
	- Remote Procedure Call 
	- They have lightweight payloads, therefore, provides high performance
	- easy to understand and work as the action is part of the URL
	- it is not well standardized

```
                  REST                                                  RPC
   1    REST is resource-oriented.	                       RPC is action-oriented.
   2    Supports GET, POST, PUT, PATCH, and DELETE.            only supports GET and POST
   3    It provides flexibility for hardware architecture      no flexibility in RPC for hardware architecture
   4    It supports hypermedia and hyperlinks                  It does not supports hypermedia and hyperlinks
   5    Allows to specify Content-types or accept headers      Require payloads of a few data types as XML for XML-RPC.

```

	
[Payload within an API]
 - https://blog.hubspot.com/website/what-is-payload
Payload is the data you send over the computer network. 
```
data ----- overhead - to show the source or destination of the payload, is removed from the view once reaching its destination
       |
       --- payload - the body of your HTTP request and response message when you make an API request.
```

[call API - browser]
http://localhost/weather.php?_path=/status
http://localhost/weather.php?_path=/parameters
http://localhost/weather.php?_path=/getShedule
https://newsapi.org/v2/top-headlines?apiKey=bcdc50d80ac04d7a9afcaee612146a7b&q=apple <!-- news -->

[call API - cmd / curl]
``` bash
$ curl http://localhost/weather.php?_path=/status
$ curl http://localhost/weather.php?_path=/parameters
$ curl http://localhost/weather.php?_path=/getSchedule -X POST -d '{"api_key":"ce79aef7a491450082040610222607", "location":"Australia/Adelailde", "duration":10}' | tail -n1 > output
$ jq . output
$ curl http://localhost/test-lisa.php?_path=/status
$ curl http://localhost/test-lisa.php?_path=/parameters
$ curl http://localhost/test-lisa.php?_path=/getSchedule -X POST -d '{"duration":5}' | jq . 
```
[call API - code / php]
``` php
	$baseurl = 'https://newsapi.org/v2/top-headlines';
	$api_key = 'bcdc50d80ac04d7a9afcaee612146a7b';
	$queryStr = 'apple';

	$api_key = urlencode($api_key);
	$userAgent = $_SERVER['HTTP_USER_AGENT'];

	$req = curl_init($baseurl . "?apikey=$api_key&q=$queryStr");  // 'api_key'&'q' - from api provider
	curl_setopt($req, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($req, CURLOPT_USERAGENT, $userAgent);
	$output = curl_exec($req);

	file_put_contents($cache_name, $output);

	$json = json_decode($output, true);

	$newsArr = $json['articles'];
```

[IRC] 
Internet Relay Chat
IRC Client
IRC Server

[API]
https://www.youtube.com/watch?v=Yzx7ihtCGBs&t=6
	- The system we want to communicate with
	- We can't access the internals of the system
	- We can only talk to the API layer
	- End point / input required + result
	- API Key: a unique ID to identify your App

[APT]
APT (Advanced Package Tool) is the command-line tool to interact with this packaging system. There are already dpkg commands to manage it, but apt is a more user-friendly way to handle packages. You can use it to find and install new packages, upgrade packages, clean your packages, etc.

There are two main tools around APT: apt-get and apt-cache. apt-get is for installing, upgrading, and cleaning packages, while apt-cache command is used for finding new packages. 

[memcached]
A distributed memory cache system that speeds up dynamic Web applications thanks to Memcached, an open source, distributed application cache system. In order to avoid accessing external databases and APIs regularly, the system caches the data and objects in memory.

[Chrome]
F12 --> Inspect on Chrome
Inspect / network / headers --> see the server infor

Apache, IIS, Nginx, sffe
If the website uses CDN -- Cloudflare
website uses HTTP accelerator -- Varnish

[curl]
GitHub - forked curl.md
$ curl -X POST -H -d ...

Charlie's
```
\1. Environment setting up for run and dev && How to check for each one? Phalcon + mariadb

你可以直接run api那个后端看是否能启动，如果有报错查看具体报错

或者 通过$ php -m  查看现有modules，你之前看到的那个文件里应该有list所有需要的modules.

Mariadb直接安装就可以了，但是api里面有个配置文件具体名字我忘了，里面需要修改连接的账号密码和端口，如果有问题的话你在run api 服务器的时候也会报错. 但是本地的DB copy我没有，当时我没有服务器的访问权限,他们直接给了我一个DB的copy.

具体的安装我记得当时是参考的这个网站一步步安装的

https://docs.phalcon.io/4.0/en/installation


\2. Structure of E2V-related modules, helper-public && helpers

主要就是helpers那个文件夹里有几个function调用，其余的没用.

那几个functions的作用也只是格式化数据类型为zotac那一端能读懂的类型播放。helper-public那个文件夹差不多就算是helper的README, 单纯告诉你要怎么样的格式. 实际上你如果按照那个格式手写个txt给zotac也能放。


\3. What skills to learn at this stage and route?

主要先把环境搭好能把api和vue两个run起来,后面主要看看vue就行。我在那上班的时候基本上没动过api那一端，他们也基本没怎么动，都是原来写好的,也没人愿意大改。


\4. Add another public API means:？

比如现在有天气的，real estate的，carswapde，应该是指老爷子想再找个public api的接口拿数据再做一个e2v的内容吧，


\5. how to debug？

后端那一块基本就看run api server的terminal报错，以及前端浏览器里response的内容了

前端就直接看浏览器的报错了.


a current example
Concepts - pipe the output to jq - ? / E2V-compatible endpoint = public API ?

E2V Debug直接run那个php文件就能显示报错，或者你从浏览器通过url打开那个文件并且调用参数，如果需要。


\6. Other parts? - DealCodes / AWS / IRC

这几个先不用管了，老爷子天天说这个，但是具体是什么东西都没人知道。

Dealcodes目前有一个项目，但是那个只是测试的，没有太多东西，很久没人维护了，modules很多都过期了，还不如重写

```

[Apache2]
```
/etc/apache2/
|-- apache2.conf
|       `--  ports.conf
|-- mods-enabled
|       |-- *.load
|       `-- *.conf
|-- conf-enabled
|       `-- *.conf
|-- sites-enabled
|       `-- *.conf
```
[Apache2 vs Nginx]
https://kinsta.com/blog/nginx-vs-apache/#nginx-modules
The biggest difference -- the way they handle requests
	1. Apache processes requests with MPM-s 
	2. ginx uses asynchronous, non-blocking event-driven architecture
Apache uses processes for every connection.

[Composer]
https://linuxize.com/post/how-to-install-and-use-composer-on-debian-10/
Composer is a dependency manager for PHP (similar to npm for Node.js or pip for Python ).
```
$ sudo apt update
$ sudo apt install wget php-cli php-zip unzip <!-- have the necessary packages installed -->
$ wget -O composer-setup.php https://getcomposer.org/installer <!-- Download the installer -->
$ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

[MySQL / MariaDB]
MySQL is one of the popular and most common database servers using to store data. 
MariaDB is the fork of MySQL. 
	==> the commands used for Oracle MySQL will also be applicable for MariaDB.
```
$ mysqld --version  <!-- to check version -->
$ mysqladmin -V 
$ sudo mysql
```
How to install?
<!-- 1. Adding mariaDB repository -->
$ sudo apt-get update
$ sudo apt-get install lsb-release software-properties-common <!-- necessary software -->
$ sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'  <!-- import the repo key to system -->
$ sudo add-apt-repository "deb [arch=amd64] http://mirror.23media.de/mariadb/repo/10.4/debian $(lsb_release -cs) main"  <!-- add the mariaDB repo to source list -->
<!-- 2. Installing mariaDB -->
$ sudo apt-get update
$ sudo apt-get install mariadb-server
<!-- 3. Checking mariaDB stauts -->
$ sudo systemctl is-enabled mariadb
$ sudo systemctl is-active mariadb
$ sudo systemctl status mariadb <!-- active 10.5.15 -->
<!-- 4. Testing mariaDB connectivity -->
$ sudo mariadb -u root -p
MariaDB $ SELECT VERSION();
MariaDB $ SHOW DATABASES;
MariaDB $ exit;

[Nginx]
Nginx does not have a configuration system like Apache;
Nginx is very efficient in serving static content on its own.
Nginx uses asynchronous, non-blocking event-driven architecture.
Nginx ideally has one worker process per CPU/core. Each one can handle hundreds of thousands of incoming network connections per worker. There is no need to create new threads or processes for each connection.
```
$ pcre-config --version
	8.44
$ cd /usr/sbin
$ nginx
$ nginx -v       <!-- nginx/1.18.0 -->
$ ps -aux|grep nginx
$ nginx -s quit
$ nginx -s reload
$ sudo nginx -t  <!--to check config file-->
```
PCRE: for Nginx to Rewrite
/usr/share/nginx/html/index.html

edit etc/nginx/sites-avaliable/default
```
server {
	listen 80;
	server_name localhost;
	autoindex on;
	index index.php;
	root /home/tanami/helpers; # CHANGE THIS
	location ~ \.php$ {
		include /etc/nginx/fastcgi.conf;
		fastcgi_split_path_info  ^(.+\.php)(/.+)$;
		fastcgi_param PATH_INFO  fastcgi_path_info;
		fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		try_files $uri =404;
		fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
		fastcgi_read_timeout 600;
		fastcgi_intercept_errors on;
		gzip off;
		fastcgi_index  index.php;
	}
}

```

[install google chrome]
Ctrl+Alt+T ==> open the terminal
Ctrl+Shift+Delete ==> clear the cache

```
$wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
$sudo apt install ./google-chrome-stable_current_amd64.deb
```

[install multiple node versions with nvm]
```
$wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
// close and reopen Terminal
$nvm -version
 => v0.38.0
$nvm install node //install latest NodeJs version
$nvm use node 
 => now using node v18.6.0 (npm v8.13.2)
$nvm ls //get a list of installed NodeJs version
$nvm exec 8.11.1 node app.js //use specific version without switching
$nvm use system //use installed nodeJs version in the system
```

[VS code]
F12 - Inspect
Alt + up - move current line up
Ctrl + D - select the same words one by one
Ctrl + Shift + ` - Terminal
Ctrl + Shift + P - fast path
Ctrl + Home / End - Beginning and End of a file
Ctrl + Shift + I - json

On Windows: Shift + Alt + F
On Mac: Shift + Option + F


[curl]
curl command is a tool to download or transfer files/data from or to a server using FTP, HTTP, HTTPS, SCP, SFTP, SMB and other supported protocols on Linux or Unix-like system.
```
$ curl --version
$ curl -I https://www.google.co.in/
$ man curl
$ curl --help
```
