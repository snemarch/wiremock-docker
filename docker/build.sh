#!/bin/sh
set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 WireMock version" >&2
  echo "Will build and tag JRE8 and JRE11 images."
  exit 1
fi

build() {
	JRE=${1}
	WIREMOCK=${2}

	docker build --build-arg BASE_IMAGE="adoptopenjdk/openjdk${JRE}:alpine-jre" \
				--build-arg WIREMOCK_VERSION="${WIREMOCK}" --tag "snemarch/wiremock-docker:${WIREMOCK}-jre${JRE}" \
				$(dirname "${0}")
}

build "8" "${1}"
build "11" "${1}"
