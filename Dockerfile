FROM n8nio/n8n:latest

USER root

# Installer Python + pip + snscrape avec apk (Alpine)
RUN apk update && \
    apk add --no-cache \
        python3 \
        py3-pip \
        py3-setuptools \
        gcc \
        g++ \
        libffi-dev \
        openssl-dev \
        musl-dev \
        git && \
    pip3 install --upgrade pip && \
    pip3 install snscrape && \
    rm -rf /var/cache/apk/*

# Créer dossier (optionnel)
RUN mkdir -p /data/scripts

# (Décommente si tu ajoutes un dossier ./scripts localement)
# COPY ./scripts /data/scripts

USER node
