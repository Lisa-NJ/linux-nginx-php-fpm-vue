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

$ echo "$PS1"
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ 
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ 

$ pcre-config --version <!-- 8.44 -->
$ nginx
$ nginx -v       <!-- nginx/1.18.0 -->
$ ps -aux|grep nginx
$ nginx -s quit
$ nginx -s reload

<!-- Dartagnan -->
$ sudo systemctl status nginx.service <!-- status of nginx -->
$ sudo nginx -t  <!--to check config -->
$ sudo systemctl start nginx.service
$ sudo cat /var/log/nginx/error.log <!-- err info -->

$ sudo systemctl restart nginx
$ systemctl restart php7.4-fpm

$ sudo apt install ./google-chrome-stable_current_amd64.deb

$ which git <!-- installation directory for git -->

<!-- install phalcon -->
$ curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash
$ sudo apt-get install php7.4-phalcon

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
$ sudo apt-get autoremove  <!-- remove dependencies used by nginx no longer required -->

<!-- install nginx -->
$ sudo apt-get update
$ sudo apt-get install nginx <!-- y -->
$ sudo systemctl is-enabled nginx
$ sudo systemctl is-active nginx
$ sudo systemctl status nginx.service

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

<!--install composer globally-->
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 
$ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
$ sudo chmod +x /usr/local/bin/composer
