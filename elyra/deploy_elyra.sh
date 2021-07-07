#!/bin/bash
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f pod_pvc.yaml
kubectl apply -f service.yaml
