module "ecs" {
  source   = "./ecs"
  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
  ecs_image_name = module.ecr.ecr_repository_url
  ecs_role_task_execution = module.iam.iam_role_task_execution
}

module "ecr" {
  source   = "./ecr"
  ecr_repository_name = var.ecr_repository_name
}

module "iam" {
  source   = "./iam"
}
