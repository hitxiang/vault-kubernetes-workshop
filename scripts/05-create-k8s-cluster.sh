#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="us-west1-b"

SERVICE_ACCOUNT="vault-server@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"
# To get valid versions
# gcloud container get-server-config
CLUSTER_VERSION="1.10.6-gke.2"

gcloud container clusters create vault \
  --enable-autorepair \
  --cluster-version ${CLUSTER_VERSION} \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --machine-type custom-1-1536 \
  --num-nodes 3 \
  --service-account "${SERVICE_ACCOUNT}" \
  --zone "${ZONE}"

# machine-type n1-standard-2
