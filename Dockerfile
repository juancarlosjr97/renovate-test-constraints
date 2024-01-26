FROM docker.io/library/python:3.12.1-alpine3.18@sha256:c76ed1927d11e3939dec0f9b69a6ba14621dc919a3b266c90cf12b38474c677d

# renovate: datasource=repology depName=alpine_3_18/openssl-dev versioning=loose
ENV OPENSSL_DEV_VERSION="3.1.4-r4"

# Add packages required for the GitLab templates
# followed by upgrading all packages to resolve container vulnerabilities
RUN apk update && \
    apk add --quiet --no-cache \
        cargo==1.71.1-r0 \
        curl==8.5.0-r0 \
        git==2.40.1-r0 \
        groff==1.22.4-r4 \
        less==633-r0 \
        jq==1.6-r4 \
        libffi-dev==3.4.4-r2 \
        openssl-dev=="${OPENSSL_DEV_VERSION}" \
        unzip==6.0-r14 \
        wget==1.21.4-r0
