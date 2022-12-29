# Deploy AWS ECS Fargate using AWS Code Deploy using Terraform

## Requirements
1. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli): 1.3.0
2. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): 2.4.7

## Spawn the Infrastructure
1. Run `terraform init`: Download terraform modules
2. Run `terraform plan`: Check what resources will be provisioned
3. Run `terraform apply`: Provision the infrastructure!

## Deployment New Changes
1. Open [AWS Code Deploy Console Dashboard](https://us-east-2.console.aws.amazon.com/codesuite/codedeploy/applications?region=us-east-2)
2. Tick the deploy application code named `deploy-nodejs-on-fargate`
3. Click `Deploy Application`
4. Choose `deploy-nodejs-on-fargate` deployment group
5. Choose _Use AppSpec editor_ 
6. Choose YAML AppSpec Language
7. Copy content in `/path/to/example-ecs-deployment/deploy/aws-codedeploy/appspec/nodejs-on-fargate.yaml` to AppSpec editor
8. Click _Create deployment_

Note: 
- `/path/to/example-ecs-deployment/deploy/aws-codedeploy/appspec/nodejs-on-fargate.yaml`: Edit the appspec file structure following [this documentation](https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-resources.html).

## Destroying Resources
1. Run `terraform destroy`

## Links and References
- https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-resources.html
- https://www.redhat.com/en/topics/devops/what-is-blue-green-deployment
- https://registry.terraform.io/modules/terraform-aws-modules/cloudwatch/aws
- https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws
- https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
- https://registry.terraform.io/modules/cloudposse/code-deploy/aws/latest/examples/complete
- https://registry.terraform.io/modules/cloudposse/ecs-alb-service-task/aws/latest/examples/complete
