#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	echo "Use default password : root"
	echo "root:root" | chpasswd
else
	echo "root:${ROOT_PASSWORD}" | chpasswd
fi

if [ -d /root/scripts ]; then
    cd /root/scripts
    git reset --hard HEAD
    git pull
else
   cd /root
   git clone --depth 1 https://github.com/zoic21/scripts.git
fi

find /root/scripts/shell -iname "*.sh" -type f -exec dos2unix {} \;
find /root/scripts/shell -iname "*.sh" -type f -exec chmod +x {} \;

service rsyslog start
service fail2ban start

/usr/bin/supervisord

