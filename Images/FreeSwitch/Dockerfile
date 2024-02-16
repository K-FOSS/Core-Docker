FROM alpine:latest AS builder


# Install packages

RUN set -eux \
    \
    && apk add --no-cache --virtual fetch-dependencies \
        ca-certificates \
        tar \
        ack \
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
        apr-dev \
        autoconf \ 
        automake \
        bash \
        bsd-compat-headers \
        coreutils \ 
        curl-dev \
        diffutils \
        flite-dev \
        gdbm-dev \
        lame-dev \
        ldns-dev \
        libedit-dev \
        libjpeg-turbo-dev \
        libks-dev \
        libpq-dev \
        libshout-dev \
        libsndfile-dev \
        libsrtp-dev \
        libtool \
        linux-headers \
        lua5.3-dev \
        mpg123-dev \
        mariadb-dev \
        ncurses-dev \
        nasm \
        net-snmp-dev \
        openssl-dev>3 \
        opus-dev \
        pcre-dev \
        perl-dev \
        portaudio-dev \
        python3-dev \
        sngtc_client-dev \
        sofia-sip-dev \
        spandsp3-dev \
        speex-dev \
        speexdsp-dev \
        sqlite-dev \
        tiff-dev \
        unixodbc-dev \
        util-linux-dev \
        xmlrpc-c-dev \
        zlib-dev \
        autoconf \
        freeradius \
        freeradius-lib \
        h2o-dev \
        freeradius-client \

    \
    && apk add --no-cache \
        bash \
        postgresql \
        postgresql-dev \
        openssl \
        sed \
        sudo

RUN export VERSION=$(wget -O - -q https://files.freeswitch.org/freeswitch-releases/ | ack -o 'freeswitch-\d{1,2}\.\d{1,2}\.\d{1,2}' | tail -1) \
    && echo "Getting https://files.freeswitch.org/freeswitch-releases/${VERSION}.-release.tar.xz" \
    && mkdir -p /src/freeswitch \
    && wget -O - https://files.freeswitch.org/freeswitch-releases/${VERSION}.-release.tar.gz | tar xz -C /src/freeswitch --strip-components=1

WORKDIR /src/freeswitch

COPY ./modules.conf /src/freeswitch/modules.conf
COPY ./python-3.10.patch /src/freeswitch/python-3.10.patch
COPY ./getlib.patch /src/freeswitch/getlib.patch
COPY ./libvpx-fix-arm-float-abi.patch /src/freeswitch/libvpx-fix-arm-float-abi.patch
COPY ./disable-Werror.patch /src/freeswitch/disable-Werror.patch

RUN ls -lah \
  && patch -p1 < python-3.10.patch \
  && patch -p1 < getlib.patch \
  && patch -p1 < libvpx-fix-arm-float-abi.patch \
  && patch -p1 < disable-Werror.patch \
  && autoreconf -vif \
  && ./configure \
		--build=$CBUILD \
		--host=$CHOST \
		--prefix=/usr \
		--enable-fhs \
		--localstatedir=/var \
		--sysconfdir=/etc \
		--with-scriptdir=/etc/freeswitch/scripts \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--with-devrandom=/dev/urandom \
        --with-ldap \
		--disable-debug \
		--enable-core-pgsql-support \
		--enable-system-lua \
		--enable-system-xmlrpc-c \
  && make libs/libvpx/libvpx.a \
  && make src/include/switch_version.h src/include/switch_swigable_cpp.h \
  && make libfreeswitch.la \
  && make all \
  && cd libs/esl \
  && make perlmod \
  && cd /src/freeswitch \
  && make -j1 DESTDIR="/tmp/out" install samples-conf samples-htdocs \
  && cd libs/esl \
  && make -j1 DESTDIR="/tmp/out" perlmod-install \
  && rm -rf /tmp/out/var/run

FROM alpine:latest

RUN apk add --no-cache \
        busybox-binsh \
        lame-libs \
        libcrypto3 \
        libcurl \
        libedit \
        libgcc \
        libks \
        libncursesw \
        libpq \
        libshout \
        libsndfile \
        libssl3 \
        libstdc++ \
        libuuid |
        lua5.3-libs \
        mpg123-libs \
        musl \
        opus \
        pcre \
        portaudio \
        sofia-sip \
        spandsp3 \
        speex \
        speexdsp \
        sqlite-libs \
        unixodbc \
        freeradius-lib \
        h2o \
        freeradius-client

COPY --from=builder /tmp/out/etc /etc
COPY --from=builder /tmp/out/usr /usr

RUN mkdir -p /var/run

COPY --from=builder /tmp/out /