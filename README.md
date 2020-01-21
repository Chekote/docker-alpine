A [Docker](https://www.docker.com) image for the [Alpine](https://alpinelinux.org/)
Linux Distribution.

# User ID control

## Initial process UID

To set the UID for the initial process, you should set a `LOCAL_USER_ID` environmental variable on the container. e.g:

    docker run -i -e LOCAL_USER_ID=1000 chekote/alpine sh

The entrypoint script will ensure that the specified user id has a home folder and a login shell.

# Distribution

Docker Hub : https://hub.docker.com/r/chekote/alpine/

