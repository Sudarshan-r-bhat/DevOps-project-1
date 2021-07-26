#!/bin/bash


# docker image to pull and the tag is always latest for now
export IMAGE=$(sed -n '1p' /tmp/.auth)

# docker password
export PASS=$(sed -n '2p' /tmp/.auth)

# docker login
docker login -u sudarshanrbhat -p $PASS

# run the container using docker-compose.
docker-compose -f docker-compose-prod up -d






