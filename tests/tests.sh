#!/bin/bash
set -e

DATA='fake confidential data'
ENCRYPTED_DATA=`docker run -e VAULT_KEY=1234 anthonykgross/ansible-vault-cli-github-action:latest \
  "echo '$DATA' > foo.yml \
  && ansible-vault encrypt foo.yml \
  && cat foo.yml"
`
SUB="ANSIBLE_VAULT;1.1;AES256"

if [[ $ENCRYPTED_DATA != *"$SUB"* ]]; then
  echo "Data not encrypted."
  exit 1
fi

if [[ $ENCRYPTED_DATA == $DATA ]]; then
  echo "Data not encrypted."
  exit 1
fi
echo "Data encrypted."

ENCRYPTED_DATA=$(echo "$ENCRYPTED_DATA" | sed -r 's/[\$]+/\\\$/g' | sed -r ':a;N;$!ba;s/\n/\\n/g')

DECRYPTED_DATA=`docker run -e VAULT_KEY=1234 anthonykgross/ansible-vault-cli-github-action:latest \
  "echo -e \"$ENCRYPTED_DATA\" > foo.yml \
  && ansible-vault decrypt foo.yml \
  && cat foo.yml"
`

if [[ $DECRYPTED_DATA != $DATA ]]; then
  echo "Data not decrypted."
  exit 1
fi
echo "Data decrypted."

exit 0