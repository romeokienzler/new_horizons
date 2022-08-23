#!/bin/bash
kubectl create secret generic secrets \
  --from-literal=PROJECT= \
  --from-literal=SSH_PASSWORD= \
  --from-literal=GIT_NAME="R" \
  --from-literal=GIT_EMAIL=r \
  --from-literal=S3_ENDPOINT=s3.eu-de.cloud-object-storage.appdomain.cloud \
  --from-literal=SECRET_ACCESS_KEY= \
  --from-literal=ACCESS_KEY_ID= \
  --from-literal=JL_PASSWORD=
  
