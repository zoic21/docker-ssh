#!/bin/bash
echo 'Start init'

echo 'Launch cron'
service cron start

/usr/bin/supervisord

