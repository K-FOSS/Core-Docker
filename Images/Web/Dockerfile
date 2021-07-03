FROM caddy:2.4.3-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/abiosoft/caddy-json-schema \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-portal@v1.14.6 \
    --with github.com/greenpau/caddy-auth-jwt@v1.3.13 \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/sillygod/cdp-cache \
    --with github.com/greenpau/caddy-trace

FROM caddy:2.4.3-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy