FROM caddy:2.5.1-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/abiosoft/caddy-json-schema \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-portal@v1.4.33 \
    --with github.com/greenpau/caddy-authorize@v1.3.21 \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/sillygod/cdp-cache \
    --with github.com/greenpau/caddy-trace \
    --with github.com/mholt/caddy-l4 \
    --with github.com/pteich/caddy-tlsconsul@v1.3.7 \
    --with github.com/lindenlab/caddy-s3-proxy@v0.5.6 \
    --with github.com/n0trace/caddy-opentracing

FROM caddy:2.5.1-builder-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy