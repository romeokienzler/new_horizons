#!/bin/bash
kubectl apply -k "github.com/kubeflow/katib.git/manifests/v1beta1/installs/katib-standalone?ref=master"
kubectl apply -f ./kf_user_ns.yaml
