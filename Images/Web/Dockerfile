FROM caddy:2.4.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-auth-jwt@v1.2.7 \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/sillygod/cdp-cache \
    --with github.com/greenpau/caddy-trace

FROM caddy:2.4.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy