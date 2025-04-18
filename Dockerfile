FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@master \
    --with github.com/caddyserver/certmagic@master
   
FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
