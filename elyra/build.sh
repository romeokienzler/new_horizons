export IMAGE_VERSION="0.19"
docker build -t elyra-ce:$IMAGE_VERSION .
docker tag elyra-ce:$IMAGE_VERSION romeokienzler/elyra-ce:$IMAGE_VERSION
docker push romeokienzler/elyra-ce:$IMAGE_VERSION