aws --profile exploration --region us-east-2 iam attach-role-policy \
	--role-name ecsTaskExecutionRole \
	--policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy | tee 03_output_attach_role_policy.json
