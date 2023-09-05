Tadartagnan@hotmail.com
schumann@oneworldled.com
michael@oneworldled.com
dartagnan@oneworldled.com.au
darius@elitem.com.au
Tanami 045 010 7311

2.24x1.28

[English]
You don't go there = don't mention that topic
It's your call = It's up to you
We look forward to engaging with you on 8 June, 2023.
Balance is indicative of: the amount in your account
allow for
Facebook - 3/5 Harry Gathenport
Dash delimited format
a comma-separated list of parameters
touch base - to talk to someone for a short time to find out how they are or what they think about something
GUID - Globally Unique Identifier
UUIU - Universaly Unique Identifiers
backwards compatibility with previous version of Rex API
The US government no longer recognizes SHALL as a legal term and recommends using MUST instead.
When used in a question, which form more often indicates that the asker is hesitant? - should
a bona fide sample of Lincoln's handwriting - authentic, true
Leave everything exactly as it is.
We have enough to do as it is without your latest orders!
Be open to learning new things
Before we make any decisions today, I'd like to make sure that everyone is on the same page.
This could be done better
Don't you dare!
So sick - means cool or excellent, Sic/sick is an internet slang expresion that is used as an adjective to compliment someone or something.
Under-representing 
OP Shop
It's my bad
It's been a minute
It is a one off set up

a forward slash (/) character
a backslash (\) character

Telfast - hayfever

do the shoey - 
flat out - super busy and tired
btw - by the way
lol - laugh out loud
lmk - let me know
imo - in my opinion
roger - your message has been received
fyi - for your information
brb - (I'll) be right back
afaik - as far as I know
tbc - to be confirmed
tba - to be announced
tbh - to be honest
COB - close of business

[将前端 Vue 项目部署到 Linux 服务器上]
1. **准备 Linux 服务器**：
   - 获得访问 Linux 服务器的 SSH 权限。
   - 确保服务器上已经安装了 Node.js 和 npm，以便运行 Vue 项目。
2. **在本地构建 Vue 项目**：
   - 在本地计算机上使用 Vue CLI 或其他构建工具构建 Vue 项目。运行以下命令将项目打包成生产版本：  
     ```bash
     npm run build
     ```
   - 这将生成一个 `dist` 目录，其中包含了打包后的项目文件。
3. **传输项目文件到服务器**：
   - 使用 SCP、SFTP 或其他文件传输工具将本地构建的项目文件传输到服务器上。例如，可以使用 SCP 命令：
     ```bash
     scp -r /local/path/to/dist user@server:/path/to/destination
     ```
     这将 `dist` 目录传输到服务器的指定目录。
4. **在服务器上安装 Web 服务器**：
   - 如果服务器上没有安装 Web 服务器（如 Nginx 或 Apache），请安装一个。以下是在 Debian/Ubuntu 上安装 Nginx 的示例命令：

     ```bash
     sudo apt update
     sudo apt install nginx
     ```
5. **配置 Web 服务器**：
   - 配置 Web 服务器以提供 Vue 项目。例如，在 Nginx 上，您可以创建一个配置文件，将请求代理到 Vue 项目的 `dist` 目录。以下是一个示例 Nginx 配置：

     ```nginx
     server {
         listen 80;
         server_name your_domain.com;

         location / {
             root /path/to/your/vue/project/dist;
             try_files $uri $uri/ /index.html;
         }
     }
     ```
   - 确保替换 `your_domain.com` 为您的域名，`/path/to/your/vue/project/dist` 为项目的实际路径。
6. **重启 Web 服务器**：
   - 根据您的 Web 服务器类型，使用适当的命令重启它。例如，在 Nginx 上，您可以运行：
     ```bash
     sudo systemctl restart nginx
     ```
7. **配置域名和 DNS**（可选）：
   - 如果您使用域名访问您的网站，请确保您的域名已配置为指向服务器的 IP 地址，并在 DNS 中设置了适当的记录。
8. **测试**：
   - 打开 Web 浏览器，并通过域名或服务器的 IP 地址访问您的 Vue 项目。您应该能够看到部署在服务器上的 Vue 项目。

这些步骤将帮助您将 Vue 项目成功部署到 Linux 服务器上。根据您的特定需求和服务器环境，某些步骤可能会有所不同。

[Fixed ZBOX-CI331NANO PCIe Bus Error / Tanami 18/8]
  -- https://unix.stackexchange.com/questions/327730/what-causes-this-pcieport-00000003-0-pcie-bus-error-aer-bad-tlp Tip2
// pci=nommconf disables Memory-Mapped PCI Configuration Space
-1. $ cd /etc/modprobe.d/
    $ cat adclient.conf
    $ lsmod | grep eth
    $ modinfo r8169
    $ apt-cache showpkg firmware-realtek  // 查询和显示指定软件包的详细信息
    $ dmesg  // 查看系统的消息日志，特别是内核消息; 用于诊断和排查与硬件、内核或设备驱动程序相关的问题
    $ demesg | less
    $ modinfo pcieport
    $ cd /etc/
    $ grep -ir 'ADCLIENT'
   --------------------------------- test --------------------------------------- 
0. $ lspci -vvv | grep -ia 'in use'  // -i: case insensitive, -a: search binary files
1. edit /etc/default/grub
	- GRUB_CMDLINE_LINUX="net.ifnames=0 pci=nommconf"
2. $ update-grub

https://www.debian.org/releases/buster/debian-installer/

[keyring]
Fix - "Current Password No Longer Matches Keyring"
Forgotten the old password + is ok to delete items in the old keyring + want to safaguard new keyring with matching password
$ cd .local/share/keyrings
$ rm *.keyring
$ sudo shutdown -r now  // 立刻重启
$ cd .local/share/keyrings // Verify the new keyring exists
$ ls -ltr *.keyring

[bash]
the bash-doc package provides the more complete bash info pages.
$ sudo apt install tcsh
$ sudo apt install dash
$ tcsh
$ exit
$ dash
$ exit

Table 8-4
PS1 symbols
Symbol Display in prompt
\$ # if the user is running with root privileges; otherwise, $
\w Pathname of the working directory
\W Basename of the working directory
\! Current event (history) number (page 313)
\d Date in Weekday Month Date format
\h Machine hostname, without the domain
\H Full machine hostname, including the domain
\u Username of the current user
\@ Current time of day in 12-hour, AM / PM format
\T Current time of day in 12-hour HH:MM:SS format
\A Current time of day in 24-hour HH:MM format
\t Current time of day in 24-hour HH:MM:SS format

[GRUB]
GNU GRUB（GRand Unified Bootloader简称“GRUB”）是一个来自GNU项目的多操作系统启动程序
GRUB菜单出现后：e键 --> GRUB编辑界面; Esc --> grub> 命令行界面

[port]
https://blog.51cto.com/u_15349616/3717562
VGA - Video Graphics Array
DVI - Digital Visual Interface
DP - Display Port
HDMI - High-Definition Multimedia Interface 

[chromium]
/usr/bin/chromium
/usr/lib/chromium/
$ chromium --version
Chromium 73.0.3683.75-1 built on Debian buster/sid,running on Debian 10.110
$ apt search chromium
chromium/oldstable 90.0.4430.212-1~deb10u1 amd64 [upgradable from: 73.0.3683.75-1]
  web browser
chromium-l10n/oldstable, oldstable 90.0.4430.212-1~deb10u1 all
  web browser - language packs

[set up apnc & adclient]
# set up apnc on Local PC
$ sudo perl apn
$ sudo apt search anyevent-irc
$ sudo apt install -y libanyevent-irc-perl
$ sudo apt search anyevent-irc
$ sudo perl apn
$ sudo apt search uniqid
$ sudo apt install -y libdata-uniqid-perl
$ sudo perl apn
	
# Set up adclient on Local Environment
$ cd ~/work-lisa/hadaly
$ sudo perl adclient
Can't locate Coro.pm....
$ apt search coro | grep perl
libcoro-perl/stable 6.570-1+b1 amd64
libcoro-twiggy-perl/stable 0.03-1.1 all
libcorona-perl/stable 0.1004-4 all
libnet-server-coro-perl/stable 1.3-2 all
$ sudo apt install libcoro-perl

$ sudo perl adclient
Can't locate Cache/Memcached/Fast.pm in @INC (you may need to install the Cache::Memcached::Fast module)...
$ apt search memcached-fast | grep perl
libcache-memcached-fast-perl/stable 0.25-1+b3 amd64
$ sudo apt install libcache-memcached-fast-perl

$ sudo perl adclient
Can't locate AnyEvent/HTTP.pm in @INC (you may need to install the AnyEvent::HTTP module)
$ apt search anyevent-http | grep perl
libanyevent-http-perl/stable 2.25-1 all
libanyevent-http-scopedclient-perl/stable 0.0.5-2 all
libanyevent-httpd-perl/stable 0.93-5 all
$ sudo apt install -y libanyevent-http-perl

$ sudo perl adclient
Can't locate Coro/Twiggy.pm in @INC (you may need to install the Coro::Twiggy module) ...
$ sudo apt install libcoro-twiggy-perl

$ sudo perl adclient
Can't locate Perl/Titdy.pm in @INC (you may need to install the Perl::Tidy module)...
$ apt search tidy-perl | grep perl
libexporter-tidy-perl/stable 0.08-1 all
libhtml-tidy-perl/stable 1.60-4+b2 amd64
libxml-tidy-perl/stable 1.20-1 all
$ sudo apt install perltidy

# localhost:1234 --> tmp.html
Copy Element to a new html, remove <script/>, Live Server

[ORZ]
https://orz.adverpost.com/collate?client=owl-384x640.5039.sa.owl.adverpost.com


[VaultRE]

[Linux查看服务状态指令]
1. 利用进程
ps -aux | grep xxx  //查看某个进程或服务是否存在
2. Systemctl
systemctl status httpd //查看 httpd 服务的运行状态 
3. 利用 chkconfig 配置工具
(1) 查看单个服务的运行状态
chkconfig --list 服务名
(2) 查看所有服务的运行状态
chkconfig --list
4. 利用 top 命令进行 实时的进程监控

[Postman]
Authorization
	- Inherit Auth from parent
	- No Auth
	- API Key
	- Bearer Token
	- Basic Auth
	- Digest Auth
	- OAuth 1.0
	- OAuth 2.0
	- Hawk Authentication
	- AWS Signature
	- NTLM Authentication
	- Akamai EdgeGrid
Postman doesn't save header data or query parameters to avoid exposing sensitive data such as API keys.

// 选中当前 collection
	/ Authorization / Type-->Bearer Token + Token {{token}}
// 设置环境变量
	点击右上角的小眼睛，然后点击Add token + secret + ......(request/Headers/authorization 的值)
// request 
	Bearer Token --> {{token}} ok
	Inherit auth from parent   ok
// post
	Body / Key - Value / longitude - 138.57

[shell program]
Shell是用户与内核进行交互操作的一种接口，目前最流行的Shell称为bash Shell
Shell是解释执行的脚本语言，所谓脚本语言就是不用编译就可以直接执行的语言。在Shell中可以调用Linux系统命令。

$ cat /etc/shells  # 查看系统中安装的 shell

+file:
$ cd /usr/local/bin
$ sudo touch hello.sh
```
echo"###############################"
echo"######### Hello World! ########"
```
$ sudo chmod ugo+x hello.sh
$ hello.sh
1. Shell 基本的执行方式
	- 1.1 输入脚本的绝对或相对路径
		/root/hello.sh
	- 1.2 bash 或 sh +脚本
		$ sh hello.sh 
	- 1.3 在脚本的路径前加 "."
		$ . /root/hello.sh

[.service]
service unit file
	- /etc/systemd/system/ac.service
```
[Unit]
Description=Hadaly
After=nginx.service memcached.service

[Service]
Type=idle
RemainAfterExit=yes
WorkingDirectory=/hadaly
ExecStart=/hadaly/adclient
ExecStop=/usr/bin/pkill adclient
Restart=always

[Install]
WantedBy=multi-user.target

```

[Open pdf in browsers]
	- word press
	- https://oneworldled.com/wp-content/uploads/2017/11/Architecture-Primer-II.pdf

	- Setting Chrome
		- chrome://settings/content/pdfDocuments -- Open PDFs in Chrome
		- Settings / Privacy and security / Site Settings / PDF documents 
		- PDF and PowerPoint viewer 
	
	- Setting Firefox
		- Settings / General / Applications / Portable Document Format(PDF) --> Open in Firefox

[Android apk]
1. for installation

[E2V Endpoint Development Process]

1. Make a .php file in local "helpers" folder, for example: "abc.php"
2. Dev environment - localhost:8080

 	(1). E2V Sources + a source named "testABC", with "URI" refering to "http://10.1.1.238:8001/abc.php"
 	(2). Private Booking / Connect E2V source "testABC" with Display "A-TEST"
 	(2-1). HexChat / #au / TEST -- $TEST:channelRefresh
 	(3). Check "http://10.1.1.38:1234/" (Inspect / responsive 1080*1920 ) to see if the E2V endpoint works as expected
5. Upload "abc.php" to CarSwap Server via ssh, if a new png file is needed, it needs to be uploaded as well
	- scp -i key_name path/abc.php name@api.carswap.me:srv/html/e2v/
6. Pre-pro environment - https://adverpost.com/ - (Team)One Wolrd LED
	(1). E2V Sources + a source named "proABC", "URI" refering to "https://api.carswap.me/e2v/abc.php"
	(2). Private Booking / Connect E2V source "proABC" with Display(owl-showcase)
	(3). Check https://adverpost.com/ Display(owl-showcase) / Dashboard to see if the liveview works
	(4). Check the Screen to see if the contents are shown as expected
7. Pro environment - https://adverpost.com/ - (Real Team)One Wolrd LED
	(1)
	(2)
	(3)
	(4)

[RayWhite]
VaultRE - Real Estate CRM Software
CRM - Customer relationship management

https://ap-southeast-2.api.vaultre.com.au/api/v1.3/pagesize=50&status=listing&portalStatus=listing&propertyClass=residential&availableOnly=true

[Error Reading Lock File...Not enough data read]
	- $ rm *.swp

[Books needed]
A Practical Guide to Linux Commands, Editors, and Shell Programming; Edition. 4th

[bug] 
When only E2V campaign is booked, nothing is shown on the Display but the AP logo, and "connected" button is orange
When E2V + normal campaign are booked, both campaign and e2v are shown on the Display, and "connected" button is green

[bug]
Sid - Forty Winks - Narre Warren (Pro)
		- CarSwap-VIC
		- Genesis Fitness - Caulfield (Pro)
		Downloading (2) files:
		Genesis_FitnessHealth_ProLED_30daysTransform.jpg 0%
		Genesis_FitnessHealth_ProLED_ReformerPilates.jpg 0%
		45422918-E8CB-4BE0-B213-C350E9AAED31.png

[AP Tracking]
方案一：GPS/GLONASS
参考文件：
	- u-blox7 (V14) Receiver Description Protocol Specification
	- GPS/GLONASS/QZSS Firmware 1.00 for u-blox 7 
1. Plug in the GPS reveiver(GPS/GLONASS U-blox7) to the Linux PC
2. Check the file: /dev/ttyACM0 to see if the input stream is coming
	- $ sudo cat /dev/ttyACM0	// Lon, Lat, Time are okay + green light on
	?- $ sudo stty -F /dev/ttyACM0 ispeed 4800 && cat < /dev/ttyACM0
	
3. Install gpsd
	- $ sudo apt install gpsd
	- $ gpsd --v
	- $ sudo gpsmon /dev/ttyACM0
	- $ sudo apt install gpsd-clients
	- $ cgps
	- $ xgps --v
	
4. Config /etc/default/gpsd && Restart
	- DEVICES="/dev/ttyACM0"	

5. - $ xgps  // display data after 4.

//6. ubxtool // https://manpages.ubuntu.com/manpages/focal/man1/ubxtool.1.html
	- $ ubxtool -e GPS
	- $ ubxtool -e NMEA
	- $ ubxtool -p MON-VER
	- $ ubxtool -p CFG-GNSS

6. 
 - $ tail -f /var/log/syslog


GPS - Global Positioning System / USA-24
GLONASS - Russia-24
BDS - China-35
Galileo - Europe

LBS - Location Based System
GNSS - Global Navigation Satellite System

u-center 是由 ublox 公司提供的 GPS 评估软件，可以对 ATK-NED-6M GPS 模块进行全面测试
将 ATK-NEO-6M GPS 模块通过 ALIENTEK STM32 开发板板载的 USB 转串口连接到电脑，并给 GPS 模块供电
	注意：这里的模块和电脑的连接，中间没有经过单片机处理！直接是模块的 TXD 接开发板 USB 转串口的 RXD，模块的 RXD 接开发板 USB 转串口的 TXD

//GNSS 这套系统给个简单的描述，就是:
	- 天上有24颗卫星在不断的绕地球运动（图1），
	- 每颗卫星不断发送“我是谁，我在哪里”的信号（电文）
	- 接收机（比如手机GPS芯片/接收模块）收到了多颗卫星发出的这样的信号，根据信号传播时间推算出离卫星的距离，进而解出了接收机自己的位置，顺便可以得到当前准确时间
	- c*c*(t-t1)(t-t1) = (x-x1)(x-x1) + (y-y1)(y-y1) + (z-z1)(z-z1) -- 需要4颗
	- 卫星时刻发送连续循环的信号
	- GPS卫星发送30秒一次的循环电文

//手机GPS芯片
	- 多是作为一个IP核放在CPU处理器芯片内的，没有单独封装成一个芯片
	- GPS芯片/核的内部结构，主要分为射频和基带两大块
	- 射频部分把卫星信号下变频为中频信号并模数转换为数字信号
	- 基带部分实现信号捕获跟踪处理

参考：https://www.youtube.com/watch?v=Rhq18MV6LtU
GPS 24
BDS 35
欧盟 
俄罗斯 ==> 授时、定位、导航、差分定位修正误差

// Raspberry Pi 
is a series of small single-board computers developed in the United Kingdom by the Raspberry Pi Foundation in association with Broadcom. The Raspberry Pi project originally leaned towards the promotion of teaching basic computer science in schools and in developing countries.

参考：GPS NEO 6M模块 https://www.youtube.com/watch?v=TzeBuOYn76Q

参考：SKYLAB-GPS Module
	- 在定位终端产品中嵌入GPS模块
	- 通过GPS模块的串口获取定位数据，位置数据
	- GPS模块只要处于工作状态就会源源不断地把接收并计算出的GPS导航定位信息传送单片机中
	- GPS模块遵循NMEA-0183协议
	- GPGGA：GPS固定数据输出语句，这是一帧GPS定位的主要数据，也是使用最广的数据。
		```
		$GPGGA,<1>,<2>,<3>,<4>,<5>,<6>,<7>,<8>,<9>,<10>,<11>,<12>,<13>,<14>*<15>

		<1> UTC时间，格式为hhmmss.sss。
	
		<2> 纬度，格式为ddmm.mmmm（前导位数不足则补0）。
	
		<3> 纬度半球，N或S（北纬或南纬）。
	
		<4> 经度，格式为dddmm.mmmm（前导位数不足则补0）。
	
		<5> 经度半球，E或W（东经或西经）。
	
		<6> 定位质量指示，0=定位无效，1=定位有效。
	
		<7> 使用卫星数量，从00到12（前导位数不足则补0）。
	
		<8> 水平精确度，0.5到99.9。
	
		<9> 天线离海平面的高度，-9999.9到9999.9米
	
		<10> 高度单位，M表示单位米。
	
		<11> 大地椭球面相对海平面的高度（-9999.9到9999.9）。
	
		<12> 高度单位，M表示单位米。
	
		<13> 差分GPS数据期限（RTCM SC-104），最后设立RTCM传送的秒数量。
	
		<14> 差分参考基站标号，从0000到1023（前导位数不足则补0）。
	
		<15> 校验和。
		```

方案二：Google Maps API
	- https://www.googleapis.com/geolocation/v1/geolocate?key=YOUR_API_KEY

//嵌入式系统上实现GPS全球定位功能
1.1 GPS模块与ARM开发板的物理连接
GPS模块属于字符设备，只需要和FL2440开发板的第二个串口连接既可以，然后将GPS测试模块放在室外便可以每隔一段时间向开发板的串口发一个数据包。
1.2 GPS数据解析
1.3 ARM+linux串口编程介绍
1.4 编写GPS数据解析程序
	- gps_test.c     测试程序，包含 主函数
	- gps_analysis.c GPS数据解析函数设计
	- set_com.c      设置GPS串口设备函数设计
	- gpsd.h         头文件
1.5 编译下载GPS数据解析程序到开发板上


```c
// 1/4 gps_test.c

#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>
#include <stdlib.h>
#include "gpsd.h"
#define GPS_LEN 512         /* GPS数据长度宏定义 */
int main (int argc, char **argv)
{
    int fd = 0;
    int nread = 0;
    GPRMC gprmc;
    //GPRMC *gprmc;
    char gps_buff[GPS_LEN];
    char *dev_name = "/dev/ttyS1";
    fd = open_com(dev_name);
    set_opt(fd,4800,8,'N',1);
    while(1)
    {
        sleep(2);  //注意这个时间的设置，设置不恰好的话，会导致GPS数据读取不完成，数据解析出错误
        nread = read(fd,gps_buff,sizeof(gps_buff));
        //printf("gps_buff: %s", gps_buff);
        memset(&gprmc, 0 , sizeof(gprmc));
        gprmc_analysis(gps_buff, &gprmc);
        if(nread > 0)
        {
		printf("===========  GPS全球定位模块  ==============\n");
		printf("==            开发者：韦书胜                  ==\n");
		printf("==            版本：  1.0.0                    ==\n");
		printf("===========================================\n");
		printf("===========================================\n");
		printf("= GPS状态位 : %c  [A:有效状态 V:无效状态]=\n" ,gprmc.pos_state);
		printf("= GPS模式位 : %c  [A:自主定位 D:差分定位]=\n" , gprmc.mode);
		printf("=日期 : 20%02d-%02d-%02d=\n", gprmc.date%100, (gprmc.date%10000)/100,
		  gprmc.date/10000);
		printf("=时间 : %02d:%02d:%02d=\n",(gprmc.time/10000+8)%24,(gprmc.time%10000)/100,
		gprmc.time%100);
		printf("=纬度 : 北纬:%.3f=\n",(gprmc.latitude/100));
		printf("=经度 : 东经:%.3f=\n",(gprmc.longitude/100));
		printf("=速度 : %.3f =\n",gprmc.speed);
		printf("===========================================\n");
         }
    }
    close(fd);
    return 0;
} /* ----- End of main() ----- */

// 2/4 gps_analysis.c

#include <stdio.h> 
#include <string.h> 
#include <stdlib.h> 
#include <sys/types.h> 
#include <errno.h> 
#include <sys/stat.h> 
#include <fcntl.h> 
#include "gpsd.h" 
int gprmc_analysis (char *buff,GPRMC *gprmc) 
{ 
	char *ptr = NULL; 
	if(gprmc == NULL) return -1; 
	if(strlen(buff) < 10) return -1; 
	if(NULL == (ptr = strstr(buff,"$GPRMC"))) return -1; 
	sscanf(ptr,"$GPRMC,%d.000,%c,%f,N,%f,E,%f,%f,%d,,,%c*",\             
	&(gprmc->time),&(gprmc->pos_state),&(gprmc->latitude),&(gprmc->longitude),&(gprmc->speed),&(gprmc->direction),&(gprmc->date),&(gprmc->mode)); 
	return 0; 
} /*  ----- End of gprmc_analysis()  ----- */ 

//strstr(str1,str2) 函数用于判断字符串str2是否是str1的子串。如果是，则该函数返回str2在str1中首次出现的地址；否则，返回NULL。 
//sscanf() 从一个字符串中读进与指定格式相符的数据。 
/* 例子： 
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>   
int main(int argc, char **argv)  
{  
	int ret;  
	char *string;  
	int digit;  
	char buf1[255];  
	char buf2[255];   
	string = "china beijing 123";  
	ret = sscanf(string, "%s %s %d", buf1, buf2, &digit);  
	printf("1.string=%s\n", string);  
	printf("1.ret=%d, buf1=%s, buf2=%s, digit=%d\n\n", ret, buf1, buf2, digit); 
	return 0; 
}  
执行结果:  1.ret=3, buf1=china, buf2=beijing, digit=123  
可以看出,sscanf的返回值是读取的参数个数  
*/

// 3/4 set_com.c  GPS串口设备配置函数


#include <stdio.h> 
#include <string.h> 
#include <errno.h> 
#include <sys/stat.h> 
#include <fcntl.h> 
#include <unistd.h> 
#include <termios.h> 
#include <sys/types.h> 
#include <stdlib.h> 
#include "gpsd.h" 

int set_opt(int fd,int nSpeed, int nBits, char nEvent, int nStop) 
{     
	struct termios newtio,oldtio; 
	if( tcgetattr( fd,&oldtio) != 0) 
	{ 
		perror("SetupSerial 1"); 
		return -1; 
	} 
	bzero( &newtio, sizeof( newtio ) );     
	newtio.c_cflag  |= CLOCAL | CREAD;     
	newtio.c_cflag &= ~CSIZE; 
	switch( nBits ) { 
	case 7:             
	newtio.c_cflag |= CS7; break; 
	case 8:             
	newtio.c_cflag |= CS8; break; 
	} 
	switch( nEvent ) { 
	case 'O': //奇校验                     
		newtio.c_cflag |= PARENB;             
		newtio.c_cflag |= PARODD;             
		newtio.c_iflag |= (INPCK | ISTRIP); 
		break; 
	case 'E': //偶校验                     
		newtio.c_iflag |= (INPCK | ISTRIP);             
		newtio.c_cflag |= PARENB;             
		newtio.c_cflag &= ~PARODD; 
		break; 
	case 'N':             
		newtio.c_cflag &= ~PARENB; break; 
	} 
	switch( nSpeed ) { 
	case 2400: 
		cfsetispeed(&newtio, B2400); 
		cfsetospeed(&newtio, B2400); 
		break; 
	case 4800: 
		cfsetispeed(&newtio, B4800); 
		cfsetospeed(&newtio, B4800); 
		break; 
	case 9600: 
		cfsetispeed(&newtio, B9600); 
		cfsetospeed(&newtio, B9600); 
		break; 
	case 115200: 
		cfsetispeed(&newtio, B115200); 
		cfsetospeed(&newtio, B115200); 
		break; 
	default: 
		cfsetispeed(&newtio, B9600); 
		cfsetospeed(&newtio, B9600); 
		break; 
	} 
	if( nStop == 1 ) 
	{      	newtio.c_cflag &= ~CSTOPB; 
	} 
	else if ( nStop == 2 ) 
	{        newtio.c_cflag |= CSTOPB; }    
	newtio.c_cc[VTIME] = 0;     
	newtio.c_cc[VMIN] = 0; 
	tcflush(fd,TCIFLUSH); 
	if((tcsetattr(fd,TCSANOW,&newtio))!=0) 
	{ 
		perror("com set error"); 
		return -1; 
	} 
	return 0; 
} 

int open_com(char *device_name) {
	int fd = 0; if (0 > (fd = open(device_name, O_RDWR|O_NOCTTY|O_NDELAY))) //要设置非阻塞模式打开设备否则会出错！ 		{ 
		perror("Open Comport Fail:"); 
		return 0; 
	} 
	return fd; 
}/*  ----- End of open_com()  ----- */

// 4/4 gpsd.h

#ifndef __GPSD_H__ 
#define __GPSD_H__ 
typedef unsigned int UINT; 
typedef int BYTE; 
typedef long int WORD; 
typedef struct __gprmc__ 
{ 
	UINT time; //时间     
	char pos_state; //定位状态     
	float latitude; //纬度     
	float longitude; //经度     
	float speed; //移动速度     
	float direction; //方向 
	UINT date; //日期     
	float declination; //磁偏角     
	char dd; //磁偏角方向     
	char mode; 
} GPRMC; 
extern int open_com(char *device_name); 
extern int gprmc_analysis(char *buff,GPRMC *gprmc); 
extern int set_opt(int fd,int nSpeed, int nBits, char nEvent, int nStop); 
#endif

```

```bash
// 1.交叉编译器编译GPS数据解析程序
$ ls gps_analysis.c  gpsd.h  gps_test  gps_test.c  makefile  set_com.c  version.h 
$ /opt/buildroot-2011.11/arm920t/usr/bin/arm-linux-gcc set_com.c gps_test.c gps_analysis.c -o gps_wei_test 
$ ls gps_analysis.c gpsd.h gps_test.c gps_wei_test set_com.c

// 2.在开发板上直接运行gps_test可执行程序，便可以获取解析后的GPS数据了

/fl2440/gps >: ./gps_wei_test  
gps infomation :8,53,332,24,30,52,231,43*77GPGSV,3,2,12,11,47,043,15,07,33,192,48,17,32,284,34,20,28,140,14*7CGPGSV,3,3,12,08,24,176,47,32,23,091,13,19,11,064,22,06,03,218,24*7FGPRMC,030323.000,A,3029.6405,N,11423.6222,E,0.34,332.13,210914,,,A*69GPGGA,030324.000,3029.6408,N,11423.6220,E,1,09,1.0,106.1,M,-13.7,M,,0000*7DGPGSA,A,3,04,08,28,30,07,17,01,11,19,,,,1.8,1.0,1.5*33GPRMC,030324.000,A,3029.6408,N,11423.6220,E,0.29,346.94,210914,,,A*61GPGGA,030325.000,3029.6410,N,11423.6218,E,1,09,1.0,105.2,M,-13.7,M,,0000*7EGPGSA,A,3,04,08,28,30,07,17,01,11,19,,,,1.8,1.0,1.5*33GPRMC,030325.000,A,3029.6410,N,11423.6218,E,0.28,315.50,210914,,,A*6DGPGGA,030326.000,3029.6412,N,11423.6216,E,1,09,1.0,104.5,M,-13.7,M,,0000*77GPGSA,A,3,04,08,28,30,07,17,01,11,19,,,,1.8,1.0,1.5*33GPRMC,030326.000,A,3029.6412,N,11423.621

=========== GPS全球定位模块  
= GPS状态位 : A [A:有效状态 V:无效状态]
= 日期 : 2014-09-21 
时间 : 11:03:23 
纬度 : 北纬:30.296 
经度 : 东经:114.236 
速度 : 0.340
```
到此，我们的GPS定位成功！

[ssh key]
1. ssh keys work much like 2 pieces of a puzzle
unique because they only match with each other and nothing else
2. Generate a pair of keys: private key - on your computer, public key - copy public key onto remote machines
3. rsa - encoding method
4. default path for rsa key pair on Debian: ~/.ssh/id_rsa

```bash
<!-- only one key -->
$ ssh-keygen -t rsa     // generate(id_rsa + id_rsa.pub) + location + passphrase
// --> give the content of id_rsa.pub to Dartagnan to add to the list on the server
$ ssh-add               // include into the authentication agent of SSH
$ ssh-copy-id user@host // copy it onto the remote machine
$ nano sshd_config      // AUthentication/PermitRootLogin without-password

// reload SSH
$ reload SSH
$ sudo service ssh restart  // path: /User/lisa/.ssh/id_rsa

<!-- mutiple keys -->
$ ssh-keygen -C "carswap-key-19" -t ed25519 // file: key_cs_123  passphrase: pp123
$ ssh-copy-id -i ~/.ssh/key_cs_123.pub acme.learnlinux.cloud
$ ssh -i ~/.ssh/key_cs_123 acme.learnlinux.cloud // to unlock the key, input passphrase

$ sudo chown username path + password for username

$ scp -i key-file local-file username@server.com:/srv/html/path 
```

[Linux - tty]
Ctrl + Alt + F1~F6 switch between different users;
Debian GNU/Linux 10 ac-master tty2

在大多数 发行版 中，你可以使用以下键盘快捷键来得到 TTY 屏幕：

CTRL + ALT + F1 – 锁屏 / Zotac-TTY1
CTRL + ALT + F2 – 桌面环境 / Zotac-LCD
CTRL + ALT + F3 – TTY3
CTRL + ALT + F4 – TTY4
CTRL + ALT + F5 – TTY5
CTRL + ALT + F6 – TTY6
你最多可以访问六个 TTY。但是，前两个快捷方式指向发行版的锁定屏幕和桌面环境。

[E2V dev]
// newsapiorg.php

// new E2V for Cyrus
	- database: carswap root/OES12345@
	- tables: cs_car + cs_users + cs_images + dealer_slots + dealer_screens
	- dealer's picture: https://api.carswap.me/e2v/logos/122809.png - not in use

1. agent name from database or UI
2. https://api.carswap.me/e2v/cs_lorbek_v.php
3. 图片位置调整
4. 去掉白色背景图
5. 字体更新
6. 加上agent名字
7. 换 Carswap logo

[Ray White E2V]
	- A new boss means new api-key and token 9/12

[todo]
// debug global event bus
// https://blog.huati365.com/9dc7d6666f2709ad - AnyEvent

[Linux - service]
...

[connect E2V to a Display]
	post - http://localhost:8000/api/v1/scheduleSource
	get  - http://localhost:8000/api/v1/displays?include=bookings,e2vbookings,tags&limit=all&team=353
	get  - http://localhost:8000/api/v1/campaigns?include=tags,media&limit=all&team=353
	get  - http://localhost:8000/api/v1/sources?limit=all&team=353
[delete E2V from a Display]
	delete - http://10.1.1.238:8000/api/v1/displays/6675/sources/692
	get - displays 同上
	get - campaigns
	get - sources
	
[make a campaign]

[uploading a png]

	1. click 'upload' on localhost:8080 
		- axios.post(UPLOAD_ENDPOINT)
		- 1. nerkmid receives the file and Beginning conversion of image from $.../conv/in/filename to $.../conv/out/filename.png
		- 2. Creating thumbnail filename_l.jpg, filename_m.jpg, and filename_s.jpg in  $.../conv/thumb/
		- 3. Sending callback to API
		- 4. Sending API request to store media
	2. axios.get(UPLOAD_POLL_ENDPOINT)
		- ```
		  response: {
			stauts:200, 
			statusText:"OK", 
			config:{url:"http://localhost:8008/status"},
			data: {hash: "b735153d8bbc495b22ea4d5d52c9ae83"}
			}
		  ```
	3. click an image: request URL - http://10.1.1.238/out/7e8265381303728d832e1d75a791d184.png

[Media / refresh]
http://localhost:8000/api/v1/media?limit=all&search=&team=353
```
	...
	{
	   "mediaId":"1063843",
	   "teamId":"353",
	   "imageId":"15639",
	   "name":"5188a01e8f98e4e553ded995908d5cea.png",
	   "size":"68498",
	   "height":"755",
	   "width":"1025",
	   "hash":"b735153d8bbc495b22ea4d5d52c9ae83",
	   "mimeType":"image\/png",
	   "uri":"http:\/\/localhost\/out\/5188a01e8f98e4e553ded995908d5cea.png"
	}
	...
```
http://localhost/thumb/b735153d8bbc495b22ea4d5d52c9ae83_l.jpg


1.png 200
	https://aws.adverpost.com/ccda4afcbad22a95e3bc27d7e6bee980.png 
PFS_VideoScreen_384x240px_6c_.jpg
	https://aws.adverpost.com/2779d5953353fa92e04f89af8b65dbf4.png
0b79f1bc81a936eecc3810aa0b493f6e.png
	http://localhost/out/0b79f1bc81a936eecc3810aa0b493f6e.png
ed7bb012952ab8aba1fec4ee038d6ead.png	
	http://localhost/out/ed7bb012952ab8aba1fec4ee038d6ead.png
	
[ufw]
```bash
$ sudo ufw status verbose 
$ systemctl status ufw
$ ufw enable
$ sudo ufw allow http
$ sudo ufw allow 80
$ sudo ufw allow 8000
```
	- UFW防火墙的默认行为是阻止所有传入和转发流量，并允许所有出站流量。这意味着除非您打开指定的端口，否则任何尝试访问您的服务器的人都将无法连接。
	- 默认策略在/etc/default/ufw文件中定义，可以通过手动修改该文件或使用sudo ufw default <policy> <chain>命令来更改。
	- 根据系统上运行的应用程序，您可能还需要打开其他端口。 打开端口的一般语法是ufw allow port_number/protocol。如果未给出协议，则UFW会同时为tcp和udp创建规则。


[IRC] 
	Internet Relay Chat
	IRC Client
	IRC Server
	
[HexChat / IRC]
1. all commands are in 00.html / External API
2. Server: root.cdn.adverpost.com
3. If a display has quit, it is not on the list of the HexChat anymore.

http://root.cdn.adverpost.com:2222/clients

[connect to zotac using ssh]
```bash
$ ssh root@10.1.1.134
// password + enter
root@ac-master:~# systemctl start apn
root@ac-master:~# logout

root@ac-master:~# top
root@ac-master:~# cd /
root@ac-master:~# cd hadaly
root@ac-master:~# ls
// adclient  AnyEvent  assets  bin  cache	Data  DISCLAIMER  docs	Hadaly	IO  opt
root@ac-master:~# cd Hadaly
root@ac-master:~# ls
// Blocking.pm  Config.pm	Listener.pm  Playlist.pm  System.pm  Util.pm
root@ac-master:~# nano Config.pm
root@ac-master:~# systemctl restart ac
root@ac-master:~# systemctl status ac
```
A guide to Login as root over SSH on Ubuntu
https://www.linuxfordevices.com/tutorials/ubuntu/login-as-root-over-ssh
```bash
//  To check if we have an ssh-server is installed on our target machine
root@ac-master:~# apt-cache policy openssh-server
// Install ssh-server
root@ac-master:~# sudo apt install openssh-server
root@ac-master:~# systemctl status ssh
root@ac-master:~# sudo systemctl enable --now ssh
// edit /etc/ssh/sshd_config --> PermitRootLogin yes + PubkeyAuthentication yes
root@ac-master:~# sudo systemctl restart ssh
```

[mailgun]
```bash
curl -s --user 'api:YOUR_API_KEY' \
    https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages \
    -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
    -F to=YOU@YOUR_DOMAIN_NAME \
    -F to=bar@example.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomeness!'
```

```php
$mgClient = Mailgun::create($this->di->getConfig()->mailgun->apiKey, $this->di->getConfig()->mailgun->apiUrl);
$params = array(
	'from'    => $this->di->getConfig()->mailgun->from,
	'to'      => $this->di->getConfig()->mailgun->adminAccount,
	'subject' => 'Pending Manual Approval',
	'html'    => $this->view->getRender('emails', 'ManualApprovalEmail', [
		"email" => $email,
		"username" => $username,
		"userId" => $user->getId()
		])
);
try {
	$mgClient->messages()->send($this->di->getConfig()->mailgun->domain, $params);	
} catch (\Exception $e) {
				return $this->respondServerError('The server failed to process your request');
			}
```

[New Zotac]
How to make a new copy of Zotac
	# Jobs at Office
	- a new empty Zotac + a new M2 Hard disk
	- Hard Disk connected to the computer next to Michael
	- double-click Adverclient(adclient-318-amd64.img.xz(https://docs.adverpost.com )) --> target new Hard disk
	
	- a warning window appears + fix
	- system / GParted -- choose the 2nd part(apclient) + expand the volume to 120G	
	
	- put the Hard Disk in the Zotac
	- connect the Zotac to a screen --power_on--> show HWID 113.189.1b2
	- delete --> BIOS setting: Power/Loss - on, 
				   Security/Secure boot/Secure boot - disabled, secure mode - custom,
	                           Boot - legacy --> win8 or Pure UEFI
	
	- check HexChat / noconf / :*:getID + :*:clearState
	- Add a new Display on adverpost + change ACID to TEST.****
		- LED: pixel is useful, physical width and height only for users 
		- LCD: 0×0 -- use the maximum by default 
		- block time -- the maximum of a campaign supported
		- Brightness / censor -- not finished yet
		- ACID connected to IRC, not for users, can be renamed to something meaningful
	- check HexChat / noconf: h_14... has quit --> / #au: TEST
	
	- Ctrl + Alt + F1: enter cmd window
	- root / elitem
	- hadaly/Hadaly/System.pm  --> http://10.1.1.238:8000
	- nano "..." interface=%s --> "eth1" // Ln:66 or "eth0"
	- systemctl restart ac
note:
	- On a LCD, contents can be rotated: 
		Displays / A-TEST / Edit / Type:LCD + Pixel Width/Height:0 + Screen Rotation: 180
	- change wifi password to custom
		nano /etc/wpa_supplicant.conf
		network={
		ssid="name"
		psk="pwd"
		}		
	# Jobs on site
	- move the newly imaged Zotac to onsite
	- turn on wifi hotspot: AP + ba...123 
	- connect: wifi antenna + LED cable + Power cable
	
	- check the status of Display --> online :)
	 
	# exception for replacing
	- reimage the damaged zotac --> new HWID
	- remove all booked campaign
	- edit Display --> change HWID to the new one & save


​		
[DHCP and DNS]
DHCP 
​	- Dynamic Host Configuration Protocol
​	- Assigns IP addresses to hosts
​	- Comes as a client and a server
​	- DHCP Discover + DHCPOffer + DHCPRequest + DHCPACK
​	- DHCPDiscover - Looks for a DHCP server
​	- DHCPOffer - The DHCP server offers an address
​	- DHCPRequest - The host requests to lease the address
​	- DHCPACK / sends < IP addr + subnet mask + the default gateway + dns server >
​	- UDP Port / Client 68 + Server 67
dhcpcd
​	- an implementation of the DHCP client
​	- gets the host information (IP address, routes, etc) from a DHCP server 
​	- configures the network interface of the machine on which it is running 
​	
OpenWrt luci feed 
​	- LuCI - OpenWrt Configuration Interface
​	- https://github.com/Lisa-NJ/luci
UPD (User Datagram Protocol)
​	- UDP ports include the DNS port (53), the Dynamic Host Configuration Protocol port (68), and the Kerberos port (88)
dnsmasq

MAC Address
	- media access control address
	- a unique ID assigned to network interface cards (NICs)
	- also known as a physical or hardware address

[LAN]
LAN cable - Local Area Network
Ethernet cables can have different lengths, colors and transmission speeds. But they all have one thing in common: they have an RJ45 connector at both ends.

[linux shortcut]
```
Ctrl+Alt+T ==> open the terminal
Window + <-/-> ==> left half / right half
Ctrl+R ==> reverse-i-search

```
[Postman]
1. Postman doesn't save header data or query parameters to avoid exposing sensitive data such as API keys.
2. Cloud Agent Error: Can not send requests to localhost. Select a different agent.
	- 不能给 localhost 发请求
	- $ snap install postman  // Install Postman Desktop Agent
3. If you're integrating a third-party API, the required authorization will be specified by the API provider.	

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
$ cd /etc/nginx
$ sudo nginx
$ sudo nginx -v       <!-- nginx/1.18.0 -->
$ ps -aux|grep nginx
$ sudo nginx -s quit
$ nginx -s reload
$ sudo nginx -t  <!--to check config file-->
```
PCRE: for Nginx to Rewrite
/usr/share/nginx/html/index.html

edit etc/nginx/sites-availiable/default
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
	在Nginx的官方文档中定义的location的语法结构为：
	
	location [ = | ~ | ~* | ^~ ] uri { ... }
	其中，uri变量是待匹配的请求字符串，可以是不含正则表达的字符串，如/myserver.php等；也可以是包含有正则表达的字符串，如 .php$（表示以.php结尾的URL）等。为了下文叙述方便，我们约定，不含正则表达的uri称为“标准uri”，使用正则表达式的uri称为“正则uri”。
	
	其中方括号里的部分，是可选项，用来改变请求字符串与 uri 的匹配方式。在介绍四种标识的含义之前，我们需要先了解不添加此选项时，Nginx服务器是如何在server块中搜索并使用location块的uri和请求字符串匹配的。
	
	在不添加此选项时，Nginx服务器首先在server块的多个location块中搜索是否有标准uri和请求字符串匹配，如果有多个可以匹配，就记录匹配度最高的一个。然后，服务器再用location块中的正则uri和请求字符串匹配，当第一个正则uri匹配成功，结束搜索，并使用这个location块处理此请求；如果正则匹配全部失败，就使用刚才记录的匹配度最高的location块处理此请求。
	
	了解了上面的内容，就可以解释可选项中各个标识的含义了：
	
	“=”，用于标准uri前，要求请求字符串与uri严格匹配。如果已经匹配成功，就停止继续向下搜索并立即处理此请求。
	
	“^～”，用于标准uri前，要求Nginx服务器找到标识uri和请求字符串匹配度最高的location后，立即使用此location处理请求，而不再使用location块中的正则uri和请求字符串做匹配。
	
	“～”，用于表示uri包含正则表达式，并且区分大小写。
	
	“～*”，用于表示uri包含正则表达式，并且不区分大小写。注意如果uri包含正则表达式，就必须要使用“～”或者“～*”标识。

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

[Xvfb]
Xvfb 是一个虚拟 X 服务器的缩写，它代表 "X Virtual Framebuffer"。Xvfb 允许在没有物理显示器的情况下运行图形应用程序，它模拟了一个完整的 X 服务器环境。

传统上，X 服务器用于显示图形用户界面 (GUI) 应用程序，需要连接到物理显示器或远程显示器。但是，在某些情况下，可能没有可用的显示器，或者你希望在没有显示器的情况下运行应用程序。这时，就可以使用 Xvfb 来创建一个虚拟的 X 服务器，它只存在于内存中而不需要物理显示器。

Xvfb 将图形输出渲染到内存中的虚拟帧缓冲区，而不是发送到实际的显示设备。这使得你可以在后台运行图形应用程序，无需图形界面的实际显示。Xvfb 的输出可以被重定向到其他 X 应用程序进行处理，或者可以使用工具（如 Xvnc）将图形显示到远程计算机上。

Xvfb 在许多情况下都非常有用，例如在服务器上运行测试套件、自动化测试、无头浏览器（Headless Browser）以及需要图形环境的脚本和应用程序等。它提供了一种轻量级的方法来模拟和处理图形输出，而不依赖于物理显示器。


[login keyring 22/7/2023]

在Linux中，login keyring（登录密钥环）是一种安全存储用户敏感数据的机制。它主要用于存储和管理用户的密码、私钥、数字证书、认证令牌等敏感信息。当用户登录到图形界面或通过终端登录时，系统**会自动创建和管理**一个登录密钥环。

登录密钥环的目的是**避免在用户会话期间频繁输入**密码和敏感信息，从而提高用户体验和安全性。一旦用户提供了登录密码，系统将解锁登录密钥环，并且在用户登录期间始终保持解锁状态。这样，其他应用程序和服务可以使用登录密钥环来获取存储在其中的敏感数据，而不需要用户再次输入密码。

例如，当用户登录到一个使用电子邮件客户端的图形界面时，该客户端可能需要访问存储在登录密钥环中的用户邮箱密码。登录密钥环可以在用户登录后自动解锁，并提供必要的密码信息给邮件客户端，从而无需用户手动输入密码。

尽管登录密钥环提供了方便和安全性，但同时也需要谨慎对待。如果恶意软件或攻击者能够访问解锁的密钥环，他们可能会获取到其中存储的敏感信息。因此，在使用登录密钥环时，用户需要保证自己的系统处于良好的安全状态，并避免安装来自不可信来源的软件。

需要注意的是，不同的Linux发行版可能有不同的登录密钥环实现方式和工具。常见的工具包括 GNOME Keyring 和 KWallet（用于KDE桌面环境）。这些工具通常与特定的桌面环境相关联，并且提供图形界面来管理和查看存储在登录密钥环中的数据。

//1. Seahorse is the tool to manage keys and passwords.

//2. Most desktop environments like GNOME, KDE, Xfce etc use an implementation of [gnome-keyring](https://wiki.archlinux.org/index.php/GNOME/Keyring?ref=itsfoss.com) to provide this keyring feature in Linux.

//...待完成 https://itsfoss.com/ubuntu-keyring/
收回昨天的话，只旁观，不折腾了，好累 9/8/2023
