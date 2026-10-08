#!/bin/bash
set -e

MARIADB_WP_USER_PASSWORD=$(cat /run/secrets/mariadb_wp_user_pw)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_admin_pw)
WP_USER_PASSWORD=$(cat /run/secrets/wordpress_user_pw)

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --path=/var/www/html --allow-root
    wp config create --path=/var/www/html --dbname="$MARIADB_DATABASE" --dbuser="$MARIADB_WP_USER" \
        --dbpass="$MARIADB_WP_USER_PASSWORD" --dbhost=mariadb --allow-root
    wp core install --path=/var/www/html --url="$DOMAIN_NAME" --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" --allow-root
    wp user create "$WP_USER" "$WP_USER_EMAIL" --path=/var/www/html --role=author \
        --user_pass="$WP_USER_PASSWORD" --allow-root
fi

chown -R www-data:www-data /var/www/html

exec php-fpm8.2 -F
