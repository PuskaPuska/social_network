#!/bin/bash

mvn clean package -Dmaven.test.skip=true -f ./pom.xml
#docker build -t ay-social .
#docker tag ay-social:latest /ay-social:v11


docker build -t ay-social-chat ./social-chat/
#docker tag ay-social-chat:latest a/ay-social-chat:v1
#
