# Cloudflare

#  Repo structure for modularity with muultiple teams being able to 'self-serve'

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