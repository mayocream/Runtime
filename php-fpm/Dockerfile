FROM php:7-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add --no-cache --virtual .build-deps \
 	autoconf gcc libc-dev make libpng libpng-dev

RUN pecl install redis \
	&& docker-php-ext-enable redis \
	&& docker-php-ext-install pdo_mysql bcmath gd
	
# ARG PHP_OPCACHE=false

# RUN if [ ${PHP_OPCACHE} = true ]; then \
# 	docker-php-ext-install opcache \
# ;fi

RUN apk del .build-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000