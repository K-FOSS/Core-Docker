# MCP local RAG search

Pass-through image based on [`mcp-local-rag`](https://github.com/nkapila6/mcp-local-rag) with a refreshed Debian CA certificate bundle. CI publishes `kristianfoss/mcp-search:core-mcp` for `linux/amd64` and `linux/arm64`.

Commands, transport, configuration, and persistence behavior are inherited from the upstream image. The `latest` base tag is mutable.

Build locally with `docker build -t core-docker/mcp-search:local Images/MCP/Search`.
