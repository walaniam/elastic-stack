#!/bin/bash

source _elk-conf.sh

container_id=$(docker ps -a |grep "$KIBANA_IMAGE" |awk '{print $1}')
docker stop $container_id
