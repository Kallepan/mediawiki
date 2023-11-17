#!/bin/bash

export $(grep -v '^#' .env | xargs)

# deploy
cd infrastructure
kubectl kustomize > ./manifests.yaml
kubectl apply -f ./manifests.yaml --kubeconfig $KUBECONFIG
