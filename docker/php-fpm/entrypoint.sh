#!/bin/sh

if [ ! -f /app/.deployed ]; then
    echo "Extracting app.tgz to app"
    mkdir /app
    tar --strip=1 -zxf /app-dist/app.tgz -C /app
    chown -R www-data:www-data /app
    touch /app/.deployed
    echo "Extract done"
fi

exec "$@"
