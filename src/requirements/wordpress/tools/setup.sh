set -e  

echo "wordpress initiated"

until mysqladmin ping -h"$MYSQL_HOST" --silent; do
	echo "Waiting for MariaDB..."
	sleep 2
done

mkdir -p /run/php

if [ ! -f /var/www/html/index.php]; then
	echo "Copying Wordpress to /var/www/html"
	cp -a /tmp/wp/. /var/www/html/
fi

cd /var/www/html

if ! wp core is