# NetBox

Customized [NetBox Docker](https://github.com/netbox-community/netbox-docker) image based on NetBox `v4.5`. CI publishes `kristianfoss/netbox:core` for `linux/amd64` and `linux/arm64`.

Dependencies from `plugin_requirements.txt` are installed during the build. `configuration/load_plugin.py` enables `netbox_ipcalculator`, `netbox_topology_views`, and `netbox_lists` while static assets are collected. Runtime configuration, secrets, database, Redis, migrations, and startup behavior are inherited from the upstream image; follow the [NetBox Docker quickstart](https://github.com/netbox-community/netbox-docker/wiki/Quickstart).

Build locally with `docker build -t core-docker/netbox:local Images/NetBox`.
