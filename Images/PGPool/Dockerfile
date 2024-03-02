FROM alpine:3.17 AS builder

ENV PGPOOL_INSTALL_DIR /opt/pgpool-II
ENV PGPOOL_CONF_VOLUME /config

WORKDIR /tmp/pgpool

# Install packages
RUN set -eux \
    \
    && apk add --no-cache --virtual fetch-dependencies \
        ca-certificates \
        tar \
    \
    && apk add --no-cache --virtual build-dependencies \
        bison \
        flex \
        file \
        gcc \
        g++ \
        libbsd-doc \
        linux-headers \
        make \
        patch \
        openssl-dev \
        openldap-dev \
    \
    && apk add --no-cache \
        bash \
        postgresql \
        postgresql-dev \
        openssl \
        sed \
        sudo

COPY fix_compile_error.patch /tmp/pgpool/

# Install Pgpool-II
RUN set -eux \
    \
    && wget -O /tmp/pgpool.tar.gz "https://pgpool.net/mediawiki/images/pgpool-II-4.5.0.tar.gz" \
    && tar -zxf /tmp/pgpool.tar.gz -C /tmp/pgpool --strip-components 1 \
    && cd /tmp/pgpool \
    && patch -p1 < fix_compile_error.patch \
    && ./configure \
        --prefix=${PGPOOL_INSTALL_DIR} \
        --with-openssl \
        --with-ldap \
    && make -j "$(nproc)" \
    && make DESTDIR=/tmp/out install \
    \
    && mkdir -p /tmp/out/var/run/pgpool \
    && mkdir -p /tmp/out/var/run/postgresql \
    && mkdir -p /tmp/out/opt/pgpool-II \
    && chown -R postgres:postgres /tmp/out/opt/pgpool-II \
    && rm -rf /tmp/out/var/run

RUN set -eux \
    \
    && apk del --purge  --rdepends fetch-dependencies build-dependencies

COPY entrypoint.sh /tmp/out/opt/pgpool-II/bin/
COPY start.sh /tmp/out/opt/pgpool-II/bin/
COPY Healthcheck.sh /tmp/out/opt/pgpool-II/bin/


FROM alpine:latest

COPY --from=builder /tmp/out /

WORKDIR /

ENV PGPOOL_INSTALL_DIR /opt/pgpool-II
ENV PGPOOL_CONF_VOLUME /config

# Create postgres user used to start Pgpool-II
RUN set -ex; \ 
    addgroup -g 70 -S postgres; \
    adduser -u 70 -S -D -G postgres -H -h /var/lib/pgsql -s /bin/sh postgres; \
    mkdir -p /var/lib/pgsql; \
    chown -R postgres:postgres /var/lib/pgsql

RUN apk add --no-cache \
        bash \
        postgresql \
        openssl \
        openldap-dev \
    && mkdir -p /var/run/pgpool \
    && chown -R postgres:postgres /var/run/pgpool \
    && mkdir -p /var/run/postgresql \
    && chown -R postgres:postgres /var/run/postgresql \ 
    && mkdir -p /opt/pgpool-II \
    && chmod +x /opt/pgpool-II/bin/Healthcheck.sh



USER postgres

ENTRYPOINT ["/opt/pgpool-II/bin/entrypoint.sh"]
CMD ["/opt/pgpool-II/bin/start.sh"]

EXPOSE 9999
