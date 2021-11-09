FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/Vonng/pg_exporter.git

WORKDIR /go/pg_exporter

ENV CGO_ENABLED=0 \
  GOOS=linux

RUN go build -a -ldflags '-extldflags "-static"' -o pg_exporter

FROM scratch
COPY --from=builder /go/pg_exporter/pg_exporter /pg_exporter

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/pg_exporter" ]