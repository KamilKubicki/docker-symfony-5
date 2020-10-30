ARG PHP_VERSION=7.4

FROM php:${PHP_VERSION}-fpm-alpine

RUN apk add --update \
    zip \
    unzip \
    curl \
    nodejs \
    yarn

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1

COPY .docker/php/config/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

COPY .docker/php/config/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 775 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["php-fpm"]