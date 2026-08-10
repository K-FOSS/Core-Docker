# syntax=docker/dockerfile:1
FROM ubuntu:24.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean \
  && apt update && apt install -y \
  git \
  wget \
  tar \
  xz-utils \
  && mkdir -p /src/kea \
  && wget -O - https://downloads.isc.org/isc/kea/3.2.0/kea-3.2.0.tar.xz | tar xJ -C /src/kea --strip-components=1

RUN apt install -y \
  build-essential \
  bison \
  flex \
  libssl-dev \
  libcap-dev \
  libboost-dev \
  libboost-filesystem-dev \
  liblog4cplus-dev \
  meson \
  ninja-build \
  pkg-config \
  postgresql-server-dev-all \
  python3-dev

WORKDIR /src/kea

RUN meson setup build \
    --buildtype=release \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=lib \
    -Dcrypto=openssl \
    -Dmysql=disabled \
    -Dpostgresql=enabled \
    -Dtests=disabled \
  && meson compile -C build -j "$(nproc)" \
  && DESTDIR=/tmp/out meson install -C build \
  && mv /tmp/out/var/run /tmp/out/run \
  && test -n "$(find /tmp/out/usr/lib -type f -name libdhcp_pgsql.so -print -quit)" \
  && test -n "$(find /tmp/out/usr/lib -type f -name 'libkea-pgsql.so.*' -print -quit)"

COPY ./Healthcheck.sh /tmp/out/Healthcheck.sh

FROM ubuntu:24.04
COPY --from=build /tmp/out /

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean \
  && apt update \
  && apt install -y \
    libpq5 \
    wget \
    curl \
    postgresql-client \
    liblog4cplus-2.0.5
