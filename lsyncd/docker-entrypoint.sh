#!/bin/sh
set -e

chmod 600 /etc/rsync/rsync.password /etc/rsync/rsync.secrets

rsync --daemon --config=/etc/rsync/rsync.conf
lsyncd /etc/lsyncd/lsyncd.conf

exec "$@"