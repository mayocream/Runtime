FROM postgres:alpine

# Set Timezone
ARG DEFAULT_TIMEZONE=UTC
RUN apk add --no-cache tzdata
ENV TZ $DEFAULT_TIMEZONE

# Premissions
RUN chown -R postgres /var/lib/postgresql/data \
    && chmod -R 700 /var/lib/postgresql/data