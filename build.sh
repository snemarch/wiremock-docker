#!/bin/sh
set -e

build() {
	JRE=${1}
	WIREMOCK=${2}

	docker build --build-arg BASE_IMAGE="adoptopenjdk/openjdk${JRE}:alpine-jre" \
				--build-arg WIREMOCK_VERSION="${WIREMOCK}" --tag "snemarch/wiremock-docker:${WIREMOCK}-jre${JRE}" \
				--tag "snemarch/wiremock-docker:latest-jre${JRE}" ./alpine
}

build "8" "2.26.3"
build "11" "2.26.3"
