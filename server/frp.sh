#!/usr/bin/env bash
# !/bin/sh
set -m
VERSION=0.38.0
MODE=frps
DOCKER_NAME="frp-server"
WAR_PATH="docker/frp"
FRP_NAME="/etc/frp"
function cp_app() {
    docker cp ${WAR_PATH}/${MODE}.ini ${DOCKER_NAME}:${FRP_NAME}/${MODE}.ini
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
