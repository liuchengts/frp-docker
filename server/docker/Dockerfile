FROM registry.cn-hangzhou.aliyuncs.com/lcts/frp-server:latest
COPY frp /usr/local/frps
ENTRYPOINT [ "/usr/local/frps/frps","-c","/usr/local/frps/frps.ini" ]