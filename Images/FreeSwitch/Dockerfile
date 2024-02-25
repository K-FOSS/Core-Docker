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
    sudo \
    libldap2-dev \
    libasound2-dev \
    libavcodec-dev \
    erlang-dev \
    libavutil-dev \
    libavformat-dev \
    libswscale-dev


RUN export VERSION=$(wget -O - -q https://files.freeswitch.org/freeswitch-releases/ | ack -o 'freeswitch-\d{1,2}\.\d{1,2}\.\d{1,2}' | tail -1) \
    && echo "Getting https://files.freeswitch.org/freeswitch-releases/${VERSION}.-release.tar.xz" \
    && mkdir -p /src/freeswitch \
    && wget -O - https://files.freeswitch.org/freeswitch-releases/${VERSION}.-release.tar.gz | tar xz -C /src/freeswitch --strip-components=1

WORKDIR /src/freeswitch

ENV CFLAGS='-O2 -static -static-libgcc'
ENV CXXFLAGS='-O2 -static -static-libgcc'
ENV LDFLAGS='-s'

RUN ls -lah \
  && ./configure \
        --help \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var/lib/openldap \
    --with-pic \
    --with-tls=openssl \
    --enable-dynamic \
    --with-gnu-ld \
  && make -j "$(nproc)" \
  && make DESTDIR=/tmp/out install

CMD ["freeswitch"]