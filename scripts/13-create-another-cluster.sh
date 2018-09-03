#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="us-west1-b"
CLUSTER_VERSION="1.10.6-gke.2"
# Create a cluster with alpha features so we can do process namespace sharing
# shareProcessNamespace: true
gcloud container clusters create my-apps \
  --cluster-version ${CLUSTER_VERSION} \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --machine-type custom-1-1536 \
  --enable-kubernetes-alpha \
  --num-nodes 3 \
  --scopes "cloud-platform" \
  --zone "${ZONE}"

#  --machine-type n1-standard-2 \
#  --enable-kubernetes-alpha \
