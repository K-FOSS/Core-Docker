# MCPHub with Docker CLI

Extends [`samanhappy/mcphub`](https://github.com/samanhappy/mcphub) with Docker CLI 28.3.3. CI publishes `kristianfjones/mcphub:latest` for `linux/amd64`.

Runtime behavior is inherited from MCPHub. Access to a Docker daemon is not bundled; provide a socket or remote endpoint only when appropriate, because it can grant broad control of the host. Both the upstream base tag and published tag are mutable.

Build locally with `docker build -t core-docker/mcphub:local Images/MCP/MCPHub`.
