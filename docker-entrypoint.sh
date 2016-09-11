#!/bin/sh
set -ex

source /setuidgid.inc

mkdir -p /home/${DOCKER_USER}/.config/syncthing
chown -R ${DOCKER_USER}:${DOCKER_GROUP} /usr/local/bin /home/${DOCKER_USER}/.config/syncthing

sleep 1
echo hello

HOME=/home/${DOCKER_USER} USER=${DOCKER_USER} su-exec ${DOCKER_USER} "$@"
