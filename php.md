### Web Server
### Basic concepts
RFC 2616 / Chapter 14 -- http header
mime - Multipurpose Internet Mail Extensions
	- IETF RFC 6838
	- type/subtype
	- text image audio video application


[Phalcon devtools / Installation]
$ composer global require phalcon/devtools
$ phalcon
$ phalcon -V
$ phalcon create-project store
$ cd store
$ phalcon create-controller --name test
$ phalcon serve --help
$ phalcon serve --port=8888
```
1. One of the key features of Phalcon is that it is loosely coupled
2. Setting up Debug 
	- + (new Phalcon\Debug)->listen(); //index.php
	- refresh the url
3. Install Xdebug
	- $ sudo apt install php7.4-xdebug  // install php8.2-xdebug by default
4. Integrate Xdebug with the PHP interpreter
	- $ php -m
	- $ sudo updatedb
	- $ locate xdebug.so  // /usr/lib/php/20220829/xdebug.so
	- edit php.ini, + [xdebug] section
	- localhost:8001 can see xdebug info
5. Configure Xdebug in PhpStorm﻿
	- phpStorm / File / Settings / PHP / Debug

External Libraries
	- $ git clone https://github.com/phalcon/phalcon-devtools.git 3.1.x (the latest version with ide)
	- open phpStorm / External Libraries / Right Mouse Click --> Config Php Include Paths
	- choose: phalcon-devtools / ide / stubs / Phalcon

MVC
 |----app
 |     |----controllers
 |     |      |----indexController.php   // 
 |     |----core
 |     |----models
 |     |----views
 |            |----home
 |
 |----public
 |      |----css
 |      |     |----
 |      |
 |      |----index.php     // The entry point for the app( autoloader + DI + HTTP requests ) 
 |
 |----.htaccess
 |----.htrouter.php   // If it sees files existing in public, deliver directly, not to give to Phalcon

```

1. Users land in your public directory, index.php --> building the bootsrapping
2. --> Call a new application instance (an object /spp/core)
3. --> Read the URL 
4. --> render/call the right controller
5. --> Go and render view (/models)

```php
public/css/.htaccess -- handles the ability to have them short URLs
public/css/index.php -- the bootstrap file which creates a new app
The routing system
The initialization file -- require all the core components that you need
```
[php debug]
	最详细的phpstorm+xdebug调试详细教程，没有之一
	https://www.cnblogs.com/endkoo/p/14849807.html
	
	/tmp/php_errors.log

[Phalcon\MVC] - Models, Views, Controllers
	1. Isolation of business logic(Models) from the user interface(Views) and the database layer
	2. Every request to your application resources will be managed by the MVC architecture
	3. The controllers provide the ‘flow’ between models and views. Controllers are responsible for 
		- processing the incoming requests from the web browser, 
		- interrogating the models for data, and 
		- passing that data on to the views for presentation.

```
             Web Browser   --requests-->   Controller --interrogating--> Models
                                                      <---  date ----              
                                               |
                                               |
                                               v
                                             Views           
```
[Phalcon\Mvc\Model]
	1. an implementation of the object-relational mapping (ORM)
	2. Models are primarily used for managing the rules of interaction with a corresponding database table
	3. Each table in your database will correspond to one model in your application
	4. The bulk of your application’s business logic will be concentrated in the models
```
             business objects    ----  Model ---- database tables
                                     1 model ---- 1 table 
             
```

[code]
``` php
require './e2v_helper.php';
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Headers: application-token, authorization, content-type');

// Takes raw data from the request
$post_body = file_get_contents('php://input');
// Converts it into a PHP object
$parameters = json_decode($post_body, TRUE);
$cache_name = './weather_cache/'.md5($parameters['api_key']).'_'.md5($parameters["location"]).'.db';

if (file_exists($cache_name) && (time() - stat($cache_name)['mtime']) < 3600) {
    $result = file_get_contents($cache_name);
}
else
{
    $token = $access_token . ":" . "";
    // $req = curl_init($baseurl . '/properties?active=true&status=listing&api_key=' . $api_key);
    $req = curl_init($baseurl . '/properties?');

    curl_setopt($req, CURLOPT_RETURNTRANSFER, true);
    // curl_setopt($req, CURLOPT_USERPWD, $token);
    curl_setopt($req, CURLOPT_HTTPHEADER, array('Accept: application/json', 'X-Api-Key: ' . $api_key, 'Authorization: Bearer ' . $access_token));
    $result = curl_exec($req);

    $response_code = curl_getinfo($req, CURLINFO_HTTP_CODE);
    echo $response_code.'is return code';
    if (curl_errno($req)) {
        $result = '[]';
    }
    else {
        file_put_contents($cache_name, $result);
    }
}
```


### php 
```
$ php -v
$ php -f weather.php
$ php weather.php
$ php -r 'print "abc\n", "defgg\n";'
$ php -r 'echo "abc\n";'
```
SAPI = Server Application Programming Interface
CGI = Common Gateway Interface
// edit php.ini / error_log: /tmp/php_error.log
	/etc/php/7.4/fpm/php.ini

1. your file must end with that php to be interpreted as php
2. php files can also have html, CSS, JavaScript in them
3. php opening and closing tag is <?php ?> 
4. php interpreter interpreted the code between opening and closing tag. But if your file entirely contain 100 percent php code then you do not need the closing tag
5. php closing tag will automatically  assume the semicolon on the last  line
6. Echo is marginally faster than print
7. Variable declared with dollar sign($)
8. $this is a special variable that can't be assigned
9. Vriables are always assigned by value by default. 
10. clear concept of variable declaration rules and classification

	variable declaration rules:

	(1).start with dollar sign($)
	(2).first letter of variable name comes from a-zA-z_
	(3).next letters of variable name comes from a-zA-Z0-9_
	(4).no space,no syntex

	classification of variables:

	Variable are mainly Two types
	(1).Predefined Variable
	(2).User Define Variable
	
	Predefined Variable
	There are 12 predefined variables in php 8
	
	(1).$GLOBALS — References all variables available in global scope
	(2).$_SERVER — Server and execution environment information
	(3).$_REQUEST — HTTP Request variables
	(4).$_FILES — HTTP File Upload variables
	(5).$_ENV — Environment variables
	(6).$_SESSION 
	(7).$_COOKIE — HTTP Cookies
	(8).$_GET — HTTP GET variables
	(9).$_POST — HTTP POST variables
		==> The above 9 are also superglobals
	(10).$http_response_header — HTTP response headers
	(11).$argc — The number of arguments passed to script
	(12).$argv — Array of arguments passed to script

	User Define Variable
	User Define variable are 3 types
	```
	(1).variable scope ---- .local scope 
	                    |-- .global scope
	                     |-- .static variable
	```
	(2).variable variables
	```
	${$a[1]} - to use $a[1] as a v ariable
	${$a}[1] - to use $$a as the variable
	```
	(3).reference variable

11. All functions and classes in PHP have the global scope
12. possible to call recursive functions in PHP
13. var_dump: Dumps information about a variable
14. require is identical to include except upon failure it will halt the script whereas include only emits a warning (E_WARNING) which allows the script to continue.
15. :: allows access to static, constant, and overridden properties or methods of a class.
16. header — Send a raw HTTP header, header() must be called before any actual output is sent, either by normal HTML tags, blank lines in a file, or from PHP.
17. array() or [] - to define an array
18. json_encode - Returns the JSON representation of a value
19. unset() - destroys the specified variables.
20. Magic constants - __LINE__ __FILE__	 __DIR__ __FUNCTION__ __CLASS__ __TRAIT__ __METHOD__ __NAMESPACE__ ClassName::class	
21. References in PHP - a means to access the same variable content by different names. 

The $GLOBALS array is an associative array with the name of the global variable being the key and the contents of that variable being the value of the array element. 

<input name="a.b" /> becomes $_REQUEST["a_b"].
22. Data Types & Type Casting
// 4 Scalar Types
	# bool - true / false
	# int - 1, 2, 3, -5
	# float - 1.4, -9.8
	# string - Heredoc
	
	```php
	echo <<< EOF
	      a
	     b
	    c
	\n
	EOF;
	```
// 4 Compound Types
	# array
	# object 
	# callable
	# iterable
// 2 Special Types
	# resource
	# null
23. Booleans

intergers 0 -0 = false
floats 0.0 -0.0 = false
'' = false
'0' = false
[] = false
null = false

24. Operators & Operator Precedence 
	- https://www.php.net/manual/en/language.operators.precedence.php
 - arithmatic, assignment, string operarors, comparison, error control, increment / decrement, logical, bitwise, array operators, execution
 - ?? <=> ** . @ union `` instanceof ?
  
25. return declare
	- declare(ticks) encoding
	- declare(strict_types=1) : write in every file when needed
26. In order to use PHP's cURL functions you need to install the libcurl package. php7.4-curl
	- https://www.php.net/manual/en/book.curl.php
    $req = curl_init($url);
    curl_setopt($req, CURLOPT_HTTPHEADER,'Accept: application/json');
    $result = curl_exec($req);
    file_put_contents($cache_name, $result);
    curl_getinfo
    curl_errno
27. php://input: This is a read-only stream that allows us to read raw data from the request body. It returns all the raw data after the HTTP headers of the request, regardless of the content type.
    file_get_contents() function: This function in PHP is used to read a file into a string.
    json_decode() function: This function takes a JSON string and converts it into a PHP variable that may be an array or an object.

28. PDO
	PDO::__construct — Creates a PDO instance representing a connection to a database
	public PDO::__construct(
	    string $dsn,
	    ?string $username = null,
	    ?string $password = null,
	    ?array $options = null
	)
	The Data Source Name, or DSN, contains the information required to connect to the database.
	In general, a DSN consists of the PDO driver name, followed by a colon, followed by the PDO driver-specific connection syntax. 	
	PDO::prepare — Prepares a statement for execution and returns a statement object
```php
	$pdo = new PDO('mysql:host=127.0.0.1;dbname=carswap', 'root', 'OES12345@');

	$stmt = $pdo->prepare("SELECT count(*) FROM cs_car");
	$stmt->execute();
	$total_cars = $stmt->fetchColumn();
```


### PHP

为了开始使用 PHP，找一个支持PHP和MySQL的Web主机，安装Web服务器、PHP及MySQL；

如果您的服务器支持 PHP，只要在 web 目录中创建 .php 文件即可，服务器将自动为您解析这些文件。

PHP 脚本在服务器上执行，然后将纯 HTML 结果发送回浏览器。

```php
<?php
$txt="Hello world!";
$x=5;
$y=10.5;
$z=$x+$y;
echo $z;
echo "x: $x"; 
echo("123";)
echo "1"," ", "2", " ", "3";
echo 'Lisa\'s apple';
echo "Lisa's apple";
$name = "Lisa";
echo "My name is {$name}";
echo "My name is $name";
echo 'Hello' . $name . '<br />';

function myTest()
{
    //global 关键字：在函数内调用函数外定义的全局变量
    global $x,$y;
    $y=$x+$y;
}
function myTest1()
{
    //所有全局变量存储在一个名为 $GLOBALS[index] 的数组中。 index 保存变量的名称。
    $GLOBALS['y']=$GLOBALS['x']+$GLOBALS['y'];
} 
function myTest2()
{
    //static：希望某个局部变量不要被删除
    static $x1=0;
    echo $x1;
    $x1++;
    echo PHP_EOL;    // 换行符
}
function myTest3($x)
{
    echo $x;
}

MyTest3(6);
//echo - 可以输出一个或多个字符串（字符串可以包含 HTML 标签）,快，没有返回值
echo "<h2>PHP 很有趣!</h2>";
echo "这是一个", "字符串，", "使用了", "多个", "参数。";
$cars=array("Volvo","BMW","Toyota");
echo "<br>";
echo "我车的品牌是 {$cars[0]}";
//print - 只允许输出一个字符串，return 1；使用方法类似echo
print "<br>";
print "我新车的品牌是 {$cars[1]}";
print("hello");

$a = "Hello";
$b = $a . " world!"; //.可以连接字符串
?>
```

``` php
<!DOCTYPE html>
<body>
    <h1>
        <?php echo 'Hello'; ?>
        <?= 'Hello'; ?>
    </h1>
    <p>
        My first paragraph.

    </p>
</body>
</html>
```
PHP 语句和 PHP 变量区分大小写。

弱类型语言：不必向 PHP 声明该变量的数据类型，PHP 会根据变量的值，自动把变量转换为正确的数据类型；在强类型的编程语言中，我们必须在使用变量前先声明（定义）变量的类型和名称。

PHP 中的 $_GET 和 $_POST 变量用于检索表单中的信息，比如用户输入。

```html
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
 
<form action="welcome.php" method="post">
名字: <input type="text" name="fname">
年龄: <input type="text" name="age">
<input type="submit" value="提交">
</form>
 
</body>
</html>
```

当用户填写完上面的表单并点击提交按钮时，表单的数据会被送往名为 "welcome.php" 的 PHP 文件：

```php
欢迎<?php echo $_POST["fname"]; ?>!<br>
你的年龄是 <?php echo $_POST["age"]; ?>  岁。
```

预定义的 **$_GET 变量**用于收集来自 method="get" 的表单中的值，从带有 GET 方法的表单发送的信息，对任何人都是可见的（会显示在浏览器的地址栏）在 HTML 表单中使用 method="get" 时，所有的变量名和值都会显示在 URL 中，所以在发送密码或其他敏感信息时，不应该使用；并且对发送信息的量也有限制，不能超过 2000 个字符。

预定义的 **$_POST** 变量用于收集来自 method="post" 的表单中的值，从带有 POST 方法的表单发送的信息，对任何人都是不可见的（不会显示在浏览器的地址栏），并且对发送信息的量也没有限制，然而，默认情况下，POST 方法的发送信息的量最大值为 8 MB（可通过设置 php.ini 文件中的 post_max_size 进行更改）。

预定义的 **$_REQUEST** 变量包含了$_GET、$POST和 $_COOKIE的内容，可用来收集通过 GET 和 POST 方法发送的表单数据。

### MySQL

可以运行于多个系统上，支持多种语言：C、C++、Python、Java、Perl、PHP、Eiffel、Ruby 和 Tcl 等；

对PHP有很好的支持，PHP 是目前最流行的 Web 开发语言。

```bash
Rpm -qa | grep mysql //检测系统是否自带安装MySQL
```

如果你系统有安装，那可以选择进行卸载:

```bash
rpm -e mysql　　// 普通删除模式
rpm -e --nodeps mysql　　// 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除
```

### Apache服务

```bash
httpd -v  //查看Apache版本

sudo apachectl start //启动Apahe服务

//Web服务根目录：Library/WebServer/Documents

sudo apachectl stop //停止Apache服务

php -v //查看php的版本
```



### 工具
