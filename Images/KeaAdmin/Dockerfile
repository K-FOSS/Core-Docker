FROM alpine

RUN apk add --no-cache \
  kea-admin \
  kea-dhcp4 \
  mariadb-client

ENTRYPOINT [ "/usr/sbin/kea-admin" ]