FROM debian:latest AS builder

ENV PGPOOL_INSTALL_DIR /opt/pgpool-II
ENV PGPOOL_CONF_VOLUME /config

WORKDIR /tmp/pgpool

RUN apt-get update && apt-get -uy upgrade

# Install packages
RUN apt install -y \
    wget \
    ca-certificates \
    build-essential \
    tar \
    bison \
    flex \
    file \
    gcc \
    g++ \
    libbsd-dev \
    make \
    patch \
    openssl \
    libssl-dev \
    libldap-dev \
    postgresql \
    sed \
    sudo

COPY fix_compile_error.patch /tmp/pgpool/

ENV CFLAGS='-O2 -static -static-libgcc'
ENV CXXFLAGS='-O2 -static -static-libgcc'
ENV LDFLAGS='-s'

# Install Pgpool-II
RUN set -eux \
    \
    && wget -O /tmp/pgpool.tar.gz "https://pgpool.net/mediawiki/images/pgpool-II-4.5.0.tar.gz" \
    && tar -zxf /tmp/pgpool.tar.gz -C /tmp/pgpool --strip-components 1 \
    && cd /tmp/pgpool \
    && ./configure \
        --prefix=${PGPOOL_INSTALL_DIR} \
        --with-openssl \
        --with-ldap \
    && make -j "$(nproc)" \
    && make DESTDIR=/tmp/out install
