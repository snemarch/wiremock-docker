ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG WIREMOCK_VERSION
ENV JAVA_OPTS="-Xmx128m"
LABEL maintainer="Sune Marcher <snemarch@gmail.com>"
VOLUME /home/wiremock
EXPOSE 8080 8443

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN : "${WIREMOCK_VERSION:?Build argument needs to be set and non-empty.}" \
	&& apk add --no-cache ca-certificates \
	&& update-ca-certificates

RUN mkdir -p /var/wiremock/lib /var/wiremock/extensions \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/${WIREMOCK_VERSION}/wiremock-jre8-standalone-${WIREMOCK_VERSION}.jar \
    -O /var/wiremock/lib/wiremock-standalone.jar

COPY docker-entrypoint.sh /

WORKDIR /home/wiremock
CMD java ${JAVA_OPTS} -cp /var/wiremock/lib/*:/var/wiremock/extensions/* com.github.tomakehurst.wiremock.standalone.WireMockServerRunner
