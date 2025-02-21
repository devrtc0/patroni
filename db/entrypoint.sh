#!/usr/bin/env sh

echo "PostgreSQL wait patroni to start"

DOCKER_IP=$(hostname -i)
readonly DOCKER_IP

chmod 0700 /var/lib/postgresql/data

if [ -f /var/lib/postgresql/init.sh ] && [ ! -z "$POST_INIT_PATH" ]; then
    DIRNAME=$(dirname "$POST_INIT_PATH")
    mkdir -p "$DIRNAME"
    cp /var/lib/postgresql/init.sh "$DIRNAME/"
    chown postgres:postgres "$POST_INIT_PATH"
fi

export PATRONI_POSTGRESQL_CONNECT_ADDRESS="$DOCKER_IP:5432"
export PATRONI_RESTAPI_CONNECT_ADDRESS="$DOCKER_IP:8008"
if [ -z "$PATRONI_NAME" ]; then
    if [ -z "$NAME_PREFIX" ]; then
        export PATRONI_NAME="$HOSTNAME"
    else
        export PATRONI_NAME="$NAME_PREFIX-$HOSTNAME"
    fi
fi

exec su-exec postgres dumb-init /venv/bin/patroni /etc/patroni/patroni.yml
