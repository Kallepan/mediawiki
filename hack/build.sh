#!/bin/bash

export $(grep -v '^#' .env | xargs)

echo $DOCKER_REGISTRY_PASSWORD | docker login $DOCKER_REGISTRY_SERVER -u $DOCKER_REGISTRY_USERNAME --password-stdin

# build and push images
docker build -t $DOCKER_REGISTRY_SERVER/$DOCKER_REGISTRY_USERNAME/wiki:$WIKI_IMAGE_TAG ./build
docker push $DOCKER_REGISTRY_SERVER/$DOCKER_REGISTRY_USERNAME/wiki:$WIKI_IMAGE_TAG