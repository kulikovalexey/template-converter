FROM webdevops/php-nginx:${PHP_VERSION}

# Установка xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Конфигурация xdebug (пример)
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Создание не-root пользователя (пример)
RUN useradd -ms /bin/bash newuser
USER newuser

WORKDIR /app

