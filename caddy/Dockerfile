#
# Builder
#
FROM ineva/alpine:3.10.3 as builder

ARG version="2.4.1"

RUN apk add wget tar
WORKDIR /srv
RUN wget https://github.com/caddyserver/caddy/releases/download/v${version}/caddy_${version}_linux_amd64.tar.gz && tar -xf caddy_${version}_linux_amd64.tar.gz

#
# Final stage
#
FROM ineva/alpine:3.10.3

COPY --from=builder /srv/caddy /usr/bin/caddy
COPY Caddyfile /srv/Caddyfile
RUN chmod +x /usr/bin/caddy

# validate install
RUN /usr/bin/caddy version

EXPOSE 80 443 2015
# configs
VOLUME /root/.config/caddy
# certs cache
VOLUME /root/.local/share/caddy

WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["run", "--config", "/srv/Caddyfile"]
