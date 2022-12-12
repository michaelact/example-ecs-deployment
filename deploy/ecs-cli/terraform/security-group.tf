module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = "container-nodejs-on-fargate"
  description = "Security group container nodejs on fargate"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["${var.your_ip_address}/32"]
  ingress_rules       = ["http-80-tcp"]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}

output "security_group_id" {
  value = module.security_group.security_group_id
  description = "Security Group ID ECS Services"
}
