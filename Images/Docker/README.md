# Rootless Docker-in-Docker

Customized [Docker rootless DinD](https://hub.docker.com/_/docker) image based on `docker:29-dind-rootless`. CI publishes `kristianfoss/docker:core-mcp` for `linux/amd64` and `linux/arm64`.

The inherited rootless runtime and TLS behavior are retained. When TLS is disabled, the custom entrypoint starts the daemon with the fixed `172.31.95.0/24` bridge network. Like other DinD deployments, the container requires the privileges and persistent storage appropriate to its environment.

Build locally with `docker build -t core-docker/docker:local Images/Docker`.
