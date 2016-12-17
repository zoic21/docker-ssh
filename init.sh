#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	echo "Use default password : root"
	echo "root:root" | chpasswd
else
	echo "root:${ROOT_PASSWORD}" | chpasswd
fi

if [ -f /root/helper ]; then
    cd /root/helper
    git reset --hard HEAD
    git pull
else
   cd /root
   git clone --depth 1 https://github.com/jeedom/helper.git
fi

dos2unix /root/helper/ssh/connection.sh
dos2unix /root/helper/ssh/multissh.sh

/usr/bin/supervisord

