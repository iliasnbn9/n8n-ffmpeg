FROM n8nio/n8n:latest

USER root

# Installer ffmpeg et pip
RUN apk add --no-cache ffmpeg py3-pip

# Installer streamlink via pip
RUN pip install streamlink

USER node
