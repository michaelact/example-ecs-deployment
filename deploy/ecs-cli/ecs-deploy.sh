#!/bin/bash

set -e

cd $1

source .env
ecs-cli compose service up \
  --region $AWS_REGION \
  --aws-profile $AWS_PROFILE \
  --deployment-max-percent $DEPLOYMENT_MAX_HEALTHY_PERCENT \
  --deployment-min-healthy-percent $DEPLOYMENT_MIN_HEALTHY_PERCENT \
  --cluster $CLUSTER_NAME \
  --force-deployment \
  --scheduling-strategy REPLICA \
  --launch-type FARGATE \
  --timeout 10
