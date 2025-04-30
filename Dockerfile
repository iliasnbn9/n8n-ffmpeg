FROM n8nio/n8n:latest

# Install ffmpeg (déjà prévu dans ton repo)
USER root

RUN apt-get update && \
    apt-get install -y ffmpeg \
                       python3 \
                       python3-pip \
                       git \
                       curl \
                       ca-certificates \
                       gcc \
                       libpq-dev \
                       libffi-dev \
                       libssl-dev \
                       build-essential && \
    pip3 install --upgrade pip && \
    pip3 install snscrape && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crée un dossier pour tes scripts python
RUN mkdir -p /data/scripts
COPY ./scripts /data/scripts

# Redonne l'utilisateur n8n pour la suite
USER node
