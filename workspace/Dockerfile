FROM php:7-cli-alpine

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
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
	&& docker-php-ext-install pdo_mysql bcmath gd pcntl \
	&& docker-php-ext-enable redis imagick mcrypt

RUN apk del .build-deps

RUN apk add supervisor bash git \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www
