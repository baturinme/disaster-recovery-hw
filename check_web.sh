#!/bin/bash

PORT=80
FILE="/var/www/html/index.html"

if ! nc -z 127.0.0.1 $PORT; then
    exit 1
fi

if [ ! -f "$FILE" ]; then
    exit 1
fi

exit 0