#!/bin/bash
set -e

# INPUT Vars
export VAULT_ADDR=$1
export VAULT_TOKEN=$2
export ENVIRONMENT=$3
export SUFFIX=${4:-${ENVIRONMENT}}
export LOG_LEVEL=$5
export WORKDIR='/github/workspace'
export PATH=${6:-"environment/${ENVIRONMENT}"}

cd ${WORKDIR}

if [ -z "${VAULT_ADDR}" ] && [ -z "${VAULT_TOKEN}" ]
then
      echo "${VAULT_ADDR} or ${VAULT_TOKEN} is empty"
else
      find ${PATH} -name "*.ctmpl" -print | while read file
      do
        rootname="${file%.ctmpl}"
        echo "$file -> $rootname"
        /usr/local/bin/consul-template \
          -once \
          -vault-addr=${VAULT_ADDR} \
          -log-level=${LOG_LEVEL} \
          -template=${file}:${rootname}
      done
fi
