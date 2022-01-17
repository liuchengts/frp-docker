FROM registry.cn-hangzhou.aliyuncs.com/lcts/frp-client:latest
COPY frp /usr/local/frpc
ENTRYPOINT [ "/usr/local/frpc/frpc","-c","/usr/local/frpc/frpc.ini" ]