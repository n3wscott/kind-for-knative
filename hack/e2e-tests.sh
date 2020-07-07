#!/usr/bin/env bash

set -o errexit

pwd

readonly reg_port='5000'

export KO_DOCKER_REPO=localhost:${reg_port}

#
# local test_options=""
# local go_options=""
# [[ ! " $@" == *" -tags="* ]] && go_options="-tags=e2e"
# report_go_test -v -race -count=1 ${go_options} $@ ${test_options}
#
# go_test_e2e -timeout=30m -parallel=12 ./test/e2e ./test/conformance -brokerclass=MTChannelBasedBroker -channels=messaging.knative.dev/v1beta1:Channel,messaging.knative.dev/v1beta1:InMemoryChannel,messaging.knative.dev/v1:Channel,messaging.knative.dev/v1:InMemoryChannel -sources=sources.knative.dev/v1alpha2:ApiServerSource,sources.knative.dev/v1alpha2:ContainerSource,sources.knative.dev/v1alpha2:PingSource || fail_test


./test/upload-test-images.sh

go test -v -tags=e2e -count=1 ./test/e2e