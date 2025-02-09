#!/bin/sh

set -ex

function clear_after_tests()
{
  rm -rf .hypothesis .pytest_cache
}


# This script is supposed to be executed from the docker image

cd "$(dirname "$0")"

trap clear_after_tests EXIT

pytest -s
QDRANT__ON_DISK_VECTORS=1 pytest -s
