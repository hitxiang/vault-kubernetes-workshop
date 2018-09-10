#!/usr/bin/env bash
set -e

kubectl apply -f k8s/app_namespace.yaml

kubectl create serviceaccount vault-auth --namespace zack-app
kubectl apply -f - <<EOH
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: role-tokenreview-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:auth-delegator
subjects:
- kind: ServiceAccount
  name: vault-auth
  namespace: zack-app
EOH
