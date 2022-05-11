FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder

WORKDIR /src/github.com
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/coredns/coredns.git

WORKDIR /src/github.com/coredns
COPY ./plugin.cfg ./plugin.add.cfg 
RUN cat ./plugin.add.cfg >>./plugin.cfg

RUN make -f Makefile.release release

FROM scratch
COPY --from=builder /src/github.com/coredns/build/linux/amd64/coredns /coredns

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/coredns" ]
