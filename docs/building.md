Building, tagging and pushing
=============================

To perform a build, execute the `build.sh` script in the `docker` directory, giving the desired WireMock version as the
sole argument – e.g., from the repository root, run `./docker/build.sh 2.26.3`. The script builds and tags both JRE8
and JRE 11 versions, so the above invocation will result in the `2.26.3-jre8` and `2.26.3-jre11` images.

The project has been set up with (rudimentary) GitHub -> Docker Hub integration for building. It took some fiddling to
get the integration working – it took me a while to get Docker Hub picking up changes at all, and then 9 attempts to get
the build succeeding. Most of these seem obvious now, but lessons learnt:

1. If you use a regex in "Source" for a Tag build, the "Docker Tag" can refer to `{sourceref}` or `{\n}` – for `{\n}`
    to work, you must use a capture group in the Source regex.
1. Even if you use build hooks, there must be a `Dockerfile` in the "Build Context" directory specified.
1. The `hooks` directory must be a subdirectory of the "Build Context" directory, not the repository root.
1. The individual hook files must have the `execute` permission set.
1. Hooks will be run in the "Build Context" directory, not the repository root.

The build script should probably be modified to take the Docker repository as an argument, instead of having
`snemarch/wiremock-docker` hardcoded – the push hook uses the Docker Hub-supplied `${DOCKER_REPO}`.
