#!/bin/bash

source _elk-conf.sh

elastic_container_id=$(docker ps -a |grep "$ELASTIC_IMAGE" |awk '{print $1}')

if [[ "$elastic_container_id" == "" ]]; then
  echo "Elastic container of image $ELASTIC_IMAGE is not running"
  exit 1
fi

if [[ "$(docker images -q $KIBANA_IMAGE 2> /dev/null)" == "" ]]; then
  docker pull $KIBANA_IMAGE
fi

docker run -d --rm --network=$NETWORK --name kibana --link $elastic_container_id:elasticsearch -p 5601:5601 $KIBANA_IMAGE

