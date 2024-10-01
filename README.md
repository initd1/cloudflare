# Cloudflare
## Usage
- Initialize Terraform: Run terraform init in your working directory to download necessary plugins.
- Plan Changes: Use terraform plan to see what changes will be made.
- Apply Configuration: Deploy your setup with terraform apply.

##  Repo structure for modularity with multiple teams being able to 'self-serve'
```
  ├── .github/
  │   └── workflows/
  │       └── ci-cd.yml
  ├── terraform/
  │   ├── main.tf
  │   ├── variables.tf
  │   ├── outputs.tf
  │   ├── provider.tf
  │   ├── team1.auto.tfvars
  │   └── team2.auto.tfvars
  └── README.md
```