FROM scratch

COPY --from=yobasystems/alpine-mariadb:10 / /

RUN ln -s /data/files /var/lib/mysql

ENTRYPOINT [ "/scripts/run.sh" ]