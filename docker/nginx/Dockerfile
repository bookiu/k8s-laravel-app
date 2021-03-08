# build
FROM alpine AS builder
COPY . /app
RUN cd /app \
    && rm -rf .git docker Dockerfile .env k8s-deploy.yaml deploy.sh


FROM ustc-edu-cn.mirror.aliyuncs.com/library/nginx:alpine
COPY --from=builder --chown=nginx:nginx /app /app
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/
