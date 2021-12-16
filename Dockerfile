# chekote/alpine
FROM alpine:latest

# install su-exec
RUN set -eux; \
	#
	apk add su-exec; \
	#
    # verify that the binary works
	su-exec nobody true;

WORKDIR /workdir

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
