module "ecs" {
  source   = "./ecs"
  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
}

module "ecr" {
  source   = "./ecr"
  ecr_repository_name = var.ecr_repository_name
}
