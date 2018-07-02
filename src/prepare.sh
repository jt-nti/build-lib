#!/usr/bin/env bash

#
# This pipeline script must be included directly in the pipeline yaml
# definition in order to fetch released versions of the common
# blockchain build scripts.
#
# See also: prepare-unstable.sh
#
# Alternatively, download and extract the scripts directly in the
# repository you are building. Once they are in your own repository you
# can modify them to suit your own build requirements.
#

set -ex

if [ -n "$BUILD_LIB_URL" ]; then
  build_lib_dir=$(mktemp -d)

  (curl -fsSL ${BUILD_LIB_URL}) > ${build_lib_dir}/blockchain-build-lib.tgz

  tar -xvf ${build_lib_dir}/blockchain-build-lib.tgz -C ${build_lib_dir}

  mkdir -p $SCRIPT_DIR
  cp -rn ${build_lib_dir}/scripts/* $SCRIPT_DIR > /dev/null 2>&1 || true
fi
