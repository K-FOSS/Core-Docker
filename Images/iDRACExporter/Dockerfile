FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/mrlhansen/idrac_exporter.git

WORKDIR /go/idrac_exporter

ENV CGO_ENABLED=0 \
  GOOS=linux

RUN go build -a -ldflags '-extldflags "-static"' -o idrac_exporter

FROM scratch
COPY --from=builder /go/idrac_exporter/idrac_exporter /idrac_exporter

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/idrac_exporter" ]