FROM citusdata/citus:alpine

RUN apk add --no-cache su-exec py3-virtualenv dumb-init \
    && apk add --no-cache --virtual build-dependencies build-base linux-headers python3-dev py3-pip \
    && python3 -m venv /venv && mkdir -p /venv/etc \
    && cd /venv \
    && ./bin/pip install psycopg2 \
    && ./bin/pip install patroni[etcd] \
    && apk del build-dependencies

WORKDIR /var/lib/postgresql
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
