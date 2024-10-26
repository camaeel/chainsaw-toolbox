ARG VERSION=latest

FROM tofuutils/tenv:latest AS tenvinstall

FROM ghcr.io/kyverno/chainsaw:${VERSION}

USER root

RUN apk update && apk upgrade && \
    apk add curl jq yq

COPY --from=tenvinstall /usr/local/bin/tenv /usr/local/bin

USER nonroot

