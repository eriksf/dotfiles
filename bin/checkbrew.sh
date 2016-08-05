#!/usr/bin/env bash

for i in $(brew leaves)
do
    found=$(grep -c "brew install \b${i}\b" brew.sh)
    if [[ $found -ne 1 ]]; then
        echo "Check ${i}... "
    fi
done
