#!/bin/bash

echo "****************************************"
echo "*******BUILDING THE JAVA APPLICATION****"
echo "****************************************"

# For the below command to work you either need to have maven installed in you're host sys or simply use 
# docker image=maven:3.6.1-alpine and set the working dir to the place where you pom.xml is present.
# specify the folder where pom.xml is present.
mvn -f ../devops_java_app -B -DskipTests clean package  
