#!/bin/bash

<<com
    This script has to be put under the custom-hooks folder inside the git repo.
    problem statement:
        read ref from gitlab ,
        then parse it to fetch the branch name.
        If the branch is master then, get the crumb from Jenkins server.
        next, using crumb trigger the Jenkins build Job.

com


if ! [ -t 0 ]; then
  read -a ref;
fi;

# -r : read spaces as well, -a read as array
IFS='/' read -ra REF <<< "${ref[2]}"
branch="${REF{2}}"

if [ "${branch}" == "master" ]; then

  crumb=$(curl -u "sudarshan:root" -s 'http://jenkins:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField, ":", //crumb)')
  curl -u "sudarshan:root" -H "$crumb" -X POST http://jenkins:8080/job/devops-pipeline-job/build?delay=0sec

  if [ $? -eq 0 ]; then
    echo "*** OK ****";
  else
    echo "*** Error ****";

fi;


