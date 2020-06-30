WireMock Docker
===============

Docker images for easily running standalone [WireMock](http://wiremock.org/), supporting both JRE8 and JRE11 runtimes.

The image exposes port `8080` and `8443` – to enable HTTPS, you need the WireMock `--https-port`
[command line option](http://wiremock.org/docs/running-standalone/).

WireMock mapping files go in `/home/wiremock`, which is exposed as a volume.

The JRE8 version is useful if you're in a conservative organisation, whereas the JRE11 is useful if you have more
up-to-date codebases – especially if you need to use WireMock [extensions](http://wiremock.org/docs/extending-wiremock/)
as part of your projects, and cannot or do not want to build those specifically for JRE8.

NOTES
=====
The images are based on [AdoptOpenJDK](https://hub.docker.com/_/adoptopenjdk), since they have Alpine versions of both
JRE8 and JRE11. [OpenJDK](https://hub.docker.com/_/openjdk) has an Alpine version for JRE8 (which is smaller than
AdoptOpenJDK!), but none for JRE11.

The WireMock artifact used is `wiremock-jre8-standalone`, quoting WireMock
[Download and Installation](http://wiremock.org/docs/download-and-installation/):
> The Java 8+ build endeavours to track the latest version of all its major dependencies. This is usually the version
> you should choose by default.

TODO
====
* Add 'getting started' and perhaps samples – using as base container vs mount points.
* See if it's possible to shrink JRE11 image with `jlink`. Might not be viable on Alpine, and could limit what's
    possible to do with extensions.
