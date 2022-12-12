#!/bin/bash
set -e

AWS_ACCOUNT_ID=$1

aws --profile exploration --region us-east-2 ecr create-repository \
	--repository-name container-on-aws/nodejs | tee 00_output_create_ecr_repository.json

aws --profile exploration --region us-east-2 ecr get-login-password \
	--region us-east-2 | docker login \
		--username AWS \
		--password-stdin $AWS_ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com
