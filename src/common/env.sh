#!/usr/bin/env bash
ROOTDIR=${ROOTDIR:=$PWD}

export COMPOSER_VERSION=${COMPOSER_VERSION:="0.19.5"}

export GO_VERSION=${GO_VERSION:="1.9.2"}

# set location for go executables
export GOROOT=${ROOTDIR}/go
export PATH=${GOROOT}/bin:$PATH
export GOPATH=${ROOTDIR}

export CONFIGPATH=${CONFIGPATH:="deploy_config.json"}
export CHAINCODEPATH=${CHAINCODEPATH:="chaincode"}

export HLF_VERSION=${HLF_VERSION:="1.0.4"}
export FABRIC_SRC_DIR=${ROOTDIR}/fabric-${HLF_VERSION}

export DEBUG=${DEBUG:=false}
