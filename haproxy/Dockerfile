FROM haproxy:alpine

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
RUN apk add --no-cache tzdata
ENV TZ $DEFAULT_TIMEZONE