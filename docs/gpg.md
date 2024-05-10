# GPG

```sh
# list all gpg keys on the system
gpg --list-secret-keys --keyid-format=long

# show PGP public-key
gpg --armor --export key-id

# export gpg keys into backup file
gpg --output gpg_keys.backup --armor --export-secret-keys

# import all the gpg keys from the file
gpg --import gpg_keys.backup
```

```sh
# encrypt file
gpg --encrypt --recipient 07B8DBEF8DAE2D17942AE17C88E0C20483888F8E --output encrypted_secrets.gpg secrets.txt

# decrypt file
gpg --decrypt --recipient key-id encrypted_secrets.gpg
```
