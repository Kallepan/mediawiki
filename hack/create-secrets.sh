#!/bin/bash

export $(grep -v '^#' .env | xargs)

kubectl create ns $NAMESPACE \
    --kubeconfig $KUBECONFIG

# delete and create db secret
kubectl delete secret db-secret \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG
kubectl create secret generic db-secret \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG \
    --from-env-file=.db.env

# delete and create app secret
kubectl delete secret app-secret \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG
kubectl create secret generic app-secret \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG \
    --from-env-file=.app.env

# delete and create localsettings configmap
kubectl delete configmap localsettings-configmap \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG
kubectl create configmap localsettings-configmap \
    -n $NAMESPACE \
    --kubeconfig $KUBECONFIG \
    --from-file=config/LocalSettings.php

# registry
kubectl delete secret regcred -n $NAMESPACE --kubeconfig=$KUBECONFIG
kubectl create secret docker-registry -n $NAMESPACE \
    regcred \
    --docker-server=$DOCKER_REGISTRY_SERVER_PULL_IMAGES \
    --docker-username=$DOCKER_REGISTRY_USERNAME \
    --docker-password=$DOCKER_REGISTRY_PASSWORD \
    --kubeconfig=$KUBECONFIG