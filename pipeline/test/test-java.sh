#!/bin/bash

echo "**********************************************"
echo "*********Testing the Java Application*********"
echo "**********************************************"

# THIS WILL GENERATE SUREFIRE TEST REPORTS
mvn -f ../devops_java_app test

