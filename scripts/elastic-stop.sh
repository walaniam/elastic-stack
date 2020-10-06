#!/bin/bash

source _elk-conf.sh

elastic_container_id=$(docker ps -a |grep "$ELASTIC_IMAGE" |awk '{print $1}')
docker stop $elastic_container_id
