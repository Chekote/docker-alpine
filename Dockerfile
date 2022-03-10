# chekote/alpine:latest
# us.gcr.io/chekote-56995/alpine:latest
FROM alpine:latest

# install su-exec
RUN set -eux; \
    #
    apk update; \
    apk upgrade; \
	#
	apk add su-exec; \
	#
    # verify that the binary works
	su-exec nobody true;

WORKDIR /workdir

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
