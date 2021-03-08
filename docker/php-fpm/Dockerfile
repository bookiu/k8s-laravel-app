# build
FROM ustc-edu-cn.mirror.aliyuncs.com/library/composer AS builder
COPY . /app
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && composer install
RUN mkdir /app-dist \
    && tar --exclude='.git' --exclude='docker' --exclude='Dockerfile' --exclude='.env' --exclude="k8s-deploy.yaml" -zcf /app-dist/app.tgz /app


FROM ustc-edu-cn.mirror.aliyuncs.com/library/php:7.4-fpm-alpine
COPY --from=builder /app-dist /app-dist
# entrypoint
COPY ./docker/php-fpm/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
