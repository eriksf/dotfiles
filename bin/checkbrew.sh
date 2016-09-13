#!/usr/bin/env bash

for i in $(brew leaves)
do
    found=$(egrep -c "brew install \b${i}\b([^-]|$)" brew.sh)
    if [[ $found -ne 1 ]]; then
        echo "Check ${i} [${found}]... "
    fi
done
