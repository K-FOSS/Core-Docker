FROM alpine

RUN apk add --no-cache mariadb

RUN ln -s /data /var/lib/mysql

ENTRYPOINT [ "/usr/bin/mariadbd" ]