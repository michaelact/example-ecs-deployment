module "ecs_service_task" {
  source  = "cloudposse/ecs-alb-service-task/aws"
  version = "0.66.4"

  name                               = "container-nodejs-on-fargate"
  container_definition_json          = jsonencode(yamldecode(file("container-definition/container-nodejs-on-fargate.yaml")))
  ecs_cluster_arn                    = module.ecs_cluster.cluster_arn
  launch_type                        = "FARGATE"
  platform_version                   = "1.4.0"
  vpc_id                             = module.vpc.vpc_id
  ignore_changes_task_definition     = true
  security_group_ids                 = [module.security_group.security_group_id]
  subnet_ids                         = module.vpc.private_subnets
  assign_public_ip                   = true
  network_mode                       = "awsvpc"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  deployment_controller_type         = "CODE_DEPLOY"
  desired_count                      = 1
  task_memory                        = 512
  task_cpu                           = 256
  exec_enabled                       = true

  ecs_load_balancers = [
    {
      container_name   = "container-nodejs-on-fargate"
      container_port   = 80
      elb_name         = null
      target_group_arn = module.load_balancer.target_group_arns[0]
    }
  ]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}

output "ecs_service_name" {
  value = module.ecs_service_task.service_name
}
