# Bootstraping Kubernetes with ArgoCD

This repository contains all the necessary files to bootstrap a Kubernetes cluster using ArgoCD and ArgoCD App of Apps pattern.

## Prerequisites

- Github repository (to host the code)
- Gitlab repository (to host secrets)
- Helm installed locally
- kubectl installed locally

## Deployment Steps

1. Install Minikube

Follow the instructions on the [Minikube official documentation](https://minikube.sigs.k8s.io/docs/start/) to install Minikube on your local machine.

2. Start Minikube

```bash
minikube start --cpus 4 --memory 4096
```

3. Enable useful Minikube addons

```bash
minikube addons enable metrics-server
minikube addons enable ingress
```

4. Install ArgoCD

```bash
kubectl create namespace argocd
cd helm/argocd
helm install argocd .
```

5. Deploy ArgoCD App of Apps

```bash
kubectl apply -f argo-apps/appset.yaml
```
