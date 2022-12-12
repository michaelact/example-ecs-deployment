module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "vpc-container-fargate"
  cidr = "172.22.0.0/16"

  azs            = ["us-east-2a", "us-east-2b"]
  public_subnets = ["172.22.16.0/24", "172.22.17.0/24"]

  enable_nat_gateway              = false
  single_nat_gateway              = false
  one_nat_gateway_per_az          = false
  create_database_subnet_group    = false
  create_elasticache_subnet_group = false
  enable_dns_hostnames            = true

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "Network Public Subnets"
}
