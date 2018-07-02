#!/usr/bin/env bats

load test_helper

setup() {
  SRC_DIR=${BATS_TEST_DIRNAME}/../src
  TEST_TEMP_DIR="$(mktemp -d)"
}

@test "prepare.sh: should exist" {  
    [ -e ./src/prepare.sh ]
}

@test "prepare.sh: should be executable" {  
    [ -x ./src/prepare.sh ]
}

@test "prepare.sh: should not attempt to fetch scripts if BUILD_LIB_URL is not set" {
  run ${SRC_DIR}/prepare.sh
  echo "status = $status"
  echo $output
  [ $status -eq 0 ]

  # todo test whether curl was called (how?!)

  file_count=$(count_files $TEST_TEMP_DIR)
  echo "file_count = $file_count"
  [ $file_count -eq 0 ]
}

@test "prepare.sh: should fetch scripts from BUILD_LIB_URL" {
  #BUILD_LIB_URL='https://example.org/scripts.tgz' run ../src/prepare.sh
  #SCRIPT_DIR=$TEST_TEMP_DIR BUILD_LIB_URL='https://github.com/hyperledger-composer-samples/lib/releases/download/v0.1-poc/toolchain-script-lib.tgz' run ./src/prepare.sh
  SCRIPT_DIR=$TEST_TEMP_DIR \
    BUILD_LIB_URL='https://github.com/hyperledger-composer-samples/lib/releases/download/v0.1-poc/toolchain-script-lib.tgz' \
    run ${SRC_DIR}/prepare.sh
  echo "status = $status"
  echo $output
  [ $status -eq 0 ]

  # todo test whether curl was called (how?!)

  file_count=$(count_files $TEST_TEMP_DIR)
  echo "file_count = $file_count"
  echo $(pwd)
  [ $file_count -eq 6 ]
}

@test "prepare.sh: should handle an invalid BUILD_LIB_URL" {
  SCRIPT_DIR=$TEST_TEMP_DIR \
    BUILD_LIB_URL='https://github.com/IBM-Blockchain-Starter-Kit/build-lib/releases/download/v0.0/invalid-blockchain-build-lib.tgz' \
    run ${SRC_DIR}/prepare.sh
  echo "status = $status"
  echo $output
  [ $status -eq 22 ]

  file_count=$(count_files $TEST_TEMP_DIR)
  echo "file_count = $file_count"
  echo $(pwd)
  [ $file_count -eq 0 ]
}

@test "prepare.sh: should not overwrite existing scripts in SCRIPT_DIR" {
  skip
}
