#!/usr/bin/env bash

set -e

echo "mode: $1"
echo

if [[ "${TRAVIS_OS_NAME}" = "linux" ]]
then
    CONDA_PACKAGE=$(conda build -c conda-forge recipes/$1 --output);
    echo "conda package ${CONDA_PACKAGE}. OS: ${TRAVIS_OS_NAME}";
    echo anaconda -v -t ${ANACONDA_TOKEN} upload "${CONDA_PACKAGE}" -u ccitools --force;
else
    echo "Anaconda upload is only executed when running on linux"
fi
