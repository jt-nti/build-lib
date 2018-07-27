#!/usr/bin/env bash

# shellcheck source=src/common/env.sh
source "${SCRIPT_DIR}common/env.sh"

export CONTRACTS=$(ls contracts)
export APPS=$(ls apps)
if ls contracts/*/package.json > /dev/null 2>&1
then
  export HAS_COMPOSER_CONTRACTS=true
fi
