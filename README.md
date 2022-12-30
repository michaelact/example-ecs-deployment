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
   - [AWS-Copilot](./deploy/aws-copilot/) (Doesn't fit the use case)
   - [Compose-CLI](./deploy/compose-cli/) (Doesn't fit the use case)
   - [AWS-CodeDeploy](./deploy/aws-codedeploy/) (Not a clean structure) \[WIP\]
2. Follow the instruction there

## Deployment Tools Recommendation

|                 | **AWS Code Deploy** | **Terraform**    | **ECS-CLI**  |
|-----------------|---------------------|------------------|--------------|
| **Language**    | YAML/JSON           | Terraform (*.tf) | YAML         |
| **Community**   | Large               | Large            | Small        |
| **Popularity**  | Popular             | 35.6k Stars      | 1.7k Stars   |
| **Pricing**     | Free                | Free             | Free         |
| **Difficult**   | Easy                | Medium           | Easy         |

This data was taken on December 29, 2022.

- Terraform: Able to create all types of resources from AWS Cloud with definitive files. However, it is continuously unable to read events outside of the terraform, such as autoscaling.
- ECS-CLI: Suitable for integration with CI/CD pipelines. The deployment process will be similar to common deployment design using docker compose.
- AWS Code Deploy: Suitable for integration with CI/CD pipelines. However, the structure exemplified in the GitHub repository above still has some weaknesses. Therefore, further exploration is needed to find a cleaner and more mature structure.
