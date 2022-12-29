module "load_balancer" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.1.0"

  name                             = "lb-nodejs-on-fargate"
  vpc_id                           = module.vpc.vpc_id
  subnets                          = module.vpc.public_subnets
  security_groups                  = [module.security_group.security_group_id]
  enable_cross_zone_load_balancing = true

  target_groups = [
    {
      name_prefix      = "blu-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
    },
    {
      name_prefix      = "grn-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
    }
  ]

  http_tcp_listeners = [
    {
      port     = 80
      protocol = "HTTP"
      action_type = "forward"
      forward = {
        target_groups = [
          {
            target_group_index = 0
            weight             = 100
          },
          {
            target_group_index = 1
            weight             = 0
          }
        ]
      }
    }
  ]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
