module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = "container-nodejs-on-fargate"
  description = "Security group container nodejs on fargate"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["${var.your_ip_address}/32"]
  ingress_rules       = ["http-8080-tcp"]

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}
