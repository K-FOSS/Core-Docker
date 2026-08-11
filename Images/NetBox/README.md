# NetBox

Customized [NetBox Docker](https://github.com/netbox-community/netbox-docker) image based on NetBox `v4.6.1`. CI publishes `kristianfoss/netbox:core` for `linux/amd64` and `linux/arm64`.

Dependencies from [`plugin_requirements.txt`](plugin_requirements.txt) are installed during the build. [`configuration/load_plugin.py`](configuration/load_plugin.py) enables `netbox_ipcalculator`, `netbox_topology_views`, and `netbox_lists` while static assets are collected. The other packages are installed but are not enabled by this build-time configuration; enable and configure the plugins required by a deployment through the upstream NetBox Docker configuration mechanism.

## Installed plugins

| Package or source | Enabled while collecting static assets |
|---|---|
| [`netbox-lists`](https://pypi.org/project/netbox-lists/) | Yes (`netbox_lists`) |
| [`netbox-ddns`](https://github.com/Xyphen-IT/netbox-ddns) | No |
| [`netbox-ipcalculator`](https://pypi.org/project/netbox-ipcalculator/) | Yes (`netbox_ipcalculator`) |
| [`netbox-topology-views`](https://pypi.org/project/netbox-topology-views/) | Yes (`netbox_topology_views`) |
| [`netbox-plugin-device-map`](https://pypi.org/project/netbox-plugin-device-map/) | No |
| [`phonebox_plugin`](https://pypi.org/project/phonebox-plugin/) | No |
| [`netbox-gateways`](https://pypi.org/project/netbox-gateways/) | No |
| [`nb-service`](https://pypi.org/project/nb-service/) | No |
| [`netbox-plugin-dns`](https://pypi.org/project/netbox-plugin-dns/) | No |
| [`netbox-bgp`](https://pypi.org/project/netbox-bgp/) | No |
| [`netbox_kea`](https://pypi.org/project/netbox-kea/) | No |
| [`netbox-data-flows`](https://pypi.org/project/netbox-data-flows/) | No |
| [`netbox-tunnels2`](https://pypi.org/project/netbox-tunnels2/) | No |
| [`netbox-inventory`](https://pypi.org/project/netbox-inventory/) | No |
| [`netbox-contract`](https://pypi.org/project/netbox-contract/) | No |
| [`netbox-slm`](https://pypi.org/project/netbox-slm/) | No |
| [`netbox-routing`](https://pypi.org/project/netbox-routing/) | No |
| [`netbox-acls`](https://pypi.org/project/netbox-acls/) | No |

The PyPI dependencies are unpinned, and `netbox-ddns` is installed from its mutable `main` branch, so plugin versions can change when the image is rebuilt.

Compatibility status at the NetBox 4.6.1 bump:

- Explicitly documented as 4.6-compatible upstream: `netbox-lists`, `netbox-acls`, `netbox-inventory`.
- Documented as compatible with the 4.6 line or with a broad enough lower bound that they are expected to work on 4.6, but not yet backed here by a repo-level compatibility check: `netbox-ipcalculator`, `netbox-data-flows`.
- Still requiring follow-up before this image can be called fully 4.6-ready: `netbox-topology-views`, `netbox-plugin-dns`, `netbox-gateways`, `netbox-contract`, `netbox-routing`, `nb-service`, `netbox-tunnels2`, `netbox_kea`, `netbox-plugin-device-map`, and `netbox-ddns` from `main`.

The next maintenance step is to replace or pin the remaining lagging plugins to versions that explicitly declare NetBox 4.6 support, then re-test the build and collectstatic path before taking another NetBox minor update.

Runtime configuration, secrets, database, Redis, migrations, and startup behavior are inherited from the upstream image; follow the [NetBox Docker plugin configuration](https://github.com/netbox-community/netbox-docker/wiki/Using-Netbox-Plugins) and [quickstart](https://github.com/netbox-community/netbox-docker/wiki/Quickstart).

Build locally with `docker build -t core-docker/netbox:local Images/NetBox`.
