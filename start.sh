#!/bin/bash

if [ -z "$APP" ]; then
    export APP=app.js
fi

if [ -z "$APP_NAME" ]; then
    export APP_NAME=app
fi

pm2 link $SECRET_ID $PUBLIC_ID $APP_NAME

cd /app
pm2 start $APP -i 0 --name $APP_NAME --no-daemon
