aws --profile exploration --region us-east-2 iam create-role \
	--role-name ecsTaskExecutionRole \
	--assume-role-policy-document file://policy/task-execution-assume-role.json | tee 02_output_create_task_definition.json
