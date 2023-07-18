#!/bin/bash

docker tag portainer/portainer-ce:latest portainer/portainer-ce:backup
docker image rm portainer/portainer-ce:latest
if docker pull portainer/portainer-ce:latest; then
    docker stop portainer
    docker rm portainer
    bash ./run-portainer.sh
else
    echo "Error pulling new image"
    docker tag portainer/portainer-ce:backup portainer/portainer-ce:latest
fi

