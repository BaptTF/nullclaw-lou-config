# Image custom NullClaw avec outils DevOps/K8s
# Part de l'image officielle (Alpine-based) et ajoute les outils necessaires

FROM ghcr.io/nullclaw/nullclaw:latest

USER root

# Installation des outils systeme essentiels (Alpine apk)
RUN apk add --no-cache \
    git \
    curl \
    wget \
    jq \
    yq \
    bash \
    openssh-client \
    ca-certificates \
    gnupg \
    unzip \
    github-cli

# Installation de kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Change the home folder to /nullclaw-data
RUN sed -i 's|^nobody:.*|nobody:x:65534:65534:nobody:/nullclaw-data:/sbin/nologin|' /etc/passwd

# Retour a l'utilisateur non-root de l'image de base
USER 65534:65534