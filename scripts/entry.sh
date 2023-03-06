#!/usr/bin/env bash
set -e

case "$1" in
  app )
    echo 'entry.sh: Running in app mode'
    ;;
  test )
    echo 'entry.sh: Running in Test mode'
    (pytest "${@:2}")
    flake8 /app --ignore=E128,E251,E501,E701
    mypy /app --ignore-missing-imports
    ;;
  * )
    "$@"
    ;;
esac
