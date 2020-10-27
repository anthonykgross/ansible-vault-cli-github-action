# Ansible Vault CLI Github Action

This action is based on `ubuntu:bionic` image.  
You can execute all `Ansible Vault` related actions i.e.  
You can also execute standard `Linux` commands as base `Docker` image is `ubuntu`.

## Inputs

### `command`

**Required** Command to execute. Default `"ansible-vault"`.

## Example usage

```
uses: actions/ansible-vault-cli-action@latest
with:
  vault_key: ${{ secrets.vault_key }}
  command: "ansible-vault decrypt foo.yml bar.yml"
```
