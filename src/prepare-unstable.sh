#!/usr/bin/env bash

#
# This pipeline script must be included directly in the pipeline yaml
# definition in order to fetch unreleased versions of the common
# blockchain build scripts.
#
# See also: prepare.sh
#
# Alternatively, download and extract the scripts directly in the
# repository you are building. Once they are in your own repository you
# can modify them to suit your own build requirements.
#

set -ex

build_lib_scripts="pipeline-BLOCKCHAIN.sh
pipeline-BUILD.sh
pipeline-CLOUDANT.sh
pipeline-COMMON.sh
pipeline-DEPLOY.sh"

mkdir -p ${SCRIPT_DIR:=./scripts/}

for script in $build_lib_scripts; do
  SCRIPT_SRC="${SCRIPT_URL:=https://raw.githubusercontent.com/IBM-Blockchain-Starter-Kit/build-lib/master/scripts}/${script}"
  SCRIPT_FILE="${SCRIPT_DIR}${script}"
  
  if [ ! -f  ${SCRIPT_FILE} ]; then
    (curl -sSL ${SCRIPT_SRC}) > ${SCRIPT_FILE}
  fi
done
