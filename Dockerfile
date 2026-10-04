ARG BASE_IMAGE=ubuntu
ARG BASE_IMAGE_VERSION=22.04
FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}
LABEL maintainer="Sasha Gerrand <github+docker-glibc-builder@sgerrand.com>"
ENV DEBIAN_FRONTEND=noninteractive \
    GLIBC_VERSION=2.39 \
    PREFIX_DIR=/usr/glibc-compat
RUN apt-get -q update \
	&& apt-get -qy install \
		bison \
		build-essential \
		gawk \
		gettext \
		openssl \
		python3 \
		texinfo \
		wget
COPY configparams /glibc-build/configparams
COPY builder /builder
ENTRYPOINT ["/builder"]
