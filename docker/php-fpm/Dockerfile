# build
FROM alpine AS builder
COPY . /app
RUN cd /app \
    && rm -rf .git docker Dockerfile .env k8s-deploy.yaml deploy.sh


FROM ustc-edu-cn.mirror.aliyuncs.com/library/php:7.4-fpm-alpine
COPY --from=builder --chown=www-data:www-data /app /app
