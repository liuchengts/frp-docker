#!/usr/bin/env bash
# !/bin/sh
set -m
DOCKER_NAME="frp-client"
WAR_PATH="docker/frp"
function cp_app() {
    docker cp ${WAR_PATH}/frpc.ini ${DOCKER_NAME}:/usr/local/frpc/frpc.ini
}
function restart_app() {
    docker restart ${DOCKER_NAME}
}
function start_app() {
    docker start ${DOCKER_NAME}
}
function stop_app() {
    docker stop ${DOCKER_NAME}
}

case $1 in
start)
       cp_app
       start_app
	;;
 restart)
       cp_app
       restart_app
	;;
 stop)
       stop_app
	;;
*)
       echo "Usage: $0 {start |restart |stop}" >&2
esac
