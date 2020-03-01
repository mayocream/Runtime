FROM gogs/gogs

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
ENV TZ $DEFAULT_TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone