# frp-docker
docker环境部署frp

# 当前frp版本 0.38.0

# 说明
- 这是基于`alpine`和`frp`发布的最新版本源码构建的，可以自行更改参数重新构建

- 构建因为网络问题失败的解决办法
  - 开启科学上网重新构建
  - 使用现成的版本
    - frp-server: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-server:frp_0.38.0` 
    - frp-client: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-client:frp_0.38.0`
    
# 使用
- `frp`目录下为相应的配置文件，自行更改即可。具体配置请参照`frp`官方文档
- `frp.sh`会同步配置文件进容器，并重新启动
- 只需要在`docker-compose.yml`文件中对应配置端口即可使用。或者直接使用`docker run`命令，具体使用请参照`docker`官方文档

# 更改frp版本的方法
- 更改`Dockerfile`中的`VERSION`，对应[frp releases](https://github.com/fatedier/frp/releases)
- 更改`frp.sh`中的`VERSION`，对应[frp releases](https://github.com/fatedier/frp/releases)