# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.17.1

# Base image
#============
FROM ghcr.io/containerbase/base:9.20.13@sha256:9d5c018646811190c6eae482ac7d8be90f3817378903f57b3fe6d9616e7fe8f4 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.18.1

# renovate: datasource=npm
RUN install-tool corepack 0.21.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.402


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
