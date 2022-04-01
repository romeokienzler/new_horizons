./ubuntu_install_docker.sh
service docker start
./install_kubectl.sh
./install_kustomize.sh
./kind/install_kind.sh
./kind/create_kind_cluster.sh
kubectl config current-context
./kubeflow/install_kubeflow.sh
