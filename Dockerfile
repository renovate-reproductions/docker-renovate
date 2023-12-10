# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.89.6

# Base image
#============
FROM ghcr.io/containerbase/base:9.30.0@sha256:e0cfc6f69790e6f1effeb4d83c7872d8752202088b47dde4848405c8710cc677 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.10.0

# renovate: datasource=npm
RUN install-tool corepack 0.23.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.100


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
