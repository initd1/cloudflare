# Cloudflare
The intent of this repo is to demonstrate how to manage Cloudflare configurations using Terraform and GitHub Actions for CI/CD.

## Usage
- Check providers using `terraform providers` 
- Initialize Terraform: Run `terraform init` in your working directory to download necessary plugins.
- Plan Changes: Use `terraform plan` to see what changes will be made.
- Apply Configuration: Deploy your setup with `terraform apply`.

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

### Commands

#### Verify Validity of API Token
```
curl -X GET "https://api.cloudflare.com/client/v4/accounts/<account_id>/tokens/verify" \
     -H "Authorization: Bearer <api_token>" \
     -H "Content-Type:application/json"

```

### Permissions Required for API Token

| Type | Permission | Mode | 
| ----| ------| ----|
Account  | Cloudflare Tunnel | Edit |
Account  | Zero Trust   | Edit |
Account  | DNS Firewall | Edit |
Account  | Access: Apps and Policies | Edit |
Zone     | DNS  | Edit |
