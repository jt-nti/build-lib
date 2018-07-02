#!/usr/bin/env bash

function count_files {
  echo $(cd $1 && find . ! -name . -prune -print | grep -c /)
}
