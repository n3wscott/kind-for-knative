#!/usr/bin/env bash

set -o errexit

readonly reg_port='5000'

export KO_DOCKER_REPO=localhost:${reg_port}

pwd

ko apply -Rf ./config/core
ko apply -f ./config/channels/in-memory-channel/
ko apply -f ./config/brokers/mt-channel-broker/
ko apply -f ./config/sugar

