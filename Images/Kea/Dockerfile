FROM ubuntu:21.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
  git \
  wget \
  tar \
  && mkdir -p /src/kea \
  && wget -O - https://ftp.isc.org/isc/kea/1.9.9/kea-1.9.9.tar.gz | tar xz -C /src/kea --strip-components=1

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

FROM ubuntu:21.04
COPY --from=0 /tmp/out /
COPY --from=registry.gitlab.isc.org/isc-projects/stork/agent-kea:latest /agent/stork-agent /usr/sbin/stork-agent

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
  && apt install -y \
    libpq5 \
    botan \
    postgresql-client-13