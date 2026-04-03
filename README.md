# NullClaw Custom Image 🦊

Image Docker custom basée sur l'image officielle `ghcr.io/nullclaw/nullclaw:latest` avec des outils DevOps/K8s supplémentaires.

## Outils inclus

| Outil | Usage |
|-------|-------|
| `git` | Cloner/manipuler les repos GitOps |
| `kubectl` | Interagir avec le cluster K3s |
| `jq` / `yq` | Parsing JSON/YAML |
| `curl` / `wget` | Requêtes HTTP |

## Usage

### Local test
```bash
docker build -t nullclaw-custom:latest .
docker run --rm -it nullclaw-custom:latest help
```

## CI/CD
- **Build automatique** : à chaque push sur `main`
- **Multi-arch** : `linux/amd64` + `linux/arm64`

## Renovate

Configuration dans `renovate.json` :
- Auto-merge des patchs de l'image de base
- Review requise pour minor/major
