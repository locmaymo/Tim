#!/bin/bash

# Chờ MySQL sẵn sàng
echo "Đang chờ database MySQL khởi động..."
until nc -z -v -w30 mysql 3306
do
  echo "Đang chờ kết nối cơ sở dữ liệu..."
  sleep 5
done
echo "Database MySQL đã sẵn sàng!"

# Sửa quyền thư mục storage và bootstrap/cache (nếu cần)
echo "Sửa quyền truy cập cho thư mục storage và bootstrap/cache..."
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

# Kiểm tra xem APP_KEY đã tồn tại chưa

echo "Đang tạo APP_KEY mới..."
php artisan key:generate --ansi

# Xóa cache config và tạo cache config mới
echo "Đang xóa cache config và tạo cache config mới..."
php artisan config:clear
php artisan config:cache

# Tạo symbolic link cho storage nếu chưa có
if [ ! -L "public/storage" ]; then
  echo "Tạo symbolic link cho storage..."
  php artisan storage:link
else
  echo "Symbolic link đã tồn tại!"
fi

# Chạy migrations
echo "Đang chạy migrations..."
php artisan migrate --force

# Khởi động PHP-FPM
echo "Khởi động dịch vụ PHP-FPM..."
php-fpm