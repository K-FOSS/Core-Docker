# Core Docker images

Core Docker is K-FOSS's collection of purpose-built container images for
infrastructure, networking, observability, and MCP workloads. Each image has an
independent build context under [`Images/`](Images/); this repository is not a
single application or a Docker Compose stack.

Images on the default branch are built by GitHub Actions or the equivalent
Forgejo Actions workflows and published to Docker Hub and the Forgejo
container registry. The Forgejo workflows
are in [`.forgejo/workflows/`](.forgejo/workflows/) and target a runner with
the `docker` label, using the YXL runner's Docker endpoint. Some directories
are retained as experiments or historical build contexts and are not currently
published by CI.

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

### Forgejo runner prerequisites

Enable Actions for the repository, register an online runner with the `docker`
label, and configure its job container to provide a Docker-compatible endpoint
at `tcp://127.0.0.1:2376` with `/certs/client` mounted. Add the `DH_USER` and
`DH_TOKEN` repository secrets for Docker Hub publishing. Add
`FORGEJO_REGISTRY_PASSWORD` and, optionally, `FORGEJO_REGISTRY_USERNAME` for
Forgejo registry publishing; the username defaults to the Forgejo repository
owner. Forgejo images use the
`<forgejo-host>/<owner>/<repository>/<image>:<tag>` naming convention. The
workflows install their Docker client and JavaScript-action dependencies in the Ubuntu 24.04 job
container; the runner must also support privileged containers and ARM64 QEMU.

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
`DH_TOKEN` repository secrets and must never be committed. After all active
images in the daily workflow build successfully, the Kea and NetBox image
READMEs are also published as their Docker Hub repository descriptions.
Because Docker Hub descriptions belong to repositories rather than tags,
`Images/Kea/README.md` describes the shared `kristianfjones/kea` repository,
and the separately built `vps1-admin` tag cannot publish an independent
`Images/KeaAdmin/README.md` overview.

## Shared Dev Spaces container storage

This repository's [devfile](.devfile.yaml) uses
[Kubedock](https://docs.redhat.com/en/documentation/red_hat_openshift_dev_spaces/3.29/html/user_guide/assembly_using-fuse-overlayfs_user_guide)
for Docker-compatible `run` operations. Kubedock asks the OpenShift cluster
runtime to pull images, so its node image cache is not stored in a workspace
volume.

For local rootless Podman/Buildah pulls and builds, a Dev Spaces administrator
can apply [`devspaces/container-images-pvc.yaml`](devspaces/container-images-pvc.yaml)
in a user's Dev Spaces project before starting a workspace. Dev Spaces mounts
the claim at Podman's rootless image-store path in every workspace in that
project. The claim requires a storage class that supports `ReadWriteMany`.

```sh
oc apply -f devspaces/container-images-pvc.yaml -n <devspaces-user-project>
```

The container storage database is not designed for concurrent writers. Stop
other workspaces that use Podman or Buildah before modifying the shared store;
concurrently running workspaces may use it read-only. For safe concurrent
builds across users or projects, use a registry or a BuildKit registry cache
instead of sharing this filesystem. The PVC is deliberately not part of the
devfile lifecycle, so deleting this workspace does not delete the shared image
store.

See [`AGENTS.md`](AGENTS.md) for repository-specific guidance for coding
agents and automated contributors.
