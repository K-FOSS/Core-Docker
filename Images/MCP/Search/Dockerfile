FROM debian:stable-slim as certs

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM ghcr.io/nkapila6/mcp-local-rag:latest
COPY --from=certs /etc/ssl/certs /etc/ssl/certs