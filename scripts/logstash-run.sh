#!/bin/bash

source _elk-conf.sh

#elastic_container_id=$(docker ps -a |grep "$ELASTIC_IMAGE" |awk '{print $1}')
elastic_container_id=$(docker ps --filter "name=elasticsearch" --format '{{.ID}}')

if [[ "$elastic_container_id" == "" ]]; then
  echo "Elastic container of name=elasticsearch is not running"
  exit 1
fi

if [[ "$(docker images -q "$LOGSTASH_IMAGE" 2> /dev/null)" == "" ]]; then
  docker pull "$LOGSTASH_IMAGE"
fi

this_script=$(realpath $0)
basedir=$(dirname $this_script)
parentdir=$(dirname $basedir)
docker run --rm -it --network=$NETWORK --name logstash \
	--link $elastic_container_id:elasticsearch \
	-v $parentdir/logstash/settings/:/usr/share/logstash/config/ \
	-v $parentdir/logstash/pipeline/:/usr/share/logstash/pipeline/ \
	-v ~/dev-data/stock/:/usr/share/walaniam/stock/data/ \
	$LOGSTASH_IMAGE

