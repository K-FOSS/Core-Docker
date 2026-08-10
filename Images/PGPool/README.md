# Pgpool-II

[Pgpool-II 4.7.2](https://www.pgpool.net/docs/47/en/html/) built with OpenSSL, LDAP, and memcached support. CI publishes `kristianfjones/pgpool:latest` for `linux/amd64`; the container runs as the `postgres` user and listens on port `9999` by default.

At minimum, set `PGPOOL_PARAMS_BACKEND_HOSTNAME0`. Every `PGPOOL_PARAMS_*` variable is translated to the corresponding `pgpool.conf` setting. Defaults include backend port `5432`, backend weight `1`, and listen address `*`.

Credentials named as matching `*_USERNAME` and `*_PASSWORD` pairs are added to `pool_passwd`. Optional controls include `PGPOOL_ENABLE_POOL_PASSWD`, `PGPOOL_PASSWORD_ENCRYPTION_METHOD`, `PGPOOL_SKIP_PASSWORD_ENCRYPTION`, `PGPOOL_PCP_USER`, and `PGPOOL_PCP_PASSWORD`.

Mount optional configuration at `/config`: `/config/pool_hba.conf` replaces the generated HBA file, while `/config/tls/tls.crt` and `/config/tls/tls.key` enable the supplied TLS identity.

```sh
docker run --rm -p 9999:9999 -e PGPOOL_PARAMS_BACKEND_HOSTNAME0=postgres kristianfjones/pgpool:latest
```

Build locally with `docker build -t core-docker/pgpool:local Images/PGPool`.
