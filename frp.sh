#!/usr/bin/env bash
# !/bin/sh
set -m
MODE=$1
OPERATE=$2
DOCKER_NAME=""
FRP_ROOT="/etc/frp" # 对应 build.args.INSTALL_ROOT
FILE_NAME=""
function main() {
  modeHandle
  operateHandle
}

function modeHandle() {
    case $MODE in
       c)
            MODE="frpc"
            DOCKER_NAME="frp-client"
            FILE_NAME="docker-compose-client.yml"
        ;;
       s)
            MODE="frps"
            DOCKER_NAME="frp-server"
            FILE_NAME="docker-compose-server.yml"
        ;;
      *)
             echo "Usage: $0 {c |s}" >&2
      esac
}

function operateHandle() {
    case $OPERATE in
       build)
            build_app
        ;;
       create)
            create_app
        ;;
       start)
            start_app
        ;;
       stop)
            stop_app
        ;;
       restart)
            restart_app
        ;;
       *)
             echo "Usage: $0 {build |create |start |restart |stop}" >&2
      esac
}

function create_app() {
  sudo docker-compose -f ${FILE_NAME} up -d
}

function build_app() {
  sudo docker-compose -f ${FILE_NAME} build
}

function cp_app() {
  sudo docker cp ${MODE}.ini ${DOCKER_NAME}:${FRP_ROOT}/${MODE}.ini
}

function restart_app() {
  cp_app
  sudo docker restart ${DOCKER_NAME}
}

function start_app() {
  sudo docker start ${DOCKER_NAME}
}

function stop_app() {
  sudo docker stop ${DOCKER_NAME}
}

main
