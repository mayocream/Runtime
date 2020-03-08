FROM php:7.4-fpm-alpine

# China Mirror
ARG CHINA_MIRROR=false
RUN if [ ${CHINA_MIRROR} = true ]; then \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
	&& apk update \
;fi

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
RUN apk add --no-cache tzdata
ENV TZ $DEFAULT_TIMEZONE

RUN apk add --no-cache --virtual .build-deps \
	$PHPIZE_DEPS

# Opcache Option
ARG PHP_EXT_OPCACHE=false
RUN if [ $PHP_EXT_OPCACHE = true ]; then \
    docker-php-ext-install opcache \
;fi

# Xdebug Option
ARG PHP_EXT_XDEBUG=false
RUN if [ $PHP_EXT_XDEBUG = true ]; then \
	pecl install xdebug  \
	&& docker-php-ext-enable xdebug \
;fi

# Imagick Option
ARG PHP_EXT_IMAGICK=false
RUN if [ $PHP_EXT_IMAGICK = true ]; then \
	apk add --no-cache --virtual .ext-deps imagemagick-dev \
	&& pecl install imagick \
	&& docker-php-ext-enable imagick \
	&& apk del .ext-deps \
;fi

# GD Option
ARG PHP_EXT_GD=false
RUN if [ $PHP_EXT_GD = true ]; then \
	apk add --no-cache --virtual .ext-deps \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& apk del .ext-deps \
;fi

# Redis Option
ARG PHP_EXT_REDIS=false
RUN if [ $PHP_EXT_REDIS = true ]; then \
	pecl install redis-5.1.1 \
	&& docker-php-ext-enable redis \
;fi

# Mcrypt Option
ARG PHP_EXT_MCRYPT=false
RUN if [ $PHP_EXT_MCRYPT = true ]; then \
	apk add --no-cache --virtual .ext-deps libmcrypt-dev \
	&& pecl install mcrypt-1.0.3 \
	&& docker-php-ext-enable mcrypt \
	&& apk del .ext-deps \
;fi

# Enable other exts
RUN docker-php-ext-install -j$(nproc) \
		pdo_mysql \
		bcmath \
		pcntl \
		mysqli \
		iconv \
		posix


# Install runtime dependencies
RUN set -ex; \
		runDeps="$( \
			scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
				| tr ',' '\n' \
				| sort -u \
				| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
		)"; \
		apk add --virtual .phpexts-rundeps $runDeps

RUN apk del .build-deps

WORKDIR /var/www

RUN ln -sf /dev/stderr /var/log/php-fpm/error.log

CMD ["php-fpm"]

EXPOSE 9000