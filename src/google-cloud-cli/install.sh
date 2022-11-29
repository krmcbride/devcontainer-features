#!/bin/sh
set -e

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg > /usr/share/keyrings/cloud.google.gpg
apt-get update
apt-get install -y --no-install-recommends \
  google-cloud-cli \
  google-cloud-cli-gke-gcloud-auth-plugin
apt-get clean
rm -rf /var/lib/apt/lists/*