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
    unzip

# Installation de kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Verification des versions installees
RUN echo "=== Versions des outils ===" \
    && git --version \
    && kubectl version --client 2>/dev/null | head -1 \
    && yq --version \
    && jq --version

# Retour a l'utilisateur non-root de l'image de base
USER 65534:65534