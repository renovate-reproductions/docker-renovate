# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.43.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.23.10@sha256:500fe665605b6bcad30014bff345c56c6bdb1c148ae79d4ac56f84a9c046edfd AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.18.2

# renovate: datasource=npm
RUN install-tool corepack 0.22.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.403


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
