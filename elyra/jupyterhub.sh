helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

helm upgrade --cleanup-on-fail \
  --install latest jupyterhub/jupyterhub \
  --namespace climate-and-sustainability \
  --create-namespace \
  --values jupyterhub.yaml

