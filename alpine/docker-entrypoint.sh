#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
	set -- java "${JAVA_OPTS}" -cp /var/wiremock/lib/*:/var/wiremock/extensions/* com.github.tomakehurst.wiremock.standalone.WireMockServerRunner "$@"
fi

exec "$@"
