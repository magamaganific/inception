#!bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql"]; then
	echo "Initializing MariaDB data directory..."
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld &

sleep 5

echo "Creating database and user..."

unset MYSQL_HOST

mariadb <<-EOSQL
	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
	FLUSH PRIVILEGES;
EOSQL

killall mysqld || true

sleep 3

echo "Starting MariaDB server..."

mysqld