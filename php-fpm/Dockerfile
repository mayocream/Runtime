FROM php:7-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add --no-cache --virtual .build-deps \
 	autoconf gcc libc-dev make

RUN pecl install redis \
	&& docker-php-ext-enable redis \
	&& docker-php-ext-install pdo_mysql bcmath

# php gd
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

# php imagick
RUN set -ex \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

# ARG PHP_OPCACHE=false

# RUN if [ ${PHP_OPCACHE} = true ]; then \
# 	docker-php-ext-install opcache \
# ;fi

RUN apk del .build-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000