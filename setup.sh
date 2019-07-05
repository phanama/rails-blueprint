#!/usr/bin/env bash

minikube start
minikube addons enable ingress

kubectl apply -f deploy/

echo "Access your app through:"
minikube ip