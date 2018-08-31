#!/usr/bin/env bash
set -e

vault write auth/kubernetes/role/myapp-role \
  bound_service_account_names=default \
  bound_service_account_namespaces=zack-app \
  policies=default,myapp-kv-rw \
  ttl=15m
