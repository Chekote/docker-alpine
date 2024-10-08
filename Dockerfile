# chekote/alpine:latest
# chekote/alpine:$OS_VERSION
# chekote/alpine:$OS_VERSION-$(date +%Y-%m-%d-%H-%M-%S)
FROM alpine:latest

# install su-exec
RUN set -eux; \
    #
    # Update all packages
    apk update; \
    apk upgrade; \
	#
	# Install entrypoint dependencies
	apk add su-exec; \
    #
    # Install useful common tools
    apk add coreutils; \
	#
    # verify that the binary works
	su-exec nobody true;

WORKDIR /workdir

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
