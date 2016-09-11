DOCKER_USER=${DOCKER_USER:-user}
DOCKER_USER_ID=${DOCKER_USER_ID:-500}
DOCKER_GROUP=${DOCKER_GROUP:-user}
DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-500}

addgroup ${DOCKER_GROUP} -g  ${DOCKER_GROUP_ID} && echo "Added ${DOCKER_GROUP}:${DOCKER_GROUP_ID} group"
adduser -D "${DOCKER_USER}" -u "${DOCKER_USER_ID}" -G "${DOCKER_GROUP}" && echo "Added ${DOCKER_USER}:${DOCKER_USER_ID} user"