#!/bin/sh -l

echo "$VAULT_KEY > $DEFAULT_VAULT_PASSWORD_FILE"
eval $1
