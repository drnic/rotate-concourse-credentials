#!/bin/bash

flytarget=$1; shift
if [[ "${flytarget}X" == "X" ]]; then
  echo "USAGE: ./push_pipelines.sh <fly target alias>"
  exit 1
fi

target_dir=${target_dir:-tmp}
cd ${target_dir}

echo Pushing pipelines...
for pipeline_file in $(ls *.yml); do
  pipeline=${pipeline_file%%.*}
  echo Pushing ${pipeline}...
  fly -t ${flytarget} c -c ${pipeline_file} ${pipeline}
done
