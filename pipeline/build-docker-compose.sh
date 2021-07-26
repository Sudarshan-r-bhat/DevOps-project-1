#!/bin/bash

echo "*********************************************************"
echo "*****Building the docker image and running it now********"
echo "*********************************************************"

docker-compose -f java-app-docker-compose build

