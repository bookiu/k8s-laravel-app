# build
FROM ustc-edu-cn.mirror.aliyuncs.com/library/composer AS builder
COPY . /app
RUN cd /app \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && composer install \
    && rm -rf .git docker Dockerfile .env k8s-deploy.yaml deploy.sh


FROM ustc-edu-cn.mirror.aliyuncs.com/library/php:7.4-fpm-alpine
COPY --from=builder --chown=www-data:www-data /app /app
