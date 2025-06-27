### To do list

- [x] 已完成任务
- [ ] cron + updatedb +
- [ ] type codes & creator codes
- [ ] sticky bit (page 980)
- [ ]  the pwd shell builtin && the pwd 
- [ ] utility(/bin/pwd)
- [ ] getfacl  setfacl
- [ ] xargs/881
- [ ]  the linux tty device driver
- [ ]  background tasks /283 + job contrl
- [ ] the compatible parameter (page 158) set
- [ ] a swap file (Figure 6-7, page 162)
- [ ] LANG page304 and VIMINIT(for vim initialization)
- [ ] The lnks script (page 406)
- [ ] PATH page297 -- change the environment so the shell searches the working directory automatically
- [ ] huponexit (page 333)
- [ ] set MAIL + MAILPATH + MAILCHECK
- [ ] menu prompt page 374
- [ ] select control structure page 428
- [ ] bash debugging symbol page 410
- [ ] ps page 796
- [ ] Functions page 437 -- the use of local and global variables within a function
- [ ] bash features and options page 330
- [ ] test utility - page 854
- [ ] shell builtin - page 446
- [ ] ??? sra - binary



### docker
```bash
$ sudo docker pull phpnotdead/phalcon:7.4-4.1.0
$ sudo docker images
$ sudo docker run -d \
            --name php7.4-fpm \
            -v /home/myname/helpers:/var/www/helpers \
            -v /home/myname/api:/var/www/api \
            -p 9000:9000 \
            php:7.4-fpm
$ sudo docker run -d --name phalcon-api -v ~/my/api/public:/var/www/html -p 9001:9000 phpnotdead/phalcon:7.4-4.1.0
$ sudo docker ps
$ sudo docker stop php7.4-fpm-api
$ sudo docker rm php7.4-fpm-api
$ sudo docker exec -it <container_name_or_id> /bin/bash
$ sudo docker exec <container_name_or_id> <command>
$ sudo docker exec my-container ls /var/www/html
$ sudo docker logs <container_name_or_id>

$ sudo docker pull php:7.4-fpm
$ sudo docker run -d --name php-api -v ~/my/api:/var/www/html -p 9009:9000 php:7.4-fpm
$ sudo docker exec -it <container_name_or_id> sh
Install: phalcon4 (psr) + procps(ps)
$ sudo docker commit <CONTAINER_ID> ap-php-phalcon
$ sudo docker run -d --name php-fpm-phalcon \
            -v /my/path/work/api:/var/www/html \
            -p 9000:9000 \
            ap-php-phalcon

$ sudo docker images
REPOSITORY            TAG         IMAGE ID       CREATED       SIZE
php7.4-cli-phalcon4   latest      0361c1856d8c   5 days ago    882MB
ap-php-phalcon        latest      c66fd6129c8f   5 days ago    510MB
php                   7.4-fpm     38f2b691dcb8   2 years ago   443MB

$ sudo docker tag c66fd6129c8f ap-php-phalcon:fpm7.4-phalcon4
$ sudo docker images
REPOSITORY            TAG               IMAGE ID       CREATED       SIZE
php7.4-cli-phalcon4   latest            0361c1856d8c   5 days ago    882MB
ap-php-phalcon        fpm7.4-phalcon4   c66fd6129c8f   5 days ago    510MB   # a new item
ap-php-phalcon        latest            c66fd6129c8f   5 days ago    510MB

$ sudo docker save -o ap-php-phalcon.tar ap-php-phalcon:fpm7.4-phalcon4

$ sudo chown  lisa:lisa ap-php-phalcon.tar  # not copyable if it is root:root 
copy to share with team
$ docker load -i my-app.tar  # to import
$ sudo docker images    # to check
```



### Time

```bash
$ timedatectl status
    Local time: Wed 2025-03-05 09:55:41 ACDT
           Universal time: Tue 2025-03-04 23:25:41 UTC
                 RTC time: Tue 2025-03-04 23:25:41
                Time zone: Australia/Adelaide (ACDT, +1030)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
$ systemctl status ntp
Unit ntp.service could not be found.
$ systemctl status ntpd
Unit ntpd.service could not be found.
==> systemd-timesyncd or chronyd
在现代的 Debian 和 Ubuntu 服务器上，默认的时间同步服务是 systemd-timesyncd，而不是 ntpd。
$ systemctl status systemd-timesyncd
Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-02-21 11:18:16 ACDT; 1 week 4 days ago
       Docs: man:systemd-timesyncd.service(8)
...
$ apt install systemd-timesyncd
$ systemctl status systemd-timesyncd
```



### grub

```
┌───────────────────────┐
│  1. BIOS/UEFI 固件    │  计算机通电后，首先执行 BIOS 或 UEFI 固件，进行硬件初始化和自检
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│  2. 第1阶段加载程序     │   BIOS/UEFI 移交控制权 (位于磁盘的 MBR 中，大小通常为 512 字节)
│    (boot.img)         │
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│  3. 第1.5阶段加载程序   │  由第1阶段加载程序加载，位于磁盘的第一个分区或文件系统的引导扇区; 提供文件系统支持，能够读取磁盘上的文件
│    (core.img)         │
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│  4. 第2阶段加载程序     │ 由第1.5阶段加载程序加载，负责读取 GRUB 配置文件，并据此显示启动菜单
│    (grub.cfg)         │
└──────────┬────────────┘
           │
           ▼
┌──────────────────────┐
│  5. 显示启动菜单       │
│    (等待用户选择)      │
└──────────┬───────────┘
           │
           ▼
┌───────────────────────┐
│  6. 加载内核和initrd    │
│    (vmlinuz, initrd)  │
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│  7. 启动操作系统        │
└───────────────────────┘
```

### Q+A

- fatal: detected dubious ownership in repository at '/mydir'

  ```bash
  $ git config --global --add safe.direcgtory /mydir
  $ chown -R root:root /mydir
  ```

  

### Thunar File Manager + Other locations

```bash$ sudo apt install gvfs-backends
$ sudo apt install samba smbclient
Start Thunar + Input "smb://mylocalserver/share" 
	=> popup window / Connect As "Registered User" user + password / Connect
	=> Network / /share/ on cpc -- appear on the left of Thunar
```



### Partition Table

- $ sudo parted /dev/sdb print

  Model:  USB  SanDisk 3.2Gen1 (scsi)
  Disk /dev/sdb: 30.8GB
  Sector size (logical/physical): 512B/512B
  Partition Table: msdos
  Disk Flags: 

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  15.8GB  15.8GB  primary  ext4         boot

- $ sudo parted /dev/sda print
  Model: ATA WDC WDS*****G0A- (scsi)
  Disk /dev/sda: 120GB
  Sector size (logical/physical): 512B/512B
  Partition Table: gpt
  Disk Flags: 

Number  Start   End    Size   File system  Name  Flags
 1      1049kB  538MB  537MB  fat32              boot, esp
 2      538MB   120GB  119GB  ext4

- $ sudo fdisk -l
  Disk /dev/sda: 111.79 GiB, 120034123776 bytes, 234441648 sectors
  Disk model: WDC WDS*****G0A-
  Units: sectors of 1 * 512 = 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disklabel type: gpt
  Disk identifier: B*****-0393-4A29-91D8-251111*EB8C8

| Device    | Start   | End       | Sectors   | Size   | Type  |            |
| --------- | :------ | --------- | --------- | ------ | ----- | ---------- |
| /dev/sda1 | 2048    | 1050623   | 1048576   | 512M   | EFI   | System     |
| /dev/sda2 | 1050624 | 234440703 | 233390080 | 111.3G | Linux | filesystem |


...

Disk /dev/sdb: 28.65 GiB, 30765219840 bytes, 60088320 sectors
Disk model:  SanDisk 3.2Gen1
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x6****95d

Device     Boot Start      End  Sectors  Size Id Type
/dev/sdb1  *     2048 30941183 30939136 14.8G 83 Linux

### wifi check

Q: iwconfig 命令只显示 lo eth0 eth1  没有显示 wlan0?
A:
// 查看系统是否识别到无线网卡
$ lspci | grep -i wireless
$ lspci
01:00.0 Network controller: Intel Corporation Wireless 3165 (rev 81)
or
00:14.3 Network controller: Intel Corporation CNVi: Wi-Fi
// 查看是否正确加载了 iwlwifi 驱动程序
lsmod | grep iwlwifi
iwlwifi               249856  1 iwlmvm
cfg80211              774144  3 iwlmvm,iwlwifi,mac80211
or
iwlwifi               360448  0
cfg80211              1134592  1 iwlwifi

[resolution]
$ apt install fbset
$ fbset
or
$ cat /sys/class/graphics/fb0/virtual_size

[irssi]
$ sudo apt update
$ sudo apt install irssi
$ irssi -c irc.server.com -n nickname
$ /oper Name Pwd
$ /j #channelName

$ sudo apt install r-base

$ du -h filename  // show the size of a file 
$ vi newfilename
$ wc -l filename  // show how many lines in a file

$ echo "Your message here" | wall  // send broadcast message to all users online

$ useradd <tom>
$ passwd <tom>

$ lsattr
$ chattr +i .env

$ id lisa
uid=1013(lisa) gid=1013(lisa) groups=1013(lisa),27(sudo)

$ nohup command &

$ tail -n 100 example.txt   // show the last 100 lines of "example.txt"

$ top
$ ps -p <PID> -o etime
	ELAPSED
	256-23:17:05  `DAYS-HOURS:MIN:SEC`
$ date -d "257 days ago"
	Thu 08 Mar 2023 10:34:22 AM ACDT
$ ps -eo user,pid,cmd | grep 10049
	root 10049 /tmp/go-build3807.../b001/exe/nerkmid
$ ps -p <PID> -o cmdcd 
$ pwdx <PID>

$ uname -r  // Linux kernal version
$ apt-cache showpkg firmware-realtek
$ apt-cache search linux-image // to list kernals available
$ apt list --upgradable   // to show what packages can be upgraded
$ lsmod | grep i915 // 如果已加载 i915 模块，说明您已经在使用 Intel 显卡的开源驱动程序
$ lspci -v -s `lspci | awk '/ VGA / {print $1}'`
$ lspci -k // pci + driver

###  System Command

-  Installation & Log in

  login、shutdown、halt、reboot、mount、umount、chsh

- Security

  passwd、su、umask、chgrp、chmod、chown、chattr、sudo、pswho

- Management

  df、top、free、quota、at、lp、adduser、groupadd kill、crontab、tar、unzip、gunzip、last

- Network

  ifconfig、ip、ping、netstat、telnet、ftp、route、rlogin rcp、finger、mail、nslookup

- File

  file、mkdir、grep、dd、find、mv、ls、diff、cat、ln

```bash
$ > /my/path/to/abc.log
清空 abc.log 文件的内容，而不会删除文件本身
$ truncate -s 0 /my/path/to/abc.log
$ echo -n > /my/path/to/abc.log
```



### GPT & file system

GPT 分区表：GPT 使用主分区表和备份分区表来维护分区信息。主分区表位于磁盘的开头，备份分区表位于磁盘的末端。
分区和文件系统：调整文件系统大小和调整分区大小是两个不同的操作。调整文件系统大小通常不会自动更新 GPT 的备份分区表位置，因此需要手动修复。

```bash
$ sudo resize2fs -p /dev/sdb2 10G           // 调整文件系统大小
$ sudo parted /dev/sdb resizepart 2 10GB    // 调整分区大小
$ sudo sgdisk -e /dev/sdb                   // 修复 GPT 备份分区表位置
```





<!-- How to use usb disk on Linux -->
$ lsblk
`
NAME                  MOUNTPOINT
sda
 |----sda1            /boot/efi
 |----sda2            /

sdb
 |----sdb1

sdc

|----sdc1

|----sdc2

`
$ mkdir /media/usb
$ mount /dev/sdb1 /media/usb
$ umount /media/usb

<!-- The backup GPT table is corrupt, but the primary appears ok, so that will be used -->
$ sudo gdisk /dev/sdc
$ e
$ w
$ sudo gdisk -l /dev/sdc 

<!-- sdc 60G, resize to 20G, make .img, compress to .img.xz -->

$ sudo umount /dev/sdc2           // ensure sdc2 is not mounted

$ sudo e2fsck -f /dev/sdc2          // check the file system

$ sudo resize2fs /dev/sdc2 20G // resize to 20G

$ sudo fdisk /dev/sdc  (d 2 n 2 +20G w) => on Disks, 20G && restart GParted would display the update 
or $ sudo parted /dev/sdb resizepart 2 20GB

$ sudo e2fsck -f /dev/sdc2

$  sudo resize2fs /dev/sdc2

=> partition2 is resized to 20G, can be seen with Disks

$ sudo sgdisk -e /dev/sdc 
=> fix backup GPT

$ sudo mount /dev/sdc2 /mnt

$ cd /mnt && ls

$ sudo umount /dev/sdc2

$ sudo dd if=/dev/sdc of=/path/to/output.img bs=1M count=21000

=> output.img size of 20+G

$ xz -zvve9 -T0 ./output.img

=> output.img.zx size of 816.2M is created

Alternatively, if generated with Disks/Create Disk Image, the size of img file is 56G, and .img.xz is 1.5G


<!-- sdc 60G, resize to 5G, make .img, compress to .img.xz by Darius-->

Disks + GParted + Cmd / 60GB source ssd + 8GB target ssd

[1/4 Resize]
GParted / Resize  4279MB --> 4900MB ～ same as $ resize2fs -p '/dev/sdx2' 4900M
$ sgdisk -e /dev/sdx 
=> move the secondary GPT to the back of the disk

[2/4 Clone]
$ sudo dd if=/dev/sdX of=/dev/sdY status=progress
=> blank small ssd on Disks, no Partition Table

$ sgdisk /dev/sdX -R /dev/sdY
=> replicate Partiotion Table
caution! Secondary header was placed beyond the disk's limits! Moving the header, but other problems may occur!

-- can be fixed by rerunning GParted & Resize

[3/4 Img]
use: 8GB target ssd
GDisks / Create Disk Image...
=> disk.img

[4/4 Shrink]
$ sudo xz -t -k -T0 -e9 -zvv 'path/to/disk.img

<!-- wrong fs type, bad option, bad superblock on /dev/sdc, missing codepage or helper program... -->
$ mkfs -t ext4 /dev/sdc         // (1)Format
$ mount /dev/sdc /media/usb     // (2)Then can be Mounted  (3)Shown in Files

<!-- Adverclient Generation 10.11.0 + 331 -->
1. Make changes to the current version
	- 1.1 /grub-ifname-patch  -+->  "pci=nommconf"
	- 1.2 /bootstrap.sh/L115  --> "git checkout 31-extend-e2v-support-iframe" (correct version)
	- 1.3 /bootstrap.sh： 10.1.1.253 --> 10.1.1.238; 
	- 1.4 /preseed.cfg：10.1.1.253 --> 10.1.1.238; 
	      10.1.1.249 --> mirror/http/proxy string;
	      xfonts-unifont
	
2. debian-10.11.0-amd64-netinst.iso --> usb boot drive (Rufus/Windows)

// verify iso (optional)
$ ls -l ~/Downloads/debian-12.1.0-amd64-netinst.iso
$ gpg --keyserver keyring.debian.org --recv-keys 0x$(wget -q -O - https://ftp-master.debian.org/keys/release-12.asc | gpg --dry-run --import --import-options show-only | awk -F'/' '/^pub/{print $NF; exit}')
$ gpg --verify debian-12.1.0-amd64-netinst.iso.gpg debian-12.1.0-amd64-netinst.iso

// make usb boot disk using dd (optional to test)
$ sudo dd bs=4M if=path/to/debian-12.1.0-amd64-netinst.iso of=/dev/sdX status=progress
$ sudo apt update
$ sudo apt install qemu-utils
$ qemu-img --version

$ dpkg --get-selections | tee selections
$ xz -zvve9 -T0 [image].img
$ xz -dk file.xz // extract xz file

$ xz -v abc  // compress abc to abc.xz + delete abc when it is done

$ apt-get source -d [list of packages]
$ apt-get download [list of packageds]

// 
自定义 Xorg 启动脚本： 对于高级用户或需要自定义 Xorg 启动选项的情况，您可以编写自定义的 Xorg 启动脚本并使用 xinit 命令来启动 Xorg。例如：
xinit /path/to/custom-xorg-config
这将使用指定的 Xorg 配置文件启动 Xorg 服务器。

$ free -h 
```
              total        used        free      shared  buff/cache   available
Mem:           3.7Gi       3.6Gi       1.2Mi       31Mi       105Mi

```

<!-- Special parameters -->
$# the number of cmd-line arguments


<!-- Programming tools -->
1. do not name a shell script test

<!-- Processing the Cmd Line -->
1. Reading a command line
2. Applies history expansion
3. Applied alias substitution to the line
4. Parsing the cmd line into tokens and 
	scanning each token for special characters and patterns -- to take certain actions
	command-line expansion in the following order:
	`
	1. Brace expansion (page 336)
	2. Tilde expansion (page 337)
	3. Parameter and variable expansion (page 338)
	4. Arithmetic expansion (page 338)
	5. Command substitution (page 340)
	6. Word splitting (page 341)
	7. Pathname expansion (page 341)
	8. Process substitution (page 343)
	`
5. Quote removal

// a function to exchange the names of two files
function switch() 
{
	local tmp=$$switch
	mv "$1" $tmp         // positional parameters
	mv "$2" "$1"
	mv $tmp "$2"
}

$ . ~/.bash_profile // .(dot) command -- put the changes into effect immediately

// network - network-manager
$ apt update
$ apt install network-manager
$ systemctl status network-manager
$ nmcli connection show
$ nmcli device wifi rescan
$ nmcli device wifi list
$ nmcli device wifi connect SSID password PASSWORD
$ nmcli connection down SSID 

// ifupdown - 配置网络接口的工具
ifupdown 是一个用于配置网络接口的工具，它在 Linux 系统中发挥着重要的作用。具体来说，ifupdown 用于启用（up）或禁用（down）网络接口，以及为网络接口分配 IP 地址、设置路由和配置其他网络参数。
当 Linux 系统启动时，ifupdown 负责根据预定义的配置文件来激活网络接口，使得系统能够正常与网络通信。同时，在系统运行过程中，ifupdown 也能够通过命令行或脚本的方式进行网络接口的手动启用或禁用。
ifupdown 的主要作用包括：
1.管理网络接口：ifupdown 通过配置文件来管理网络接口的状态，可以启用或禁用网络接口。
2.分配 IP 地址：ifupdown 可以为网络接口分配 IP 地址，使得系统能够通过网络进行通信。
3.配置路由：ifupdown 可以设置网络接口的路由，帮助系统找到正确的网络路径来发送和接收数据。
4.配置其他网络参数：除了 IP 地址和路由，ifupdown 还可以配置其他网络参数，如子网掩码、网关、DNS 服务器等。
总的来说，ifupdown 是一个在 Linux 系统中负责网络接口配置和管理的重要工具，它确保了网络接口在启动时能够正确地配置，并能够随时进行调整和管理。

$ nc -q0 localhost 11211  // 0 s 后 quit //...???

//word splitting - no expansion, no splitting
$ IFS="p"
$ aa=export
$ echo $aa
ex ort

// reexecuting and editing commands
$ fc -l 1020 1025
$ fc -l view whereis
$ fc -e
$ fc 1029
$ fc -s 1029
$ fc -s adams=john 1029

$ !! 
$ !!44
$ !!-6
$ !ca
$ !?cat?

$ ps -f  // -f: full
$ ps --forest
$ pstree -p

$ lsblk
$ python3 -m http.server 7777   // http://localhost:7777

$ echo $TERM  // xterm-256color, linux; "xterm"表示X Window系统下的终端仿真器
$ sudo dpkg-reconfigure tzdata
$ sudo dpkg-reconfigure keyboard-configuration

$ echo 'My new file.' > myfile  // Create a file by redirecting echo's output to a file
$ date  // Wed Mar 18 17:12:20 PDT 2009
$ date +"%A %B %d" // Wednesday March 18
$ date -d "+1 hour 40 minutes"
$ script -a filename// recordss a session to filename/typesript, -a 追加 not overwriting
$ ...
$ exit

$ bzip2 -v letter_e  // compresses a file; –v (verbose): to report how much bzip2 was able to reduce the size of the file
$ bzip2 -k letter_e  // -k(keep): to keep the original file while compressing a file
$ bunzip2 letter_e.bz2
$ bzcat letter_e.bz2 | head -2  // decompresses the compressed data and displays the decompressed data

$ gzip / gunzip / zcat -- GNU zip .gz
$ compress file // .z

$ gzip -d file.gz // extract to file
$ gunzip file.gz  // extract and replace file.gz

$ unzip filename.zip // extract
$ zip -r file.zip foldername // compress

$ tar -czvf myfolder.tar.gz my_folder

$ tar -cvf all.tar g b d  // –c (create), –v (verbose), and –f (write to or read from a file)
$ tar -tvf all.tar  // -t(table)
$ tar -xvf all.tar
$ tar -xf all.tar  // -x(extract) silently 

$ gunzip -c make-3.81.tar.gz | tar -xvf -  // "–c" and "-" when using pipe
$ tar -xvzf make-3.81.tar.gz   // tar calls gunzip directly
$ tar -xvjf make-3.81.tar.bz2


$ todos memo.txt  // UNIT --> Windows/OS X
$ unix2dos memo.txt  // -b(backup) -n(new)
$ cat memo | tr -d '\r' > memo.txt      //-d(delete)

$ locate motd // search for files on the local system

$ stat -f /home | grep -i name // –f(filesystem status), –i (case insensitive)

$ lpr my\ file
$ lpr "my file"

# create a new directory in 2 ways
$ pwd
/home/charlie
$ mkdir lite/promo
$ mkdir /home/charlie/lite/promo
$ mkdir -p lite/promo  // -p: create both the lite and promo directories with one command . & ..
$ cd // = $ cd home/charlie: makes charlie’s home directory the working directory
$ rmdir /home/charlie/lite/promo  // delete a directory without files
$ rm -r /home/charlie/lite  // delete files and directories within a directory
$ rm -f abc.md // delete anyway and no prompt, -f = -force

$ touch letter // create an empty file
$ echo ''
$ mv names temp lite   // move 2 files 'names' and 'temp' to the directory 'lite' + can move directories
$ cp names temp lite/promo  // copy 2 files

$ chmod u+s myprog1   // setuid permission
$ chmod 4755 myprog1  // same as above command
$ chmod g+s myprog2   // setgid permission
$ chmod 2755 myprog2  // same as above cmd
$ ls -l myprog *
-rwsr-xr-x 1 root pubs 19704 Jul 31 14:30 myprog1
-rwxr-sr-x 1 root pubs 19704 Jul 31 14:30 myprog2

# Never give shell scripts setuid permission

$ ls -ld /home/max/info  // -d: directory
$ ls -rx // -x: in lines; -r: from Z->a
$ ls -lh // -h: human readable
$ ls -a
$ echo * // not display . .. .aa 
$ echo .* // display only . .. .aa

$ ln --symbolic /home/max/sum /tmp/s3    // --symbolic = -s
$ ls -l /home/max/sum /tmp/s3
-rw-rw-r-- 1 max max 38 Jun 12 09:51 /home/max/sum
lrwxrwxrwx 1 max max 14 Jun 12 09:52 /tmp/s3 -> /home/max/sum   // "l": link
$ cat /tmp/s3
This is sum.

$ cat // copy every line until Ctrl+D is typed 
$ cat > sample.txt  // create a file "sample.txt" without using an editor, Caution - will overwrite the file if it is an existing one
$ cat stationery tape pens > supply_orders  // catenate several files into one larger one

$ cat pear >> orange  // append output symbol

$ set -o // list each of the features controlled by set, followed by its state(on or off)
$ set +o // 

# noclobber -- bash
$ touch tmp
$ set -o noclobber  // turns on the feature
$ echo "hi there" > tmp
bash: tmp: cannot overwrite existing file
$ set +o noclobber  // turns off the feature
$ echo "hi there" > tmp
$ set +o histexpand // turn off history expansion

# noclobber -- tsch
$ set noclobber
$ unset noclobber

# override coclobber with >|
$ set -o noclobber
$ date > tmp2
bash: a: cannot overwrite existing file
$ date >| tmp2

$ shopt -s dotglob    // turn on
$ shopt -u dotglob    // off
$ shopt dotglob       // diaplay how a feature is set
$ shopt               // list the features controlled by shopt and their state
$ shopt -s            // list the features controlled by shopt that are set or on
$ shopt -u            // list the features that are unset or off
$ shopt -u expand_aliases  // turn aliases off

$ echo "hi there" > /dev/null
$ cat /dev/null > messages  // truncate the file to zero length while preserving the ownership and permissions

$ cat abstract | tr abc ABC   // tr cannot change the original file
$ tr abc ABC < abstract

$ ls | lpr

$ who | tee who.out | grep sam

$ ls -l | lpr &  // &: background
$ ls -lt  // sort by time

$ ps // bash ps

$ less ~sam/.bashrc

$ stty ek // to set the erase and kill keys to their default values
$ su -c 'ls -l /lost+found' // su spawns a new shell running with root privileges
$ su
'# ls -l /lost+found   //-l(long): to display more information about a file
'# exit
$ sudo ls -l /lost+found
$ sudo -i
$ exit

$ ls -ld mak * // –d (directory): causes ls to display only file and directory names

$ ls --help | less   //space + h + enter + q
$ ls -F  // -F: add '/' after each directory and '*' after each executable file
$ ls ~ // show the contents of the current user's home directory

$ who
$ apropos who // 快速查找命令和函数的工具
$ who am i
$ finger
$ finger lisa // + a username; search for .plan in lisa's home directory; not case sensitive
$ w  // displays a list of the users who are logged in on the local system

$ tty


$ write username
write: you have write permission turned off //...??? to test more
$ mesg y
$ mesg n

$ info coreutils

$ less /usr/share/doc/grep/README
$ zcat /usr/share/doc/info/README.gz | less

$ passwd
$ pwgen


$ echo xxxxxx CONTROL-V CONTROL-U   // CONTROL-U: the erase character
$ echo xxxxxx CONTROL-V CONTROL-U | od -c  // od: octal display

$ rm -i toollist // waits for you to respond with y (yes) before it deletes the file

$ cp -i orange orange.2 // waits for you to respond with y (yes) before it overwrites a file
$ mv -i orange orange.2 // interactive mode

$ lpstat –p // display a list of available printers
$ lpr report // print file report using the default printer
$ lpr -P mailroom report // using the printer named mailroom
$ lpstat –o // to see which jobs are in the print queue
$ lpq // same as the above
$ lprm 86 // to remove the job from the print queue and stop it from printing
$ lpr -P laser1 05.txt 108.txt 12.txt // prints three files on the printer named laser1

$ head months   // 默认显示文件months前10行
$ tail -5 months
$ tail -f logfile // -f: monitor lines as they are added to the end of the growing file named logfile
$ sort -u -n days // -n 待测试
$ uniq days.txt // skipping adjacent duplicate lines

$ ls tty??  // ?: matches any single character
$ echo tty??
$ ls tty*   // *: 0到任意多
$ echo tty*
$ lpr part0 part1 part2 part3 part5  // 3 ways to print the same contents
$ lpr part[01235]  // [abc] 只取其一
$ lpr part[0-35]   // 0-3取其中一个 或者 只取5
$ ls * [^ab] // ^: 非
$ ls [^b-d]* 
$ ls ?old
$ ls \?old

$ vim practice 
ESCAPE
:q!
:set nonumber
:set nonumber
:help
:help insert
:help compatible
:help vi-diff

// 常见 bash 内置指令
1. cd：切换当前工作目录。
2. echo：输出文本或变量的内容。
3. pwd：显示当前工作目录的路径。
4. export：设置环境变量。
5. alias：创建命令别名。
6. unset：取消设置的变量或别名。
7. source：在当前Shell环境中执行指定脚本。
8. history：显示最近执行的命令历史记录。
$ history 10
$ history | tail
9. help：获取Bash内置命令的帮助信息。
10. type：显示指定命令的类型，如内置命令还是外部命令。
11. read：从标准输入读取用户输入。
12. exec：用新的命令替换当前进程。
13. shift：将命令行参数左移一位。
14. break：跳出循环。
15. continue：跳过循环的当前迭代。
16. exit：退出当前Shell会话。
17. if case
18. trap
19. kill
20. getopts


$ cat x y | tr "[a-z]" "[A-Z]"
$ cat x y 1> hold1 2> hold2
$ cat x y &> hold
$ cat x y 1> hold 2>&1
$ cat x y 2>&1 1> hold
$ cat x y 2>&1 | tr "[a-z]" "[A-Z]"

$ bash --version
$ chsh  // change login shell permanently

$ sleep 60 &
[1] 7809
$ jobs
[1] + Running
sleep 60 &

$ xclock &
[2] 1247
$ fg 2
$ %2
$ fg %xc
$ fg %?clo
$ fg

$ dirs
$ pushd ../vue
$ cd -  // change the working to the previous dir + change the 1st in the stack
$ pushd +2  //  stack order --> +2, the number of dirs remains the same
$ popd
$ popd +1 // removes one from the dirs list, the length of the list -1

$ echo $person
max
$ echo "$person"
max
$ echo '$person'
$person
$ echo \$person
$person

$ apt policy chromium // Installed + Candidate + Version table

$ sudo apt remove php8.1* --purge
$ dpkg -l | grep php
$ apt list --installed | grep php
$ apt show php7.4-phalcon4
$ apt depends php7.4-phalcon4
$ curl localhost:8000 -I
$ echo "$PATH"
$ echo "${PATH//:/$'\n'}"
$ sudo apt update && sudo apt upgrade
$ apt search php7.4-phalcon
$ lsof -i:80
$ sudo apt-get remove apache2 --purge
$ sudo apt-get autoremove
$ apt list --installed | grep apache2
$ sudo apt-get remove apache2-bin  --purge 
$ alias l='ls -ahltr'   // -t: sort by time newest first; -r: reverse the order
$ lsusb
$ ps -efj #内核守护进程
$ ssh-keygen -t rsa -b 4096 -f .ssh/ap_lisa

$ systemctl start [name.service]
$ systemctl stop [name.service]
$ systemctl restart [name.service]
$ systemctl reload [name.service]
$ systemctl status [name.service]
$ systemctl is-active [name.service]
$ systemctl list-units --type service --all
$ systemctl list-unit-files --type=service
$ systemctl enable [name.service]  # 将服务设置为开机自启动

```
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 045e:00cb Microsoft Corp. Basic Optical Mouse v2.0
Bus 001 Device 002: ID 045e:07f8 Microsoft Corp. Wired Keyboard 600 (model 1576)
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```


<!-- Bad Zotac -->
<!-- Adverclient has a file system with errors... -->
$ fsck /dev/sda2
$ df -h 
$ sudo badblocks -wsv -t 0x00 /dev/sdc  <!-- Testing with pattern 0x00 -->
$ sudo badblocks -wsc /dev/sdc          <!-- Testing with pattern 0xaa -->

$ lscpu
$ lspci // show Hardware Info - intel corporation comet lake-s gt2 uhd graphics 630 (rev 03)
$ cat /proc/cpuinfo // show every cpu info
$ cat /etc/passwd | grep -v nologin|grep -v halt|grep -v shutdown| awk -F":" '{print $1"|"$3"|"$4}'|more
$ service apache2 status
$ cat /etc/os-release  // to check os in command line

$ lspci // 列出所有已连接的 PCI 设备
$ lspci -v -s `lspci | awk '/ VGA / {print $1}'` // display card driver
$ lsmod   //查看已加载的内核模块
$ modinfo video // 显示名为 "video" 的内核模块的信息
$ lsmod | grep i915 // 如果看到输出，其中包含 "i915"，这表示 Intel 显卡的内核驱动程序已经加载



<!-- alias -->
$ echo $PWD
/home/max
$ alias dirA = "echo Working directory is $PWD"  // expanded created
$ alias dirA
$ alias dirB = 'echo Working directory is $PWD"  // expanded used
$ alias dirB
$ cd cars
$ dirA
Working directory is /home/max                   // displays the name of the dir the alias was created in
$ dirB
Working directory is /home/max/cars              // displays the proper name of the working directory

$ unalias dirA  // remove

<!-- Install Postman Desktop Agent -->
$ snap install postman

<!-- install mysql -->
https://www.cloudbooklet.com/how-to-install-mysql-on-debian-11/
$ sudo apt install wget
$ wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
$ sudo apt install ./mysql-apt-config_0.8.22-1_all.deb
$ sudo apt update
$ sudo apt install mysql-server
$ sudo service mysql status

$ mysql -p
mysql> connect dbname;
mysql> describe booking_logging;
mysql> select count(*) from booking_logging;
mysql> select from booking_logging where id = 638381749;
$ ss | grep 6667
$ ss
$ ss | grep ircd | wc -l
$ cd /apircd
$ irssi

$ gedit php.ini
$ hostname -I
$ netstat -l
$ netstat -i
$ ls -l test.png
$ grep 'PLAYLIST_ADDR' -rn *
$ hostname -I
$ alias l='ls -haltr'
$ grep localhost -r *
$ grep 1234 assets/wrapper
$ grep -w localhost -r *   // -w -- to match only whole words

<!-- Debug Info -->
$ journalctl -fan -u ac  # begin from current time (f/follow, a/all, n/lines, u/unit)
$ systemctl status ac

<!-- Install GIMP -->
$ sudo snap install gimp

<!-- Install phpStorm -->
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install snapd
$ sudo snap install phpstorm --classic
$ phpstorm

<!-- ssh -->

<!-- only one key -->
$ ssh-keygen -t rsa     // generate(id_rsa + id_rsa.pub) + location + passphrase
// --> give the content of id_rsa.pub to Dartagnan to add to the list on the server
$ ssh-add               // include into the authentication agent of SSH
$ ssh-copy-id user@host // copy it onto the remote machine
$ nano sshd_config      // Authentication/PermitRootLogin without-password

// reload SSH
$ reload SSH
$ sudo service ssh restart  // path: /User/lisa/.ssh/id_rsa

<!-- multiple keys -->
$ ssh-keygen -C "carswap-key-19" -t ed25519 // file: key_cs_123  passphrase: pp123
$ ssh-copy-id -i ~/.ssh/key_cs_123.pub acme.learnlinux.cloud
$ ssh -i ~/.ssh/key_cs_123 acme.learnlinux.cloud // to unlock the key, input passphrase

<!-- Replace String Using the sed, 
     By default, sed only replaces the first occurrence of the specified string in each line
     s - substitute
     g - replace all occurrences of string, 
    -i[SUFFIX], --in-place[=SUFFIX]
                 edit files in place (makes backup if SUFFIX supplied)

    # - a number flag such as 1, 2 - which occurrence of a specified string          
 -->
$ sed 's/127.0.0.1/10.1.1.38/g' -i assets/*
$ sed 's/box/bin/2' foxinbox.txt 

$ sed 's/10.1.1.253/192.168.0.197/g' -i ./*

<!-- download file from Zotac -->
$ scp root@10.1.1.39:/hadaly/cache/media/output ~

$ scp -i key-file local-file username@server.com:/srv/html/path

//...ftp rsync

<!-- ufw -->
$ sudo ufw status verbose
$ systemctl status ufw
$ sudo ufw allow http
$ sudo ufw allow 80
$ sudo ufw allow 8000

<!-- Mac Address: HWaddr or ether or lladdr -->
$ ifconfig 
$ ifconfig -a
$ ifconfig en0
$ ip address
$ ip a

<!-- can not use ifconfig -->
$ apt install net-tools

<!-- history -->
$ history | grep ssh
$ pgrep -s 966
$ pgrep -s php
$ pgrep -af php
$ ssh root@10.1.1.39

<!-- curl + jq -->
https://curl.se/docs/manual.html
$ sudo apt install curl
$ curl --help
$ sudo apt install jq
$ curl https://e2v.adverpost.com/simple.php?_path=/status | jq .
$ curl https://e2v.adverpost.com/simple.php?_path=/parameters | jq .
$ curl https://e2v.adverpost.com/simple.php -I
$ curl https://e2v.adverpost.com/simple.php?_path=/status
$ curl http://localhost/.
$ curl http://localhost/weather.php?_path=/status > output
$ jq . output
$ curl http://localhost/weather.php?_path=/getSchedule -X POST -H "Content-Type: application/json" -d @test.json | tail -n1 > output
$ jq . output
<!-- test.json -->
{
  "api_key": "ce79aef7a491450082040610222607",
  "location": "Australia/Adelailde",
  "duration": 10
}
$ curl http://localhost/weather.php?_path=/getSchedule -X POST -d @test.json | tail -n1 > output
$ jq . output
$ curl http://localhost/weather.php?_path=/getSchedule -X POST -d '{"api_key":"ce79aef7a491450082040610222607", "location":"Australia/Adelailde", "duration":10}' | tail -n1 > output
$ jq . output
$ curl -H "x-api-key: bcdc50d80ac04d7a9afcaee612146a7b" https://newsapi.org/v2/everything?q=apple&from=2022-09-06&to=2022-09-06&sortBy=popularity | tail -n1  > output
$ jq . output

$ curl -H "Content-Type: application/json, x-api-key: 6JA5SRCMyg19dbMPwle5X1yulrMyygFY3s7W32Ps, Authorization:Bearer fqqknicnyiqisvxmtrzizsorokvjzcvlnbizyaah" https://ap-southeast-2.api.vaultre.com.au/api/v1.3/properties/sale?pagesize=50&status=listing&portalStatus=listing&propertyClass=residential&availableOnly=true

$ curl -H "x-api-key: 6JA5SRCMyg19dbMPwle5X1yulrMyygFY3s7W32Ps, Authorization:Bearer fqqknicnyiqisvxmtrzizsorokvjzcvlnbizyaah" https://ap-southeast-2.api.vaultre.com.au/api/v1.3/properties/sale?pagesize=50&status=listing&portalStatus=listing&propertyClass=residential&availableOnly=true
$ curl https://ap-southeast-2.api.vaultre.com.au/api/v1.3/properties/sale?pagesize=50&status=listing&portalStatus=listing&propertyClass=residential&availableOnly=true -X POST -d @rw.json

$ curl https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API Key}

<!-- change password mysql -->
$ mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('666');
$ mysql> FLUSH PRIVILEGES;

<!-- hexchat -->
$ sudo apt update
$ sudo apt install hexchat
$ hexchat
$ hexchat -v  <!-- 2.14.3 -->

<!--install google chrome-->
$apt list --installed | grep chrome
$wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
$sudo apt install ./google-chrome-stable_current_amd64.deb
<!-- upgrade -->
$sudo apt install -y google-chrome-stable

<!-- install nvm -->
<!--install multiple node versions with nvm-->
$ wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
$ source ~/.bashrc
<!-- close and reopen Terminal-->
$nvm -version
$nvm -v
 => v0.38.0
$nvm install node //install latest NodeJs version
$nvm install 12 //install node12
$nvm use node 
 => now using node v18.6.0 (npm v8.13.2)
$nvm ls //get a list of installed NodeJs version
$nvm exec 8.11.1 node app.js //use specific version without switching
$nvm use system //use installed nodeJs version in the system


$ sudo apt update
$ sudo apt install diffutils
<!-- compare 2 files side by side in 2 columns -->
$ diff file1 file2 -y 
$ diff -u colors.1 colors.2 // -u hunks with @@

$ file letter.bz2  // to learn about the contents of a file

$ sort months | head -4
$ ls | wc -w // wc(word count) -w(words) -- displays the number of words
$ tail months | lpr  // to send output of a program to the printer

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04
$ ip addr show | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
$ curl -4 icanhazip.com
$ sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
$ sudo unlink /etc/nginx/sites-enabled/default

<!-- 0. Dumping database(table+data) into files on source server -->
$ mysqldump -u root -p dcdb >dcdb-0817.sql
$ mysqldump -u root -p csdb >csdb-0817.sql
$ mysqldump -u root -p owl >owl-0817.sql

<!-- 1. Create db on target server -->
$ sudo mysql
[sudo] password for user:
MariaDB[dbname] > create database owl;
MariaDB[dbname] > create database csdb;
MariaDB[dbname] > create database dcdb;

<!-- 2. Migrating the Database -->
$ cd ~/owl/program/api
$ sudo vendor/bin/phinx migrate  // --> create tables;
$ sudo vendor/bin/phinx seed:run -s DisplayOwnersSeeder -s AdvertiserSeeder  // --> add fake data

<!-- 2.1 another way of migrating -->
$ phalcon migration generate
$ phalcon migration run 

<!-- 3. Import data from files: create table + import data -->
$ sudo mysql -uroot -p dcdb < dcdb-0817.sql
$ sudo mysql -uroot -p csdb < csdb-0817.sql
$ sudo mysql -uroot -p owl < owl-0817.sql
<!-- or -->
MariaDB > source /.../dcdb-0817.sql

$ mysql -uroot -p -e "SELECT d.id, d.name, t.name team_name, d.last_connected
	FROM display d
	INNER JOIN team t
	ON d.team_id = t.id;" > raw.csv

mysql> select * from table_name where abc='ABC' \G; // show in a readable format


<!-- Cannot delete or update a parent row: a foreign key constraint fails -->
MariaDB > SET FOREIGN_KEY_CHECKS=0; -- to disable them
MariaDB > drop table team, application;
MariaDB > ...
MariaDB > SET FOREIGN_KEY_CHECKS=1; -- to re-enable them

// 使用 sudo mysql 可以登录，但 mysql -u root -p 会被拒绝访问
在 Debian 的 MariaDB 默认配置中，sudo mysql -uroot -p 会尝试通过密码验证登录，但因为还没有为 root 设置密码。MariaDB 默认使用 Unix Socket Authentication 来管理 root 用户。
如果 root 用户为密码认证，设置密码
ps: mysql -u root -p + Ctrl D --> login? //...???
$ sudo mysql
MariaDB > SELECT user, host, plugin FROM mysql.user;
mysql_native_password 表示使用密码认证；unix_socket 表示使用 Unix Socket。
MariaDB > SET PASSWORD FOR 'root'@'localhost' = PASSWORD('999');
MariaDB > FLUSH PRIVILEGES;
==> sudo mysql -uroot -p 可以使用新设置的密码登录

<!--install phalcon4-->
https://docs.phalcon.io/4.0/en/installation#deb-based-distributions-debian-ubuntu-etc
<!-- 1. extensions needed -->
<!-- psr Not In Use -->
$ git clone https://github.com/jbboehr/php-psr.git
$ cd php-psr  // where 'config.m4' is
$ sudo apt install php7.4-dev // to install phpize command
$ phpize
$ ./configure
$ make
$ make test
$ sudo make install
<!-- psr extension -->
$ sudo apt install php7.4-psr

<!-- imagick -->
$ sudo apt-get install php7.4-imagick
<!-- memcached -->
$ sudo apt update
$ sudo apt install memcached libmemcached-tools
$ sudo systemctl status memcached

$ sudo apt-get install php7.4-gd 
$ sudo apt-get install php7.4-mbstring
<!-- libpcre3-dev -->
$ sudo apt-get install libpcre3-dev

<!-- 2. add the repo to your distribution -->
$ curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash 
<!-- 3. install phalcon4 -->
$ sudo apt-get install php7.4-phalcon4
// --> Unable to locate package php7.4-phalcon4 + Couldn't find any package by glob 'php7.4-phalcon4'
<!-- 3.1 Install with Pecl -->
$ sudo pecl channel-update pecl.php.net
$ sudo pecl install phalcon-4.1.2

<!-- 4. to check -->
$ php -m <!-- phalcon is on the list -->

<!-- another way to install phalcon4:  --> 
$ cd /tmp
$ git clone https://github.com/phalcon/cphalcon
$ cd cphalcon/
$ git checkout tags/v4.0.0 ./
$ cd build
$ composer install
// ...to be finished

<!-- 1 Install Phalcon DevTools-->
$ composer global require phalcon/devtools
$ phalcon


<!-- 2 Install phalcon DevTools-->
https://github.com/phalcon/phalcon-devtools#installing-via-composer
<!-- 1.Installation via Git -->
$ cd ~
$ git clone https://github.com/phalcon/phalcon-devtools.git
$ cd phalcon-devtools
$ composer install
$ ln -s $(pwd)/phalcon /usr/bin/phalcon  // ln -s a b 中的 a 就是源文件，b是链接文件名; 删除软链接:rm -rf b 注意不是rm -rf b/
$ chmod ugo+x /usr/bin/phalcon
<!-- 2. to check -->
$ phalcon -v <!-- 4.1.0 -->

<!-- Dartagnan used -->
$ cd /user/bin
$ ls
$ mysql -uroot
$ explorer.exe . 
$ cat .
$ cat temp
$ nano temp
$ ll /sys/class/net/
$ ll /sys/class/net/enp1s0/
$ ll /sys/class/net/enp1s0/device/uevent
$ cd work-lisa/hadaly/
$ grep WD_T9SENDER_IV -r *
$ grep 'sub start_listeners' -r *
$ grep 'sub start_listener' -r *
$ ll bin/
$ perl /bin/ldetect
$ sudo ifconfig
$ perl bin/ldetect
$ grep 'sub dlog' -r *
$ grep 'ldetect' -r *
$ grep '$daemons{sender}->{args}' -r *
$ ./bin/T9Sender_linux --help
$ ./bin/T9Sender_linux
$ cd bin/
$ ./T9Sender_linux --help
$ bash T9Sender_linux
$ perl T9Sender_linux
$ sh -c T9Sender_linux
$ ulimit -m 512000 && DISPLAY=:1 T9Sender_linux
$ pgrep -af T9
$ file T9Sender_linux
$ ll
$ sudo chmod +x T9Sender_linux
$ sudo su
$ T9Sender_linux --static
$ lsb_release -a  // linux version
```
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 11 (bullseye)
Release:	11
Codename:	bullseye
```
$ ./ldetect
$ ./T9Sender_linux
$ ll /sys/class/
$ sudo systemctl start mysql.service
$ fg
$ sudo systemctl status mysql.service
$ mysqld_safe --skip-grant-tables --skip-networking &
$ fg
$ sudo kill $(cat /var/lib/mysql/$HOSTNAME.pid)
$ sudo systemctl start mariadb.service
$ sudo systemctl status mariadb.service
$ mysqlcheck -A -auto-repair -u root -p
$ sudo systemctl --failed
$ cd /var/lib/mysql/

$ ll
$ sudo rm aria_log_control ib_logfile0
$ pgrep -af mysql
$ sudo kill -15 31534 31535 31652
$ ll /etc/mysql/debian-start
$ sudo systemctl start mysql
$ sudo systemctl restart mysql
$ sudo systemctl status mysql
$ curl localhost:8000 -I

$ clear
$ reset

$ xdg-open note.md

$ find -name "*.js" -type f

$ find . -name love.txt
$ find /home -name File.txt
$ find /home -iname love.txt

$ find / -type d -name Flower
$ find . -type f -name wither.php
$ find . -type f -name "*.php"

$ find . -type f -perm 0777 -print
$ find . -type f ! -perm 0777 -print

$ find / -perm /u=s   <!-- SUID -->
$ find / -perm /g=s   <!-- SGID -->
$ find / -perm /u=r   <!-- read-only -->
$ find / -perm /a=x   <!-- executable -->

$ find / -perm 2644   <!-- SGID with permission 644 -->
$ find / -perm 1551   <!-- sticky bit with 551 -->

$ find /tmp -type f -empty <!-- empty files -->
$ find /tmp -type d -empty <!-- empty directories -->

$ find / -type f -perm 777 -print -exec chmod 755 {}\; <!-- find files 777 then change permission-->
$ find / -type f -name "*.txt" -exec rm -f {}\; <!-- find all txt files then delete -->

$ find . -type f -mtime +1
$ find . -type f -mtime 1
$ find . -name '*.php' -mmin -30

$ echo "$PS1"
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ 
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ 

$ pcre-config --version <!-- 8.44 -->
$ sudo nginx
$ nginx -v       <!-- nginx/1.18.0 -->
$ ps aux|grep nginx
$ sudo nginx -s quit
$ sudo nginx -s reload

$ pgrep your_process_name // get process ID from process name

<!-- Dartagnan -->
$ sudo systemctl status nginx.service <!-- status of nginx -->
$ sudo nginx -t  <!--to check config -->
$ sudo systemctl start nginx.service
$ sudo cat /var/log/nginx/error.log <!-- err info -->

$ sudo systemctl restart nginx
$ sudo systemctl restart php7.4-fpm

$ sudo apt install ./google-chrome-stable_current_amd64.deb

$ which git <!-- installation directory for git -->

<!-- uninstall apache2 -->
$ sudo systemctl stop apache2
$ sudo apt-get --purge remove apache2
$ sudo apt-get --purge remove apache2-doc
$ sudo apt-get --purge remove apache2-utils
$ sudo apt autoremove
<!-- remove unused files -->
$ sudo rm -rf /var/www
$ sudo rm -rf /etc/libapache2-mod-jk

$ whereis nginx // displays all the files it finds by looking in standard locations 
$ which nginx // search path
$ type echo // to determine whether a command is a builtin(utilities that are built into a shell)
echo is a shell builtin 

$ sudo usr/sbin/groupadd www
$ sudo usr/sbin/useradd -g www www

<!-- install yum??? -->
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install yum

$ ls /usr/bin/python*
$ sudo apt-get remove --auto-remove python3

<!-- uninstall nginx -->
$ sudo apt-get purge nginx nginx-common   <!-- remove everything -->
$ sudo apt-get autoclean
$ sudo apt-get autoremove  <!-- remove dependencies used by nginx no longer required -->

<!-- install nginx -->
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
$ sudo apt-get install nginx -y <!-- y -->
$ sudo systemctl status nginx
$ sudo systemctl is-enabled nginx
$ sudo systemctl is-active nginx
Todo: restart

<!-- smb access issue with Xfce -->
$ sudo apt install gvfs-backends -y
$ libreoffice smb://my/share/name/123.docx

在 Xfce 桌面环境 下，libreoffice 可能无法直接打开 smb:// 共享目录下的 .docx 文件，原因主要是：
1. 为什么 LibreOffice 在 Xfce 下无法打开 SMB 文件？
Xfce 默认使用 Thunar 文件管理器，但 Thunar 不支持 GNOME 的 GVFS (GNOME Virtual File System) 完整功能，这可能导致 smb:// 共享文件无法正确挂载。
LibreOffice 依赖 GVFS 处理 smb:// 路径，但在 Xfce 下，GVFS 可能 未正确安装 或 未自动挂载共享目录。
2. 直接安装 GNOME 是否能解决问题？
✅ 是的，安装 GNOME 可以解决
如果安装 GNOME 桌面环境，LibreOffice 可以直接使用 GNOME 的 GVFS 来访问 smb:// 共享文件，通常可以解决这个问题。
安装 GNOME 
sudo apt update
sudo apt install gnome -y
然后重启并切换到 GNOME 试试
libreoffice  smb://my/share/name/123.docx 
命令行打开文件，如果可以打开，说明问题确实是 Xfce 的 GVFS 支持不足导致的。
3. 不安装 GNOME，如何解决 Xfce 的 SMB 问题？
如果你 不想安装 GNOME，可以尝试以下方法：
方法 1：安装 gvfs 组件
在 Xfce 下，默认可能 没有安装完整的 gvfs 支持，可以手动安装：
sudo apt install gvfs-backends -y
重启后
gio open smb://my/share/name/123.docx
方法 2：手动挂载 SMB 共享目录
如果 gvfs 仍然不能正常工作，可以尝试 手动挂载共享目录：
sudo apt install cifs-utils -y
sudo mkdir -p /mnt/smb_share
sudo mount -t cifs //my/share/name /mnt/smb_share -o username=youruser,password=yourpassword,uid=$(id -u),gid=$(id -g),rw
然后直接从本地路径打开：
libreoffice /mnt/smb_share/123.docx
如果这样可以打开，说明问题出在 LibreOffice 不能直接解析 smb:// 路径。

<!-- apt install <package> 发生了什么？ -->
以 sudo apt install vim 为例：

查找本地索引数据库 /var/lib/apt/lists/，确定 vim 的最新版本和依赖项。
解析 /var/lib/dpkg/status，检查 vim 是否已安装，以及是否需要升级。
下载 vim.deb 到 /var/cache/apt/archives/（如果尚未下载）。
使用 dpkg 安装 .deb：
$ dpkg -i /var/cache/apt/archives/vim_9.0.0180-1_amd64.deb
更新 /var/lib/dpkg/status，标记 vim 为已安装。

/etc/apt/sources.list      包含了 软件仓库（Repository） 的地址
/var/lib/apt/lists/	       存储远程仓库的索引，不包含 .deb 包	ls -lh /var/lib/apt/lists/
/var/cache/apt/archives/   存储已下载的软件 .deb，但未安装	ls -lh /var/cache/apt/archives/
/var/lib/dpkg/status	   记录已安装的软件包及其状态	cat /var/lib/dpkg/status

<!-- reinstall desktop tool -->
$ sudo apt update
$ sudo apt -y upgrade
$ sudo apt -y install task-gnome-desktop
$ sudo systemctl set-default graphical.target
$ reboot

<!--lisa is not in the sudoers file-->
$ sudo apt-get update
$ su root
$ apt-get install sudo -y
$ sudo adduser lisa sudo

<!-- 98:Address already in use -->
$ sudo fuser -k 80/tcp
<!--apache2 is running -->

<!-- install php && php-fpm 7.4 -->
$ sudo apt-get install php7.4-fpm -y
$ sudo systemctl status php7.4-fpm
$ php -v
<!-- test php -->
$ echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
localhost/info.php --> show info 

<!-- install composer-->
$ curl -s https://getcomposer.org/installer | php -- --version=2.5.1
$ php composer.phar install   // local use
$ sudo mv composer.phar /user/local/bin/composer  // --> can be used anywhere


<!-- install phalcon in ~/software -->
$ git clone https://github.com/phalcon/cphalcon.git
$ cd cphalcon/build 
$ sudo ./install <!-- php-config is not installed -->
$ sudo apt-get install php7.3-dev 
$ sudo ./install <!-- PHP <= 7.4 is no longer supported --> 
$ sudo apt-get install php7.4-dev 
$ sudo ./install <!-- Build succeed: Please restart your web server to complete the installation
 -->

<!-- php modules -->
$ php -m

<!-- fix problem: PHP Startup: Unable to load dynamic library 'pdo_mysql.so' -->
<!-- fix problem: php -v fail -->
$ sudo apt-get --purge remove php7.3-common
$ sudo apt-get install php7.3-common php7.3-mysql php7.3-cli

<!-- install mariaDB -->
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
$ mysqladmin --version
$ sudo mysql  <!-- log into directly without password -->
$ 

X Window System (X视窗系统) 是服务于Unix系统的GUI系统

[utility]
bison: generates parsing code that makes it easier to write programs to build compilers
flex: generates scanners (code that recognizes lexical patterns in text)
make + GNU Configure + Build System: make it easier to manage complex development projects

[tmux]
Tmux 是一个强大的终端复用工具，以下是一些常用指令：
$ sudo apt install tmux

1. 会话管理
```
$ tmux new -s <session_name>	        创建新的会话
$ tmux ls 或 tmux list-sessions	        列出所有会话
$ tmux attach -t <session_name>	        重新连接会话
$ tmux detach	                        从当前会话断开 (在 tmux 内使用 Ctrl+b d)
$ tmux kill-session -t <session_name>	关闭指定会话
$ tmux kill-server	                    关闭所有 tmux 会话
```
2. 窗口管理
```
$ tmux new-window -n mywin               创建一个新窗口，并命名为 "mywin"
    = Ctrl+b c                        
$ tmux list-windows                      列出所有窗口（可选择切换）  
    = Ctrl+b w	       
$ tmux select-window -t 0:1              切换到会话0的窗口1
    = Ctrl+b n	                         下一个窗口                  
    or Ctrl+b p	                         上一个窗口
    or Ctrl+b <window_number>	         指定编号窗口    
$ tmux rename-window "NewName"
    = Ctrl+b ,	                         重命名当前窗口                
$ tmux kill-window                       关闭当前窗口
    = Ctrl+b &	                      
```
3. 窗格（Pane）管理
```
Ctrl+b %	垂直分割窗格
Ctrl+b "	水平分割窗格
Ctrl+b o	切换到下一个窗格
Ctrl+b {	交换当前窗格与左侧窗格
Ctrl+b }	交换当前窗格与右侧窗格
Ctrl+b x	关闭当前窗格
Ctrl+b z	最大化/恢复当前窗格
Ctrl+b q	显示窗格编号
```
4. 调整窗格大小
```
Ctrl+b Alt+↑	增大窗格高度
Ctrl+b Alt+↓	减小窗格高度
Ctrl+b Alt+→	增大窗格宽度
Ctrl+b Alt+←	减小窗格宽度
```
5. 滚动与复制模式
```
Ctrl+b [	进入滚动模式
Ctrl+b ]	粘贴复制的内容
q	退出滚动模式
↑ / ↓	上下滚动
PgUp / PgDn	向上或向下翻页
```
6. 其他常用指令
```
tmux source-file ~/.tmux.conf	重新加载 tmux 配置
tmux set-option -g mouse on	    启用鼠标支持
tmux show-options -g	        查看全局配置
```
如果你经常使用 tmux，可以自定义 .tmux.conf 来优化体验，比如启用鼠标滚动、调整快捷键等。你有需要的话，我可以帮你配置。

7. 屏幕被日志刷满的处理：
- Ctrl+b 后 松开，再按 : 进入命令模式。
- 运行：new-window
这样就新建了一个窗口，不会影响当前的输出。

[github key]
`$ git clone git@github.com:Lisa-NJ/my-repo-name` failed with
```
Cloning into 'my-repo-name'...
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```
How to fix
- Generate a new key by 
`$ ssh-keygen -t rsa -b 4096 -C "myemailname@gmail.com"` and save it as `~/.ssh/id_rsa`
- Add SSH Key --> GitHub
    - `$ cat ~/.ssh/github_rsa.pub` and copy the whole text
    - `https://github.com/settings/keys` / New SSH key
    - Input `Title`, paste to `Key` and `Add SSH key` 
- Edit `~/.ssh/config`, add
```
Host github.com
  Hostname github.com
  User git
  IdentityFile ~/.ssh/github_rsa
  IdentitiesOnly yes
```
- Run `$ chmod 600 ~/.ssh/config` 
- Test by `$ ssh -T git@github.com`
```
Hi your-github-username! You've successfully authenticated, but GitHub does not provide shell access.
```
- Clone by `$ git clone git@github.com:your-github-username/your-repo.git`
