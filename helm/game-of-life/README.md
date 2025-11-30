# Game of Life Helm Chart

Ce Helm chart déploie l'application Conway's Game of Life sur Kubernetes.

## Installation

```bash
helm install game-of-life ./helm/game-of-life
```

## Configuration

Les paramètres suivants peuvent être configurés dans `values.yaml` :

| Paramètre | Description | Défaut |
|-----------|-------------|--------|
| `replicaCount` | Nombre de réplicas | `2` |
| `image.repository` | Repository de l'image Docker | `game-of-life` |
| `image.tag` | Tag de l'image | `latest` |
| `service.type` | Type de service Kubernetes | `ClusterIP` |
| `service.port` | Port du service | `80` |
| `ingress.enabled` | Activer l'ingress | `true` |
| `ingress.hosts` | Hosts de l'ingress | `game-of-life.local` |
| `resources.limits.cpu` | Limite CPU | `100m` |
| `resources.limits.memory` | Limite mémoire | `128Mi` |

## Construire l'image Docker

Depuis le répertoire `game-of-life` :

```bash
docker build -t game-of-life:latest .
```

## Déploiement avec ArgoCD

Créer une application ArgoCD pointant vers ce chart pour un déploiement GitOps.
