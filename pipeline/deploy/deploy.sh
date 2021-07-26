#!/bin/bash

# write the auth details to a file.
echo sudarshanrbhat/build_java_app > .auth
echo $PASS >> .auth


# transfer the above file to production server.
# syntax: scp -i <privatekey> <file-path> user@host:<remote-file-path>
# TODO: THE PROD-HOST-NAME WILL CHANGE DEPENDING ON THE DOCKER-COMPOSE FILE || SO CHANGE THIS ACCORDINGLY ||

scp -i ../../ssh-keys/id_rsa .auth prod_user@pipeline_prod_host_1:/tmp/.auth
scp -i ../../ssh-keys/id_rsa ./prod_env/deploy-prod.sh prod_user@pipeline_prod_host_1:/tmp/prod_deploy.sh



