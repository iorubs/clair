#!/bin/bash

echo "Waiting for clair to fetch vulnerabilities (This can take a long time):"

while true
do
    docker-compose logs clair | grep "update finished" >& /dev/null
    if [ $? == 0 ]; then
        echo "Update finished."
        exit 0
    fi

    docker-compose logs clair | grep "an error occured" >& /dev/null
    if [ $? == 0 ]; then
        echo "Error happend." >&2
        docker-compose logs clair
        exit 1
    fi

    echo -n "."
    sleep 5
done
