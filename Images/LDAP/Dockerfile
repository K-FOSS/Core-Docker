FROM debian:latest AS builder
WORKDIR /tmp/openldap

RUN apt-get update && apt-get -uy upgrade

# Install packages
RUN apt install -y \
    ack \
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
    libargon2-dev \
    groff-base \
    libssl-dev \
    libevent-dev \
    sed \
    sudo

RUN export VERSION=$(wget -O - -q https://www.openldap.org/software/download/OpenLDAP/openldap-release/ | ack -o 'openldap-\d{1,2}\.\d{1,2}\.\d{1,2}' | tail -1) \
    && mkdir -p /src/openldap \
    && wget -O - https://www.openldap.org/software/download/OpenLDAP/openldap-release/${VERSION}.tgz | tar xz -C /src/openldap --strip-components=1

WORKDIR /src/openldap

ENV CFLAGS='-O2 -static -static-libgcc'
ENV CXXFLAGS='-O2 -static -static-libgcc'
ENV LDFLAGS='-s'

RUN ls -lah \
  && ./configure \
    --with-pic \
    --with-tls=openssl \
    --with-gnu-ld \
  && make -j "$(nproc)" \
  && make DESTDIR=/tmp/out install
