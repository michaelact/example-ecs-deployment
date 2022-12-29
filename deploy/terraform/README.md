# Deploy AWS ECS Fargate using Terraform

## Requirements
1. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli): 1.3.0
2. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): 2.4.7

## Spawn the Infrastructure
1. Run `terraform init`: Download terraform modules
2. Run `terraform plan`: Check what resources will be provisioned
3. Run `terraform apply`: Provision the infrastructure!

## Check Fargate Service Public IP
1. Open [AWS ECS Cluster Console](https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters)
2. Click `ecs-container-fargate` Cluster
3. Click `container-nodejs-on-fargate` ECS Services
4. Click `Tasks` bar
5. Click on one of the task ID that is in the `Running` state
6. Find `Public IP`
7. Type in your browser following this format: `http://PUBLIC_IP:80/`

## Destroying Resources
1. Run `terraform destroy`

## Links and References
- https://github.com/cloudposse/terraform-aws-ecs-alb-service-task
- https://registry.terraform.io/modules/terraform-aws-modules/cloudwatch/aws
- https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws
- https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
