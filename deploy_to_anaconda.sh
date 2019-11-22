#!/usr/bin/env bash

set -e

echo "mode: $1"
echo

if [[ "${TRAVIS_OS_NAME}" = "linux" ]]
then
    CONDA_PACKAGE=$(conda build -c conda-forge recipe --output);
    echo "conda package ${CONDA_PACKAGE}. OS: ${TRAVIS_OS_NAME}";

    if [[ "$1" = "production" ]]
    then
        echo anaconda -v -t ${ANACONDA_TOKEN} upload "${CONDA_PACKAGE}" -u ccitools --force;
    else
        echo "Deployment would looke like:"
        echo anaconda -v -t ${ANACONDA_TOKEN} upload "${CONDA_PACKAGE}" -u ccitools --force;
    fi
else
    echo "Anaconda upload is only executed when running on linux"
fi
