FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM ghcr.io/patrickdappollonio/mcp-domaintools:latest
COPY --from=certs /etc/ssl/certs /etc/ssl/certs