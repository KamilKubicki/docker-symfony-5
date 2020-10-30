#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

if [ "$1" = 'yarn' ]; then
    # Specifies that nc should only scan for listening daemons
    # without sending any data to them.
    until nc -z ${PHP_HOST} ${PHP_PORT}; do
        echo "*** PHP connection attempt ***"
        sleep 3
    done
fi

exec "$@"