# Deploy AWS ECS Fargate using AWS-CLI Native

## Requirements
1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): 2.4.7
2. [jq](https://stedolan.github.io/jq/download/)
3. [tee](https://www.linuxquestions.org/questions/linux-software-2/wanna-install-tee-command-4175517168/)

# Step by Step
1. Run `./01_create_ecs_cluster.sh`
2. Run `./02_create_role.sh`
3. Run `./03_attach_role_policy.sh`
4. Run `./04_create_task_definition.sh AWS_ACCOUNT_ID`
   Replace `AWS_ACCOUNT_ID` with the AWS Account ID we use to provision the ECS Infrastructure
5. Run `./05_create_security_group.sh`
6. Run `./06_create_security_group_rule.sh YOUR_PUBLIC_IP`
   Replace `YOUR_PUBLIC_IP` with the Public IP which we will later use to access the ECS Fargate service.
7. Filling out the SUBNETS variable on `./07_create_ecs_service.sh` file
   1. Open [VPC Console Dashboard](https://us-east-2.console.aws.amazon.com/vpc/home?region=us-east-2#vpcs:)
   2. Copy VPC ID that we want to use to put the ECS Service
   3. In the left bar, click `Subnets`
   4. Paste the VPC ID into the Search bar containing the words `Filter subnets`
   5. Put the subnet ID on `07_create_ecs_service.sh` file
8. Run `./07_create_ecs_service.sh`

## Check Fargate Service Public IP
1. Open [AWS ECS Cluster Console](https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters)
2. Click `ecs-container-fargate` Cluster
3. Click `container-nodejs-on-fargate` ECS Services
4. Click `Tasks` bar
5. Click on one of the task ID that is in the `Running` state
6. Find `Public IP`
7. Type in your browser following this format: `http://PUBLIC_IP:8080/`
