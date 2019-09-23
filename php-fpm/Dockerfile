FROM php:7-fpm-alpine

# SET TIMEZONE
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ADD MIRROR REPO
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

# Opcache Option
ARG ENABLE_OPCACHE=false
RUN if [ ${ENABLE_OPCACHE} = true ]; then \
    docker-php-ext-install opcache \
;fi

RUN apk del .build-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000