#!/bin/bash

source _elk-conf.sh

if [[ "$(docker images -q $ELASTIC_IMAGE 2> /dev/null)" == "" ]]; then
  docker pull $ELASTIC_IMAGE
fi

if [[ "$(docker network ls |grep $NETWORK 2> /dev/null)" == "" ]]; then
  docker network create --driver bridge $NETWORK || true
fi

docker run --rm -d -p 9200:9200 -p 9300:9300 --network=$NETWORK --name elasticsearch -e "discovery.type=single-node" $ELASTIC_IMAGE
