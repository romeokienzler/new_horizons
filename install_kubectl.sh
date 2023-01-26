#!/bin/bash
#wget https://dl.k8s.io/v1.21.0/kubernetes-client-linux-amd64.tar.gz
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /bin/
sudo chmod 755 /bin/kubectl
