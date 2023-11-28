# Use an official PHP runtime as a parent image
FROM php

# Set the working directory to /var/www
WORKDIR /var/www

# Copy composer.lock and composer.json to the working directory
COPY composer.lock composer.json /var/www/

# Install any needed packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    unzip \
    git \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd zip pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install --no-scripts --no-interaction --no-autoloader

# Copy the rest of the application code
COPY . /var/www/

# Generate the Laravel application key
RUN php artisan key:generate

# Change ownership of the storage and bootstrap/cache directories
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Set the user to www-data
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 8000


ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
