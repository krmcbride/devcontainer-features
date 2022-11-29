#!/bin/bash
set -e

source dev-container-features-test-lib

check "gcloud is installed" gcloud --version

reportResults