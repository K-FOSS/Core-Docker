FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/yyyar/gobetween.git

WORKDIR /go/gobetween

RUN go mod download \
  && make build-static

FROM scratch
COPY --from=builder /go/gobetween/bin/gobetween /gobetween

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/gobetween" ]