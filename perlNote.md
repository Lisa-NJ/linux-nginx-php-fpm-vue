??? Void
??? 插值
??? 布尔
??? v字符串
??? grep die open close async defer_exec

 
00. Perl - Practical Extraction and Report Language
具有高级语言的强大能力和灵活性
提供脚本语言（如sed和awk）的所有功能，还具备它们不具备的很多功能 - 方便
擅长扫描任意的文本文件，从这些文件中获取信息，也很适合于完成许多系统管理的功能
约有90%与文字处理有关，10%与其他处理相关
A .pl is a single script.
In .pm (Perl Module) you have functions that you can use from other Perl scripts:
A Perl module is a self-contained piece of Perl code that can be used by a Perl program or by other Perl modules. 

```bash
//第一种运行方式
$ perl file.pl
//第二种运行方式
$ chmod u+x file.pl
$ ./file.pl
```
运行perl脚本的流程：perl脚本在解释执行时和shell脚本一样，自顶向下，跳过sub定义部分依次执行

在命令行中使用 -e 选项来输入语句来执行代码
```bash
$ perl -e 'print "Hello World\n"'
```

hello.pl

```perl
#!/usr/bin/perl
use feature qw(say state);  # either works for the use of say
use 5.010; 
 
# 输出 "Hello, World"
print "Hello, world\n";
print 'Hello, world\n';  # 单引号双引号均可，双引号可以正常解析一些转义字符与变量，而单引号会原样输出(可以使用多行文本)。

my $var = "A variable";
print "$var\n"; 
print $var, "\n";   # the same as the above line
say $var; # adds a new line \n to every call
 
exit; # 整个 perl 脚本会退出
 
=pod 注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
=cut

# When used it is similar to my but it creates and initializes the variable only once. The same as static variable in C
sub next_counter {
   state $counter = 0;
   $counter++;
   return $counter;
}

{
   my $counter = 0;
   sub next_counter {
      $counter++;
      return $counter;
   }
}
```

```bash
$ chmod 0755 hello.pl 
$ ./hello.pl 
Hello, world                   # 输出结果
Hello, world\n
```
$ xset -dpms  // 在 X Window System 中，xset 命令用于配置和控制 X 服务器的各种参数和属性。其中，xset -dpms 是一条 xset 命令的参数组合，用于禁用 DPMS（Display Power Management Signaling）功能。
$ xset s off  // 用于禁用屏幕保护功能
$ dwm ??? // 是一个轻量级的、动态布局的窗口管理器；dwm 使用动态布局，意味着窗口在运行时可以自动重新排列和调整大小，而不需要手动调整。
$ unclutter -display :1 -idle 0 -root&	// unclutter 是一个用于 X Window System 的小型实用程序，它的作用是自动隐藏鼠标指针当它在一段时间内没有移动时。
$ xsetbg // 通常用于在 X Window System 中窗口管理器启动时设置桌面背景图片

[X Window System]
	- https://muicoder.github.io/linux_basic/0590xwindow.html
X Window System 是个利用网络架构的图形用户接口软件;
分成 X Server 与 X Client 两个组件, 其中 X Server 在管理硬件，而 X Client 则是应用程序。
在运作上，X Client 应用程序会将所想要呈现的画面告知 X Server ，最终由 X server 来将结果透过他所管理的硬件绘制出来！

Xorg（也称为X.Org）是一个开源的图形显示服务器，用于在 Linux、Unix 和类Unix系统上提供图形界面支持。它是X Window System的一个实现，负责管理图形显示、窗口管理和用户输入等功能。

Xvfb 是一个虚拟 X 服务器的缩写，它代表 "X Virtual Framebuffer"。Xvfb 允许在没有物理显示器的情况下运行图形应用程序，它模拟了一个完整的 X 服务器环境。
传统上，X 服务器用于显示图形用户界面 (GUI) 应用程序，需要连接到物理显示器或远程显示器。但是，在某些情况下，可能没有可用的显示器，或者你希望在没有显示器的情况下运行应用程序。这时，就可以使用 Xvfb 来创建一个虚拟的 X 服务器，它只存在于内存中而不需要物理显示器。
Xvfb 将图形输出渲染到内存中的虚拟帧缓冲区，而不是发送到实际的显示设备。这使得你可以在后台运行图形应用程序，无需图形界面的实际显示。Xvfb 的输出可以被重定向到其他 X 应用程序进行处理，或者可以使用工具（如 Xvnc）将图形显示到远程计算机上。
Xvfb 在许多情况下都非常有用，例如在服务器上运行测试套件、自动化测试、无头浏览器（Headless Browser）以及需要图形环境的脚本和应用程序等。它提供了一种轻量级的方法来模拟和处理图形输出，而不依赖于物理显示器。

01. Perl 解释器不会关心有多少个空白, 但是如果空格和分行出现在字符串内，他会原样输出。
02. Perl only interpolates scalar variables and arrays, not hashes. 
    In addition, the interpolation is only applied to the double-quoted string, but not the single-quoted string.
1. Here document grammer - << EOF ... EOF

```perl
#!/usr/bin/perl
 
$a = 10;
$var = <<"EOF";
这是一个 Here 文档实例，使用双引号。
可以在这输入字符串和变量。
例如：a = $a
EOF
print "$var\n";

```
输出结果：
```
这是一个 Here 文档实例，使用双引号。
可以在这输入字符串和变量。
例如：a = 10
```
2. 使用反斜线（\）来转义
```perl
#!/usr/bin/perl
 
$result = "菜鸟教程 \"runoob\"";
print "$result\n";
print "\$result\n";
```
输出结果：
```
菜鸟教程 "runoob"
$result

```
3. Perl variable scopes
```perl
$color = 'red';              # global
{
	my $color = 'blue';  # local
}
our $color1 = 'white';       # global variables visible throughout the program or from external packages
```
4. 弱类型语言，变量不需要指定类型，Perl 解释器会根据上下文自动选择匹配类型
    Perl 有三个基本的数据类型：标量、数组、哈希，Perl 为每个类型设置了独立的命令空间
    标量：可以是一个整数，浮点数，字符，字符串，段落或者一个完整的网页。

  	 __FILE__, __LINE__, 和 __PACKAGE__ 分别表示当前执行脚本的文件名，行号，包名
  
  	 
  ```perl
  $myfirst=123;　    #标量-数字123 global variable
  $myBigN = 123_456_789; #123456789   
  
  $mysecond="123";   #标量-字符串123
  $str = "hello" . "world";       # 字符串连接
  $str1 = q/"Are you learning Perl String today?" We asked./;
  my $name = 'Jack';
  my $s2 = qq/"Are you learning Perl String today?"$name asked./;
  my $s = q^A string with different delimiter ^;
  
  # string functions:
  # length($s) uc($s) lc($s) index() rindex()
  
  $var1 = 047;       # 0开头为8进制的数 - 等于十进制的39
  $var2 = 0x1f;      # 0x开头为16进制 - 等于十进制的31　
  
  
  # 数组：
  @arr=(1,2,3)       #数组-索引从 0 开始，$ages[0]取数组第一个值
  
  @array = qw/这是 一个 数组/; #使用 qw// 运算符，它返回字符串列表，数组元素以空格分隔。
  print "$array[-1]\n"; # 负数，反向读取 - '数组'
  $new_size = push(@array, "对吧");
  @array2 = @array[1,2]; # 一个 数组
  @array3 = @array[1..2]; # 连续的索引
  splice(@array, 1, 2, 21..22); 
  
  @var_20 = (10..20);
  @var_abc = ('a'..'z');
  print "@var_20\n";   # 输出 10 到 20
  print "@var_abc\n";  # 输出 a 到 z
  
  %h=('a'=>1,'b'=>2); #哈希-无序的 key/value 对集合
  %data = ('google', 45, 'runoob', 30, 'taobao', 40); #定义哈希，$data{'google'}访问哈希值	
  
  $size = @arr;   # 数组赋值给标量，返回数组元素个数
  
  ```
  Perl already uses a comma (,) as a separator in the list so for integer numbers Perl uses an underscore character ( _) instead.
  0b123 Binary integer using a prefix of 0b
  0255 Octal integer using a prefix of 0
  0xABC Hexadecimal integer using a prefix of 0x

5. 转义字符 \l \L \u \U

6. use strict 语句让所有变量需要强制声明类型。

7. 数组操作：push, pop, unshift, shift, splice，
    特殊变量 $[ - 数组的第一索引值
    scalar @array - 数组长度

8. 哈希 delete foreach while
  ```perl
  %data = ('google', 'google.com', 'runoob', 'runoob.com', 'taobao', 'taobao.com');
  %data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');
  %data = (-google=>'google.com', -runoob=>'runoob.com', -taobao=>'taobao.com');  # - 来代替引号
  
  $data{'google'} = 'google.com';
  $data{'runoob'} = 'runoob.com';
  $data{'taobao'} = 'taobao.com';
  
  @names = keys %data; # 获取 data 所有 key 的数组
  @urls = values %data; # 获取 data 所有 value 的数组
  
  if( exists($data{'facebook'} ) ){  # 判断key是否存在
     print "facebook 的网址为 $data{'facebook'} \n";
  }
  else
  {
     print "facebook 键不存在\n";
  }
  
  %data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');
  foreach $key (keys %data){
      print "$data{$key}\n";
  }
  
  while(($key, $value) = each(%data)){
      print "$data{$key}\n";
  }
  ```

9. ** 乘幂
   <=> 比较运算符 返回 -1 0 或者 1
   q{}
   qq{}
   qx{}
   -> 一个类的方法
   ..  范围运算符
   chomp - remove the last character in a string

   ```perl
   chomp($s = <STDIN>);  # <STDIN> is used to get input from users
   ```

10. sub - perl 子程序(函数)
    @_ 参数
    $_ [0] 第一个参数
    $_ the default variable of Perl
    如果我们需要传入标量和数组参数时，需要把列表放在最后一个参数上;
    可以向子程序传入多个数组和哈希，但是在传入多个数组和哈希时，会导致丢失独立的标识。所以我们需要使用引用来传递
    如果没有使用 return 语句，则子程序的最后一行语句将作为返回值
    默认情况下，Perl 中所有的变量都是全局变量
    my @list = @_ my操作符 - 用于创建词法作用域变量，通过 my 创建的变量，存活于声明开始的地方，直到闭合作用域的结尾

    local 定义的变量不存在于主程序中，但存在于该子程序和该子程序调用的子程序中

    If ARRAY is omitted, shifts the [`@_`](https://perldoc.perl.org/perlvar#%40_) array within the lexical scope of subroutines

    ```perl
    #!/usr/bin/perl
    
    # 定义函数
    sub PrintList{
       my @list = @_;
       print "列表为 : @list\n";
    }
    $a = 10;
    @b = (1, 2, 3, 4);
     
    # 列表参数
    PrintList($a, @b);
    ```

11. Perl 引用/指针
    (1)匿名哈希引用, 使用{}定义 
    ```perl
    $href= { APR =>4, AUG =>8 };
    ```
    (2)函数引用格式: \&
    调用引用函数格式: & + 创建的引用名。
    ```perl
    # 创建函数的引用
    $cref = \&PrintHash;
     
    # 使用引用调用函数
    &$cref(%hash);
    ```

12. Perl类的定义
    文件后缀为 .pm
    把一个包当作一个类用，并且把包里的函数当作类的方法来用。
    Perl 的包提供了独立的命名空间，所以不同包的方法与变量名不会冲突。
    bless() 函数 -- 用来构造对象， 通过 bless 把一个引用和这个类名相关联，返回这个引用就构造出一个对象
    ```perl
    object = bless reference, classname;
    ```

13. package
	 require 和 use 将载入一个模块
	 @INC -- Perl 内置的一个特殊数组，它包含指向库例程所在位置的目录路径
	 require 和 use 函数调用 eval 函数来执行代码
	 	use语句是编译时引入的，require是运行时引入的
	 	use引入模块的同时，也引入了模块的子模块。而require则不能引入
	 	
14. for 等价于 foreach
	```perl
	my @a = (1..9);

	for my $i (@a){
	print("$i","\n");
	}
	```

15. 正则表达式 Perl regular expression
	=~            is the binding operator
	!~            negated form of the binding operator 
	/Expression/i to match a pattern case insensitive
	m"/"          to match a pattern that contains a forward slash (/) character
	A*	Zero or more A
	A+	One or more A
	A?	A is optional
	A{10}	Ten A
	A{1,5}	From one to five A
	A{2,}	Two A or more
	
	{}[]()^$.|*+?\ metacharacters - the regular expression engine treats these characters in a special way
	
	
	```perl
	my $s = 'Perl regular expression is powerful';
	print "match found\n" if( $s =~ /ul/);
	
	my @words= (
	   'Perl',
	   'regular expression',
	   'is',
	   'a very powerul',
	   'feature'
	);

	foreach(@words){
	   print("$_ \n") if($_ !~ /er/);
	}
	```

16. -e, -z, -s, -M, -A, -C, -r, -w, -x, -o, -f, -d , -l
	eval
    Description taken from the official documentation of Perl:

    - -r File is readable by effective uid/gid.
    - -w File is writable by effective uid/gid.
    - -x File is executable by effective uid/gid.
    - -o File is owned by effective uid.

    - -R File is readable by real uid/gid.
    - -W File is writable by real uid/gid.
    - -X File is executable by real uid/gid.
    - -O File is owned by real uid.

    - -e File exists.
    - -z File has zero size (is empty).
    - -s File has nonzero size (returns size in bytes).

    - -f File is a plain file.
    - -d File is a directory.
    - -l File is a symbolic link (false if symlinks aren't supported by the file system).
    - -p File is a named pipe (FIFO), or Filehandle is a pipe.
    - -S File is a socket.
    - -b File is a block special file.
    - -c File is a character special file.
    - -t Filehandle is opened to a tty.

    - -u File has setuid bit set.
    - -g File has setgid bit set.
    - -k File has sticky bit set.

    - -T File is an ASCII or UTF-8 text file (heuristic guess).
    - -B File is a "binary" file (opposite of -T).

    - -M Script start time minus file modification time, in days.
    - -A Same for access time.
    - -C Same for inode change time (Unix, may differ for other platforms)

17. AnyEvent
	```perl
	AnyEvent->timer()
	AnyEvent->condvar 
	AnyEvent->io()
	
	AnyEvent->timer(
	    after       => $seconds,    # 多久之后做相应的操作.
	    interval   => $seconds,    # 在上面条件生效后，每隔多久进行一次 callback.
	    cb => $cb,    # cb 是 callback 的简写，所以知道了吧，只要到了前面的条件，就会运行 cb => 指向的函数.
	);
	
	#条件变量
	sub retrieve_e2v_playlist {
	    my ($route, $parameters) = @_;
	    my $cv = AnyEvent->condvar;
	    http_post $route, $parameters, 'timeout' => $CONST{TIMEOUT_PLAY}, sub { $cv->send($_[0] || undef) };
	    return $cv->recv;
	}
	
    	eval {...}; # 捕获运行时错误
    	if($@) {...} # 处理错误
	
	```
	- AnyEvent->condvar： 用于创建条件变量（Condition Variable）的方法，用于在异步事件驱动编程中进行协调和同步
	- $cv->send 来触发条件变量
	- $cv->recv 阻塞等待条件变量的触发；一旦条件变量被触发，recv 方法会返回触发时传递的值
	- eval BLOCK 形式是在编译时做语法检查的，所以它的效率相当高。如果有一个可捕获的错误存在（包括任何由 die 操作符生成的），eval 返回 undef 并且把错误信息放到 $@ 里。如果没有错误，Perl 保证把 $@ 设置为空字串，所以你稍后可以很可靠地做错误检查。eval 是一个在 Perl 里做全部例外处理的好地方。
	- http_post, http_get: The callback will be called with the response body data as first argument (or undef if an error occurred), and a hash-ref with response headers (and trailers) as second argument.

AnyEvent::Util - run_cmd, 
	
	```perl
	$cv = run_cmd $cmd, key => value...
	```
AnyEvent::Coro->run_cmd 方法，可以启动一个非阻塞的命令执行，并立即返回一个 AnyEvent::Coro::Guard 对象。通过该对象，可以对命令进行进一步的控制，例如等待命令执行完成、发送信号给命令进程等

18. 数字0,字符串 '0'、"",空 list(),和 undef 为 false，其他值均为 true
	undef 将指定键的值设置为未定义的值
	```perl
	# 2-Some functions return undef to indicate failure. Others might return undef if they have nothing valuable to return.
	my $x = do_something(); 
	# 3-Use the undef() function to reset a variable to undef
	undef $x
	# 4-Use the return value of the undef() function to set a variable to undef, The parentheses after the function name are optional 
	$x = undef;
	
	my $x; # 1-When declared withput assigning a value to it, the content will be undef
	# The defined() function will return true if the given value is not undef. It will return false if the given value is undef.
	if (defined $x) {
	    say '$x is defined';
	} else {
	    say '$x is undef';
	}
	
	# In a numerical operation --> 0; in a string operation --> empty string
	my $x;
	say $x + 4, ;  # 4
	say 'Foo' . $x . 'Bar' ;  # FooBar
	 
	$x++;
	say $x; # 1
	```	
		
19. map 的用法
	```perl
	my @numbers = (1..5);
	print "@numbers\n";       # 1 2 3 4 5
	my @doubles = map {$_ * 2} @numbers;
	print "@doubles\n";       # 2 4 6 8 10
	```
20. grep of Perl

21. AnyEvent

22. Perl Module - .pm
	- create a file named FileLogger.pm
	- make the FileLogger module a package by:  package FileLogger at the top of the  FileLogger.pm file.
	- write the code for subroutines and variables into the  FileLogger.pm
	- put the last statement in the  FileLogger.pm file: 1; to make the file returns true
	- three ways to use modules from other programs: do, require, and use

23. Coro::AIO
	- aio_open
	- aio_read
	- aio_write
	- aio_close
	
[A&Q]
1. $| 是一个特殊变量，用于控制输出缓冲。当 $| 的值为 0 时，输出会被缓冲起来，直到达到一定条件（比如输出换行符 \n 或者缓冲区满）才会被刷新到输出设备上。当 $| 的值为 1 时，输出是无缓冲的，每次写入都会立即刷新到输出设备上。
因此，将 $| 设置为 1 可以确保输出是实时的，即写入输出后立即可见。这在某些情况下很有用，特别是当你需要实时更新进度条、日志或与其他程序进行实时通信时。
1-1. $! 是一个特殊变量，用于存储最后一次系统错误的相关信息
2. $SIG 变量是一个哈希引用，用于存储不同信号的处理程序。每个键值对表示一个信号和对应的处理程序。键是信号名称（如 INT、HUP、TERM 等），值是处理程序的引用。
3. INT：SIGINT，中断信号，通常由用户按下 Ctrl+C 发送。
4. $$：这是一种特殊的Shell变量，代表当前进程的进程ID（PID）
5. use Coro: 使用Coro模块的async函数可以将子例程转换为协程
	- https://www.junmajinlong.com/coding/process_thread_coroutine/
	- 在正常情况（非coroutine）下，routine 跳转运行后必须原地等待跳转后的那个 routine 执行完返回才能继续从原地向下执行；
	- 使用 coroutine 的时候，假设 routine1 和 coroutine2 互为 coroutine，那么 routine1 跳转到 routine2 去执行的时候，它会等待 routine2 才能继续向下执行，但是不一定是等待 routine2 执行完

	- coroutine:协同运行
	```
	var q := new queue

	coroutine produce
	    loop
		while q is not full
		    create some new items
		    add the items to q
		yield to consume

	coroutine consume
	    loop
		while q is not empty
		    remove some items from q
		    use the items
		yield to produce

	```
6. shell 中的 coproc：协同运行的进程
7. freeze：将数据结构序列化为字符串或字节流，以便在稍后的时间点进行存储或传输
	- use Storable
8. q 创建单引号字符串
   qq, qx 创建双引号字符串
9. Coro::Twiggy->new用于创建一个基于Twiggy的异步Web服务器对象，可以用于处理并发的HTTP请求。
   Twiggy是一个基于AnyEvent的高性能异步Web服务器框架，而Coro是一个用于协程和并发编程的模块。通过结合使用Coro和Twiggy，可以实现高效的异步Web服务器。
10. defined 关键字用于检查变量是否已定义，对于已定义的变量返回true，对于未定义的变量返回false
11. $:: 全局命名空间的简写形式，相当于：'$main::'
12. unblock_sub是Coro::AnyEvent模块中的一个函数。它用于将一个阻塞的子例程（subroutine）转换为非阻塞的协程（coroutine）
13. !~ 不包含，不匹配 =~包含匹配
14. eval 是一个内置函数，用于动态地执行包含 Perl 代码的字符串或者代码块，并捕获和处理任何可能发生的错误；
如果 BLOCK 中的代码正常执行，eval 函数将返回 undef。如果 BLOCK 中的代码发生错误，eval 函数将捕获错误，并返回一个表示错误的字符串。可以使用 $@ 变量访问捕获的错误信息;
    $@ 是一个特殊变量，用于存储最近一次 eval 函数执行过程中捕获的错误信息。
    如果在 eval 块中使用了 eval BLOCK 形式，而不是字符串形式的 eval EXPR，则在执行过程中的语法错误将被捕获到 $@ 中。对于字符串形式的 eval，语法错误将在执行 eval 前引发一个编译时错误。

