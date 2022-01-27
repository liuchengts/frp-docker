FROM alpine:latest
ENV MODE=frpc
ENV INSTALL_ROOT=/etc
ENV INSTALL_DIRECTORY=${INSTALL_ROOT}/frp
ENV VERSION=0.38.0
ENV FRP_NAME=frp_${VERSION}_linux_amd64
ENV FRP_TAR_URL=https://github.com/fatedier/frp/releases/download/v${VERSION}/${FRP_NAME}.tar.gz
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update upgrade \
    && apk add bash bash-doc bash-completion \
    && wget -O /tmp/${FRP_NAME}.tar.gz ${FRP_TAR_URL} \
    && tar -zxvf /tmp/${FRP_NAME}.tar.gz -C ${INSTALL_ROOT} \
    && mv ${INSTALL_ROOT}/${FRP_NAME} ${INSTALL_DIRECTORY} \
    && rm -rf /tmp/${FRP_NAME}.tar.gz \
    && echo -e "#!/bin/bash \n cd ${INSTALL_DIRECTORY} \n ./${MODE} -c ${MODE}.ini" > ./entrypoint.sh \
    && chmod +x ./entrypoint.sh

COPY frp/${MODE}.ini ${INSTALL_DIRECTORY}
ENTRYPOINT ["./entrypoint.sh"]
