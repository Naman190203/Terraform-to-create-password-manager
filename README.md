# Terraform-to-create-password-manager
This project implements a cloud-based password manager using Terraform and Azure Key Vault. The goal is to automate the secure creation, storage, rotation, and management of secrets without manual intervention. By leveraging Terraform’s infrastructure-as-code approach, the solution ensures consistent and repeatable deployment of secrets.



## To output the table in key vault
```bash
  az keyvault secret list --vault-name TestKV1RG1 --output table
```

## To output the secret
```bash
  az keyvault secret show --vault-name TestKV1RG1 --name secret_name --query value  -o tsv
```

The secret can be also be rotated by adding this script to a cron job with an offset time, ensuring that a new password is generated automatically just after the existing one expires.



