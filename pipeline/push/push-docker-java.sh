#!/bin/bash

IMAGE="build_java_app"

# DOCKER LOGIN, $PASS IS SET IN JENKINSFILE.
docker login  -u sudarshanrbhat -p $PASS

# TAG THE IMAGE APPROPRIATELY
docker tag $IMAGE:latest sudarshanrbhat/$IMAGE:latest

# PUSH THE  IMAGE TO REPOSITORY, ENSURE THE REPOSITORY EXISTS IN DOCKER HUB
docker push sudarshanrbhat/$IMAGE:latest
