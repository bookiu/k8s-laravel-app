# 如何使用

你可以直接运行`kubectl apply -f k8s-deploy.yaml`来部署应用，也可以编辑PHP代码后运行后面的步骤重新打包部署应用。

# 自定义构建

## 镜像构建

构建Nginx：

```bash
# 构建
docker build --rm -f ./docker/php-fpm/Dockerfile -t your/repository/k8s-laravel-app-nginx:tag .

# 推送
docker push your/repository/k8s-laravel-app-nginx:tag
```

构建PHP：

```bash
# 构建
docker build --rm -f ./docker/php-fpm/Dockerfile -t your/repository/k8s-laravel-app-phpfpm:tag .

# 推送
docker push your/repository/k8s-laravel-app-phpfpm:tag
```

## 部署到k8s

部署前，请先修改[k8s-deploy.yaml](https://github.com/yaxin-cn/k8s-laravel-app/blob/master/k8s-deploy.yaml)文件`Deployment`中的镜像地址，修改为你自己构建的地址即可。

然后运行下面的命令部署应用：

```bash
kubectl apply -f k8s-deploy.yaml
```
