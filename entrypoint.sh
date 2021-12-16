#!/usr/bin/env sh

# Based on: Deni Bertović https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

# Use the LOCAL_USER_ID that was passed in, or fallback to 9001
USER_ID=${LOCAL_USER_ID:-9001}

# Get the username that is associated with the user id (if any)
USER_NAME=`getent passwd | awk -F: '$3 == '${USER_ID}' { print $1 }'`

# Does the user already exist?
if [ "$USER_NAME" == "" ]; then
  # No, we need to create it.
  USER_NAME=user

  # Don't create the home folder if already exists.
  if [ -d "/home/user" ]; then
    ARGS='-H'
  fi

  # Create the user.
  adduser -D -s /bin/sh -u ${USER_ID} ${ARGS} user
  export HOME=/home/${USER_NAME}

  # Ensure home is owned by user (Docker may have created it as root when mounting volumes)
  chown ${USER_NAME} $HOME
fi

# Execute the command
su-exec ${USER_NAME} "$@"
