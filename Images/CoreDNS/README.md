# CoreDNS

Custom [CoreDNS 1.14.4](https://github.com/coredns/coredns/releases/tag/v1.14.4) build with the repository's [`plugin.cfg`](plugin.cfg). The configuration includes the external [fanout](https://github.com/networkservicemesh/fanout), [alias](https://github.com/serverwentdown/alias), [warnlist](https://github.com/giantswarm/coredns-warnlist-plugin), [dnsredir](https://github.com/leiless/dnsredir), and [kubernetai](https://github.com/coredns/kubernetai) plugins.

The active daily workflow builds this context for `linux/amd64` and `linux/arm64` and publishes `kristianfjones/coredns-docker:core0`. The build pins the Go base image by multi-platform digest, verifies the CoreDNS release tag against its full commit, and resolves each external plugin at a full commit. These values are exposed as build arguments in the Dockerfile so an upgrade remains an explicit, reviewable change.

The scratch runtime contains only the statically linked CoreDNS binary and the CA certificate bundle. It has no shell or package manager. Supply a Corefile and any required data files; CoreDNS listens on DNS port 53 unless the configuration overrides it:

```sh
docker run --rm -p 53:53/tcp -p 53:53/udp \
  -v "$PWD/Corefile:/Corefile:ro" \
  kristianfjones/coredns-docker:core0 -conf /Corefile
```

Build the native platform locally and confirm the embedded version:

```sh
docker build --pull -t core-docker/coredns:local Images/CoreDNS
docker run --rm core-docker/coredns:local -version
```

Use Buildx to match CI's published platforms:

```sh
docker buildx build --pull \
  --platform linux/amd64,linux/arm64 \
  -t core-docker/coredns:local Images/CoreDNS
```
