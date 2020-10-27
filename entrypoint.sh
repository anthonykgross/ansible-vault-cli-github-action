#!/bin/bash

echo $VAULT_KEY > $ANSIBLE_VAULT_PASSWORD_FILE
VAULT_KEY='************'
eval $1
