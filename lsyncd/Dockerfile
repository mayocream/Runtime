FROM alpine

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

RUN apk add --no-cache lsyncd rsync

COPY ./docker-entrypoint.sh /etc/lsyncd/run.sh

RUN chmod 755 /etc/lsyncd/run.sh

ENTRYPOINT ["/etc/lsyncd/run.sh"]