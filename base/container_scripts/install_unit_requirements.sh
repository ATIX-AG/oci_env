#!/bin/bash

set -e

declare PROJECT=$1

if [ $PROJECT == "pulp_file" ]
then
    declare PROJECT="pulpcore"
fi

if [ ! -d "/src/$PROJECT/" ]
then
    echo "Please clone $PROJECT into ../$PROJECT/"
    exit 1
fi

python3 -m pip install git+https://github.com/pulp/pulp-smash.git

cd "/src/$PROJECT/"

if [[ -f unittest_requirements.txt ]]; then
    python3 -m pip install -r unittest_requirements.txt
fi
