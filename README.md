# A docker image for PM2 and Keymetrics

This is a very simple docker image with pm2, the process manager, and keymetrics, the monitoring solution, installed.

The image will use `/app` folder as the place for the source code and the working directory, so you should provide your app as a volume, i.e;

```
-v /path/to/app/source:/app
```

Also, the executable (app entry js file) should be noted as the environment variable `APP`. The default value for `APP` variable is `app.js`. If you want, you can also supply a name for your application via the `APP_NAME` environment variable. The default value for `APP_NAME` variable is `app`.

The container exposes 80 and 443 ports so you can bind to them.

So a complete command for running a node.js application with pm2 and keymetrics would be;

```
docker run -dt \
    -e "APP=app.js" \
    -e "APP_NAME=MyApplication" \
    -e "SECRET_ID=YOUR_SECRET_ID_FROM_KEYMETRICS" \
    -e "PUBLIC_ID=YOUR_PUBLIC_ID_FROM_KEYMETRICS" \
    -v /path/to/app/source:/app \
    dashersw/docker-node-pm2-keymetrics
```
