# syntax=docker/dockerfile:1.7
FROM ghcr.io/open-webui/mcpo:main

ARG DOCKER_VERSION=28.3.3
ARG TARGETARCH

RUN --mount=type=cache,target=/var/cache/docker-cli,sharing=locked \
    case "${TARGETARCH}" in \
      amd64) docker_arch=x86_64 ;; \
      arm64) docker_arch=aarch64 ;; \
      *) echo "Unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac \
    && if [ ! -s "/var/cache/docker-cli/docker-${DOCKER_VERSION}-${docker_arch}.tgz" ]; then \
      curl -fsSL "https://download.docker.com/linux/static/stable/${docker_arch}/docker-${DOCKER_VERSION}.tgz" \
      -o "/var/cache/docker-cli/docker-${DOCKER_VERSION}-${docker_arch}.tgz"; \
    fi \
    && tar -xz -C /usr/local/bin --strip-components=1 \
      -f "/var/cache/docker-cli/docker-${DOCKER_VERSION}-${docker_arch}.tgz" \
      docker/docker
