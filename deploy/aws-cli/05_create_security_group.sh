aws --profile exploration --region us-east-2 ec2 create-security-group \
	--group-name container-nodejs-on-fargate \
	--description "Security Group for AWS ECS Fargate" | tee 05_output_create_security_group.json
