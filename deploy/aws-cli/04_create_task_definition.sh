#!/bin/bash
set -e

AWS_ACCOUNT_ID=$1

sed "s|REPLACEME_AWS_ACCOUNT_ID|$AWS_ACCOUNT_ID|g" container-definition/node-task-definition.json > container-definition/output-node-task-definition.json
aws --profile exploration --region us-east-2 ecs register-task-definition \
	--cli-input-json file://container-definition/output-node-task-definition.json | tee 04_output_create_task_definition.json
