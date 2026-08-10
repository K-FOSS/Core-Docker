# Kea DHCP

Source-built [ISC Kea 3.2.0](https://downloads.isc.org/isc/kea/3.2.0/) with PostgreSQL support and without MySQL support. CI publishes `kristianfjones/kea:vps1-core` for `linux/amd64`.

The image intentionally has no default command. Supply the Kea daemon and configuration explicitly, for example:

```sh
docker run --rm -v "$PWD/kea:/etc/kea:ro" kristianfjones/kea:vps1-core kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
```

`Healthcheck.sh` is installed at the filesystem root but is not registered as a Docker health check. Configuration and database initialization remain the operator's responsibility. See the [Kea Administrator Reference Manual](https://kea.readthedocs.io/) for daemon and schema guidance.

Build locally with `docker build -t core-docker/kea:local Images/Kea`.
