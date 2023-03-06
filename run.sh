#! /bin/bash
compose_file=docker/docker-compose.yml

if [ "$1" == "--clean" ]; then
  docker-compose --file $compose_file down -v
  exit
fi

set -a
. project.cfg

# Are we running inside a terminal or on CI?
if [ -t 1 ]; then
    INTERACTIVE_FLAG="-it"
else
    INTERACTIVE_FLAG=""
fi

./build.sh

image_name="$repo_full:latest"

docker-compose --file $compose_file up

# Some "docker-compose run" options for quick reference:
#  -e VARIABLE=value
#  --publish, -p HOST_PORT:CONTAINER_PORT
#  --volume=[HOST_PATH|NAMED_VOLUME]:DEST_PATH[:ro]
#
# NB:
#  - Volume will create DEST_PATH if it doesn't already exist
#  - Mount and Volume require absolute paths, and cannot deal with symlinks
