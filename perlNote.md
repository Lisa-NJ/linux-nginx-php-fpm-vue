??? Void
??? 插值
??? 布尔
??? v字符串
??? eval字符串
??? our
??? grep die open close async defer_exec

 
0. Perl - Practical Extraction and Report Language
具有高级语言的强大能力和灵活性
提供脚本语言（如sed和awk）的所有功能，还具备它们不具备的很多功能 - 方便
擅长扫描任意的文本文件，从这些文件中获取信息，也很适合于完成许多系统管理的功能
约有90%与文字处理有关，10%与其他处理相关

```bash
//第一种运行方式
$ perl file.pl
//第二种运行方式
$ chmod u+x file.ph
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

1. Perl 解释器不会关心有多少个空白, 但是如果空格和分行出现在字符串内，他会原样输出。
2. Here document grammer - << EOF ... EOF

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
3. 使用反斜线（\）来转义
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
4. 弱类型语言，变量不需要指定类型，Perl 解释器会根据上下文自动选择匹配类型
    Perl 有三个基本的数据类型：标量、数组、哈希，Perl 为每个类型设置了独立的命令空间
    标量：可以是一个整数，浮点数，字符，字符串，段落或者一个完整的网页。

  	 __FILE__, __LINE__, 和 __PACKAGE__ 分别表示当前执行脚本的文件名，行号，包名
  数组：
  	 
  ```perl
  $myfirst=123;　    #标量-数字123　
  
  $mysecond="123";   #标量-字符串123
  $str = "hello" . "world";       # 字符串连接
  
  $var1 = 047;       # 0开头为8进制的数 - 等于十进制的39
  $var2 = 0x1f;      # 0x开头为16进制 - 等于十进制的31　
  
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
	    interval   => $seconds,    # 在上面条件生效后，每格多久进行一次 callback.
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
	- AnyEvent->condvar; 和 $cv->recv; 吧，这个其实就是条件，当达到什么条件退出事件循环;基本的 $cv->recv 是和 $cv->send 成对出现的，当事件调用 send 时 recv 收到这个调用，就会退出事件。
	- eval BLOCK 形式是在编译时做语法检查的，所以它的效率相当高。如果有一个可捕获的错误存在（包括任何由 die 操作符生成的），eval 返回 undef 并且把错误信息放到 $@ 里。如果没有错误，Perl 保证把 $@ 设置为空字串，所以你稍后可以很可靠地做错误检查。eval 是一个在 Perl 里做全部例外处理的好地方。
	- http_post, http_get: The callback will be called with the response body data as first argument (or undef if an error occurred), and a hash-ref with response headers (and trailers) as second argument.

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

21. 

