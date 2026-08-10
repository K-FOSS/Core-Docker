# Postfix relay

Alpine-based Postfix service with PostgreSQL and LDAP maps, rsyslog PostgreSQL output, and runit supervision. CI publishes `kristianfoss/postfix:core` for `linux/amd64` and `linux/arm64`.

Environment variables prefixed with `CONF_` become lowercase `postconf` settings; for example, `CONF_RELAYHOST` configures `relayhost`. `MAILNAME`, `ROOT_ALIAS`, and `SASL_AUTH` configure common relay behavior. PostgreSQL alias maps use `POSTGRES_HOSTS`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_ALIAS_DB`, plus `POSTGRES_VALIAS_QUERY` and/or `POSTGRES_ALIAS_QUERY`.

PostgreSQL log output is enabled only when `POSTGRES_LOG_TABLE`, `POSTGRES_LOG_HOST`, `POSTGRES_LOG_USER`, `POSTGRES_LOG_PASSWORD`, and `POSTGRES_LOG_DB` are all set. Otherwise mail logs are written to container stdout. Protect all credential variables as secrets.

See the [Postfix documentation](https://www.postfix.org/documentation.html). Build locally with `docker build -t core-docker/postfix:local Images/Postfix`.
