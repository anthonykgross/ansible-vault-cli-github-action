# Ansible Vault CLI Github Action

This action is based on `ubuntu:bionic` image.  
You can execute all `Ansible Vault` related actions i.e.  
You can also execute standard `Linux` commands as base `Docker` image is `ubuntu`.

## Inputs

### `command`

**Required** Command to execute. Default `"ansible-vault"`.

### `vault_key`

**Required** Your vault key. Default `''`.

## Example usage

```
uses: anthonykgross/ansible-vault-cli-github-action@v1
with:
  vault_key: ${{ secrets.vault_key }}
  command: "ansible-vault decrypt foo.yml"
```
