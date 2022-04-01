#!/bin/bash
pushd .
cd /tmp
git clone https://github.com/kubeflow/manifests.git
cd manifests
while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done
popd
kubectl apply -n kubeflow -f rbac.yaml
