#!/bin/sh
set -e

chmod 600 /etc/rsync/rsync.password /etc/rsync/rsync.secrets

rm -rf /var/run/rsyncd.pid /var/run/lsyncd.pid

rsync --daemon --config=/etc/rsync/rsync.conf
lsyncd /etc/lsyncd/lsyncd.conf

exec "$@"