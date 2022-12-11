module "ecs_service_task" {
  source  = "cloudposse/ecs-alb-service-task/aws"
  version = "0.66.4"

  name                               = "container-nodejs-on-fargate"
  container_definition_json          = jsonencode(yamldecode(file("container-definition/container-nodejs-on-fargate.yaml")))
  ecs_cluster_arn                    = module.ecs_cluster.cluster_arn
  launch_type                        = "FARGATE"
  vpc_id                             = module.vpc.vpc_id
  security_group_ids                 = [module.security_group.security_group_id]
  subnet_ids                         = module.vpc.public_subnets
  assign_public_ip                   = true
  network_mode                       = "awsvpc"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  deployment_controller_type         = "ECS"
  desired_count                      = 1
  task_memory                        = 512
  task_cpu                           = 256
  exec_enabled                       = true

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
