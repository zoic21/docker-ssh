#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	echo "Use default password"
else
	echo "root:${ROOT_PASSWORD}" | chpasswd
fi

/usr/bin/supervisord

