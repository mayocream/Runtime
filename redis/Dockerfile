FROM redis:alpine

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
RUN apk add --no-cache tzdata
ENV TZ $DEFAULT_TIMEZONE

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]