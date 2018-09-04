#!/usr/bin/env bash
set -e

kubectl apply -f k8s/kv-sidecar.yaml

# Debug sample
# kubectl -n zack-app describe pod/kv-sidecar-5bd77d5b97-95xtb
# kubectl -n zack-app logs kv-sidecar-5bd77d5b97-95xtb -c vault-authenticator
