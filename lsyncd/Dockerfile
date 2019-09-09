FROM alpine

RUN apk add --no-cache lsyncd rsync \
    && mkdir -p /etc/lsyncd \
                /etc/rsyncd

ADD lsyncd.conf /etc/lsyncd/
ADD rsync.conf /etc/rsync/

ENTRYPOINT ["docker-entrypoint.sh"]