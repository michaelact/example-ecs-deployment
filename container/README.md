# AWS Fargate: Running a serverless Node.js app on AWS ECS. 

## Requirements
1. [Docker](https://docs.docker.com/engine/install/)
2. Docker Hub (Alternative 1):
   1. [Docker Hub Account](https://hub.docker.com/signup)
   2. [Docker Hub Access Token](https://docs.docker.com/docker-hub/access-tokens/)
3. Elastic Container Registry (Alternative 2)
   1. [ECR Authentication](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html) (Alternative 2)

### Push Container Image to Repository
1. Build the application to container image: `docker build -t USERNAME/container-nodejs-on-fargate:latest .` 
2. Push to repository: `docker push USERNAME/container-nodejs-on-fargate:latest`
3. If you have successfully pushed the container image to Docker Hub repository, you can see it on `https://hub.docker.com/r/USERNAME/container-nodejs-on-fargate`. For example https://hub.docker.com/r/michaelact/container-nodejs-on-fargate .

## Push to ECR Repository (Alternative 2)
1. Create ECR Repository `cd /path/to/example-ecs-deployment/aws-cli/; ./00_create_ecr_repository.sh AWS_ACCOUNT_ID`
2. Retag `docker tag USERNAME/container-nodejs-on-fargate:latest AWS_ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/container-on-aws/nodejs:latest`
3. Push to repository: `docker push AWS_ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/container-on-aws/nodejs:latest`

## Links and References
- https://levelup.gitconnected.com/aws-fargate-running-a-serverless-node-js-app-on-aws-ecs-c5d8dea0a85a
- https://github.com/austinloveless/Docker-on-AWS
