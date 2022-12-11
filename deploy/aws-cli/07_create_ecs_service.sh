#!/bin/bash
set -e

############################################################################################################################
# EDIT HERE
# Example:
# SUBNETS="subnet-XXXXXXXXXX, subnet-XXXXXXXXXX, subnet-XXXXXXXXXX, subnet-XXXXXXXXXX, subnet-XXXXXXXXXX, subnet-XXXXXXXXXX" 
SUBNETS="subnet-058cbd49, subnet-76b6251d, subnet-2b16df56"
############################################################################################################################

SECURITY_GROUP_ID=$(cat 05_output_create_security_group.json | jq -r '.GroupId')

aws --profile exploration --region us-east-2 ecs create-service \
	--cluster ecs-container-fargate \
	--service-name container-nodejs-on-fargate \
	--task-definition container-nodejs-on-fargate \
	--desired-count 1 \
	--network-configuration "awsvpcConfiguration={subnets=[ $SUBNETS ],securityGroups=[ $SECURITY_GROUP_ID ],assignPublicIp=ENABLED}" \
	--launch-type "FARGATE" | tee 07_output_create_ecs_service.json
