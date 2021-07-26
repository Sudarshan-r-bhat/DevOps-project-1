#!/bin/bash

# write the auth details to a file.
echo sudarshanrbhat/pipeline_java_app > .auth
echo $PASS >> .auth


# transfer the above file to production server.
# syntax: scp -i <privatekey> <file-path> user@host:<remote-file-path>

scp -i ./id_rsa .auth prod_user@pipeline_prod_host_1:/tmp/.auth
scp -i ./id_rsa prod_deploy.sh prod_user@pipeline_prod_host_1:/tmp/prod_deploy.sh



