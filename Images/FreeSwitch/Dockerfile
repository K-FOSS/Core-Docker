FROM alpine:3.17 as builder


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

    \
    && apk add --no-cache \
        bash \
        postgresql \
        postgresql-dev \
        openssl \
        sed \
        sudo

RUN export VERSION=$$(wget -O - -q https://files.freeswitch.org/freeswitch-releases/ | ack -o '	freeswitch-\d{1,2}\.\d{1,2}\.\d{1,2}' | tail -1) \
    && wget -O - https://files.freeswitch.org/freeswitch-releases/$${VERSION}.tar.gz | tar xz -C /src/freeswitch --strip-components=1

WORKDIR /src/freeswitch

RUN ls -lah \
  && ./configure \
    --help \
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
		--with-python3 \
		--disable-debug \
		--enable-core-pgsql-support \
		--enable-system-lua \
		--enable-system-xmlrpc-c