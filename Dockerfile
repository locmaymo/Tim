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

# Sao chép entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose cổng 9000
EXPOSE 9000

# Sử dụng entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]