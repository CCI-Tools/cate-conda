#!/usr/bin/env bash

set -e

echo "branch:  $TRAVIS_BRANCH"
echo "event:   $TRAVIS_EVENT_TYPE"
echo "package: $1"
echo

if [ "$TRAVIS_BRANCH" = "master" ]; then
    if [ "$TRAVIS_EVENT_TYPE" = "api" -o "$TRAVIS_EVENT_TYPE" = "push" ]; then
        CONDA_PACKAGE=$(conda build --old-build-string -c conda-forge -c defaults recipes/$1 --output);
        echo "conda package $CONDA_PACKAGE";
        anaconda -v -t $ANACONDA_TOKEN upload "$CONDA_PACKAGE" -u ccitools --force;
    else
        echo "NOT uploading to Anaconda Cloud, because this is the wrong event type";
        echo "event $TRAVIS_EVENT_TYPE"
    fi
else
    echo "NOT uploading to Anaconda Cloud, because this is the wrong branch";
    echo "branch $TRAVIS_BRANCH";
fi
