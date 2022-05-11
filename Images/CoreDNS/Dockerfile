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
COPY ./plugin.cfg ./plugin.add.cfg 
RUN cat ./plugin.add.cfg >>./plugin.cfg

RUN echo "Platform ${LINUX_ARCH}" \
  && printenv \
  && mkdir -p build/linux/${TARGETPLATFORM} \
  && CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w -X 092c1444" -o build/linux/${TARGETPLATFORM}/coredns 

FROM scratch
ARG TARGETPLATFORM
COPY --from=builder /src/github.com/coredns/build/linux/${TARGETPLATFORM}/coredns /coredns

COPY --from=certs  /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT [ "/coredns" ]
