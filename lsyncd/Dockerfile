FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache lsyncd rsync

ENTRYPOINT ["docker-entrypoint.sh"]