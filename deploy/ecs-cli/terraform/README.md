# Deploy AWS ECS Fargate using ECS-CLI

## Requirements
1. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli): 1.3.0

## Configure AWS Profile
You may get this error when run `terraform init`.

```
$ terraform init

╷
│ Error: error configuring Terraform AWS Provider: failed to get shared config profile, exploration
│
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on backend-terraform.tf line 9, in provider "aws":
│    9: provider "aws" {
│
╵
```

1. Generate [AWS Access Key and Secret Key via AWS Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
2. Run `aws configure --profile exploration`

## Spawn Infrastructure
1. Run `terraform init`: Download terraform modules
2. Run `terraform plan`: Check what resources will be provisioned
3. Run `terraform apply`: Provision the infrastructure!

## Destroying Resources
1. Run `terraform destroy`
