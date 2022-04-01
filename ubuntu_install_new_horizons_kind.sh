./ubuntu_install_docker.sh
service docker start
./install_kubectl.sh
./install_kustomize.sh
./kind/install_kind.sh
cd kind
./create_kind_cluster.sh
./enable_ingress_on_kind.sh
cd ..
kubectl cluster-info --context kind-kind
./kubeflow/install_kubeflow.sh
