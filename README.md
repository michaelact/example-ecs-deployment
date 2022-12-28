# Example of ECS CLI Deployment 

## Requirements
1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): 2.4.7
2. [jq](https://stedolan.github.io/jq/download/)
3. [tee](https://www.linuxquestions.org/questions/linux-software-2/wanna-install-tee-command-4175517168/)
4. [ECS-CLI](https://github.com/aws/amazon-ecs-cli#installing): 1.21.0
5. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli): 1.3.0
6. [Docker](https://docs.docker.com/engine/install/)

## Configure AWS Profile
1. Generate [AWS Access Key and Secret Key via AWS Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
2. Run `aws configure --profile exploration`

## Build and Push Application Container Image
1. Navigate to `/path/to/example-ecs-deployment/container/`
2. Follow the instruction there

## Deployment
1. Choose what deployment tools do you want to try, currently available are:
   - [ECS-CLI](./deploy/ecs-cli/)
   - [AWS-CLI](./deploy/aws-cli/)
   - [Terraform](./deploy/terraform/)
2. Follow the instruction there
