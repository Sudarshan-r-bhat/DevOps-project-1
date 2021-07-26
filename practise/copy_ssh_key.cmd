@REM # remove the existing ssh keys.
del id_rsa*

@REM # copy the newly generate ssh key to host system.
docker cp devops_remote_host_1:/root/.ssh/id_rsa ./id_rsa
docker cp devops_remote_host_1:/root/.ssh/id_rsa.pub ./id_rsa.pub

@REM # copy ssh private key to jenkins and give it permission
docker exec -ti devops_jenkins_1 mkdir /root/.ssh
docker cp ./id_rsa devops_jenkins_1:/root/.ssh/id_rsa
docker exec -ti devops_jenkins_1 chmod 400 /root/.ssh/id_rsa

@REM # copy the same to prod server as well.
docker cp ./id_rsa devops_prod_docker_1:/root/.ssh/id_rsa
docker cp ./id_rsa.pub devops_prod_docker_1:/root/.ssh/authorized_keys

docker exec -ti devops_prod_docker_1 chmod 400 /root/.ssh/id_rsa
docker exec -ti devops_prod_docker_1 chmod 700 /root/.ssh/authorized_keys

@REM # install ssh server and PermitRootLogin
@REM # keep this until dockerfile is written for prod-docker.
docker exec -ti devops_prod_docker_1 apk add openssh


