FROM php:7-fpm-alpine

RUN apk update && apk add --no-cache --virtual .build-deps \
 	autoconf gcc libc-dev make
	

# RUN apk add postgresql-dev

RUN pecl install redis bcmatch \
	&& docker-php-ext-enable redis \
	&& docker-php-ext-install pdo_mysql
	
# ARG PHP_OPCACHE=false

# RUN if [ ${PHP_OPCACHE} = true ]; then \
# 	docker-php-ext-install opcache \
# ;fi

RUN apk del .build-deps

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000