FROM alpine:latest
ENV MODE=frps
ENV INSTALL_DIRECTORY=/etc
ENV VERSION=0.38.0
ENV FRP_NAME=frp_${VERSION}_linux_amd64
ENV FRP_TAR_URL=https://github.com/fatedier/frp/releases/download/v${VERSION}/${FRP_NAME}.tar.gz
ENV SERVICE_BIN=${INSTALL_DIRECTORY}/${FRP_NAME}/${MODE}
ENV SERVICE_BIN_INI=${INSTALL_DIRECTORY}/${FRP_NAME}/${MODE}.ini

RUN apk update upgrade \
    && apk add bash bash-doc bash-completion openrc \
    && echo ${FRP_TAR_URL} \
    && wget -O /tmp/${FRP_NAME}.tar.gz ${FRP_TAR_URL} \
    && tar -zxvf /tmp/${FRP_NAME}.tar.gz \
    && mv ${FRP_NAME} ${INSTALL_DIRECTORY} \
    && rm -rf /tmp/frp.tar.gz ${FRP_NAME} \
    && rc-update add ${SERVICE_BIN}

COPY frp/${MODE}.ini ${SERVICE_BIN_INI}
ENTRYPOINT [ "rc-service","${SERVICE_BIN}","-c","${SERVICE_BIN_INI}" ]