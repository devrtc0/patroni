#!/usr/bin/env sh

echo "PostgreSQL wait patroni to start"

DOCKER_IP=$(hostname -i)
readonly DOCKER_IP

chmod 0700 /var/lib/postgresql/data

export PATRONI_POSTGRESQL_CONNECT_ADDRESS="$DOCKER_IP:5432"

exec su-exec postgres dumb-init /venv/bin/patroni /etc/patroni/patroni.yml
