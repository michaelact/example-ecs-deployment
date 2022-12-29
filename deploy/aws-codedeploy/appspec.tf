data "aws_caller_identity" "current" {}

resource "local_file" "appspec_codedeploy" {
    content  = templatefile("${path.module}/appspec/nodejs-on-fargate.yaml.tftpl", {
        task_definition_arn = "arn:aws:ecs:us-east-2:${data.aws_caller_identity.current.account_id}:task-definition/container-nodejs-on-fargate:${module.ecs_service_task.task_definition_revision}"
    })
    filename = "${path.module}/appspec/nodejs-on-fargate.yaml"
}
