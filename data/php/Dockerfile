FROM php:7.4.16-apache-buster
# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=busybox:latest /bin/wget /usr/bin/wget
# Install nodejs
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug

# Add directories for sites
RUN mkdir -m 777 -p /tmp/php_sessions/default && mkdir -m 777 -p /tmp/php_upload/default
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/default
RUN wget https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php
RUN chown -R www-data:www-data /var/www/html/

# # The default apache run command
# CMD ["apache2-foreground"]