module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = "container-nodejs-on-fargate"
  description = "Security group container nodejs on fargate"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block, "${var.your_ip_address}/32"]
  ingress_rules       = ["http-80-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
