#!/bin/bash

flytarget=$1; shift
if [[ "${flytarget}X" == "X" ]]; then
  echo "USAGE: ./fetch_pipelines.sh <fly target alias>"
  exit 1
fi

target_dir=${target_dir:-tmp}
mkdir -p ${target_dir}

api=$(cat ~/.flyrc| yaml2json | jq -r ".targets.${flytarget}.api")
username=$(cat ~/.flyrc| yaml2json | jq -r ".targets.${flytarget}.username")
password=$(cat ~/.flyrc| yaml2json | jq -r ".targets.${flytarget}.password")

echo Fetching list of pipelines...
pipelines=$(curl -s -k -u ${username}:${password} ${api}/api/v1/pipelines | jq -r ".[].name")
for pipeline in ${pipelines[@]}; do
  echo Fetching pipeline $pipeline configuration...
  fly -t ${flytarget} c ${pipeline} > ${target_dir}/${pipeline}.yml
done
