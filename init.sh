#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	ROOT_PASSWORD=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 20)
	echo "Use generate password : ${ROOT_PASSWORD}"
fi

echo "root:${ROOT_PASSWORD}" | chpasswd

if [ -d /root/scripts/.git ]; then
    cd /root/scripts
    git reset --hard HEAD
    git pull
else
   git clone --depth 1 https://github.com/zoic21/scripts.git /root/scripts.tmp
   cp -R /root/scripts.tmp/* /root/scripts
   rm -rf /root/scripts.tmp
fi

if [ -f /root/.google_authenticator ]; then
	rm /root/.google_authenticator
fi
cp /root/.google_authenticator_default /root/.google_authenticator
chmod 600 /root/.google_authenticator
chmod 600 -R /root/.ssh
chown root:root /root/.google_authenticator
chown root:root -R /root/.ssh

find /root/scripts/shell -iname "*.sh" -type f -exec dos2unix {} \;
find /root/scripts/shell -iname "*.sh" -type f -exec chmod +x {} \;

/usr/bin/supervisord

