#!/bin/bash

# remove the existing ssh keys.
rm ./id_rsa*

# copy the newly generate ssh key to host system.
docker cp devops_remote_host_1:/root/.ssh/id_rsa ./id_rsa
docker cp devops_remote_host_1:/root/.ssh/id_rsa.pub ./id_rsa.pub


# copy ssh private key to jenkins and give it permission
docker exec -ti devops_jenkins_1 mkdir /root/.ssh
docker cp ./id_rsa devops_jenkins_1:/root/.ssh/id_rsa
docker exec -ti devops_jenkins_1 chmod 400 /root/.ssh/id_rsa



