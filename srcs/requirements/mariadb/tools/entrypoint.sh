#!/bin/sh
set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

MARIADB_ROOT_PASSWORD=$(cat /run/secrets/mariadb_root_pw)
MARIADB_WP_USER_PASSWORD=$(cat /run/secrets/mariadb_wp_user_pw)

cat > /tmp/init.sql <<-EOF
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
	CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
	CREATE USER IF NOT EXISTS '${MARIADB_WP_USER}'@'%' IDENTIFIED BY '${MARIADB_WP_USER_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_WP_USER}'@'%';
	FLUSH PRIVILEGES;
EOF

exec mariadbd --user=mysql --init-file=/tmp/init.sql