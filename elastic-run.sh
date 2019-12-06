#!/bin/bash

source _elk-conf.sh

if [[ "$(docker images -q $ELASTIC_IMAGE 2> /dev/null)" == "" ]]; then
  docker pull $ELASTIC_IMAGE
fi

docker run --rm -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" $ELASTIC_IMAGE
