# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.19.0

# Base image
#============
FROM ghcr.io/containerbase/base:7.1.0@sha256:aef365da10b4b1fd7fb95e9ef6b549074620089ec5fe9e7627b973739f48a815 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.15.0

# renovate: datasource=npm
RUN install-tool corepack 0.17.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.202


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
