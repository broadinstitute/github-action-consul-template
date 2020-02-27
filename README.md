# github-action-consul-template
installs consul template on runner
### Example use
```
- name: consul-template render templates for terraform
  uses: broadinstitute/github-action-consul-template@master
  with:
    vault-address: ${{ secrets.VAULT_ADDR }}
    vault-token: ${{ steps.token.outputs.vault_token }}
    environment: dev
```
