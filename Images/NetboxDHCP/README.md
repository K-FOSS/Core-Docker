# NetBox Kea DHCP

Python image containing the [`netbox-kea-dhcp`](https://pypi.org/project/netbox-kea-dhcp/) command. CI publishes `kristianfjones/netbox-dhcp:main` for `linux/amd64` (the hosted runner's default BuildKit platform).

The entrypoint is `/usr/local/bin/netbox-kea-dhcp`. Pass configuration through the command's supported arguments and environment. The package and Python base currently use mutable, unpinned versions, so rebuilds can change without a repository commit.

Build locally with `docker build -t core-docker/netbox-dhcp:local Images/NetboxDHCP`.
