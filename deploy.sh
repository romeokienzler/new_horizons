./kubeflow/deploy_kubeflow_pipelines.sh
cd elyra
./deploy_elyra.sh
cd ..
#TODO check if on KIND
./kind/enable_ingress_on_kind.sh
#TODO check if on KIND
./kind/configure_ingress.sh
