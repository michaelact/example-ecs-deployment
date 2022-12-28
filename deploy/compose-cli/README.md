# Deploy AWS ECS Fargate using Docker Compose CLI

Docker Compose CLI didn't support to use existing Application Load Balancer (ALB). Each ECS service must have its own ALB, this may increase our cloud costs.

## Links and References
- https://github.com/docker/compose-cli/issues/1426
