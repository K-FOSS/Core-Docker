FROM ubuntu:22.04

RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean \
  && apt update && apt install -y \
  git \
  wget \
  tar \
  && mkdir -p /src/kea \
  && wget -O - https://ftp.isc.org/isc/kea/2.1.4/kea-2.1.4.tar.gz | tar xz -C /src/kea --strip-components=1

RUN apt install -y \
  build-essential \
  bison \
  botan \
  flex \
  libssl-dev \
  libcap-dev \
  libboost-dev \
  libboost-filesystem-dev \
  liblog4cplus-dev \
  postgresql-server-dev-all \
  python3-dev

WORKDIR /src/kea

RUN ls -lah

RUN ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--libexecdir=/usr/lib \
	--runstatedir=/run \
	--without-mysql \
	--with-pgsql \
	--disable-rpath \
	--enable-generate-messages \
	--enable-generate-parser \
	--enable-shell \
  && make -j$(nproc) \
  && make DESTDIR=/tmp/out install

FROM ubuntu:22.04
COPY --from=0 /tmp/out /

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean \
  && apt update \
  && apt install -y \
    libpq5 \
    botan \
    wget \
    curl \
    postgresql-client-13 \
    liblog4cplus-2.0.5