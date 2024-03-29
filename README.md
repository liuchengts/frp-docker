# frp-docker

`docker` 环境部署 `frp`

# 一、当前 `frp` 版本 `0.51.3`（`frp` 最新版）
# 二、直接使用
- 服务端
```docker-compose-server.yml
version: '2'
services:
  frps :
    container_name: frp-server
    image: registry.cn-hangzhou.aliyuncs.com/lcts/frp-server:frp_0.51.3
    restart: always
    ports:
       - "7000-7500:7000-7500"
    environment:
       TZ : "Asia/Shanghai"
```
- 客户端
```docker-compose-client.yml
version: '2'
services:
  frpc :
    container_name: frp-client
    image: registry.cn-hangzhou.aliyuncs.com/lcts/frp-client:frp_0.51.3
    restart: always
    environment:
       TZ : "Asia/Shanghai"
```
- 管理脚本同样可以使用 `frp.sh`
# 三、自行构建

- 构建
    - `frp-server` : `sudo ./frp.sh s build`
    - `frp-client` : `sudo ./frp.sh c build`
- 创建
    - `frp-server` : `sudo ./frp.sh s create`
    - `frp-client` : `sudo ./frp.sh c create`
- 启动
    - `frp-server` : `sudo ./frp.sh s start`
    - `frp-client` : `sudo ./frp.sh c start`
- 停止
    - `frp-server` : `sudo ./frp.sh s stop`
    - `frp-client` : `sudo ./frp.sh c stop`
- 重启（会更新当前文件夹中的 `frpc.ini 或 frps.ini` 到容器）
    - `frp-server` : `sudo ./frp.sh s restart`
    - `frp-client` : `sudo ./frp.sh c restart`
- 参数说明
    - 第一个参数是模式,可选值为 `c、s`,表示客户端或服务端
    - 第二个参数是操作,可选值 `build、start、restart、stop`


# 四、已有版本

- `0.38.0`
    - `frp-server`: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-server:frp_0.38.0`
    - `frp-client`: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-client:frp_0.38.0`
- `0.51.3`
    - `frp-server`: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-server:frp_0.51.3`
    - `frp-client`: `docker pull registry.cn-hangzhou.aliyuncs.com/lcts/frp-client:frp_0.51.3`

# 五、说明

- 这是基于 `alpine` 和 `frp` 发布的最新版本源码构建的，可以自行更改参数重新构建，镜像只有`45M`
- 构建因为网络问题失败的解决办法
    - 开启科学上网重新构建
    - 使用现成的版本
- `frp.sh` 脚本运行失败的解决方案
    - `chmod +x frp.sh`
    - `sudo ./frp.sh`


- `frpc.ini\frps.ini` 为相应的配置文件，自行更改即可。具体配置请参照 `frp` [官方文档](https://github.com/fatedier/frp)
- `frp.sh` 会同步配置文件进容器，并重新启动
- 只需要在 `docker-compose.yml` 文件中对应配置端口即可使用。或者直接使用 `docker run` 命令，具体使用请参照 `docker` 官方文档

# 六、更改frp版本的方法

- 更改 `docker-compose-server.yml\docker-compose-client.yml` 中的 `VERSION`
  ，对应 [frp releases](https://github.com/fatedier/frp/releases)
