#!/bin/sh

if [ $# -eq 0 ]; then
    clair-scanner -h
else
    clair-scanner -c="$CLAIR" --ip="$SCANNER" "$@"
fi
