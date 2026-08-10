# Open WebUI MCPO

Extends [MCPO](https://github.com/open-webui/mcpo) with Docker CLI 28.3.3 for MCP workloads that need to invoke Docker. CI publishes `kristianfoss/openwebui:core-mcp` for `linux/amd64` and `linux/arm64`; the build selects Docker's `x86_64` or `aarch64` archive from BuildKit's `TARGETARCH`.

Entrypoint, ports, and MCPO configuration are inherited from `ghcr.io/open-webui/mcpo:main`. Access to a Docker daemon is not bundled: provide a socket or remote Docker endpoint only when the trust boundary permits it.

Build locally with `docker build -t core-docker/openwebui:local Images/OpenWebUI`.
