#!/bin/bash

v_files=("package.json" "manifest.json")
version=$1

echo "Setting version to $version"
for file in "${v_files[@]}"
do
    curr_v=$(jq '.version' $file)
    echo "Updating $curr_v -> $version"
    update=$(jq --arg v $version '.version = $v ' $file)
    echo $update >  $file
done

