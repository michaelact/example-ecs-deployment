# AWS Fargate: Running a serverless Node.js app on AWS ECS. 

## Requirements
1. [Docker](https://docs.docker.com/engine/install/)

## Step by Step
1. Run `docker build -t michaelact/container-nodejs-on-fargate:latest /path/to/example-ecs-deployment/container/`
2. Push `docker push michaelact/container-nodejs-on-fargate:latest`
3. See it on: https://hub.docker.com/r/michaelact/container-nodejs-on-fargate

## Push to ECR repository
1. Create ECR Repository `cd /path/to/example-ecs-deployment/aws-cli/; ./00_create_ecr_repository.sh AWS_ACCOUNT_ID`
2. Retag `docker tag michaelact/container-nodejs-on-fargate:latest AWS_ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/container-on-aws/nodejs:latest`
3. `docker push AWS_ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/container-on-aws/nodejs:latest`
