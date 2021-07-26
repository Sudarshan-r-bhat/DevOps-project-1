#!/bin/bash

IMAGE="pipeline_java_app"

# DOCKER LOGIN
docker login  -u sudarshanrbhat -p $PASS

# TAG THE IMAGE APPROPRIATELY
docker tag $IMAGE:latest sudarshanrbhat/$IMAGE:latest

# PUSH THE  IMAGE TO REPOSITORY
docker push sudarshanrbhat/$IMAGE:latest
