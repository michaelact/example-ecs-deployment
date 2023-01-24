# Deploy AWS ECS Fargate using ECS-CLI

## Requirements
1. [ECS-CLI](https://github.com/aws/amazon-ecs-cli#installing): 1.21.0
2. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli): 1.3.0

## Spawn the Infrastructure using `terraform`
1. Navigate to `/path/to/example-ecs-deployment/deploy/ecs-cli/terraform/` folder
2. Follow the instruction there

## Deploy using `ecs-cli`

The Amazon ECS Command Line Interface (CLI) is a command line tool for Amazon Elastic Container Service (Amazon ECS) that provides high-level commands to simplify creating, updating, and monitoring clusters and tasks from a local development environment.

1. Create the environment variables on `container-nodejs-on-fargate/.env` file
3. Run `./ecs-deploy.sh container-nodejs-on-fargate`

## Check Fargate Service Public IP
1. Open [AWS ECS Cluster Console](https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters)
2. Click `ecs-container-fargate` Cluster
3. Click `container-nodejs-on-fargate` ECS Services
4. Click `Tasks` bar
5. Click on one of the task ID that is in the `Running` state
6. Find `Public IP`
7. Type in your browser following this format: `http://PUBLIC_IP:80/`

## Links and References
- https://github.com/aws/amazon-ecs-cli
- https://web.archive.org/web/20220517091612/https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cmd-ecs-cli-compose-ecsparams.html
- https://web.archive.org/web/20220517091612/https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cmd-ecs-cli-compose-parameters.html
