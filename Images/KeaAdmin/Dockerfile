FROM alpine

RUN apk add --no-cache \
  kea-admin \
  mariadb-client

ENTRYPOINT [ "/usr/sbin/kea-admin" ]