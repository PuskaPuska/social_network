#!/bin/bash

docker run --name ay-social \
    -d --rm -p 8888:8888 \
    diplom/ay-social
   --env-file=env-var.properties \
