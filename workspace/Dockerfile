FROM php:7.2-cli-alpine3.7

RUN apk update && apk add --no-cache --virtual .build-deps \
	autoconf gcc libc-dev make curl openssl

RUN apk add postgresql-dev
	
RUN pecl install redis \
	&& docker-php-ext-enable redis \
	&& docker-php-ext-install pdo_pgsql
	
RUN apk del .build-deps
	
RUN apk add supervisor bash git \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www

RUN bash