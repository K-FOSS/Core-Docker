FROM alpine:latest

RUN apk add --no-cache \
	bash \
	ca-certificates \
	libsasl \
	mailx \
	sed \
    postfix \ 
	postfix-pgsql \
    postfix-ldap \
	rsyslog \
	rsyslog-pgsql \
	runit

COPY service /etc/service
COPY runit_bootstrap /usr/sbin/runit_bootstrap
COPY rsyslog.conf /etc/rsyslog.conf

RUN ln -sf /dev/stdout /var/log/mail.log

ENTRYPOINT ["/usr/sbin/runit_bootstrap"]