FROM n8nio/n8n:latest

USER root

# Installer ffmpeg, python, pip et virtualenv
RUN apk add --no-cache ffmpeg python3 py3-pip py3-virtualenv

# Créer un venv et installer streamlink dedans
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install streamlink

# Rendre le binaire accessible via symlink
RUN ln -s /opt/venv/bin/streamlink /usr/local/bin/streamlink

USER node
