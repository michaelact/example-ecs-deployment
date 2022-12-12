# Deploy AWS ECS Fargate using ECS-CLI

## Requirements
1. [ECS-CLI](https://github.com/aws/amazon-ecs-cli#installing): 1.21.0

## Configure AWS Profile
1. Generate [AWS Access Key and Secret Key via AWS Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
2. Run `aws configure --profile exploration`

## Spawn the Infrastructure
1. Navigate to `/path/to/example-ecs-deployment/deploy/ecs-cli/terraform/` folder
2. Follow the instruction
3. Save on your note the `public_subnets` and `security_group_id` after `terraform apply` variable

## Deploy using `ecs-cli`
1. Create the environment variables on `container-nodejs-on-fargate/.env` file
2. Edit `container-nodejs-on-fargate/ecs-params.yml` on `subnets` and `security_groups` sections according to the values you got when you spawned the infrastructure
3. Run `./ecs-deploy.sh container-nodejs-on-fargate`

## Check Fargate Service Public IP
1. Open [AWS ECS Cluster Console](https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters)
2. Click `ecs-container-fargate` Cluster
3. Click `container-nodejs-on-fargate` ECS Services
4. Click `Tasks` bar
5. Click on one of the task ID that is in the `Running` state
6. Find `Public IP`
7. Type in your browser following this format: `http://PUBLIC_IP:80/`
