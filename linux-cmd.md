$ sudo apt remove php8.1* --purge
$ dpkg -l | grep php
$ apt list --installed | grep php
$ apt show php7.4-phalcon4
$ apt depends php7.4-phalcon4
$ curl localhost:8000 -I
$ echo "$PATH"
$ echo "${PATH//:/$'\n'}"
$ sudo apt update && sudo apt upgrade
$ cd /
$ phpize -v
$ apt search php7.4-phalcon
$ lsof -i:80
$ sudo apt-get remove apache2 --purge
$ sudo apt-get autoremove
$ apt list --installed | grep apache2
$ sudo apt-get remove apache2-bin  --purge 
$ alias l='ls -ahltr'
$ lscpu 
$ cat /etc/passwd | grep -v nologin|grep -v halt|grep -v shutdown| awk -F":" '{print $1"|"$3"|"$4}'|more
$ service apache2 status
$ cat /etc/os-release  // to check os version in command line

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
$ journalctl -fan -u ac

<!-- ssh -->

<!-- only one key -->
$ ssh-keygen -t rsa     // generate(id_rsa + id_rsa.pub) + location + passphrase
// --> give the content of id_rsa.pub to Dartagnan to add to the list on the server
$ ssh-add               // include into the authentication agent of SSH
$ ssh-copy-id user@host // copy it onto the remote machine
$ nano sshd_config      // Authentication/PermitRootLogin without-password

// reload SSH
$ reload SSH
$ sudo service ssh restart  // path: /User/lisa/ssh/id_rsa

<!-- mutiple keys -->
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

<!-- download file from Zotac -->
$ scp root@10.1.1.39:/hadaly/cache/media/output ~

<!-- ufw -->
$ sudo ufw status verbose
$ systemctl status ufw
$ sudo ufw allow http
$ sudo ufw allow 80
$ sudo ufw allow 8000

<!-- Mac Address: HWaddr or ether or lladdr -->
$ ifconfig 
$ ifconfig -a
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

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04
$ ip addr show | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
$ curl -4 icanhazip.com
$ sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
$ sudo unlink /etc/nginx/sites-enabled/default

<!-- 1. Dumping database into files -->
$ mysqldump -u root -p dcdb >dcdb-0817.sql
$ mysqldump -u root -p csdb >csdb-0817.sql
$ mysqldump -u root -p owl >owl-0817.sql

$ sudo mysql
MariaDB > create database owl;
MariaDB > create database csdb;
MariaDB > create database dcdb;
<!-- 2. Import data from files -->
$ sudo mysql -uroot -p dcdb < dcdb-0817.sql
$ sudo mysql -uroot -p csdb < csdb-0817.sql
$ sudo mysql -uroot -p owl < owl-0817.sql
<!-- or -->
MariaDB > source /.../dcdb-0817.sql
<!-- 3. Migrating the Database -->
$ cd ~/owl/program/api
$ sudo vendor/bin/phinx migrate
$ sudo vendor/bin/phinx seed:run -s DisplayOwnersSeeder -s AdvertiserSeeder

<!--install phalcon4-->
https://docs.phalcon.io/4.0/en/installation#deb-based-distributions-debian-ubuntu-etc
<!-- 1. extensions needed -->
# imagick
$ sudo apt-get install php7.4-imagick

# memcached
$ sudo apt update
$ sudo apt install memcached libmemcached-tools
$ sudo systemctl status memcached

$ sudo apt-get install php7.4-gd 
$ sudo apt-get install php7.4-mbstring
<!-- 2. add the repo to your distribution -->
$ curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash 
<!-- 3. install phalcon4 -->
$ sudo apt-get install php7.4-phalcon4
<!-- 4. to check -->
$ php -m <!-- phalcon is on the list -->
 
<!-- another way to install phalcon4:  --> 
$ cd /tmp
$ git clone https://github.com/phalcon/cphalcon
$ cd phalcon
$ git checkout tags/v4.0.0 ./
$ cd build
$ compose install
// ...

<!-- install phalcon DevTools -->
https://github.com/phalcon/phalcon-devtools#installing-via-composer
<!-- 1.Installation via Git -->
$ cd ~
$ git clone https://github.com/phalcon/phalcon-devtools.git
$ cd phalcon-devtools
$ composer install
$ ln -s $(pwd)/phalcon /usr/bin/phalcon
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
$ lsb_release -a
$ ./ldetect
$ ./T9Sender_linux
$ ll /sys/class/
$ sudo systemctl start mysql.service
$ fg
$ sudo systemctl status mysql.service
$ mysqld_safe --skip-grant-tables --skip-networking &
$ mysql -u root
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
$ mysql -uroot -p
$ cd ~/work-lisa/vue
$ cat .env.development.local
$ curl localhost:8000 -I
$ cd work-lisa/vue
$ npm run serve
$ cat .env.development.local
$ cd ../api
$ composer install
$ cat phinx.yml
$ sudo nano phinx.yml
$ sudo nano app/config/config.ini

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
$ ps -aux|grep nginx
$ sudo nginx -s quit
$ sudo nginx -s reload

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

$ whereis nginx

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

<!-- install composer -->
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
$ sudo chmod +x /usr/local/bin/composer

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

