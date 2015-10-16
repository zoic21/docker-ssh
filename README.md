# Environment Variables
MYSQL_JEEDOM_PASSWORD
MYSQL_HOST
MYSQL_PORT
MYSQL_JEEDOM_USER
MYSQL_JEEDOM_DBNAME

docker run --name some-jeedom --privileged -v /my/jeedom/data:/usr/share/nginx/www/ -e MYSQL_JEEDOM_PASSWORD=todo -e MYSQL_HOST=todo -e MYSQL_PORT=todo -e MYSQL_JEEDOM_USER=todo -e MYSQL_JEEDOM_DBNAME=todo -v /dev/bus/usb:/dev/bus/usb jeedom/docker