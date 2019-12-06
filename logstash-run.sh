#!/bin/bash

source _elk-conf.sh

if [[ "$(docker images -q $LOGSTASH_IMAGE 2> /dev/null)" == "" ]]; then
  docker pull $LOGSTASH_IMAGE
fi

this_script=$(realpath $0)
basedir=$(dirname $this_script)
docker run --rm -it -v $basedir/logstash/config/:/usr/share/logstash/config/ $LOGSTASH_IMAGE

