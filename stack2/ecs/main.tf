resource "aws_ecs_cluster" "django_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "django_task" {
  family                   = "django-task"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = "256"
  memory                  = "512"

  container_definitions = jsonencode([{
    name      = "django"
    image     = "my-django-image"  # Reemplaza con el nombre de tu imagen
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

  network_configuration {
    subnets          = ["subnet-0a1d412d9012fd6f6"]  # Reemplaza con tu subred
    assign_public_ip = true
  }
}