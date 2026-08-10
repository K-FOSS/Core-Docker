FROM golang:1.26.3-bookworm@sha256:386d475a660466863d9f8c766fec64d7fdad3edac2c6a05020c09534d71edb4b AS builder

ARG TARGETOS
ARG TARGETARCH
ARG COREDNS_VERSION=1.14.4
ARG COREDNS_COMMIT=232d7cac38fbb8baeb900150d683e61da288ae75
ARG FANOUT_COMMIT=e635d0cda3c4411abc0a1e1ca2bb38a3af04be44
ARG ALIAS_COMMIT=bf1b867dd4e52fc9571f930640789fb76c0ced11
ARG WARNLIST_COMMIT=b3e28c8f2d3688f296513916cca0adc652f483c5
ARG DNSREDIR_COMMIT=6163d6e46cb74038adb404467d1d586aa871d673
ARG KUBERNETAI_COMMIT=63042672f1231c8da753917908097b1ddb71156f

WORKDIR /src/github.com/coredns

RUN git init \
    && git remote add origin https://github.com/coredns/coredns.git \
    && git fetch --depth 1 origin "refs/tags/v${COREDNS_VERSION}" \
    && test "$(git rev-parse FETCH_HEAD)" = "${COREDNS_COMMIT}" \
    && git checkout --detach FETCH_HEAD

COPY plugin.cfg plugin.cfg

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go generate coredns.go \
    && go get \
        "github.com/networkservicemesh/fanout@${FANOUT_COMMIT}" \
        "github.com/serverwentdown/alias@${ALIAS_COMMIT}" \
        "github.com/giantswarm/coredns-warnlist-plugin@${WARNLIST_COMMIT}" \
        "github.com/leiless/dnsredir@${DNSREDIR_COMMIT}" \
        "github.com/coredns/kubernetai@${KUBERNETAI_COMMIT}" \
    && CGO_ENABLED=0 GOOS="${TARGETOS}" GOARCH="${TARGETARCH}" \
        go build -buildvcs=false -trimpath -tags=grpcnotrace \
        -ldflags="-s -w -X github.com/coredns/coredns/coremain.GitCommit=${COREDNS_COMMIT}" \
        -o /out/coredns .

FROM scratch

COPY --from=builder /out/coredns /coredns
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/coredns"]
