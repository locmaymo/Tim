# Sử dụng hình ảnh PHP chính thức
FROM php:8.2-fpm

# Thiết lập thư mục làm việc
WORKDIR /var/www/html

# Cài đặt các phụ thuộc hệ thống
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    netcat-openbsd \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Cài đặt Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Sao chép mã nguồn ứng dụng
COPY . .

# Cài đặt các phụ thuộc PHP
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Thiết lập quyền cho các thư mục cần thiết
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/storage \
    && chmod -R 775 /var/www/html/bootstrap/cache

# Expose cổng 9000
EXPOSE 9000

# Khởi chạy PHP-FPM
CMD ["php-fpm"]