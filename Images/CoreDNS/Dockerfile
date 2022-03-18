FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/coredns/coredns.git

WORKDIR /go/coredns
COPY ./plugin.cfg ./plugin.add.cfg 
RUN cat ./plugin.add.cfg >>./plugin.cfg

RUN make

FROM scratch
COPY --from=builder /go/coredns/coredns /coredns

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/coredns" ]