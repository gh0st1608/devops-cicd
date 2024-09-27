resource "aws_ecs_cluster" "django_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "django_task" {
  family                   = "django-task"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = "256"
  memory                  = "512"

  execution_role_arn      = var.ecs_role_task_execution  # Agrega esta línea
  task_role_arn           = var.ecs_role_task_execution 

  container_definitions = jsonencode([{
    name      = "django_container"
    image     = "${var.ecs_image_name}:latest"
    essential = true
    
    portMappings = [{
      containerPort = 8000
      hostPort      = 8000
    }]
  }])
}

resource "aws_ecs_service" "django_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.django_cluster.id
  task_definition = aws_ecs_task_definition.django_task.id
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = ["subnet-0a1d412d9012fd6f6"]  # Reemplaza con tu subred
    security_groups  = ["sg-0a7523b4abaead0af"] 
    assign_public_ip = true
  }
}