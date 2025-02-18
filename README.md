---
title: Vault Azure Secrets GitHub Actions
description: Examples for integrating HashiCorp Vault Azure Secrets Engine with AzureAD/Entra Application/Service Principal and GitHub Actions
---

# HashiCorp Vault Azure Secrets Engine and GitHub Actions

#### Repo Directory
```
.
├── LICENSE
├── Makefile
├── README.md
└── examples
    ├── terraform
    │   ├── 02-02.vault.az_secrets.tf
    │   ├── 02-03.vault.auth.tf
    │   ├── 03-01.github.vars.tf
    │   ├── templates
    │   │   └── vault_github_read_policy.tpl
    │   └── tfvar.placeholder
    └── workflows
        └── main.yml
```
