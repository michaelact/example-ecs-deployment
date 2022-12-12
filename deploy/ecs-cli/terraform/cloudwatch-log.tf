module "cloudwatch_log_stream" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "4.0"

  name           = "cloudwatch-container-nodejs-on-fargate"
}
