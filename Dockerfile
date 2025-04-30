FROM n8nio/n8n:latest

USER root

# Installer Python + venv + dépendances de build
RUN apk update && \
    apk add --no-cache \
        python3 \
        py3-pip \
        py3-setuptools \
        py3-virtualenv \
        gcc \
        g++ \
        libffi-dev \
        openssl-dev \
        musl-dev \
        git && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install snscrape && \
    rm -rf /var/cache/apk/*

# Créer un dossier pour scripts (optionnel)
RUN mkdir -p /data/scripts

ENV PATH="/opt/venv/bin:$PATH"

USER node
