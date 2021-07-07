#!/bin/bash
wget https://dl.k8s.io/v1.21.0/kubernetes-client-linux-amd64.tar.gz
tar xvfz kubernetes-client-linux-amd64.tar.gz
chmod 755 kubernetes/client/bin/kubectl
mv kubernetes/client/bin/kubectl /bin/
rm -Rf kubernetes
rm kubernetes-client-linux-amd64.tar.gz
