#!/bin/sh
set -e

# Thiết lập quyền cho thư mục storage và bootstrap/cache
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Chạy lệnh khởi động PHP-FPM
exec php-fpm