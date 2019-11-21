#!/usr/bin/env bash

set -e

echo "package: $1"
echo

CONDA_PACKAGE=$(conda build -c conda-forge recipes/$1 --output);
echo "conda package ${CONDA_PACKAGE}. OS: ${TRAVIS_OS_NAME}";
echo anaconda -v -t ${ANACONDA_TOKEN} upload "${CONDA_PACKAGE}" -u ccitools --force;
