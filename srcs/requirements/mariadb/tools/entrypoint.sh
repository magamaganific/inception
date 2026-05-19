#!bin/bash
set -e

echo "Starting MariaDB initalization..."

if [ ! -d "/var/lib/mysql/mysql"]; then
	echo "Initializing data directory..."
	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

echo "Starting temporary MariaDB server for setup..."
mysqld --skip-networking --socket=/run/mysqld.sock --user=mysqld &
pid="$!"

echo "Waiting for MariaDB to be ready..."
until mysqladmin --socket=/run/mysqld.sock ping >/dev/null 2>&1; do
	sleep 1
done
echo "MariaDB is ready!"

echo "Running setup SQL..."
mysql --socket=/run/mysqld/mysqld.sock \
	-u root \
	-p"$(cat /run/secrets/db_root_password)" <<EOF

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Shutting down temporary MariaDB..."
mysqladmin --socket=run=/run/mysqld/mysqld.sock -u root -p"${MYSQLD_ROOT_PASWORD}" shutdown

wait "$pid" || true

echo "Initialization complete. Startingg MariaDB..."
exec mysqld --user=mysqld --datadir=/var/lib/mysqld --socket=/run/mysqld/mysqld.sock