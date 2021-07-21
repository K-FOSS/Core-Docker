FROM alpine as builder


RUN apk add --no-cache \
  git \
  wget \
  tar \
  && mkdir -p /src/kea \
  && wget -O - https://ftp.isc.org/isc/kea/1.9.9/kea-1.9.9.tar.gz | tar xz -C /src/kea --strip-components=1

RUN apk add --no-cache \
  build-base \
  bison \
  botan-dev \
  flex \
  libcap \
  boost-dev \
  log4cplus-dev \
  mariadb-dev \
  postgresql-dev \
  python3-dev

WORKDIR /src/kea

RUN ls -lah

RUN ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--libexecdir=/usr/lib \
	--runstatedir=/run \
	--with-mysql \
	--with-pgsql \
	--disable-rpath \
	--enable-generate-messages \
	--enable-generate-parser \
	--enable-shell \
  && make -j$(nproc) \
  && make DESTDIR=/tmp/out install

FROM alpine
RUN apk add --no-cache \
  libgcc \
  musl \
  libstdc++ \
  mariadb-connector-c \
  mariadb-client \
  libpq \
  botan-libs \
  log4cplus

COPY --from=builder /tmp/out /

ENTRYPOINT [ "/usr/sbin/kea-dhcp4" ]