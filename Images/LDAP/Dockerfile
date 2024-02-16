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
    sed \
    sudo

RUN export VERSION=$(wget -O - -q https://www.openldap.org/software/download/OpenLDAP/openldap-release/ | ack -o 'openldap-\d{1,2}\.\d{1,2}\.\d{1,2}' | tail -1) \
    && mkdir -p /src/openldap \
    && wget -O - https://www.openldap.org/software/download/OpenLDAP/openldap-release/${VERSION}.tgz | tar xz -C /src/openldap --strip-components=1

WORKDIR /src/openldap

RUN ls -lah \
  && AUTOMAKE=/bin/true autoreconf -fi \
  && ./configure --help