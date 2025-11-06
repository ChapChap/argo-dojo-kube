# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

## [1.0.1] - 2025-11-06

### Modifié

- Ajout d'une vérification de la présence de la CRD `monitoring.coreos.com/v1` dans le cluster avant la création du ServiceMonitor
- Le ServiceMonitor ne sera créé que si la CRD Prometheus Operator est disponible dans le cluster

## [1.0.0] - 2025-11-06

### Ajouté

- Version initiale du chart Guestbook
