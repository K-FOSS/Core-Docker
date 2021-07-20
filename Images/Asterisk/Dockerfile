FROM andrius/asterisk:alpine_glibc-18.1.1

RUN apk add --no-cache \
  asterisk-alsa \
  asterisk-pgsql \
  asterisk-sounds-en \
  asterisk-sounds-moh \
  asterisk-speex \
  asterisk-srtp

ENTRYPOINT [ "/usr/sbin/asterisk" ]