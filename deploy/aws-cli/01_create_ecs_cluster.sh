aws --profile exploration --region us-east-2 ecs create-cluster \
	--cluster-name ecs-container-fargate \
	--capacity-providers FARGATE | tee 01_output_create_ecs_cluster.json
