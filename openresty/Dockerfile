FROM openresty/openresty:alpine

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
RUN apk add --no-cache tzdata
ENV TZ $DEFAULT_TIMEZONE

RUN adduser -D www-data

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx", "-c", "/etc/nginx/conf.d/conf/nginx.conf", "-g", "daemon off;"]

EXPOSE 80 443