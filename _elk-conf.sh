#!/bin/bash

ELASTIC_VERSION=7.5.0
ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:$ELASTIC_VERSION
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:$ELASTIC_VERSION
LOGSTASH_IMAGE=docker.elastic.co/logstash/logstash:$ELASTIC_VERSION
NETWORK=elastic

DATA_BASE_DIR=/mnt/c/Dev/data
mkdir -p $DATA_BASE_DIR
