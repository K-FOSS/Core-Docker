# CoreDNS

Custom [CoreDNS](https://coredns.io/) build with the repository's `plugin.cfg`, including external `fanout`, `alias`, `warnlist`, `dnsredir`, and `kubernetai` plugins. CI publishes `kristianfjones/coredns-docker:core0` for `linux/amd64` and `linux/arm64`.

The scratch runtime contains only the CoreDNS binary and CA certificates. Supply a Corefile and any required data files:

```sh
docker run --rm -p 53:53/udp -v "$PWD/Corefile:/Corefile:ro" kristianfjones/coredns-docker:core0 -conf /Corefile
```

The Dockerfile currently builds the default branch of CoreDNS and the plugin file uses upstream default branches, so rebuilds are not source-reproducible. Build locally with `docker build -t core-docker/coredns:local Images/CoreDNS`.
