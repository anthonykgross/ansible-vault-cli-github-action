#!/bin/bash
set -e

ENCRYPTED_DATA=`docker run -e VAULT_KEY=1234 ansible-vault-cli-github-action:latest \
  "echo 'fake confidential data' > foo.yml \
  && ansible-vault encrypt foo.yml \
  && cat foo.yml"
`
SUB="ANSIBLE_VAULT;1.1;AES256"

if [[ $ENCRYPTED_DATA != *"$SUB"* ]]; then
  echo "Data not encrypted."
  exit 1
fi

if [[ $ENCRYPTED_DATA == "fake confidential data" ]]; then
  echo "Data not encrypted."
  exit 1
fi
echo "Data encrypted."

ENCRYPTED_DATA=$(echo "$ENCRYPTED_DATA" | sed -r 's/[\$]+/\\\$/g')
echo "$ENCRYPTED_DATA"

DECRYPTED_DATA=`docker run -e VAULT_KEY=1234 ansible-vault-cli-github-action:latest \
  "echo \"$ENCRYPTED_DATA\" > foo.yml \
  && ansible-vault decrypt foo.yml \
  && cat foo.yml"
`


exit 0