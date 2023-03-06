#!/bin/bash

. project.cfg

if [ "$1" ]; then
  target="$1"
else
  target="prod"
fi

if [ "$target" == "prod" ]; then
  tags="--tag $repo_full:latest --tag $repo_full:$tag"
elif [ "$target" == "test" ]; then
  tags="--tag $repo_full:tests"
fi

DOCKER_BUILDKIT=1 \
docker build \
  --build-arg VERSION="${VERSION}" \
  $tags \
  --file docker/Dockerfile \
  --target $target \
  .
