#!/bin/bash

ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:7.5.0
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:7.5.0
NETWORK=elastic-stack_elastic

mkdir -p ~/dev-data/elastic/data
mkdir -p ~/dev-data/elastic/logs
