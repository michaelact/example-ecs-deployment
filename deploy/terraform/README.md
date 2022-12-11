# Deploy AWS ECS Fargate using Terraform

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

## Spawn Resources
1. Run `terraform init`: Download terraform modules
2. Run `terraform plan`: Check what resources will be provisioned
3. Run `terraform apply`: Provision the infrastructure!

## Check Fargate Service Public IP
1. Open [AWS ECS Cluster Console](https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters)
2. Click `vpc-container-fargate` Cluster
3. Click `container-nodejs-on-fargate` ECS Services
4. Click `Tasks` bar
5. Click on one of the task ID that is in the `Running` state
6. Find `Public IP`
7. Type in your browser following this format: `http://PUBLIC_IP:8080/`
