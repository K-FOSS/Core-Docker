# Core Docker images

Core Docker is K-FOSS's collection of purpose-built container images for
infrastructure, networking, observability, and MCP workloads. Each image has an
independent build context under [`Images/`](Images/); this repository is not a
single application or a Docker Compose stack.

Images on the default branch are built by GitHub Actions and published to
Docker Hub. Some directories are retained as experiments or historical build
contexts and are not currently published by CI.

## Published images

The main [build workflow](.github/workflows/Daily.yaml) runs after pushes to
`main` and twice daily at 05:30 and 17:30 UTC.

| Build context | Published image | Platforms |
|---|---|---|
| [`Images/NetBox`](Images/NetBox) | [`kristianfoss/netbox:core`](https://hub.docker.com/r/kristianfoss/netbox) | amd64, arm64 |
| [`Images/UPNP`](Images/UPNP) | [`kristianfjones/upnp:jobs`](https://hub.docker.com/r/kristianfjones/upnp) | amd64 |
| [`Images/MCP/MCPHub`](Images/MCP/MCPHub) | [`kristianfjones/mcphub:latest`](https://hub.docker.com/r/kristianfjones/mcphub) | amd64 |
| [`Images/PGPool`](Images/PGPool) | [`kristianfjones/pgpool:latest`](https://hub.docker.com/r/kristianfjones/pgpool) | amd64 |
| [`Images/Llama`](Images/Llama) | [`kristianfoss/llama:core`](https://hub.docker.com/r/kristianfoss/llama) | amd64 |
| [`Images/Docker`](Images/Docker) | [`kristianfoss/docker:core-mcp`](https://hub.docker.com/r/kristianfoss/docker) | amd64, arm64 |
| [`Images/MCP/NetworkTools`](Images/MCP/NetworkTools) | [`kristianfoss/mcp-domaintools:core-mcp`](https://hub.docker.com/r/kristianfoss/mcp-domaintools) | amd64, arm64 |
| [`Images/MCP/Search`](Images/MCP/Search) | [`kristianfoss/mcp-search:core-mcp`](https://hub.docker.com/r/kristianfoss/mcp-search) | amd64, arm64 |
| [`Images/MCP/Docker`](Images/MCP/Docker) | [`kristianfoss/docker-mcp:testing`](https://hub.docker.com/r/kristianfoss/docker-mcp) | amd64, arm64 |
| [`Images/OpenWebUI`](Images/OpenWebUI) | [`kristianfoss/openwebui:core-mcp`](https://hub.docker.com/r/kristianfoss/openwebui) | amd64, arm64 |
| [`Images/Postfix`](Images/Postfix) | [`kristianfoss/postfix:core`](https://hub.docker.com/r/kristianfoss/postfix) | amd64, arm64 |
| [`Images/Kea`](Images/Kea) | [`kristianfjones/kea:vps1-core`](https://hub.docker.com/r/kristianfjones/kea) | amd64 |
| [`Images/PGExporter`](Images/PGExporter) | [`kristianfjones/pgexporter-docker:core0`](https://hub.docker.com/r/kristianfjones/pgexporter-docker) | amd64, arm64 |
| [`Images/CoreDNS`](Images/CoreDNS) | [`kristianfjones/coredns-docker:core0`](https://hub.docker.com/r/kristianfjones/coredns-docker) | amd64, arm64 |
| [`Images/KeaAdmin`](Images/KeaAdmin) | [`kristianfjones/kea:vps1-admin`](https://hub.docker.com/r/kristianfjones/kea) | amd64 |
| [`Images/LDAP`](Images/LDAP) | [`kristianfjones/library-openldap:latest`](https://hub.docker.com/r/kristianfjones/library-openldap) | amd64 |
| [`Images/NetboxDHCP`](Images/NetboxDHCP) | [`kristianfjones/netbox-dhcp:main`](https://hub.docker.com/r/kristianfjones/netbox-dhcp) | amd64 |

The separate [kubectl workflow](.github/workflows/KubeCTL.yaml) builds
[`Images/KubeCTL`](Images/KubeCTL) for amd64 and arm64. It currently publishes
`kristianfjones/kubectl:v1.24.4` and `kristianfjones/kubectl:v1.23.10`.

## Other build contexts

The following directories contain Dockerfiles but their build steps are
disabled or absent from the current workflows:

- [`Images/Asterisk`](Images/Asterisk)
- [`Images/FreeSwitch`](Images/FreeSwitch)
- [`Images/GoBetween`](Images/GoBetween)
- [`Images/MariaDB`](Images/MariaDB)
- [`Images/Web`](Images/Web)
- [`Images/eNMS`](Images/eNMS)
- [`Images/iDRACExporter`](Images/iDRACExporter)

Treat these as experimental or historical until their build is restored and
validated. A Dockerfile's presence alone does not mean its image is published.

## Build an image locally

Run builds from the repository root and use the image directory as the build
context:

```sh
docker build --pull --tag core-docker/kea:local Images/Kea
```

For a multi-platform validation that does not publish an image:

```sh
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag core-docker/netbox:local \
  Images/NetBox
```

Build arguments are image-specific. For example, the kubectl image accepts
`VERSION` and receives `TARGETARCH` from BuildKit:

```sh
docker buildx build \
  --build-arg VERSION=v1.24.4 \
  --platform linux/amd64 \
  --tag core-docker/kubectl:local \
  Images/KubeCTL
```

Do not add `--push` to local validation commands unless you intend to publish
to a registry and have verified the target tag.

## Making changes

Keep changes scoped to one image unless a shared workflow change requires
otherwise. When updating an image:

1. Verify base-image and downloaded dependency versions against the
   authoritative upstream release and migration notes.
2. Update the Dockerfile and any files copied from its build context together.
3. Build every platform listed for that image in the workflow, or clearly
   record why a platform could not be tested.
4. Exercise the container's entrypoint, version command, or health check where
   practical.
5. Run `git diff --check` and review the final diff for credentials, mutable
   downloads, unintended files, and publishing changes.

There is no repository-wide test suite. A successful local image build and a
focused runtime smoke test are the primary validation. GitHub Actions owns
publishing; Docker Hub credentials are supplied through the `DH_USER` and
`DH_TOKEN` repository secrets and must never be committed.

See [`AGENTS.md`](AGENTS.md) for repository-specific guidance for coding
agents and automated contributors.
