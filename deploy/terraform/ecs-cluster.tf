module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "4.1.1"

  cluster_name = "ecs-container-fargate"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
