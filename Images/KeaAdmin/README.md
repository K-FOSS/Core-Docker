# Kea Admin

Small Alpine image containing `kea-admin`, `kea-dhcp4`, and the MariaDB client. CI publishes `kristianfjones/kea:vps1-admin` for `linux/amd64` (the hosted runner's default BuildKit platform).

The entrypoint is `/usr/sbin/kea-admin`; pass its normal arguments after the image name. Database credentials and schema choices must be supplied at runtime. See the upstream [`kea-admin` documentation](https://kea.readthedocs.io/en/latest/arm/admin.html).

Build locally with `docker build -t core-docker/kea-admin:local Images/KeaAdmin`.
