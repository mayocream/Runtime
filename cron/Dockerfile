FROM php:7-cli-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add --no-cache --virtual .build-deps \
 	autoconf gcc libc-dev make freetype-dev libpng-dev libjpeg-turbo-dev imagemagick-dev libtool

RUN apk add --no-cache freetype libpng libjpeg-turbo imagemagick libmcrypt-dev

RUN pecl install redis imagick mcrypt-1.0.2 \
	&& docker-php-ext-configure gd \
    	--with-gd \
    	--with-freetype-dir=/usr/include/ \
    	--with-png-dir=/usr/include/ \
    	--with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install pdo_mysql bcmath gd opcache \
	&& docker-php-ext-enable redis imagick mcrypt

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN apk del .build-deps

RUN apk add supervisor bash git \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

COPY ./conf/cronjobs /etc/crontabs/root

WORKDIR /var/www

# start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]