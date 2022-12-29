module "code_deploy_blue_green" {
  source  = "cloudposse/code-deploy/aws"
  version = "0.2.3"

  name                  = "deploy-nodejs-on-fargate"
  minimum_healthy_hosts = null

  traffic_routing_config = {
    type       = "TimeBasedLinear"
    interval   = 10
    percentage = 10
  }

  deployment_style = {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  blue_green_deployment_config = {
    deployment_ready_option = {
      action_on_timeout    = "STOP_DEPLOYMENT"
      wait_time_in_minutes = 10
    }

    terminate_blue_instances_on_deployment_success = {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }

  ecs_service = [
    {
      cluster_name = module.ecs_cluster.cluster_name
      service_name = module.ecs_service_task.service_name
    }
  ]

  load_balancer_info = {
    target_group_pair_info = {
      prod_traffic_route = {
        listener_arns = [module.load_balancer.http_tcp_listener_arns[0]]
      }
      blue_target_group = {
        name = module.load_balancer.target_group_names[0]
      }
      green_target_group = {
        name = module.load_balancer.target_group_names[1]
      }
    }
  }
}
