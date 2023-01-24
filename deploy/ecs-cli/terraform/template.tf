resource "local_file" "eks_cluster" {
    content  = templatefile("${path.module}/../container-nodejs-on-fargate/ecs-params.yml.tftpl", {
        public_subnet_a_id  = module.vpc.public_subnets[0]
        public_subnet_b_id  = module.vpc.public_subnets[1]
        security_group_id   = module.security_group.security_group_id
    })

    filename = "${path.module}/../container-nodejs-on-fargate/ecs-params.yml"
}
