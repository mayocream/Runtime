FROM php:fpm-alpine3.7

RUN apk update && apk add autoconf gcc libc-dev make icu-dev gettext-dev \
	&& apk --no-cache add postgresql-dev

RUN pecl install redis \
	&& docker-php-ext-enable redis
	
RUN docker-php-ext-install pgsql pdo_pgsql intl hash gettext

ARG PHP_OPCACHE=false

RUN if [ ${PHP_OPCACHE} = true ]; then \
	docker-php-ext-install opcache \
;fi

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000