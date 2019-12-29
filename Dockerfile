FROM alpine:latest

RUN apk add --update --no-cache tini unbound ca-certificates openssl bash  \
  && unbound-anchor -a /etc/unbound/root.key ; true \
  && unbound-control-setup \
  && wget ftp://FTP.INTERNIC.NET/domain/named.cache -O /etc/unbound/root.hints \
  && apk del openssl \
  && rm -rf /var/cache/apk/* ;

COPY unbound.conf /etc/unbound/unbound.conf

ENTRYPOINT ["tini", "--", "/usr/sbin/unbound", "-d"]
