#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ]; then
    # Composer install on service run
	if [ "$APP_ENV" != 'prod' ]; then
		composer install --prefer-dist --no-interaction --optimize-autoloader
	fi

    # Specifies that nc should only scan for listening daemons
    # without sending any data to them.
    until nc -z ${MYSQL_HOST} ${MYSQL_PORT}; do
        echo "*** Database connection attempt ***"
        sleep 3
    done
fi

exec docker-php-entrypoint "$@"