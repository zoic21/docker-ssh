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

if [ ! -f /root/.google_authenticator ]; then
	cp /root/.google_authenticator_default /root/.google_authenticator
fi

chmod 600 /root/.google_authenticator
chmod 600 -R /root/.shh

find /root/scripts/shell -iname "*.sh" -type f -exec dos2unix {} \;
find /root/scripts/shell -iname "*.sh" -type f -exec chmod +x {} \;

/usr/bin/supervisord

