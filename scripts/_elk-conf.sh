#!/bin/bash

ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:7.16.1
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:7.16.1
NETWORK=elastic-stack_elastic

mkdir -p ~/dev-data/elastic/data
mkdir -p ~/dev-data/elastic/logs
