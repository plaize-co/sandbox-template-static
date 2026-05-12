FROM caddy:2.8-alpine

COPY public/ /srv/public/
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 8080
