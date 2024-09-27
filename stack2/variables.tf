variable "access_key" {
  type = string  
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "ecr_repository_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}
/*
variable "localstack_ci_key" {
  type = string
} */