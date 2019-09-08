FROM php:7-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add --no-cache --virtual .build-deps \
 	autoconf gcc libc-dev make freetype-dev libpng-dev libjpeg-turbo-dev imagemagick-dev libtool

RUN apk add --no-cache freetype libpng libjpeg-turbo imagemagick libmcrypt-dev

RUN pecl install redis imagick \
	&& docker-php-ext-configure gd \
    	--with-gd \
    	--with-freetype-dir=/usr/include/ \
    	--with-png-dir=/usr/include/ \
    	--with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install pdo_mysql bcmath gd opcache mcrypt \
	&& docker-php-ext-enable redis imagick

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN apk del .build-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000