# MCP network tools

Pass-through image based on [`mcp-netutils`](https://github.com/patrickdappollonio/mcp-netutils) with a refreshed Debian CA certificate bundle. CI publishes `kristianfoss/mcp-domaintools:core-mcp` for `linux/amd64` and `linux/arm64`.

Commands, transport, configuration, and ports are inherited from the upstream image. The `latest` base tag is mutable.

Build locally with `docker build -t core-docker/mcp-netutils:local Images/MCP/NetworkTools`.
