FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM golang:bullseye as builder
ARG TARGETOS
ARG TARGETARCH

WORKDIR /src/github.com
RUN apt update \
    && apt install -y git \
    && git clone https://github.com/coredns/coredns.git

WORKDIR /src/github.com/coredns
RUN ls -lah \
  && cat plugin.cfg

COPY ./plugin.cfg ./plugin.cfg

RUN echo "Platform ${LINUX_ARCH}" \
  && printenv \
  && cat plugin.cfg \
  && mkdir -p build/linux/${TARGETARCH} \
  && make gen \
  && CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w -X github.com/coredns/coredns/coremain.GitCommit=092c1444-dirty" -o build/linux/${TARGETARCH}/coredns 

FROM scratch
ARG TARGETARCH

COPY --from=builder /src/github.com/coredns/build/linux/${TARGETARCH}/coredns /coredns

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/coredns" ]
