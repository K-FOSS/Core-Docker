FROM alpine:3.24

RUN apk add --no-cache \
  kea-admin \
  kea-dhcp4 \
  mariadb-client

ENTRYPOINT [ "/usr/sbin/kea-admin" ]
