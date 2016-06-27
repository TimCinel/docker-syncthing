#!/bin/sh
set -x

SYNCTHING_USER=${SYNCTHING_USER:-syncthing}
SYNCTHING_USER_ID=${SYNCTHING_USER_ID:-500}
SYNCTHING_GROUP=${SYNCTHING_GROUP:-syncthing}
SYNCTHING_GROUP_ID=${SYNCTHING_GROUP_ID:-500}

delgroup ${SYNCTHING_GROUP} || true
delgroup ${SYNCTHING_GROUP_ID} || true
addgroup ${SYNCTHING_GROUP} -g  ${SYNCTHING_GROUP_ID}

deluser ${SYNCTHING_USER} || true
deluser ${SYNCTHING_USER_ID} || true
adduser -D "${SYNCTHING_USER}" -u "${SYNCTHING_USER_ID}" -G "${SYNCTHING_GROUP}"

mkdir -p /home/${SYNCTHING_USER}/.config/syncthing /mnt
chown -R ${SYNCTHING_USER}:${SYNCTHING_GROUP} /usr/local/bin /home/${SYNCTHING_USER}/.config/syncthing /mnt

sleep 1
echo $#
echo $*
HOME=/home/${SYNCTHING_USER} USER=${SYNCTHING_USER} su-exec ${SYNCTHING_USER} "$@"
