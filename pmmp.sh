#! /bin/bash

MYNAME="username"
PASSWORD="password"

su root << EOF
$PASSWORD
cd /home
pwd
cd /
pwd
apt update  -y
apt upgrade -y
apt install -y vim bison libtool-bin
apt install -y autoconf automake g++ cmake pkg-config re2c
apt install -y php7.4-cli

adduser -q -gecos "" --disabled-login mine
echo mine:${PASSWORD} | /usr/sbin/chpasswd
gpasswd -a mine sudo
apt install ufw
ufw default deny
ufw allow 22
ufw allow 19132/udp
EOF

su mine << EOF
$PASSWORD
mkdir /home/mine/pmmp
cd /home/mine/pmmp
git clone --recursive https://github.com/pmmp/PocketMine-MP.git
cd PocketMine-MP
cp -r src start.sh composer.json ../
cd ../
git clone https://github.com/pmmp/php-build-scripts.git
cd php-build-scripts
./compile.sh
mv bin ../
cd ../
curl -sS https://getcomposer.org/installer | php
bin/php7/bin/php composer.phar install
touch /home/mine/.bashrc
echo alias minecraft='screen -d -S pmmp -m /home/mine/pmmp/start.sh -f src/pocketmine/PocketMine.php'>>"/home/mine/.bashrc"
EOF
