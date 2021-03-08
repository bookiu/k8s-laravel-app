FROM alpine AS builder
COPY . /app
RUN mkdir /app-dist \
    && tar --exclude='.git' --exclude='docker' --exclude='Dockerfile' --exclude='.env' -zcf /app-dist/app.tgz /app


FROM php:7.4
COPY --from=builder /app-dist .

