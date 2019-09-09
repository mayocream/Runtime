FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache lsyncd rsync

COPY ./docker-entrypoint.sh /etc/lsyncd/run.sh

RUN chmod 755 /etc/lsyncd/run.sh

ENTRYPOINT ["/etc/lsyncd/run.sh"]