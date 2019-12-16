#!/bin/bash -eu

echo $GCLOUD_SERVICE_KEY | base64 -d | docker login -u _json_key --password-stdin https://eu.gcr.io

export VERSIONTAG=$TRAVIS_BUILD_ID"-"$TRAVIS_BRANCH
echo "Building with tags [$VERSIONTAG]"

docker build -t eu.gcr.io/census-int-ci/census-event-generator:$VERSIONTAG .
docker push eu.gcr.io/census-int-ci/census-event-generator:$VERSIONTAG
