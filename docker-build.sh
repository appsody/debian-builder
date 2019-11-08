#!/bin/bash
set -e
IMAGE_TAG=$TRAVIS_TAG
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t $DOCKER_ORG/debian-builder:$IMAGE_TAG .
docker push $DOCKER_ORG/debian-builder:$IMAGE_TAG
