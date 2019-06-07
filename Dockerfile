FROM jsimonetti/alpine-edge

RUN	apk add --no-cache unbound && \
	sed -i -e '/verbosity: 1/a     interface: 0.0.0.0' /etc/unbound/unbound.conf

CMD	[ "unbound", "-d" ]

