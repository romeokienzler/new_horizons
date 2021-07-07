#!/bin/bash
kubectl apply -f ingress_vhost.yaml
kubectl apply -f ingress-kfp.yaml -n kubeflow
