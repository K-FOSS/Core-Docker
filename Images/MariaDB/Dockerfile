FROM scratch

COPY --from=yobasystems/alpine-mariadb:10 / /



RUN rm -rf /var/lib/mysql \ 
  && ln -s /data/files /var/lib/mysql

ENTRYPOINT [ "/scripts/run.sh" ]