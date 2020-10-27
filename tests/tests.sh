#!/bin/bash
set -e

RETURN=`docker run -e VAULT_KEY=1234 ansible-vault-cli-github-action:latest \
  "echo 'fake confidential data' > foo.yml \
  && ansible-vault encrypt foo.yml \
  && cat foo.yml"
`
SUB="ANSIBLE_VAULT;1.1;AES256"

if [[ $RETURN != *"$SUB"* ]]; then
  echo "File not encrypted."
  exit 1
fi

if [[ $RETURN == "fake confidential data" ]]; then
  echo "File not encrypted."
  exit 1
fi

echo "File encrypted."
exit 0