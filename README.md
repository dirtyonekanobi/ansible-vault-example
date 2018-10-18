# Ansible Vault Examples

> 2 Examples of using Ansible Vault w/Tower


### Simple Example

In the `simple_example` folder, credentials are imported using a fully encrypted file `./vars/secrets.yml`

The naming of the file is trivial, but the file must be imported into the playbook using the `vars_files:` directive

To encrypt the file completely, use this syntax:

```shell
$ ansible-vault encrypt <file_name.extension>
```

### Complex Example

In the `complex_example` folder, credentials are imported using encrypted strings in the `./group_vars/all.yml` file.

To encrypt a string in the file use this syntax:

```shell
$ ansible-vault encrypt_string --vault-id @prompt '{{ value }}' --name '{{ key }}' >> <file_to_store_value_in.extension>

New vault password (default):
Confirm new vault password (default): 
```

Example:

```shell
$ ansible-vault encrypt_string --vault-id 'secretPassword' --name 'ansible_ssh_pass' >> group_vars/all.yml
```

The `--vault-id @prompt` flag will ensure you are prompted for password

The `>> filename` is optional, but otherwise the vaulted value will only be output to the screen

> Note: In Ansible Tower, if the `group_vars/all.yml` file is completely encrypted, inventory sync will fail if the inventory source is `From Project`, as Credential Types Vault & Insight do not work w/inventory sync.
