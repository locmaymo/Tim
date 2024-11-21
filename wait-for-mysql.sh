#!/bin/bash

# Chờ MySQL sẵn sàng
echo "Đang chờ database MySQL khởi động..."
until nc -z -v -w30 mysql 3306
do
  echo "Đang chờ kết nối cơ sở dữ liệu..."
  sleep 5
done
echo "Database MySQL đã sẵn sàng!"

# Kiểm tra xem APP_KEY đã tồn tại chưa
if grep -q "APP_KEY=" .env; then
  echo "APP_KEY đã tồn tại!"
else
  echo "APP_KEY chưa tồn tại. Đang tạo APP_KEY mới..."
  php artisan key:generate --ansi
fi

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